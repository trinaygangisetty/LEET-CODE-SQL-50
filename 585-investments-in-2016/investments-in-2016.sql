WITH cte AS (
    SELECT
        pid,
        tiv_2015,
        tiv_2016,
        lat,
        lon,
        COUNT(pid) OVER(PARTITION BY lat, lon) AS location_count
    FROM insurance
),
cte2 AS (
    SELECT 
        pid,
        tiv_2015,
        tiv_2016
    FROM cte
    WHERE location_count = 1 
),
cte3 AS (
    SELECT 
        tiv_2016
    FROM cte2
    WHERE tiv_2015 IN (
        SELECT tiv_2015 
        FROM insurance
        GROUP BY tiv_2015
        HAVING COUNT(pid) > 1 
    )
)
SELECT ROUND(SUM(tiv_2016), 2) AS tiv_2016
FROM cte3;
