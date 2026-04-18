-- ============================================
-- Q3A: Emergency Services Baseline
-- Dataset: CMS Hospital General Information
--
-- Purpose:
--   Measure overall availability of emergency
--   services across U.S. hospitals.
--
-- Metrics:
--   - total_hospitals
--   - hospitals_with_emergency_services
--   - hospitals_without_emergency_services
--   - percent_with_emergency_services
--   - percent_without_emergency_services
-- ============================================

SELECT COUNT(*) AS total_hospitals,
       COUNT(CASE WHEN emergency_services = 'Yes' THEN 1 END) AS hospitals_with_emergency_services,
	   COUNT(CASE WHEN emergency_services = 'No' THEN 1 END) AS hospitals_without_emergency_services,
       ROUND(AVG(CASE WHEN emergency_services = 'Yes' THEN 1 ELSE 0 END)*100, 2) AS percent_with_emergency_services,
       ROUND(AVG(CASE WHEN emergency_services = 'No' THEN 1 ELSE 0 END)*100, 2) AS percent_without_emergency_services
FROM hospital_rating_coverage
