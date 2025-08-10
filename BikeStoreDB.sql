create database Elevate_labs;

use Elevate_labs;

CREATE TABLE brands (
    brand_id INT PRIMARY KEY,
    brand_name VARCHAR(255)
);

SELECT * FROM brands LIMIT 5;
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(255)
);

SELECT * FROM categories LIMIT 5;
CREATE TABLE category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);
SELECT * FROM category LIMIT 5;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    phone VARCHAR(50),
    email VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    zip_code VARCHAR(20)
);

SELECT * FROM customers LIMIT 5;

CREATE TABLE order_items (
    order_id INT,
    item_id INT,
    product_id INT,
    quantity INT,
    list_price DECIMAL(10,2),
    discount DECIMAL(4,2),
    PRIMARY KEY (order_id, item_id)
);



CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_status VARCHAR(50),
    order_date DATE,
    required_date DATE,
    shipped_date DATE,
    store_id INT,
    staff_id INT
);
SELECT * FROM orders LIMIT 5;
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(255),
    brand_id INT,
    category_id INT,
    model_year INT,
    list_price DECIMAL(10,2)
);
SELECT * FROM products LIMIT 5;
CREATE TABLE staffs (
    staff_id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone VARCHAR(50),
    active TINYINT,
    store_id INT,
    manager_id INT
);
SELECT * FROM staffs LIMIT 5;
CREATE TABLE stocks (
    store_id INT,
    product_id INT,
    quantity INT,
    PRIMARY KEY (store_id, product_id)
);

SELECT * FROM stocks LIMIT 5;

CREATE TABLE stores (
    store_id INT PRIMARY KEY,
    store_name VARCHAR(255),
    phone VARCHAR(50),
    email VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(255),
    state VARCHAR(255),
    zip_code VARCHAR(20)
);
SELECT * FROM stores LIMIT 5;

SELECT product_id, product_name, category_id
FROM products
WHERE category_id = 1
LIMIT 5;

SELECT category_id, COUNT(*) AS total_products
FROM products
GROUP BY category_id
LIMIT 5;
SELECT p.product_id, p.product_name, c.category_name
FROM products p
INNER JOIN category c ON p.category_id = c.category_id
LIMIT 5;


SELECT s.store_id, s.store_name, st.staff_id
FROM stores s
LEFT JOIN staffs st ON s.store_id = st.store_id
LIMIT 5;

SELECT pr.product_id, pr.product_name, st.quantity
FROM stocks st
RIGHT JOIN products pr ON st.product_id = pr.product_id
LIMIT 5;


SELECT staff_id, first_name, last_name
FROM staffs
WHERE store_id = (
    SELECT store_id
    FROM stocks
    GROUP BY store_id
    ORDER BY SUM(quantity) DESC
    LIMIT 1
);

SELECT store_id, SUM(quantity) AS total_quantity
FROM stocks
GROUP BY store_id
LIMIT 5;

CREATE VIEW product_stock_view AS
SELECT p.product_name, c.category_name, s.quantity
FROM products p
JOIN category c ON p.category_id = c.category_id
JOIN stocks s ON p.product_id = s.product_id
LIMIT 5;

SELECT category_id, AVG(list_price) AS avg_price
FROM products
GROUP BY category_id
LIMIT 5;

SELECT * FROM product_stock_view LIMIT 5;

CREATE INDEX idx_category_id ON products(category_id);

CREATE INDEX idx_store_id ON stocks(store_id);
