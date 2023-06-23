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