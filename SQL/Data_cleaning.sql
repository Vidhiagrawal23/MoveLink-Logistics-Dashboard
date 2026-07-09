CREATE DATABASE Logistics_Analytics;

USE Logistics_Analytics;

--loads ->select and -> alt+f1 (to see tab)

--Checking count of rows
SELECT count(*) from customers;
SELECT count(*) from loads;
SELECT count(*) from routes;
SELECT count(*) from trucks;
SELECT count(*) from drivers;
SELECT count(*) from trips;

--Unique customer_id in customers table
SELECT customer_id, COUNT(*)
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;

--Unique load_id in loads table
SELECT load_id, COUNT(*)
FROM loads
GROUP BY load_id
HAVING COUNT(*) > 1;

--Unique route_id in routes table
SELECT route_id, COUNT(*)
FROM routes
GROUP BY route_id
HAVING COUNT(*) > 1;

--Unique truck_id in trucks table
SELECT truck_id, COUNT(*)
FROM trucks
GROUP BY truck_id
HAVING COUNT(*) > 1;

--Unique driver_id in drivers table
SELECT driver_id, COUNT(*)
FROM drivers
GROUP BY driver_id
HAVING COUNT(*) > 1;

--Unique trips_id in trips table
SELECT trip_id, COUNT(*)
FROM trips
GROUP BY trip_id
HAVING COUNT(*) > 1;

--Check for NULL Values
SELECT * FROM CUSTOMERS WHERE [customer_name] IS NULL;
SELECT * FROM LOADS WHERE [load_status] IS NULL;
SELECT * FROM ROUTES WHERE [fuel_surcharge_rate] IS NULL;
SELECT * FROM DRIVERS WHERE [first_name] IS NULL;
SELECT * FROM TRUCKS WHERE [model_year] IS NULL;
SELECT * FROM TRIPS WHERE [trip_status] IS NULL;


SELECT DISTINCT [booking_type] from loads;
SELECT DISTINCT customer_name from customers;

--Repatative customer name but unique customer_id 
SELECT
    customer_name,
    COUNT(*) AS Total_Records
FROM customers
GROUP BY customer_name
HAVING COUNT(*) > 1
ORDER BY Total_Records DESC;


-- Checking repitiveness of names
SELECT c.customer_id,c.customer_name, COUNT(load_id) 'Total loads'
FROM Loads l
JOIN CUSTOMERS c
ON l.customer_id = c.customer_id
WHERE c.customer_name like 'XYZ%'
GROUP BY c.customer_id, c.customer_name
Order by customer_id asc;