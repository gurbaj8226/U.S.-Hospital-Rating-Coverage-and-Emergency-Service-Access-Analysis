-- ============================================
-- Q4A: Type x Ownership Emergency Service Matrix
-- Dataset: CMS Hospital General Information
--
-- Purpose:
--   Analyze emergency-service availability across
--   hospital type and ownership combinations.
--
-- Metrics:
--   - total_hospitals
--   - hospitals_with_emergency_services
--   - hospitals_without_emergency_services
--   - percent_with_emergency_services
--   - percent_without_emergency_services
--
-- Notes:
--   Each row represents a hospital_type and
--   hospital_ownership combination. Results are
--   sorted by highest percent_without_emergency_
--   services to surface the weakest combinations.
-- ============================================

SELECT hospital_type,
	   hospital_ownership,
	   COUNT(*) AS total_hospitals,
       COUNT(CASE WHEN emergency_services = 'Yes' THEN 1 END) AS hospitals_with_emergency_services,
	   COUNT(CASE WHEN emergency_services = 'No' THEN 1 END) AS hospitals_without_emergency_services,
       ROUND(AVG(CASE WHEN emergency_services = 'Yes' THEN 1 ELSE 0 END)*100, 2) AS percent_with_emergency_services,
       ROUND(AVG(CASE WHEN emergency_services = 'No' THEN 1 ELSE 0 END)*100, 2) AS percent_without_emergency_services
FROM hospital_rating_coverage
GROUP BY hospital_type, hospital_ownership
ORDER BY percent_without_emergency_services DESC, total_hospitals DESC