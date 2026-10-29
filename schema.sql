CREATE DATABASE IF NOT EXISTS shopdb;
USE shopdb;
CREATE TABLE users (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  email VARCHAR(150) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  role ENUM('customer','admin') DEFAULT 'customer'
);
CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  description TEXT,
  price DECIMAL(10,2) NOT NULL,
  stock INT DEFAULT 0
);
CREATE TABLE cart_items (
  user_id INT, product_id INT, quantity INT NOT NULL DEFAULT 1,
  PRIMARY KEY (user_id, product_id),
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE
);
CREATE TABLE orders (
  id INT AUTO_INCREMENT PRIMARY KEY,
  user_id INT NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  status ENUM('placed','shipped','delivered','cancelled') DEFAULT 'placed',
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id)
);
CREATE TABLE order_items (
  order_id INT, product_id INT, quantity INT, price DECIMAL(10,2),
  FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
  FOREIGN KEY (product_id) REFERENCES products(id)
);
INSERT INTO products (name, description, price, stock) VALUES
 ('Cotton T-Shirt','Soft everyday tee',499.00,50),
 ('Running Shoes','Lightweight trainers',2499.00,20),
 ('Backpack','25L laptop backpack',1299.00,30),
 ('Water Bottle','1L steel bottle',399.00,100);
