INSERT INTO users (user_id, first_name, last_name, email, password, role) VALUES
('user_001', 'Alice', 'Johnson', 'alice@example.com', 'hashed_password', 'admin'),
('user_002', 'Bob', 'Smith', 'bob@example.com', 'hashed_password', 'host'),
('user_003', 'Charlie', 'Brown', 'charlie@example.com', 'hashed_password', 'guest'),
('user_004', 'Diana', 'Prince', 'diana@example.com', 'hashed_password', 'host'),
('user_005', 'Ethan', 'Cole', 'ethan@example.com', 'hashed_password', 'guest'),
('user_006', 'Fiona', 'Williams', 'fiona@example.com', 'hashed_password', 'host'),
('user_007', 'George', 'Miller', 'george@example.com', 'hashed_password', 'guest'),
('user_008', 'Hannah', 'Lee', 'hannah@example.com', 'hashed_password', 'host'),
('user_009', 'Ian', 'Clark', 'ian@example.com', 'hashed_password', 'guest'),
('user_010', 'Julia', 'Roberts', 'julia@example.com', 'hashed_password', 'host');

INSERT INTO properties (property_id, host_id, title, property_image, property_type, location, price_per_night) VALUES
('prop_001', 'user_002', 'Cozy Cottage in Malindi', 'https://example.com/prop1.jpg ', 'cottage', 'Malindi', 4500.00),
('prop_002', 'user_004', 'City Apartment in Nairobi', 'https://example.com/prop2.jpg ', 'apartment', 'Nairobi', 7500.00),
('prop_003', 'user_006', 'Beach Bedsitter Mombasa', 'https://example.com/prop3.jpg ', 'bedsitter', 'Mombasa', 3200.00),
('prop_004', 'user_008', 'Modern Apartment - Kisumu', 'https://example.com/prop4.jpg ', 'apartment', 'Kisumu', 6000.00),
('prop_005', 'user_010', 'Family Friendly Cottage', 'https://example.com/prop5.jpg ', 'cottage', 'Naivasha', 5000.00),
('prop_006', 'user_002', 'Luxury Studio in Lamu', 'https://example.com/prop6.jpg ', 'bedsitter', 'Lamu', 4000.00),
('prop_007', 'user_004', 'Executive Apartment', 'https://example.com/prop7.jpg ', 'apartment', 'Nairobi', 9000.00),
('prop_008', 'user_006', 'Quiet Cottage Nakuru', 'https://example.com/prop8.jpg ', 'cottage', 'Nakuru', 4800.00),
('prop_009', 'user_008', 'Beachside Bedsitter Diani', 'https://example.com/prop9.jpg ', 'bedsitter', 'Diani', 5500.00),
('prop_010', 'user_010', 'Weekend Getaway Cottage', 'https://example.com/prop10.jpg ', 'cottage', 'Limuru', 4200.00);

INSERT INTO bookings (booking_id, property_id, guest_id, num_of_guests, num_of_nights, total_price, check_in_date, check_out_date, status) VALUES
('book_001', 'prop_001', 'user_003', 2, 3, 13500.00, '2025-04-01 14:00:00', '2025-04-04', 'Confirmed'),
('book_002', 'prop_002', 'user_005', 4, 2, 15000.00, '2025-04-05 15:00:00', '2025-04-07', 'Pending'),
('book_003', 'prop_003', 'user_007', 1, 1, 3200.00, '2025-04-06 10:00:00', '2025-04-07', 'Confirmed'),
('book_004', 'prop_004', 'user_009', 3, 4, 24000.00, '2025-04-10 12:00:00', '2025-04-14', 'Confirmed'),
('book_005', 'prop_005', 'user_003', 2, 2, 10000.00, '2025-04-12 16:00:00', '2025-04-14', 'Cancelled'),
('book_006', 'prop_006', 'user_005', 2, 1, 4000.00, '2025-04-15 14:00:00', '2025-04-16', 'Confirmed'),
('book_007', 'prop_007', 'user_007', 5, 3, 27000.00, '2025-04-18 15:00:00', '2025-04-21', 'Pending'),
('book_008', 'prop_008', 'user_009', 2, 2, 9600.00, '2025-04-20 13:00:00', '2025-04-22', 'Confirmed'),
('book_009', 'prop_009', 'user_003', 1, 1, 5500.00, '2025-04-22 10:00:00', '2025-04-23', 'Confirmed'),
('book_010', 'prop_010', 'user_005', 2, 3, 12600.00, '2025-04-25 12:00:00', '2025-04-28', 'Pending');

