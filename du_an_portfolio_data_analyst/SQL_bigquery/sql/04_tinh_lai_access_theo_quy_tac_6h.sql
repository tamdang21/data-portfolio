-- 04_tinh_lai_access_theo_quy_tac_6h.sql
-- Business rule:
-- nếu user quay lại trong vòng 6 giờ thì vẫn tính là cùng 1 access/session

WITH ordered AS (
  SELECT
    e.user_id,
    e.datetime,
    e.volume,
    LAG(e.datetime) OVER (
      PARTITION BY e.user_id
      ORDER BY e.datetime
    ) AS prev_time
  FROM `ace-slice-459110-f8.test9.events` e
  WHERE e.user_id IS NOT NULL
),
accesses AS (
  SELECT
    *,
    TIMESTAMP_DIFF(datetime, prev_time, HOUR) AS gap_hours,
    CASE
      WHEN prev_time IS NULL THEN 1
      WHEN TIMESTAMP_DIFF(datetime, prev_time, HOUR) > 6 THEN 1
      ELSE 0
    END AS is_new_access
  FROM ordered
)
SELECT
  a.user_id,
  SUM(a.is_new_access) AS total_access_new,
  COUNT(*) AS total_access_old,
  COUNT(*) - SUM(a.is_new_access) AS chenh_lech,
  SUM(a.volume) AS total_volume
FROM accesses a
GROUP BY a.user_id
ORDER BY total_access_new DESC;
