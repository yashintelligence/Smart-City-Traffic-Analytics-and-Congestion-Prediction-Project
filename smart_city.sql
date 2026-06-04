show databases;

create database smart_city_traffic;

use smart_city_traffic;

show tables;

CREATE TABLE roads(
road_id INT PRIMARY KEY AUTO_INCREMENT,
road_name VARCHAR(100),
area VARCHAR(100),
road_length_km DECIMAL(5,2)
);

desc roads;

CREATE TABLE vehicle_types(
vehicle_id INT PRIMARY KEY AUTO_INCREMENT,
vehicle_type VARCHAR(50)
);

desc vehicle_types;

CREATE TABLE signals(
signal_id INT PRIMARY KEY AUTO_INCREMENT,
signal_name VARCHAR(100),
area VARCHAR(100)
);

desc signals;

CREATE TABLE weather(
weather_id INT PRIMARY KEY AUTO_INCREMENT,
weather_condition VARCHAR(50),
rainfall_mm DECIMAL(5,2),
temperature DECIMAL(5,2)
);

desc weather;

CREATE TABLE accidents(
accident_id INT PRIMARY KEY AUTO_INCREMENT,
road_id INT,
accident_date DATE,
accident_count INT,
FOREIGN KEY (road_id)
REFERENCES roads(road_id)
);

desc accidents;

CREATE TABLE traffic_data(
traffic_id INT PRIMARY KEY AUTO_INCREMENT,
road_id INT,
vehicle_id INT,
signal_id INT,
weather_id INT,
traffic_date DATE,
day_name VARCHAR(20),
time_slot VARCHAR(50),
vehicle_count INT,
average_speed DECIMAL(5,2),
waiting_time_seconds INT,
congestion_level VARCHAR(20),
FOREIGN KEY (road_id)
REFERENCES roads(road_id),
FOREIGN KEY (vehicle_id)
REFERENCES vehicle_types(vehicle_id),
FOREIGN KEY (signal_id)
REFERENCES signals(signal_id),
FOREIGN KEY (weather_id)
REFERENCES weather(weather_id)
);

desc traffic_data;

-- INSERT SAMPLE DATA

INSERT INTO roads
(road_name,area,road_length_km)
VALUES
('Ring Road','Surat',12.5),
('Varachha Road','Surat',8.2),
('Dumas Road','Surat',15.3),
('Adajan Road','Surat',10.2),
('Udhna Road','Surat',9.8);

select * from roads;

INSERT INTO vehicle_types(vehicle_type)
VALUES
('Car'),
('Bike'),
('Bus'),
('Truck'),
('Auto');

select * from vehicle_types;

INSERT INTO signals
(signal_name,area)
VALUES
('Signal A','Ring Road'),
('Signal B','Varachha'),
('Signal C','Dumas'),
('Signal D','Adajan'),
('Signal E','Udhna');

select * from signals;

INSERT INTO weather
(weather_condition,rainfall_mm,temperature)
VALUES
('Sunny',0,35),
('Cloudy',5,32),
('Rainy',25,28),
('Heavy Rain',60,24);

select * from weather

INSERT INTO accidents
(road_id,accident_date,accident_count)
VALUES
(1,'2025-01-01',2),
(2,'2025-01-02',3),
(3,'2025-01-03',5),
(4,'2025-01-04',1),
(5,'2025-01-05',4);

select * from accidents;

INSERT INTO traffic_data
(
road_id,
vehicle_id,
signal_id,
weather_id,
traffic_date,
day_name,
time_slot,
vehicle_count,
average_speed,
waiting_time_seconds,
congestion_level
)
VALUES
(1,1,1,1,'2025-01-01','Monday','Morning',450,48,30,'Low'),
(2,2,2,2,'2025-01-02','Tuesday','Morning',650,35,60,'Medium'),
(3,1,3,3,'2025-01-03','Wednesday','Evening',1200,15,180,'High'),
(4,3,4,1,'2025-01-04','Thursday','Afternoon',500,45,40,'Low'),
(5,2,5,4,'2025-01-05','Friday','Evening',1500,10,220,'High');

select * from traffic_data