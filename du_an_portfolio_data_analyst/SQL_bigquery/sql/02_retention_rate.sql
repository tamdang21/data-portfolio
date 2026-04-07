-- 02_retention_rate.sql
-- Mục tiêu: tính retention rate theo day_diff kể từ ngày sử dụng đầu tiên (day 0)

WITH fi AS (
  SELECT
    e.user_id,
    MIN(e.date) AS first_use_date
  FROM `ace-slice-459110-f8.test9.events` e
  GROUP BY e.user_id
),
ba AS (
  SELECT DISTINCT
    e.user_id,
    e.date
  FROM `ace-slice-459110-f8.test9.events` e
),
day_dif AS (
  SELECT
    f.user_id,
    DATE_DIFF(b.date, f.first_use_date, DAY) AS day_diff
  FROM fi f
  JOIN ba b
    ON f.user_id = b.user_id
),
retained AS (
  SELECT
    d.day_diff,
    COUNT(DISTINCT d.user_id) AS retained_users
  FROM day_dif d
  GROUP BY d.day_diff
)
SELECT
  r.day_diff,
  r.retained_users,
  FIRST_VALUE(retained_users) OVER (ORDER BY day_diff ASC) AS users_day0,
  ROUND(
    (retained_users * 100.0)
    / FIRST_VALUE(retained_users) OVER (ORDER BY day_diff ASC),
    2
  ) AS retention_rate_pct
FROM retained r
ORDER BY r.day_diff ASC;
