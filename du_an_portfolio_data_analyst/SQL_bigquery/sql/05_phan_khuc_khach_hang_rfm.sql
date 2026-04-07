-- 05_phan_khuc_khach_hang_rfm.sql
-- Phân khúc khách hàng bằng RFM

WITH ordered AS (
  SELECT
    e.user_id,
    e.date,
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
    TIMESTAMP_DIFF(datetime, prev_time, MINUTE) AS gap_minutes,
    CASE
      WHEN prev_time IS NULL THEN 1
      WHEN TIMESTAMP_DIFF(datetime, prev_time, MINUTE) > 360 THEN 1
      ELSE 0
    END AS is_new_access
  FROM ordered
),
max_day AS (
  SELECT MAX(e.date) AS dataset_max_date
  FROM `ace-slice-459110-f8.test9.events` e
),
rfm_base AS (
  SELECT
    a.user_id,
    DATE_DIFF(m.dataset_max_date, MAX(a.date), DAY) AS recency_days,
    SUM(a.is_new_access) AS frequency,
    SUM(a.volume) AS monetary
  FROM accesses a
  CROSS JOIN max_day m
  GROUP BY a.user_id, m.dataset_max_date
),
rfm_scored AS (
  SELECT
    *,
    NTILE(5) OVER (ORDER BY recency_days DESC) AS r_score,
    NTILE(5) OVER (ORDER BY frequency ASC) AS f_score,
    NTILE(5) OVER (ORDER BY monetary ASC) AS m_score
  FROM rfm_base
)
SELECT
  *,
  CASE
    WHEN r_score >= 4 AND f_score >= 4 AND m_score >= 4 THEN 'VIP'
    WHEN r_score >= 3 AND f_score >= 3 THEN 'Tiem_nang'
    WHEN r_score <= 2 AND f_score <= 2 THEN 'Yeu'
    ELSE 'Trung_binh'
  END AS customer_segment
FROM rfm_scored;
