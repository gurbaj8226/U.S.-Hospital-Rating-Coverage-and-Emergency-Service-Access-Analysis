-- ============================================
-- Q3C: Emergency Services by Rating Status
-- Dataset: CMS Hospital General Information
--
-- Purpose:
--   Compare emergency-service availability between
--   hospitals with and without an overall CMS
--   quality rating.
--
-- Metrics:
--   - total_hospitals
--   - hospitals_with_emergency_services
--   - hospitals_without_emergency_services
--   - percent_with_emergency_services
--   - percent_without_emergency_services
--
-- Notes:
--   Hospitals are grouped by whether an overall
--   hospital rating is present (rated) or missing
--   (unrated).
-- ============================================

SELECT (CASE WHEN rating_available = 1 THEN 'Rated' ELSE 'Unrated' END) AS rating_status,
	   COUNT(*) AS total_hospitals,
       COUNT(CASE WHEN emergency_services = 'Yes' THEN 1 END) AS hospitals_with_emergency_services,
	   COUNT(CASE WHEN emergency_services = 'No' THEN 1 END) AS hospitals_without_emergency_services,
       ROUND(AVG(CASE WHEN emergency_services = 'Yes' THEN 1 ELSE 0 END)*100, 2) AS percent_with_emergency_services,
       ROUND(AVG(CASE WHEN emergency_services = 'No' THEN 1 ELSE 0 END)*100, 2) AS percent_without_emergency_services
FROM hospital_rating_coverage
GROUP BY rating_status