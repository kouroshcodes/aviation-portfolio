/*Q5. Which day of the week has the most delays?*/

SELECT 
    day_of_week,
    COUNT(*) AS total_flights,
    COUNT(*) FILTER (WHERE delay = 1) AS delayed_flights,
    ROUND(COUNT(*) FILTER (WHERE delay = 1) * 100.0 / COUNT(*), 2) AS delay_rate
FROM 
    flight_performance
GROUP BY
    day_of_week
ORDER BY
    day_of_week ASC
    
;
