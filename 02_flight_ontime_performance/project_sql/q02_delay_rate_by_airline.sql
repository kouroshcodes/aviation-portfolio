/*Q2 — Which airlines have the highest and lowest delay rates?
Same pattern as Project 1 Q2 — group by a category, calculate the rate, order by it
But this time you also want to show total flights per airline so we can see if a high delay rate is coming from a small sample or a large one. 
An airline with 50% delay rate on 100 flights is very different from 50% on 50,000 flights..*/


SELECT 
    airline,
    COUNT(*) AS total_flights,
    COUNT(*) FILTER (WHERE delay = 1) AS delayed_flights,
    COUNT(*) FILTER (WHERE delay = 0) AS ontime_flights,
    ROUND(COUNT(*) FILTER (WHERE delay = 1) * 100.0 / COUNT(*), 2) AS delay_rate
FROM 
    flight_performance
GROUP BY
    airline
ORDER BY
    delay_rate DESC
    
;