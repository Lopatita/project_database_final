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