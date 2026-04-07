-- 03_phat_hien_lam_dung_trial.sql
-- Mục tiêu: phát hiện account đáng nghi có thể lạm dụng trial
-- Ý tưởng:
-- 1. Gom nhóm user có cùng country/city/os/platform
-- 2. Tính first_event_day, last_event_day, total_vol, total_fee
-- 3. So sánh account mới với account trước đó trong cùng cụm thông tin
-- 4. Tìm các trường hợp khoảng cách tạo tài khoản mới quá sát thời điểm tài khoản cũ ngừng hoạt động

WITH layer1 AS (
  SELECT DISTINCT
    user_id,
    mp_country_code,
    city,
    os,
    platform,
    created_date
  FROM (
    SELECT
      *,
      COUNT(*) OVER (
        PARTITION BY mp_country_code, city, os, platform
      ) AS so_trong_nhom
    FROM `ace-slice-459110-f8.test9.user_info`
    WHERE mp_country_code IS NOT NULL
      AND city IS NOT NULL
      AND os IS NOT NULL
      AND platform IS NOT NULL
      AND user_id IS NOT NULL
      AND created_date IS NOT NULL
  )
  WHERE so_trong_nhom > 1
),
layer2 AS (
  SELECT
    e.user_id,
    MIN(e.date) AS first_event_day,
    MAX(e.date) AS last_event_day,
    SUM(e.volume) AS total_vol,
    SUM(e.fee) AS total_fee
  FROM `ace-slice-459110-f8.test9.events` e
  GROUP BY e.user_id
),
combined AS (
  SELECT
    l1.*, 
    l2.first_event_day,
    l2.last_event_day,
    l2.total_vol,
    l2.total_fee
  FROM layer1 l1
  LEFT JOIN layer2 l2
    ON l1.user_id = l2.user_id
),
sequenced AS (
  SELECT
    *,
    LAG(user_id) OVER (
      PARTITION BY mp_country_code, city, os, platform
      ORDER BY created_date
    ) AS prev_user_id,
    LAG(last_event_day) OVER (
      PARTITION BY mp_country_code, city, os, platform
      ORDER BY created_date
    ) AS prev_last_event_day
  FROM combined
)
SELECT
  *,
  DATE_DIFF(created_date, prev_last_event_day, DAY) AS gap_from_prev_account
FROM sequenced
WHERE prev_user_id IS NOT NULL
ORDER BY mp_country_code, city, os, platform, created_date;
