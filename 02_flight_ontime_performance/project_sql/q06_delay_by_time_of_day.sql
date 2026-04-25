/*Q6. Does departure time affect delay rate? (morning vs evening)*/
SELECT 
    CASE 
        WHEN time BETWEEN 0 AND 359 THEN '1 - Early Morning (12am-6am)'
        WHEN time BETWEEN 360 AND 719 THEN '2 - Morning (6am-12pm)'
        WHEN time BETWEEN 720 AND 1079 THEN '3 - Afternoon (12pm-6pm)'
        ELSE '4 - Evening (6pm-12am)'
    END AS time_bucket,
    COUNT(*) AS total_flights,
    COUNT(*) FILTER (WHERE delay = 1) AS delayed_flights,
    ROUND(COUNT(*) FILTER (WHERE delay = 1) * 100.0 / COUNT(*), 2) AS delay_rate
FROM flight_performance
GROUP BY
    CASE 
        WHEN time BETWEEN 0 AND 359 THEN '1 - Early Morning (12am-6am)'
        WHEN time BETWEEN 360 AND 719 THEN '2 - Morning (6am-12pm)'
        WHEN time BETWEEN 720 AND 1079 THEN '3 - Afternoon (12pm-6pm)'
        ELSE '4 - Evening (6pm-12am)'
    END
ORDER BY time_bucket ASC;