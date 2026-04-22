/*Q1. Overall satisfaction rate and passenger count. */

SELECT
    COUNT(*) AS total_passengers,
    COUNT(
        CASE
            WHEN satisfaction = 'satisfied' THEN 1
        END
    ) AS satisfied_passengers,
    ROUND(
        COUNT(
            CASE
                WHEN satisfaction = 'satisfied' THEN 1
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS satisfaction_rate,
    COUNT(
        CASE
            WHEN satisfaction = 'neutral or dissatisfied' THEN 1
        END
    ) AS dissatisfied_passengers,
    ROUND(
        COUNT(
            CASE
                WHEN satisfaction = 'neutral or dissatisfied' THEN 1
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS neutral_or_dissatisfied_rate
FROM
    passenger_satisfaction;
