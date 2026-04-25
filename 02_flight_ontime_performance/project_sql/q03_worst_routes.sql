/*On to Q3 — Worst Routes
Which routes (airport_from → airport_to) have the worst delay rates?*/

SELECT 
    airport_from || ' → ' || airport_to AS route,
    airline,
    COUNT(*) AS flights,
    ROUND(COUNT(*) FILTER (WHERE delay = 1) * 100.0 / COUNT(*), 2) AS delay_rate
FROM 
    flight_performance
GROUP BY
    airport_from, airport_to,airline
HAVING 
    COUNT(*) >= 100
ORDER BY
    delay_rate DESC;