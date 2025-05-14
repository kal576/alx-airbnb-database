-- Create Bookings table partitioned by start_date
CREATE TABLE Bookings (
    booking_id INT PRIMARY KEY,
    guest_id INT,
    property_id INT,
    start_date DATE,
    end_date DATE,
    status VARCHAR(50),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (guest_id) REFERENCES Users(user_id),
    FOREIGN KEY (property_id) REFERENCES Properties(property_id)
)
PARTITION BY RANGE (YEAR(start_date)) (
    PARTITION p2022 VALUES LESS THAN (2023),
    PARTITION p2023 VALUES LESS THAN (2024),
    PARTITION p2024 VALUES LESS THAN (2025),
    PARTITION pmax VALUES LESS THAN MAXVALUE
);
