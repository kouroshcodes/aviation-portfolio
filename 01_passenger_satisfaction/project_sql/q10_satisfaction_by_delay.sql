/* Q10. Do departure delays directly cause dissatisfaction, or do passengers forgive short delays? */
SELECT
    CASE
        WHEN departure_delay_minutes = 0 THEN 'No Delay'
        WHEN departure_delay_minutes BETWEEN 1 AND 15 THEN 'Short (1-15 min)'
        WHEN
            departure_delay_minutes BETWEEN 16 AND 45
            THEN 'Moderate (16-45 min)'
        WHEN departure_delay_minutes BETWEEN 46 AND 120 THEN 'Long (46-120 min)'
        ELSE 'Severe (120+ min)'
    END AS delay_bucket,
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
    CASE
        WHEN departure_delay_minutes = 0 THEN 'No Delay'
        WHEN departure_delay_minutes BETWEEN 1 AND 15 THEN 'Short (1-15 min)'
        WHEN
            departure_delay_minutes BETWEEN 16 AND 45
            THEN 'Moderate (16-45 min)'
        WHEN departure_delay_minutes BETWEEN 46 AND 120 THEN 'Long (46-120 min)'
        ELSE 'Severe (120+ min)'
    END
ORDER BY
    satisfaction_rate DESC;
