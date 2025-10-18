CREATE TABLE payments (
   id SERIAL PRIMARY KEY,
   amount DECIMAL(10,2),
   payment_date TIMESTAMP DEFAULT NOW()
);