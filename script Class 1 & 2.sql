use firstdb
 SET GLOBAL local_infile = ON;
LOAD DATA LOCAL INFILE '/Users/MAdamAnees/Desktop/DataEng1/DE1SQL-master/SQL1/birdstrikes_small.csv'
INTO TABLE birdstrikes
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, aircraft, flight_date, damage, airline, state, phase_of_flight, @v_reported_date, bird_size, cost, @v_speed)
SET
speed = nullif(@v_speed, ''),
reported_date = nullif(@v_reported_date, '');
SHOW TABLES;
DESCRIBE birdstrikes;
SELECT * FROM birdstrikes;
SELECT cost FROM birdstrikes;
SELECT airline,cost FROM birdstrikes;
CREATE TABLE new_birdstrikes LIKE birdstrikes;
SHOW TABLES;
DESCRIBE new_birdstrikes;
SELECT * FROM new_birdstrikes;
DROP TABLE IF EXISTS new_birdstrikes;
CREATE TABLE employee (id INTEGER NOT NULL, employee_name VARCHAR(255) NOT NULL, PRIMARY KEY(id));
DESCRIBE employee;
INSERT INTO employee (id,employee_name) VALUES(1,'Student1');
INSERT INTO employee (id,employee_name) VALUES(2,'Student2');
INSERT INTO employee (id,employee_name) VALUES(3,'Student3');
SELECT * FROM employee;
UPDATE employee SET employee_name='Arnold Schwarzenegger' WHERE id = '1';
UPDATE employee SET employee_name='The Other Arnold' WHERE id = '2';
SELECT * FROM employee;
DELETE FROM employee WHERE id = 3;
SELECT * FROM employee
TRUNCATE employee;
SELECT * FROM employee;
CREATE USER 'MAdamAnees'@'%' IDENTIFIED BY 'MAdamAnees';
GRANT ALL ON birdstrikes.employee TO 'MAdamAnees'@'%';
CREATE SCHEMA birdstrikes;
GRANT SELECT (state) ON birdstrikes.birdstrikes TO 'MAdamAnees'@'%';
USE birdstrikes
CREATE TABLE `birdstrikes` (
  `id` int NOT NULL,
  `aircraft` varchar(32) DEFAULT NULL,
  `flight_date` date NOT NULL,
  `damage` varchar(16) NOT NULL,
  `airline` varchar(255) NOT NULL,
  `state` varchar(255) DEFAULT NULL,
  `phase_of_flight` varchar(32) DEFAULT NULL,
  `reported_date` date DEFAULT NULL,
  `bird_size` varchar(16) DEFAULT NULL,
  `cost` int NOT NULL,
  `speed` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
LOAD DATA LOCAL INFILE '/Users/MAdamAnees/Desktop/DataEng1/DE1SQL-master/SQL1/birdstrikes_small.csv'
INTO TABLE birdstrikes
FIELDS TERMINATED BY ';'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(id, aircraft, flight_date, damage, airline, state, phase_of_flight, @v_reported_date, bird_size, cost, @v_speed)
SET
speed = nullif(@v_speed, ''),
reported_date = nullif(@v_reported_date, '');
SELECT state, cost FROM birdstrikes ORDER BY cost;
SELECT * FROM birdstrikes LIMIT 10;
SELECT * FROM birdstrikes LIMIT 10,1;
Select * from birdstrikes
 -- Exercise 1: What state figures in the 145th line of our database?
 SELECT * FROM birdstrikes LIMIT 144,1
  -- Answer: Tennessee
  SELECT state, cost FROM birdstrikes ORDER BY cost;
  SELECT state, cost FROM birdstrikes ORDER BY state, cost ASC;
  SELECT state, cost FROM birdstrikes ORDER BY cost DESC;
  -- Exercise 2: What is flight_date of the latest birstrike in this database 
 SELECT flight_date FROM birdstrikes ORDER BY flight_date DESC
 -- Answer: 18th April 2000
 SELECT DISTINCT damage FROM birdstrikes;
 SELECT DISTINCT airline, damage FROM birdstrikes;
  -- Exercise 3: What was the cost of the 50th most expensive damage?
 SELECT DISTINCT cost FROM birdstrikes ORDER BY cost DESC
 -- 5346
 SELECT * FROM birdstrikes WHERE state = 'Alabama';
 SELECT * FROM birdstrikes WHERE state != 'Alabama'
SELECT DISTINCT state FROM birdstrikes WHERE state LIKE 'A%';
SELECT DISTINCT state FROM birdstrikes WHERE state LIKE 'a%';
SELECT DISTINCT state FROM birdstrikes WHERE state LIKE 'ala%';
SELECT DISTINCT state FROM birdstrikes WHERE state LIKE 'North_a%';
SELECT DISTINCT state FROM birdstrikes WHERE state NOT LIKE 'a%' ORDER BY state;
SELECT * FROM birdstrikes WHERE state = 'Alabama' AND bird_size = 'Small'
SELECT * FROM birdstrikes WHERE state = 'Alabama' OR state = 'Missouri';
SELECT DISTINCT(state) FROM birdstrikes WHERE state IS NOT NULL AND state != '' ORDER BY state;
SELECT * FROM birdstrikes WHERE state IN ('Alabama', 'Missouri','New York','Alaska');
SELECT DISTINCT(state) FROM birdstrikes WHERE LENGTH(state) = 5;
SELECT * FROM birdstrikes WHERE speed = 350;
SELECT * FROM birdstrikes WHERE speed >= 10000;
SELECT ROUND(SQRT(speed/2) * 10) AS synthetic_speed FROM birdstrikes;
SELECT * FROM birdstrikes where cost BETWEEN 20 AND 40;
 -- Exercise 04: What state figures in the 2nd record, if you filter out all records which have no state and no bird_size specified?
SELECT * FROM birdstrikes WHERE state = '' AND bird_size =  '';
 -- Answer: '101','Airplane','2000-01-13','No damage','AMERICAN AIRLINES','','Climb',NULL,'','0','12'
SELECT * FROM birdstrikes WHERE flight_date = "2000-01-02";
SELECT * FROM birdstrikes WHERE flight_date >= '2000-01-01' AND flight_date <= '2000-01-03';
SELECT * FROM birdstrikes where flight_date BETWEEN "2000-01-01" AND "2000-01-03";
 -- Exercise 05: How many days elapsed between the current date and the flights happening in week 52, for incidents from Colorado? (Hint: use NOW, DATEDIFF, WEEKOFYEAR)
SELECT WEEKOFYEAR(flight_date), flight_date FROM birdstrikes WHERE state = 'Colorado';
 -- 2000-01-01
SELECT NOW() as 'current_date';
 -- 2020-10-04 19:28:08
SELECT DATEDIFF ('2020-10-04', '2000-01-01');
 -- Answer: 7582
