/*Q1 — what's the total flights, delayed flights, and delay rate?*/

SELECT 
    COUNT(*) AS total_flights,
    COUNT(*) FILTER (WHERE delay = 1) AS delayed_flights,
    COUNT(*) FILTER (WHERE delay = 0) AS ontime_flights,
    ROUND(COUNT(*) FILTER (WHERE delay = 1) * 100.0 / COUNT(*), 2) AS delay_rate
FROM flight_performance;



