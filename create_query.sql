create extension postgis;
CREATE TABLE Country (
    id INT PRIMARY KEY,
    nume VARCHAR(50)
);

CREATE TABLE City (
    id INT PRIMARY KEY,
    nume VARCHAR(50),
    geometrie GEOMETRY (POINT, 4326),
    tara_id INT,
    FOREIGN KEY (tara_id) REFERENCES Country(id)
);
CREATE TABLE Points_of_interest (
    id INT PRIMARY KEY,
    nume VARCHAR(50),
    geometrie GEOMETRY (POLYGON, 4326),
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES City(id)
);

CREATE TABLE Points_of_interest (
    id INT PRIMARY KEY,
    nume VARCHAR(50),
    geometrie GEOMETRY (POLYGON, 4326),
    city_id INT,
    FOREIGN KEY (city_id) REFERENCES City(id)
);

CREATE TABLE Review (
    id INT PRIMARY KEY,
    content TEXT,
    rating INT,
    points_of_interest_id INT,
    FOREIGN KEY (points_of_interest_id) REFERENCES Points_of_interest(id)
);
CREATE TABLE PointSchedule (
    id INT PRIMARY KEY,
    point_of_interest_id INT,
    day_of_week VARCHAR(20),
    opening_time TIME,
    closing_time TIME,
    FOREIGN KEY (point_of_interest_id) REFERENCES Points_of_interest(id)
);
CREATE TABLE CityVisitorCount (
    id INT PRIMARY KEY,
    city_id INT,
    visitor_count INT,
    FOREIGN KEY (city_id) REFERENCES City(id)
);

CREATE TABLE bike_track(
	id INTEGER PRIMARY KEY,
	start_point VARCHAR(30),
	end_point VARCHAR(30),
	geometrie GEOMETRY (lineString, 4326),
	city_id INTEGER,
	FOREIGN KEY (city_id) REFERENCES City(id)
	);
	INSERT INTO Country (id, nume)
VALUES (1, 'Romania');