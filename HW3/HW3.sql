use birdstrikes;
SELECT aircraft, airline, cost, 
    CASE 
        WHEN cost  = 0
            THEN 'NO COST'
        WHEN  cost >0 AND cost < 100000
            THEN 'MEDIUM COST'
        ELSE 
            'HIGH COST'
    END
    AS cost_category   
FROM  birdstrikes
ORDER BY cost_category;
 -- Exercise 1: Do the same with speed. If speed is NULL or speed < 100 create a "LOW SPEED" category, otherwise, mark as "HIGH SPEED". Use IF instead of CASE!
-- Answer Command: 
 SELECT aircraft, airline, speed, IF(speed < 100 OR speed IS NULL, 'LOW SPEED','HIGH SPEED') AS
 speed_category FROM birdstrikes ORDER BY speed_category;
 -- COUNT(*)
 SELECT COUNT(*) FROM birdstrikes;
 -- COUNT (column)
 SELECT COUNT(reported_date) FROM birdstrikes;
 -- DISTINCT COUNT (How many distinct states we have)
 SELECT COUNT(DISTINCT(state)) FROM birdstrikes;
 -- MAX, AVG, SUM
 SELECT SUM(cost) FROM birdstrikes; -- -- FOR SUM
 SELECT (AVG(speed)*1.852) as avg_km FROM birdstrikes; -- -- FOR AVG 
 SELECT DATEDIFF(MAX(reported_date),MIN(reported_date)) from birdstrikes; -- 
  -- Exercise 02: How many distinct 'aircraft' we have in the database?
  -- Answer Command: 
SELECT DISTINCT (aircraft) FROM birdstrikes;
 -- Ans: airplane and helicopter (2)
 -- Exercise 03: What was the lowest speed of aircrafts starting with 'H'
 ----- Answer Command: 
SELECT MIN(speed) AS lowest_speed FROM birdstrikes WHERE aircraft LIKE 'H%';
 -- Answer: 9
  -- What is the highest speed by aircraft type?
  SELECT MAX(speed), aircraft FROM birdstrikes GROUP BY aircraft;
 -- question: Which state for which aircraft type paid the most repair cost?
 SELECT state, aircraft, SUM(cost) AS sum FROM birdstrikes WHERE state !='' GROUP BY state, aircraft ORDER BY sum DESC;
 -- Exercise 04: Which phase_of_flight has the least of incidents?
 SELECT * from birdstrikes;
 -- Answer Command: 
SELECT COUNT(*) AS incidents, phase_of_flight FROM birdstrikes GROUP BY phase_of_flight ORDER BY incidents ASC LIMIT 1;
 -- Answer: 2, Taxi
 -- Exercise 5: What is the rounded highest average cost by phase_of_flight?
-- Answer Command: 
SELECT phase_of_flight, ROUND(AVG(cost)) as avg_cost FROM birdstrikes GROUP BY phase_of_flight ORDER BY avg_cost DESC;
 -- Answer: Climb, 54673
 SELECT AVG(speed) AS avg_speed,state FROM birdstrikes GROUP BY state WHERE ROUND(avg_speed) = 50; -- Error b/c of where
  -- Crashbummbang! The correct keyword after GROUP BY is HAVING (filter after the aggregation); WHERE works before the aggregation
SELECT AVG(speed) AS avg_speed,state FROM birdstrikes GROUP BY state HAVING ROUND(avg_speed) = 50;
 -- Answer: Vermont, Idaho.
-- Exercise 06: What the highest AVG speed of the states with names less than 5 characters?
-- Answer Command: 
SELECT AVG(speed) AS avg_speed,state FROM birdstrikes GROUP by state HAVING LENGTH(state) <=5 ORDER BY avg_speed DESC LIMIT 1;
 -- Answer: 2862.5000 -- Iowa
 