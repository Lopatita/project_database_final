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
