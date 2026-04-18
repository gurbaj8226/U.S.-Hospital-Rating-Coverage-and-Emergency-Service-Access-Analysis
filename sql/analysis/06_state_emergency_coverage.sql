-- ============================================
-- Q3B: State-Level Emergency Service Coverage
-- Dataset: CMS Hospital General Information
--
-- Purpose:
--   Analyze how emergency-service availability
--   varies across U.S. states.
--
-- Scope:
--   Restricted to the 50 U.S. states (excludes DC
--   and U.S. territories) to ensure consistent
--   geographic comparison.
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
--   emergency_services to highlight states with
--   weaker emergency-service coverage.
-- ============================================

SELECT state,
	   COUNT(*) AS total_hospitals,
       COUNT(CASE WHEN emergency_services = 'Yes' THEN 1 END) AS hospitals_with_emergency_services,
	   COUNT(CASE WHEN emergency_services = 'No' THEN 1 END) AS hospitals_without_emergency_services,
       ROUND(AVG(CASE WHEN emergency_services = 'Yes' THEN 1 ELSE 0 END)*100, 2) AS percent_with_emergency_services,
       ROUND(AVG(CASE WHEN emergency_services = 'No' THEN 1 ELSE 0 END)*100, 2) AS percent_without_emergency_services
FROM hospital_rating_coverage
WHERE state IN (
    'AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA',
    'HI','ID','IL','IN','IA','KS','KY','LA','ME','MD',
    'MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ',
    'NM','NY','NC','ND','OH','OK','OR','PA','RI','SC',
    'SD','TN','TX','UT','VT','VA','WA','WV','WI','WY'
)

GROUP BY state
ORDER BY percent_without_emergency_services DESC, total_hospitals DESC