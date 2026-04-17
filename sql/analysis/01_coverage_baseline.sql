-- ============================================
-- Q1: Coverage Baseline
-- Dataset: CMS Hospital General Information
-- Purpose:
--   Calculate overall rating coverage
-- ============================================

SELECT COUNT(*) AS total_hospitals,
	   COUNT(CASE WHEN rating_available = 1 THEN 1 END) AS total_rated,
       COUNT(CASE WHEN rating_available = 0 THEN 1 END) AS total_unrated,
       ROUND(AVG(CASE WHEN rating_available = 1 THEN 1 ELSE 0 END), 2)*100 AS percent_rated,
       ROUND(AVG(CASE WHEN rating_available = 0 THEN 1 ELSE 0 END), 2)*100 AS percent_unrated
	
FROM hospital_rating_coverage;