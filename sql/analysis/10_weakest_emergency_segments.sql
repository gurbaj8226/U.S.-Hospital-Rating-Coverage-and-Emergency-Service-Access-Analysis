-- ============================================
-- Q4B: Weakest Meaningful Emergency-Service Segments
-- Dataset: CMS Hospital General Information
--
-- Purpose:
--   Identify hospital type × ownership combinations
--   with the weakest emergency-service coverage.
--
-- Metrics:
--   - total_hospitals
--   - hospitals_with_emergency_services
--   - hospitals_without_emergency_services
--   - percent_with_emergency_services
--   - percent_without_emergency_services
--
-- Scope:
--   Restricted to combinations with at least
--   20 hospitals to reduce distortion from
--   very small groups.
--
-- Notes:
--   Results are sorted by highest percent_without_
--   emergency_services to highlight the weakest
--   meaningful segments.
-- =============================================

SELECT hospital_type,
	   hospital_ownership,
	   COUNT(*) AS total_hospitals,
       COUNT(CASE WHEN emergency_services = 'Yes' THEN 1 END) AS hospitals_with_emergency_services,
	   COUNT(CASE WHEN emergency_services = 'No' THEN 1 END) AS hospitals_without_emergency_services,
       ROUND(AVG(CASE WHEN emergency_services = 'Yes' THEN 1 ELSE 0 END)*100, 2) AS percent_with_emergency_services,
       ROUND(AVG(CASE WHEN emergency_services = 'No' THEN 1 ELSE 0 END)*100, 2) AS percent_without_emergency_services
FROM hospital_rating_coverage
GROUP BY hospital_type, hospital_ownership
HAVING COUNT(*) >= 20
ORDER BY percent_without_emergency_services DESC, total_hospitals DESC
