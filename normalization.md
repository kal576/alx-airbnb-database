After thorough review, I realized that my darabase had several normalization issues, which i later corrected. These include:
	1. My users table included booking_id and payment_id, which violated the 2NF. A user can make multiple bookings, and the booking and payment details will be handled inside booking and payment tables respectively while referencing the users table.
	2. I had booking_id inside properties table, which, again, broke the 2NF. A property can be booked many times, which would have caused errors in my first schema, since a property would have been booked only once. I removed the booking_id and instead added property_id to bookings table, to ensure a ptoperty is only booked once at a time.
	
