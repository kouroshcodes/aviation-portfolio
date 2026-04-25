SELECT 
    airport_from,
    COUNT(*) AS total_flights,
    COUNT(*) FILTER (WHERE delay = 1) AS delayed_flights,
    ROUND(COUNT(*) FILTER (WHERE delay = 1) * 100.0 / COUNT(*), 2) AS delay_rate
FROM 
    flight_performance
GROUP BY
    airport_from
HAVING 
    COUNT(*) >= 1000
ORDER BY
    delay_rate DESC
LIMIT 10
    
;