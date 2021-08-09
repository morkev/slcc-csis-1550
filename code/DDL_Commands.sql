-- ------------------------------------
-- SQL DDL Commands Assignment
-- 
-- Professor: John Gordon
-- Student: Kevin Mora
-- ------------------------------------

-- Query Challenge #1
CREATE TABLE customer_reviews 
(
    review_id int NOT NULL AUTO_INCREMENT,
    product_name varchar(45) DEFAULT NULL,
    product_rating int NOT NULL CHECK (product_rating between 1 and 5),
    reviewer_comment varchar(250) DEFAULT NULL,
    reviewer_first_name varchar(25) DEFAULT NULL,
    reviewer_last_name varchar(25) DEFAULT NULL,
    reviewer_email varchar(45) DEFAULT NULL,
	PRIMARY KEY (`review_id`)
);

-- Query Challenge #2
ALTER TABLE customers ADD age int;
ALTER TABLE customer_reviews ADD posted DATE;
ALTER TABLE customers DROP COLUMN twitter;
ALTER TABLE products MODIFY COLUMN artist varchar(128);
ALTER TABLE customers MODIFY COLUMN phone varchar(25);
