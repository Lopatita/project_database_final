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

UPDATE PointSchedule
SET closing_time = NULL
WHERE day_of_week = 'Monday';