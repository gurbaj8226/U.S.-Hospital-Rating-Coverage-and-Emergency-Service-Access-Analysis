-- ============================================
-- Q2C: Ownership Rating Coverage
-- Dataset: CMS Hospital General Information
--
-- Purpose:
--   Analyze how hospital rating availability varies
--   across ownership types.
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
--   to highlight ownership groups with the weakest
--   rating coverage.
--
--   Some categories (e.g., Department of Defense)
--   may lack ratings due to CMS reporting rules,
--   not data absence.
-- ============================================

SELECT hospital_ownership,
	   COUNT(*) AS total_hospitals,
       COUNT(CASE WHEN rating_available = 1 THEN 1 END) AS rated_hospitals,
	   COUNT(CASE WHEN rating_available = 0 THEN 1 END) AS unrated_hospitals,
       ROUND(AVG(CASE WHEN rating_available = 1 THEN 1 ELSE 0 END), 2)*100 AS percent_rated,
       ROUND(AVG(CASE WHEN rating_available = 0 THEN 1 ELSE 0 END), 2)*100 AS percent_unrated
FROM hospital_rating_coverage
GROUP BY hospital_ownership
ORDER BY percent_unrated DESC, total_hospitals DESC;