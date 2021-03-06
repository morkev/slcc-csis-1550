-- ------------------------------------
-- SQL Final Exam – Written Queries
-- 
-- Professor: John Gordon
-- Student: Kevin Mora
-- ------------------------------------

-- Query Challenge #1
SELECT c.state, COUNT(o.order_id) AS numOrders
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id 
WHERE country = 'US'
GROUP BY c.state
ORDER BY c.state;

-- Query Challenge #2
SELECT *
	FROM customers c
	LEFT JOIN orders o
	ON c.customer_id = o.customer_id
	WHERE c.state = "UT";

-- Query Challenge #3
SELECT o.order_id, o.customer_id, o.order_date
FROM orders o
WHERE order_id IN
(
	SELECT DISTINCT order_id
	FROM order_items
	WHERE product_id IN (1, 201, 243)
);

-- Query Challenge #4
INSERT INTO products (artist, title, released, price, media, stock) 
VALUES ('The Beatles','All My Loving',1963,29.85,'Vinyl',8);

-- Query Challenge #5
INSERT INTO customers (first_name, last_name, address1, city, state, zip, country, phone, email, twitter) 
VALUES ('Kevin','Mora','1830 Lambda Squared','Salt Lake City','UT','63457-9530','US','3854569820','sci.kevinmora@gmail.com','@FermionicSoup');

-- Query Challenge #6
UPDATE customers 
SET zip = "99999" 
WHERE state = 'CO';

-- Query Challenge #7
ALTER TABLE order_items MODIFY COLUMN price decimal(10,2);
