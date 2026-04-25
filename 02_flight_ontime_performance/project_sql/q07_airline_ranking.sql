-- Q7. Rank airlines by delay rate using RANK()

WITH airline_stats AS (
    SELECT 
        airline,
        COUNT(*) AS total_flights,
        COUNT(*) FILTER (WHERE delay = 1) AS delayed_flights,
        ROUND(COUNT(*) FILTER (WHERE delay = 1) * 100.0 / COUNT(*), 2) AS delay_rate
    FROM flight_performance
    GROUP BY airline
)
SELECT 
    RANK() OVER (ORDER BY delay_rate DESC) AS rank,
    airline,
    total_flights,
    delayed_flights,
    delay_rate
FROM airline_stats
ORDER BY rank;