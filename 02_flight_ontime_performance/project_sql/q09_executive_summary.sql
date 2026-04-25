/*Q9 — Executive Summary CTE (same structure as Project 1 Q12, but for flight performance: airline + delay rate + avg flight length + busiest route per airline)
Export all query results as CSVs
Push all SQL files to GitHub*/


WITH flight_summary AS (
    SELECT 
        airline,
        COUNT(*) AS total_flights,
        ROUND(COUNT(*) FILTER (WHERE delay = 1) * 100.0 / COUNT(*), 2) AS delay_rate,
        ROUND(AVG(length), 2) AS avg_flight_length
    FROM 
        flight_performance
    GROUP BY 
        airline
),
busiest_routes AS (
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
ranked_airlines AS (
    SELECT
        *,
        ROW_NUMBER() OVER (PARTITION BY route ORDER BY delay_rate ASC ) AS rn
    FROM route_airline_stats
),
best_route_per_airline AS (
    SELECT DISTINCT ON (r.airline)
        r.airline,
        b.route,
        r.flights,
        r.delay_rate AS route_delay_rate
    FROM ranked_airlines r
    JOIN busiest_routes b ON r.route = b.route
    WHERE r.rn = 1
    ORDER BY r.airline, r.delay_rate ASC
)
SELECT 
    f.airline,
    f.total_flights,
    f.delay_rate,
    f.avg_flight_length,
    br.route AS best_route,
    br.route_delay_rate
FROM flight_summary f
JOIN best_route_per_airline br ON f.airline = br.airline
ORDER BY f.total_flights DESC;