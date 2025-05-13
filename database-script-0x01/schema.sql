-- Users Table
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(255) UNIQUE NOT NULL,
    password TEXT NOT NULL,  -- Should store hashed passwords
    role VARCHAR(20) CHECK (role IN ('admin', 'host', 'guest')) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    deleted_at TIMESTAMP
)

-- Properties Table
CREATE TABLE properties (
    property_id SERIAL PRIMARY KEY,
    host_id INT,
    title VARCHAR(255),
    property_image TEXT,  -- URL or path to image
    property_type VARCHAR(50) CHECK (property_type IN ('apartment', 'bedsitter', 'cottage')),
    location VARCHAR(255),
    is_available BOOLEAN DEFAULT TRUE,
    price_per_night NUMERIC(10, 2),
    FOREIGN KEY (host_id) REFERENCES users(user_id) ON DELETE SET NULL
);

-- Bookings Table
CREATE TABLE bookings (
    booking_id SERIAL PRIMARY KEY,
    property_id INT,
    guest_id INT,
    num_of_guests INT NOT NULL,
    num_of_nights INT DEFAULT 1,
    total_price NUMERIC(10, 2),
    check_in_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    check_out_date DATE,
    status VARCHAR(50) DEFAULT 'Pending' CHECK (status IN ('Pending', 'Confirmed', 'Cancelled', 'Refund Requested', 'Refunded')),
    cancelled_at TIMESTAMP,
    FOREIGN KEY (property_id) REFERENCES properties(property_id) ON DELETE SET NULL,
    FOREIGN KEY (guest_id) REFERENCES users(user_id) ON DELETE SET NULL
);

-- Payments Table
CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    booking_id INT,
    amount NUMERIC(10, 2),
    status VARCHAR(50) DEFAULT 'Pending' CHECK (status IN ('Pending', 'Completed', 'Pending Refund', 'Refunded')),
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    refund_requested_at TIMESTAMP,
    refund_processed_at TIMESTAMP,
    refund_reason TEXT,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE SET NULL
);

-- Reviews Table
CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    booking_id INT,
    guest_id INT,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review TEXT,
    date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (booking_id) REFERENCES bookings(booking_id) ON DELETE SET NULL,
    FOREIGN KEY (guest_id) REFERENCES users(user_id) ON DELETE SET NULL
);
