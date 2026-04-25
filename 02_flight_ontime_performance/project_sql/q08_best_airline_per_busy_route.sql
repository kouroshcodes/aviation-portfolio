WITH busy_routes AS (
    SELECT 
        airport_from || ' → ' || airport_to AS route,
        COUNT(*) AS total_flights
    FROM flight_performance
    GROUP BY airport_from, airport_to
    ORDER BY total_flights DESC
    LIMIT 10
),

route_airline_stats AS (
    SELECT
        airport_from || ' → ' || airport_to AS route,
        airline,
        COUNT(*) AS flights,
        ROUND(
            COUNT(*) FILTER (WHERE delay = 1) * 100.0 / COUNT(*), 
            2
        ) AS delay_rate
    FROM flight_performance
    GROUP BY airport_from, airport_to, airline
    HAVING COUNT(*) >= 100
),

ranked AS (
    SELECT
        *,
        ROW_NUMBER() OVER (
            PARTITION BY route
            ORDER BY delay_rate ASC
        ) AS rn
    FROM route_airline_stats
)

SELECT 
    b.route,
    b.total_flights,
    r.airline AS best_airline,
    r.flights,
    r.delay_rate
FROM busy_routes b
JOIN ranked r ON b.route = r.route
WHERE r.rn = 1
ORDER BY b.total_flights DESC;