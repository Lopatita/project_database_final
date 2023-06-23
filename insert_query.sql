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