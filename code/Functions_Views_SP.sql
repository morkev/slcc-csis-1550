-- ---------------------------------------------------------
-- SQL – Functions, Views & SP Assignment
-- 
-- Professor: John Gordon
-- Student: Kevin Mora
-- ---------------------------------------------------------

-- Challenge #1: Create a query that implements a String and Numeric function.
-- Description: The following function displays the artist name as last_name and first_name,
-- and also calculates the square root of the stock of the artists' album titles.

SELECT 
    SUBSTRING(artist, 1, POSITION(" " IN artist) - 1) AS first_name, 
    SUBSTRING(artist, POSITION(" " IN artist) + 1) AS last_name,
    title, 
    stock,
    SQRT(stock) AS stock_square_root
FROM products;

-- Challenge #2: Create a view.
-- Description: This query will produce a result set with 2 columns: 
-- 1) A concatenated combination of the artist and album
-- 2) The total sales (price) for each product. 
-- The query joins the orders, order_items and products tables. Lastly it groups by product id so that we can SUM all the orders of each product and sorts by the artist/title concatenation.

CREATE `total_sales`
    SELECT 
        CONCAT(`p`.`artist`, ' [ ', `p`.`title`, ' ]') AS `Product`,
        SUM(`i`.`price`) AS `Product_Total`
    FROM
        ((`orders` `o`
        JOIN `order_items` `i` ON ((`o`.`order_id` = `i`.`order_id`)))
        JOIN `products` `p` ON ((`i`.`product_id` = `p`.`product_id`)))
    GROUP BY `i`.`product_id`
    ORDER BY `Product`

-- Challenge #3: Create a Stored Procedure.
-- Description: Returns the number of customers in a given state. The parameter accepts the state abbreviation ('UT') – varchar(2).

CREATE PROCEDURE `customers_in_given_state`
(
	IN state_abbreviation varchar(2)
)
BEGIN
	SELECT COUNT(customer_id) AS Customers_in_Given_State
	FROM customers
	WHERE state = state_abbreviation;
END 