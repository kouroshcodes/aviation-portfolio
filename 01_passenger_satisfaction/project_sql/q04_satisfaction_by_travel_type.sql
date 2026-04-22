/*Q4. How does satisfaction differ between business travelers and personal travelers? */

SELECT
    type_of_travel,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS segment_size_pct,
    COUNT(*) AS total_passengers,
    ROUND(
        COUNT(CASE WHEN satisfaction = 'satisfied' THEN 1 END)
        * 100.0
        / COUNT(*),
        2
    ) AS satisfaction_rate,
    COUNT(CASE WHEN satisfaction = 'satisfied' THEN 1 END)
        AS satisfied_passengers
FROM passenger_satisfaction
GROUP BY type_of_travel
ORDER BY satisfaction_rate DESC;
