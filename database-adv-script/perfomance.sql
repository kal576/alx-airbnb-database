-- initial query
SELECT b.booking_id,
	b.guest-id,
	CONCAT(u.first_name, ' ', u.last_name) AS full_name,
	p.property_id,
	p.title,
	pay.payment_id,
	pay.payment_method,
	pay.payment_date
FROM Bookings
JOIN users u ON u.user_id = b.guest_id
JOIN properties p ON p.property_id = b.property_id
LEFT JOIN payments pay ON pay.booking_id = b.booking_id
WHERE pay.method = 'Cash' AND p.title IS NOT NULL
ORDER BY b.booking_id;

-- created indexes
CREATE INDEX idx_bookings_guest_id ON bookings(guest_id)
CREATE INDEX idx_bookings_properties_id ON bookings(property_id)
CREATE INDEX idx_payments_booking_id ON payments(booking_id)

--optimized query 
EXPLAIN SELECT b.booking_id,
        b.guest-id,
        CONCAT(u.first_name, ' ', u.last_name) AS full_name,
        p.property_id,
        p.title,
        pay.payment_id,
        pay.payment_method,
        pay.payment_date
FROM Bookings 
JOIN users u ON u.user_id = b.guest_id
JOIN properties p ON p.property_id = b.property_id
LEFT JOIN payments pay ON pay.booking_id = b.booking_id
WHERE pay.method = 'Cash' AND p.title IS NOT NULL
ORDER BY b.booking_id;


