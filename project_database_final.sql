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

INSERT INTO Adresa (id, strada, numar, city_id)
VALUES (1, 'Alba Iulia', 2, 1),
       (2, 'Bulevardul Regele Ferdinand I', 2, 1),
       (3, 'Strada Arhitect Laszlo Szekely 1', 3, 1);

INSERT INTO PointSchedule (id, point_of_interest_id, day_of_week, opening_time, closing_time)
VALUES (1, 1, 'Monday', '09:00:00', '18:00:00'),
       (2, 1, 'Tuesday', '09:00:00', '18:00:00'),
       (3, 2, 'Wednesday', '10:00:00', '17:00:00');

INSERT INTO Review (id, content, rating, points_of_interest_id)
VALUES (1, 'Great experience!', 5, 1),
       (2, 'Average visit.', 3, 2),
       (3, 'Highly recommended!', 4, 1);

INSERT INTO CityVisitorCount (id, city_id, visitor_count)
VALUES (1, 1, 1000);

UPDATE CityVisitorCount
SET visitor_count = 15000
WHERE id = 1;

UPDATE PointSchedule
SET opening_time = '09:00:00', closing_time = '18:00:00'
WHERE id = 1;

UPDATE PointSchedule
SET opening_time = '09:00:00', closing_time = '18:00:00'
WHERE day_of_week IN ('Monday', 'Wednesday');

UPDATE Review
SET content = 'Excelent', rating = 5
WHERE id = 1;

SELECT closing_time
FROM PointSchedule
WHERE day_of_week = 'Monday';

SELECT opening_time
FROM PointSchedule
WHERE day_of_week = 'Tuesday';

SELECT strada
FROM Adresa
WHERE strada IN ('Alba Iulia', 'Strada Arhitect Laszlo Szekely');

SELECT *
FROM Review
WHERE rating = (SELECT MAX(rating) FROM Review);

DELETE FROM Review
WHERE rating = (SELECT MIN(rating) FROM Review);

UPDATE PointSchedule
SET closing_time = NULL
WHERE day_of_week = 'Monday';

DELETE FROM Points_of_interest
WHERE id = 2;

DELETE FROM Points_of_interest
WHERE id IN (1, 3);

SELECT *
FROM bike_track
JOIN Points_of_interest ON bike_track.city_id = Points_of_interest.city_id;

SELECT *
FROM Adresa
JOIN bike_track ON Adresa.city_id = bike_track.city_id;

SELECT *
FROM Points_of_interest
JOIN City ON Points_of_interest.city_id = City.id;

SELECT *
FROM Review
JOIN Points_of_interest ON Review.points_of_interest_id = Points_of_interest.id;

SELECT *
FROM PointSchedule
JOIN Points_of_interest ON PointSchedule.point_of_interest_id = Points_of_interest.id;

SELECT *
FROM CityVisitorCount
JOIN City ON CityVisitorCount.city_id = City.id;

SELECT MIN(rating) AS min_rating
FROM Review;

SELECT MAX(rating) AS max_rating
FROM Review;

SELECT SUM(visitor_count) AS total_visitors
FROM CityVisitorCount;

SELECT AVG(rating) AS avg_rating
FROM Review;

CREATE FUNCTION getAverageRating(pointOfInterestId INT) RETURNS DECIMAL
AS $$
DECLARE avgRating DECIMAL;
BEGIN
    SELECT AVG(rating) INTO avgRating
    FROM Review
    WHERE points_of_interest_id = pointOfInterestId;

    RETURN avgRating;
END;
$$ LANGUAGE plpgsql;

ALTER TABLE Review
ADD COLUMN date_visited DATE;

ALTER TABLE Points_of_interest
ADD COLUMN description TEXT;

CREATE VIEW Points_of_interest_details AS
SELECT poi.id, poi.nume, poi.geometrie, c.nume AS city_name, r.rating
FROM Points_of_interest poi
JOIN City c ON poi.city_id = c.id
JOIN Review r ON poi.id = r.points_of_interest_id;