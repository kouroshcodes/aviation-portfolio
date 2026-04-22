/* Q9. What are the lowest-rated touchpoints specifically for Business class passengers?*/
SELECT
    'Inflight Wifi' AS touchpoint,
    ROUND(AVG(inflight_wifi), 2) AS avg_rating
FROM passenger_satisfaction
WHERE class = 'Business'
UNION ALL
SELECT
    'Departure Arrival Convenient' AS touchpoint,
    ROUND(AVG(departure_arrival_convenient), 2) AS avg_rating
FROM passenger_satisfaction
WHERE class = 'Business'
UNION ALL
SELECT
    'Ease Of Online Booking' AS touchpoint,
    ROUND(AVG(ease_of_online_booking), 2) AS avg_rating
FROM passenger_satisfaction
WHERE class = 'Business'
UNION ALL
SELECT
    'Gate Location' AS touchpoint,
    ROUND(AVG(gate_location), 2) AS avg_rating
FROM passenger_satisfaction
WHERE class = 'Business'
UNION ALL
SELECT
    'Food And Drink' AS touchpoint,
    ROUND(AVG(food_and_drink), 2) AS avg_rating
FROM passenger_satisfaction
WHERE class = 'Business'
UNION ALL
SELECT
    'Online Boarding' AS touchpoint,
    ROUND(AVG(online_boarding), 2) AS avg_rating
FROM passenger_satisfaction
WHERE class = 'Business'
UNION ALL
SELECT
    'Seat Comfort' AS touchpoint,
    ROUND(AVG(seat_comfort), 2) AS avg_rating
FROM passenger_satisfaction
WHERE class = 'Business'
UNION ALL
SELECT
    'Inflight Entertainment' AS touchpoint,
    ROUND(AVG(inflight_entertainment), 2) AS avg_rating
FROM passenger_satisfaction
WHERE class = 'Business'
UNION ALL
SELECT
    'Onboard Service' AS touchpoint,
    ROUND(AVG(onboard_service), 2) AS avg_rating
FROM passenger_satisfaction
WHERE class = 'Business'
UNION ALL
SELECT
    'Leg Room Service' AS touchpoint,
    ROUND(AVG(leg_room_service), 2) AS avg_rating
FROM passenger_satisfaction
WHERE class = 'Business'
UNION ALL
SELECT
    'Baggage Handling' AS touchpoint,
    ROUND(AVG(baggage_handling), 2) AS avg_rating
FROM passenger_satisfaction
WHERE class = 'Business'
UNION ALL
SELECT
    'Check-in Service' AS touchpoint,
    ROUND(AVG(checkin_service), 2) AS avg_rating
FROM passenger_satisfaction
WHERE class = 'Business'
UNION ALL
SELECT
    'Inflight Service' AS touchpoint,
    ROUND(AVG(inflight_service), 2) AS avg_rating
FROM passenger_satisfaction
WHERE class = 'Business'
UNION ALL
SELECT
    'Cleanliness' AS touchpoint,
    ROUND(AVG(cleanliness), 2) AS avg_rating
FROM passenger_satisfaction
WHERE class = 'Business'
ORDER BY avg_rating DESC;