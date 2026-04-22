/*Q2. satisfaction break down by class (Business / Eco / Eco Plus)? */

SELECT
    class,
    COUNT(*) AS total_passengers,
    ROUND(
        COUNT(CASE WHEN satisfaction = 'satisfied' THEN 1 END)
        * 100.0
        / COUNT(*),
        2
    ) AS satisfaction_rate,
    COUNT(CASE WHEN satisfaction = 'satisfied' THEN 1 END)
        AS satisfied_passengers,
    ROUND(
        COUNT(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN 1 END)
        * 100.0
        / COUNT(*),
        2
    ) AS neutral_or_dissatisfied_rate,
    COUNT(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN 1 END)
        AS dissatisfied_passengers

FROM passenger_satisfaction
GROUP BY class
ORDER BY satisfaction_rate DESC;
