-- 01_kpi_co_ban.sql
-- Mục tiêu:
-- 1. Tính daily users và total access theo ngày
-- 2. Phân tích theo platform
-- 3. Tính average volume theo ngày
-- 4. Tính tổng số user theo quốc gia

-- A. Daily users và total access theo ngày
SELECT
  e.date,
  COUNT(DISTINCT e.user_id) AS daily_user,
  COUNT(*) AS total_access
FROM `ace-slice-459110-f8.test9.events` e
GROUP BY e.date
ORDER BY e.date;

-- B. Daily users và total access theo ngày, theo platform
SELECT
  e.date,
  e.platform,
  COUNT(DISTINCT e.user_id) AS daily_user,
  COUNT(*) AS total_access
FROM `ace-slice-459110-f8.test9.events` e
GROUP BY e.date, e.platform
ORDER BY e.date ASC;

-- C. Average volume theo ngày
SELECT
  e.date,
  AVG(e.volume) AS avg_vol
FROM `ace-slice-459110-f8.test9.events` e
GROUP BY e.date
ORDER BY e.date ASC;

-- D. Tổng user theo quốc gia
SELECT
  g.Country,
  COUNT(DISTINCT u.user_id) AS total_users
FROM `ace-slice-459110-f8.test9.user_info` u
JOIN `ace-slice-459110-f8.test9.geography` g
  ON u.mp_country_code = g.Code
GROUP BY g.Country
ORDER BY total_users DESC;