INSERT INTO payments (payment_id, booking_id, amount, status, payment_date) VALUES
('pay_001', 'book_001', 13500.00, 'Completed', '2025-04-01 16:00:00'),
('pay_002', 'book_002', 15000.00, 'Pending', NULL),
('pay_003', 'book_003', 3200.00, 'Completed', '2025-04-06 11:00:00'),
('pay_004', 'book_004', 24000.00, 'Completed', '2025-04-10 14:00:00'),
('pay_005', 'book_005', 10000.00, 'Refunded', '2025-04-12 17:00:00'),
('pay_006', 'book_006', 4000.00, 'Completed', '2025-04-15 15:00:00'),
('pay_007', 'book_007', 27000.00, 'Pending', NULL),
('pay_008', 'book_008', 9600.00, 'Completed', '2025-04-20 14:00:00'),
('pay_009', 'book_009', 5500.00, 'Completed', '2025-04-22 11:00:00'),
('pay_010', 'book_010', 12600.00, 'Pending', NULL);

INSERT INTO reviews (review_id, booking_id, guest_id, property_id, rating, review, date) VALUES
('rev_001', 'book_001', 'user_003', 'prop_001', 5, 'Amazing stay! The cottage was clean and cozy.', '2025-04-04'),
('rev_002', 'book_003', 'user_007', 'prop_003', 4, 'Good experience, but the AC was noisy.', '2025-04-07'),
('rev_003', 'book_004', 'user_009', 'prop_004', 5, 'Perfect for our family trip!', '2025-04-14'),
('rev_004', 'book_006', 'user_005', 'prop_006', 4, 'Nice place, good view.', '2025-04-16'),
('rev_005', 'book_008', 'user_003', 'prop_008', 5, 'Host was very welcoming.', '2025-04-21'),
('rev_006', 'book_009', 'user_009', 'prop_009', 5, 'Would definitely come back!', '2025-04-23'),
('rev_007', 'book_001', 'user_003', 'prop_001', 4, 'Great value for money.', '2025-04-05'),
('rev_008', 'book_004', 'user_009', 'prop_004', 4, 'Slightly overpriced, but worth it.', '2025-04-15'),
('rev_009', 'book_006', 'user_005', 'prop_006', 5, 'Excellent service!', '2025-04-17'),
('rev_010', 'book_008', 'user_003', 'prop_008', 5, 'Highly recommend this place!', '2025-04-22');

INSERT INTO reviews (review_id, booking_id, property_id, rating, review, date) VALUES
('rev_011', 'book_002', 'prop_002', 4, 'Nice place overall. Would stay again.', '2025-04-07'),
('rev_012', 'book_007', 'prop_007', 5, 'Luxurious apartment and great service!', '2025-04-21'),
('rev_013', 'book_010', 'prop_010', 4, 'Good location and friendly host.', '2025-04-28'),
('rev_014', 'book_005', 'prop_005', 3, 'The place was okay, nothing special.', '2025-04-15'),
('rev_015', 'book_006', 'prop_006', 5, 'Perfect getaway spot!', '2025-04-16'),
('rev_016', 'book_004', 'prop_004', 4, 'Comfortable stay, good amenities.', '2025-04-14'),
('rev_017', 'book_008', 'prop_008', 5, 'Amazing views and peaceful environment.', '2025-04-22'),
('rev_018', 'book_009', 'prop_009', 4, 'Clean and well-maintained property.', '2025-04-23'),
('rev_019', 'book_001', 'prop_001', 5, 'Loved every minute of our stay!', '2025-04-05'),
('rev_020', 'book_003', 'prop_003', 4, 'Good value for money.', '2025-04-07');
