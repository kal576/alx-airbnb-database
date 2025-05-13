-- Inner Join to retrieve all bookings and the respective users
SELECT 
    bookings.booking_id,
    bookings.check_in_date,
    bookings.total_price,
    users.user_id,
    CONCAT(users.first_name, ' ', users.last_name) AS full_name,
    users.email
FROM bookings
INNER JOIN users ON users.user_id = bookings.guest_id;


-- Left join to retrieve all properties and their reviews
SELECT 
    properties.property_id,
    properties.title,
    reviews.review_id,
    reviews.rating,
    reviews.review
FROM properties
LEFT JOIN reviews ON properties.property_id = reviews.property_id
ORDER BY reviews.rating;


-- Full outer join to retireve all users and bookings
SELECT 
    users.user_id,
    CONCAT(users.first_name, ' ', users.last_name) AS full_name,
    bookings.booking_id,
    bookings.check_in_date,
    bookings.status
FROM users
FULL OUTER JOIN bookings ON users.user_id = bookings.guest_id;
