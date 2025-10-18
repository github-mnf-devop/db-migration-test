CREATE TABLE batates (
    id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    order_date TIMESTAMP DEFAULT NOW()
);
