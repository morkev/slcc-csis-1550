-- ------------------------------------
-- SQL Joins Assignment
-- 
-- Professor: John Gordon
-- Student: Kevin Mora
-- ------------------------------------

-- Query Challenge #1
 SELECT c.customer_id, c.first_name, c.last_name, c.city, c.state, c.email, o.order_id, o.order_date
     FROM customers c
     INNER JOIN orders o
         ON o.customer_id = c.customer_id
         WHERE state IN ('OH','PA')
         ORDER BY state, last_name, first_name;
        
-- Query Challenge #2
 SELECT *, 
 	(SELECT COUNT(order_status) 
      FROM orders 
      WHERE order_status = lookup_order_status.lkp_status_id) 
      AS order_count
 			FROM lookup_order_status
            GROUP BY lkp_status_id;

-- Query Challenge #3
-- order_status 14 stands for "Delivered"
 SELECT order_id, customer_id, order_date, order_status
     FROM orders 
     WHERE order_date = '2020-05-01'      
 UNION
 SELECT order_id, customer_id, order_date, order_status
     FROM orders 
     WHERE order_date = '2020-06-01' 
 ORDER BY customer_id;

