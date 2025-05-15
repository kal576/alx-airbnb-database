-- Query to find the total number of bookings made by each user
SELECT users.user_id,
	CONCAT (users.first_name, ' ', users.last_name) AS full_name,
	COUNT(bookings.booking_id) AS total_bookings
FROM Users
LEFT JOIN Bookings ON users.user_id = bookings.guest_id
GROUP BY user_id, first_name, last_name
ORDER BY total_bookings

-- Ranking properties based on total number of bookings
SELECT p.property_id,
		p.title,
        COUNT(b.booking_id) AS total_bookings,
        RANK() OVER (ORDER BY COUNT(b.booking_id)) AS booking_rank,
	    ROW_NUMBER() OVER (ORDER BY COUNT(b.booking_id)) AS row_num
FROM properties p
INNER JOIN bookings b ON b.property_id = p.property_id
GROUP BY property_id, title
ORDER BY total_bookings
	
