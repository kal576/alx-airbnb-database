-- Non-Correlated Subquery
SELECT 
    property_id,
    title
FROM properties
WHERE property_id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
);
-- Correlated Subquery
SELECT 
    user_id,
    CONCAT(first_name, ' ', last_name) AS full_name
FROM users u
WHERE (
    SELECT COUNT(*) 
    FROM bookings b 
    WHERE b.guest_id = u.user_id
) > 3;
