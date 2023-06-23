CREATE VIEW Points_of_interest_details AS
SELECT poi.id, poi.nume, poi.geometrie, c.nume AS city_name, r.rating
FROM Points_of_interest poi
JOIN City c ON poi.city_id = c.id
JOIN Review r ON poi.id = r.points_of_interest_id;