-- Inner Join to retrieve all bookings and the respective users
SELECT * FROM Bookings
JOIN Users ON users.user_id = bookings.guest_id

-- Left join to retrieve all properties and their reviews
SELECT property_id, title FROM Properties
JOIN Reviews ON properties.property_id = reviews.property_id

-- Full outer join to retireve all users and bookings
SELECT user_id, CONCAT(first_name, ' ', last_name) AS full_name FROM Users
FULL OUTER JOIN Bookings ON users.user_id = bookings.guest_id
