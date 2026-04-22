/* Q3. What's the split between loyal and disloyal customers, and does
loyalty correlate with satisfaction? */

SELECT
    customer_type,
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
GROUP BY customer_type
ORDER BY satisfaction_rate DESC;
