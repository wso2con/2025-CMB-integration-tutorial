CREATE DATABASE IF NOT EXISTS supermarket_feedback;
USE supermarket_feedback;

CREATE TABLE IF NOT EXISTS feedback (
    id INT AUTO_INCREMENT PRIMARY KEY,
    order_id VARCHAR(10) NOT NULL,
    feedback TEXT NOT NULL,
    sentiment ENUM('positive', 'neutral', 'negative') NOT NULL,
    categories VARCHAR(255),
    products VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
