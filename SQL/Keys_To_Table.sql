
use Logistics_Analytics;

--Trip -> customers
SELECT l.customer_id
FROM LOADS l
LEFT JOIN 
Customers c
ON l.customer_id = c.customer_id
where c.customer_id IS NULL;

--Trip -> routes
SELECT l.route_id
FROM loads l
LEFT JOIN routes r
ON l.route_id = r.route_id
WHERE r.route_id IS NULL;

--Trip ->loads
SELECT t.load_id
FROM trips t
LEFT JOIN loads l
ON t.load_id = l.load_id
WHERE l.load_id IS NULL;

--Trip -> Drivers
SELECT t.driver_id
FROM trips t
LEFT JOIN drivers d
ON t.driver_id = d.driver_id
WHERE d.driver_id IS NULL;

-- Trip -> Trucks
SELECT t.truck_id
FROM trips t
LEFT JOIN trucks tr
ON t.truck_id = tr.truck_id
WHERE tr.truck_id IS NULL;

--Primary key to customers table
ALTER TABLE Customers
add Constraint pk_customer
Primary key (customer_id)

--Primary key to loads table
ALTER TABLE loads
add Constraint pk_load
Primary key (load_id)

--Primary key to Driver table
ALTER TABLE drivers
add Constraint pk_driver
Primary key (driver_id)

--Primary key to route table
ALTER TABLE routes
add Constraint pk_route
Primary key (route_id)

--Primary key to truck table
ALTER TABLE trucks
add Constraint pk_truck
Primary key (truck_id)

--Primary key to trip table
ALTER TABLE trips
add Constraint pk_trip
Primary key (trip_id)

--Add foreign key to load ->customer, route

ALTER TABLE Loads
ADD CONSTRAINT fk_customer
FOREIGN  KEY(customer_id)
REFERENCES customers(customer_id)

ALTER TABLE Loads
ADD CONSTRAINT fk_route
FOREIGN  KEY(route_id)
REFERENCES routes(route_id)

--Add foreign key to trip ->load, driver, truck

ALTER TABLE trips
ADD CONSTRAINT FK_Trips_Loads
FOREIGN KEY (load_id)
REFERENCES loads(load_id);

ALTER TABLE trips
ADD CONSTRAINT FK_Trips_Drivers
FOREIGN KEY (driver_id)
REFERENCES drivers(driver_id);

ALTER TABLE trips
ADD CONSTRAINT FK_Trips_Trucks
FOREIGN KEY (truck_id)
REFERENCES trucks(truck_id);