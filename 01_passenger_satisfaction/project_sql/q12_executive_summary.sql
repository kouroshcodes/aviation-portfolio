/* Q12. Build a single summary view: for each class and travel type, show satisfaction rate + avg delay + top pain point. */

WITH segment_summary AS (
    SELECT
        class,
        type_of_travel,
        COUNT(*) AS total_passengers,
        ROUND(
            COUNT(CASE WHEN satisfaction = 'satisfied' THEN 1 END)
            * 100.0
            / COUNT(*),
            2
        ) AS satisfaction_rate,
        ROUND(AVG(departure_delay_minutes), 2) AS avg_delay_minutes
    FROM passenger_satisfaction
    GROUP BY class, type_of_travel
),

touchpoint_scores AS (
    SELECT
        class,
        type_of_travel,
        'Inflight Wifi' AS touchpoint,
        ROUND(AVG(inflight_wifi), 2) AS avg_rating
    FROM passenger_satisfaction
    GROUP BY class, type_of_travel
    UNION ALL
    SELECT
        class,
        type_of_travel,
        'Departure Arrival Convenient' AS touchpoint,
        ROUND(AVG(departure_arrival_convenient), 2) AS avg_rating
    FROM passenger_satisfaction
    GROUP BY class, type_of_travel
    UNION ALL
    SELECT
        class,
        type_of_travel,
        'Ease Of Online Booking' AS touchpoint,
        ROUND(AVG(ease_of_online_booking), 2) AS avg_rating
    FROM passenger_satisfaction
    GROUP BY class, type_of_travel
    UNION ALL
    SELECT
        class,
        type_of_travel,
        'Gate Location' AS touchpoint,
        ROUND(AVG(gate_location), 2) AS avg_rating
    FROM passenger_satisfaction
    GROUP BY class, type_of_travel
    UNION ALL
    SELECT
        class,
        type_of_travel,
        'Food And Drink' AS touchpoint,
        ROUND(AVG(food_and_drink), 2) AS avg_rating
    FROM passenger_satisfaction
    GROUP BY class, type_of_travel
    UNION ALL
    SELECT
        class,
        type_of_travel,
        'Online Boarding' AS touchpoint,
        ROUND(AVG(online_boarding), 2) AS avg_rating
    FROM passenger_satisfaction
    GROUP BY class, type_of_travel
    UNION ALL
    SELECT
        class,
        type_of_travel,
        'Seat Comfort' AS touchpoint,
        ROUND(AVG(seat_comfort), 2) AS avg_rating
    FROM passenger_satisfaction
    GROUP BY class, type_of_travel
    UNION ALL
    SELECT
        class,
        type_of_travel,
        'Inflight Entertainment' AS touchpoint,
        ROUND(AVG(inflight_entertainment), 2) AS avg_rating
    FROM passenger_satisfaction
    GROUP BY class, type_of_travel
    UNION ALL
    SELECT
        class,
        type_of_travel,
        'Onboard Service' AS touchpoint,
        ROUND(AVG(onboard_service), 2) AS avg_rating
    FROM passenger_satisfaction
    GROUP BY class, type_of_travel
    UNION ALL
    SELECT
        class,
        type_of_travel,
        'Leg Room Service' AS touchpoint,
        ROUND(AVG(leg_room_service), 2) AS avg_rating
    FROM passenger_satisfaction
    GROUP BY class, type_of_travel
    UNION ALL
    SELECT
        class,
        type_of_travel,
        'Baggage Handling' AS touchpoint,
        ROUND(AVG(baggage_handling), 2) AS avg_rating
    FROM passenger_satisfaction
    GROUP BY class, type_of_travel
    UNION ALL
    SELECT
        class,
        type_of_travel,
        'Checkin Service' AS touchpoint,
        ROUND(AVG(checkin_service), 2) AS avg_rating
    FROM passenger_satisfaction
    GROUP BY class, type_of_travel
    UNION ALL
    SELECT
        class,
        type_of_travel,
        'Inflight Service' AS touchpoint,
        ROUND(AVG(inflight_service), 2) AS avg_rating
    FROM passenger_satisfaction
    GROUP BY class, type_of_travel
    UNION ALL
    SELECT
        class,
        type_of_travel,
        'Cleanliness' AS touchpoint,
        ROUND(AVG(cleanliness), 2) AS avg_rating
    FROM passenger_satisfaction
    GROUP BY class, type_of_travel

),

worst_touchpoint AS (
    SELECT
        class,
        type_of_travel,
        touchpoint,
        avg_rating
    FROM (
        SELECT
            *,
            ROW_NUMBER() OVER (
                PARTITION BY class, type_of_travel
                ORDER BY avg_rating ASC
            ) AS rn
        FROM touchpoint_scores
    ) AS ranked
    WHERE rn = 1
)

SELECT
    s.class,
    s.type_of_travel,
    s.total_passengers,
    s.satisfaction_rate,
    s.avg_delay_minutes,
    w.touchpoint AS worst_touchpoint,
    w.avg_rating AS worst_avg_rating
FROM segment_summary AS s
INNER JOIN worst_touchpoint AS w
    ON s.class = w.class AND s.type_of_travel = w.type_of_travel
ORDER BY s.class ASC, s.satisfaction_rate DESC;
