-- Users table indexes
CREATE UNIQUE INDEX idx_email ON users(email);

-- bookngs tsble indexes
CREATE INDEX idx_bookings_guest_id ON bookings(guest_id);
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- properties table indexes
CREATE INDEX idx_properties_host_id ON properties(host_id);
CREATE INDEX idx_property_id ON properties(property_id);

-- analysing performance
EXPLAIN ANALYZE SELECT * FROM properties WHERE host_id = 'h0001';
