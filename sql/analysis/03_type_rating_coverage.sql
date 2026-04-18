-- ============================================
-- Q2B: Hospital Type Rating Coverage
-- Dataset: CMS Hospital General Information
--
-- Purpose:
--   Compare hospital rating availability across
--   hospital types.
--
-- Metrics:
--   - total_hospitals
--   - rated_hospitals
--   - unrated_hospitals
--   - percent_rated
--   - percent_unrated
--
-- Notes:
--   Results are sorted by highest percent_unrated
--   to highlight hospital types with the weakest
--   rating coverage.
-- ============================================

SELECT hospital_type,
	   COUNT(*) AS total_hospitals,
       COUNT(CASE WHEN rating_available = 1 THEN 1 END) AS rated_hospitals,
	   COUNT(CASE WHEN rating_available = 0 THEN 1 END) AS unrated_hospitals,
       ROUND(AVG(CASE WHEN rating_available = 1 THEN 1 ELSE 0 END), 2)*100 AS percent_rated,
       ROUND(AVG(CASE WHEN rating_available = 0 THEN 1 ELSE 0 END), 2)*100 AS percent_unrated
FROM hospital_rating_coverage
GROUP BY hospital_type
ORDER BY percent_unrated DESC, total_hospitals DESC;