USE Logistics_Analytics
SELECT * from drivers;
SELECT * from loads;
SELECT * from trips; 

SELECT
    d.*,
    t.*,
    l.*
FROM drivers d
JOIN trips t
    ON d.driver_id = t.driver_id
JOIN loads l
    ON t.load_id = l.load_id;

--1. Driver with highest revenue

SELECT 
    d.driver_id, d.first_name, 
    SUM(l.revenue) as total_revenue,
    ROUND(COUNT(d.driver_id),2) as total_trip_count
FROM drivers d
JOIN Trips t
on d.driver_id = t.driver_id
JOIN Loads l
ON l.load_id = t.load_id
GROUP BY d.driver_id, d.first_name
ORDER by total_revenue desc

--for highest revenue
SELECT top 1
    d.driver_id, d.first_name, 
    SUM(l.revenue) as total_revenue
FROM drivers d
JOIN Trips t
on d.driver_id = t.driver_id
JOIN Loads l
ON l.load_id = t.load_id
GROUP BY d.driver_id, d.first_name
ORDER by total_revenue desc


--2. Driver with most trips
SELECT top 5
    d.driver_id, d.first_name, d.last_name,
    ROUND(COUNT(d.driver_id),2) as total_trip_count
FROM drivers d
JOIN Trips t
on d.driver_id = t.driver_id
GROUP BY d.driver_id, d.first_name, d.last_name
ORDER by total_trip_count desc

--3. Driver with best MPG
SELECT 
    t.driver_id, 
    ROUND(AVG(t.average_mpg),2) as total_mpg
FROM drivers d
JOIN Trips t
on d.driver_id = t.driver_id
GROUP BY t.driver_id
order by  total_mpg desc

--4. Driver with lowest idle time
SELECT 
    t.driver_id,
    ROUND(SUM(idle_time_hours),2) as SUM_idle_time_hours
FROM drivers d
JOIN Trips t
on d.driver_id = t.driver_id
GROUP BY t.driver_id
order by  SUM_idle_time_hours;


--5. Experience vs Revenue
SELECT 
    t.driver_id, 
    d.years_experience, ROUND(SUM(l.revenue),2) as total_revenue
FROM drivers d
JOIN Trips t
on d.driver_id = t.driver_id
JOIN Loads l
ON l.load_id = t.load_id
GROUP BY t.driver_id, d.years_experience
order by  d.years_experience desc

--6. Experience vs MPG
SELECT 
    t.driver_id, 
    d.years_experience, ROUND(avg(t.average_mpg),2) as total_mpg
FROM drivers d
JOIN Trips t
on d.driver_id = t.driver_id
GROUP BY t.driver_id, d.years_experience
order by  d.years_experience desc