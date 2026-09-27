CREATE TABLE IF NOT EXISTS makes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    label VARCHAR(50) NOT NULL,
    price INT NOT NULL
);

INSERT INTO makes (name, label, price) VALUES ('Make1', 'Make 1', 1000);
INSERT INTO makes (name, label, price) VALUES ('Make2', 'Make 2', 2000);