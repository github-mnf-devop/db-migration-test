-- V4__add_users_audit_table.sql
-- This migration creates an audit table to track user activity.

CREATE TABLE IF NOT EXISTS users_audit (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    action VARCHAR(100) NOT NULL,
    action_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    details TEXT
);

-- Optional: seed a few audit events
INSERT INTO users_audit (user_id, action, details)
VALUES
(1, 'LOGIN', 'User 1 logged in'),
(2, 'PASSWORD_RESET', 'User 2 reset password');
