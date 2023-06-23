DELETE FROM Review
WHERE rating = (SELECT MIN(rating) FROM Review);

DELETE FROM Points_of_interest
WHERE id = 2;

DELETE FROM Points_of_interest
WHERE id IN (1, 3);