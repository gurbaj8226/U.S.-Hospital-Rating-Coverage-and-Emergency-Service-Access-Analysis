-- ============================================
-- Q3D: Ownership Emergency Service Coverage
-- Dataset: CMS Hospital General Information
--
-- Purpose:
--   Analyze how emergency-service availability
--   varies across hospital ownership types.
--
-- Metrics:
--   - total_hospitals
--   - hospitals_with_emergency_services
--   - hospitals_without_emergency_services
--   - percent_with_emergency_services
--   - percent_without_emergency_services
--
-- Notes:
--   Results are sorted by highest percent_without_
--   emergency_services to highlight ownership
--   groups with weaker emergency-service coverage.
-- ============================================

SELECT hospital_ownership,
	   COUNT(*) AS total_hospitals,
       COUNT(CASE WHEN emergency_services = 'Yes' THEN 1 END) AS hospitals_with_emergency_services,
	   COUNT(CASE WHEN emergency_services = 'No' THEN 1 END) AS hospitals_without_emergency_services,
       ROUND(AVG(CASE WHEN emergency_services = 'Yes' THEN 1 ELSE 0 END)*100, 2) AS percent_with_emergency_services,
       ROUND(AVG(CASE WHEN emergency_services = 'No' THEN 1 ELSE 0 END)*100, 2) AS percent_without_emergency_services
FROM hospital_rating_coverage
GROUP BY hospital_ownership
ORDER BY percent_without_emergency_services DESC, total_hospitals DESC