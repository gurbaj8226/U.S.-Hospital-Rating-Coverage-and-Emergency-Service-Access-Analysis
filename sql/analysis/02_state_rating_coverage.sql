-- ============================================
-- Q2A: State-Level Rating Coverage
-- Dataset: CMS Hospital General Information
--
-- Purpose:
--   Analyze how hospital rating availability varies
--   across U.S. states.
--
-- Scope:
--   Restricted to the 50 U.S. states (excludes DC
--   and U.S. territories) to ensure consistent
--   geographic comparison.
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
--   to highlight weakest rating coverage.
-- ============================================

SELECT state,
	   COUNT(*) AS total_hospitals,
       COUNT(CASE WHEN rating_available = 1 THEN 1 END) AS rated_hospitals,
	   COUNT(CASE WHEN rating_available = 0 THEN 1 END) AS unrated_hospitals,
       ROUND(AVG(CASE WHEN rating_available = 1 THEN 1 ELSE 0 END), 2)*100 AS percent_rated,
       ROUND(AVG(CASE WHEN rating_available = 0 THEN 1 ELSE 0 END), 2)*100 AS percent_unrated
FROM hospital_rating_coverage
WHERE state IN (
    'AL','AK','AZ','AR','CA','CO','CT','DE','FL','GA',
    'HI','ID','IL','IN','IA','KS','KY','LA','ME','MD',
    'MA','MI','MN','MS','MO','MT','NE','NV','NH','NJ',
    'NM','NY','NC','ND','OH','OK','OR','PA','RI','SC',
    'SD','TN','TX','UT','VT','VA','WA','WV','WI','WY'
)
GROUP BY state
ORDER BY percent_unrated DESC, total_hospitals DESC;