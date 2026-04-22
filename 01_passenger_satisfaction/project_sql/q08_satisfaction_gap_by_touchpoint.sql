/*Q8. Which touchpoints have the biggest gap between satisfied and
dissatisfied passengers?*/
SELECT
    'Inflight Wifi' AS touchpoint,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN inflight_wifi END), 2) AS satisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN inflight_wifi END), 2) AS dissatisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN inflight_wifi END) - AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN inflight_wifi END), 2) AS gap
FROM passenger_satisfaction
UNION ALL
SELECT
    'Departure Arrival Convenient' AS touchpoint,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN departure_arrival_convenient END), 2) AS satisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN departure_arrival_convenient END), 2) AS dissatisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN departure_arrival_convenient END) - AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN departure_arrival_convenient END), 2) AS gap
FROM passenger_satisfaction
UNION ALL
SELECT
    'Ease Of Online Booking' AS touchpoint,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN ease_of_online_booking END), 2) AS satisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN ease_of_online_booking END), 2) AS dissatisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN ease_of_online_booking END) - AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN ease_of_online_booking END), 2) AS gap
FROM passenger_satisfaction
UNION ALL
SELECT
    'Gate Location' AS touchpoint,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN gate_location END), 2) AS satisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN gate_location END), 2) AS dissatisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN gate_location END) - AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN gate_location END), 2) AS gap
FROM passenger_satisfaction
UNION ALL
SELECT
    'Food And Drink' AS touchpoint,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN food_and_drink END), 2) AS satisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN food_and_drink END), 2) AS dissatisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN food_and_drink END) - AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN food_and_drink END), 2) AS gap
FROM passenger_satisfaction
UNION ALL
SELECT
    'Online Boarding' AS touchpoint,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN online_boarding END), 2) AS satisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN online_boarding END), 2) AS dissatisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN online_boarding END) - AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN online_boarding END), 2) AS gap
FROM passenger_satisfaction
UNION ALL
SELECT
    'Seat Comfort' AS touchpoint,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN seat_comfort END), 2) AS satisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN seat_comfort END), 2) AS dissatisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN seat_comfort END) - AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN seat_comfort END), 2) AS gap
FROM passenger_satisfaction
UNION ALL
SELECT
    'Inflight Entertainment' AS touchpoint,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN inflight_entertainment END), 2) AS satisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN inflight_entertainment END), 2) AS dissatisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN inflight_entertainment END) - AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN inflight_entertainment END), 2) AS gap
FROM passenger_satisfaction
UNION ALL
SELECT
    'Onboard Service' AS touchpoint,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN onboard_service END), 2) AS satisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN onboard_service END), 2) AS dissatisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN onboard_service END) - AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN onboard_service END), 2) AS gap
FROM passenger_satisfaction
UNION ALL
SELECT
    'Leg Room Service' AS touchpoint,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN leg_room_service END), 2) AS satisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN leg_room_service END), 2) AS dissatisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN leg_room_service END) - AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN leg_room_service END), 2) AS gap
FROM passenger_satisfaction
UNION ALL
SELECT
    'Baggage Handling' AS touchpoint,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN baggage_handling END), 2) AS satisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN baggage_handling END), 2) AS dissatisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN baggage_handling END) - AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN baggage_handling END), 2) AS gap
FROM passenger_satisfaction
UNION ALL
SELECT
    'Checkin Service' AS touchpoint,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN checkin_service END), 2) AS satisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN checkin_service END), 2) AS dissatisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN checkin_service END) - AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN checkin_service END), 2) AS gap
FROM passenger_satisfaction
UNION ALL
SELECT
    'Inflight Service' AS touchpoint,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN inflight_service END), 2) AS satisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN inflight_service END), 2) AS dissatisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN inflight_service END) - AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN inflight_service END), 2) AS gap
FROM passenger_satisfaction
UNION ALL
SELECT
    'Cleanliness' AS touchpoint,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN cleanliness END), 2) AS satisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN cleanliness END), 2) AS dissatisfied_avg,
    ROUND(AVG(CASE WHEN satisfaction = 'satisfied' THEN cleanliness END) - AVG(CASE WHEN satisfaction = 'neutral or dissatisfied' THEN cleanliness END), 2) AS gap
FROM passenger_satisfaction
ORDER BY gap DESC;