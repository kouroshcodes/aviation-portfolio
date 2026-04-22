/*Q6. Does gender play any role in satisfaction patterns? */
SELECT
    gender,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS pct_of_total,
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
GROUP BY
    gender
ORDER BY
    satisfaction_rate DESC;
