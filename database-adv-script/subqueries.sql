-- Non-Correlated Subquery
SELECT 
    p.property_id,
    p.title,
    AVG(r.rating) AS Average_rating
FROM properties p
INNER JOIN reviews r ON p.property_id = r.property_id
WHERE p.property_id IN (
    SELECT property_id
    FROM reviews
    GROUP BY property_id
    HAVING AVG(rating) > 4.0
)
GROUP BY property_id, p.title
ORDER BY property_id;

-- Correlated Subquery
SELECT 
    u.user_id,
    CONCAT(u.first_name, ' ', u.last_name) AS full_name,
    COUNT(b.booking_id) AS total_bookings
FROM users u
INNER JOIN bookings b ON b.guest_id = u.user_id
WHERE (
    SELECT COUNT(*) 
    FROM bookings b 
    WHERE b.guest_id = u.user_id
) > 3
GROUP BY user_id, full_name
ORDER BY total_bookings;
