-- ------------------------------------
-- SQL More CRUD Assignment
-- 
-- Professor: John Gordon
-- Student: Kevin Mora
-- ------------------------------------

-- Query Challenge #1
UPDATE customers 
SET zip = "84000-0000" 
WHERE state = 'CO';

-- Query Challenge #2
UPDATE orders 
SET order_status = 9 
WHERE order_date = '2020-04-30'
AND customer_id IN (178,183,186);

-- Query Challenge #3
-- First we run this line in order to find the duplicate thanks to the last name: 
SELECT * FROM customers WHERE last_name = 'Massey';

-- The same customer (Massey) appears in customer_id: (2 & 173)
-- We will delete the larger customer_id value (173)

-- We can see a three-layer relationship with a query:
SELECT c.customer_id, c.first_name, c.last_name, o.*, i.* 
	FROM customers c
	INNER JOIN orders o ON c.customer_id = o.customer_id
	INNER JOIN order_items i ON i.order_id = o.order_id
	WHERE c.customer_id = 173;

-- Since we have 3 layers to this relationship, 
-- in order to delete customer 173, we must start at the bottom layer 
-- (in this example the order_items) and delete those first, 
-- then delete the next layer up, which is orders and then we will 
-- be able to delete the customer record:

DELETE FROM order_items WHERE order_id = 150;
DELETE FROM orders WHERE customer_id = 173;
DELETE FROM customers WHERE customer_id = 173;

-- We were able to delete customer 173 avoiding orphan records.
