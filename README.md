# SLCC-CSIS-1550
CSIS 1550 - SQL Programming Coursework at SLCC.

Databases are ubiquitous – i.e. they are everywhere. There are databases in your smart phone. There are databases behind every social media platform (Facebook, Twitter, Snapchat, etc.). There are databases in nearly every modern computer game. There are databases used in nearly every business that exists today. And the list goes on and on where you will find databases.

<b>Below you will find my notes (I obtained an A+ if you wonder).</b>

---
DATABASE: Collection of information that is stored and organized in manner that is easily accessed, managed and updated.

TYPES: There are many types of data, such as numbers, characters, words, images, documents, video, etc. When we need to store data for later use, the type of data and how we intend on using it most often dictates which type of database we need in order to best store and use the data.

- Relational - Data is stored in the form of rows and columns (called tabular), where each row represents one record of information and each column represents one attribute (characteristic) of the records.
- Hierarchical - Data is stored in the form of parent-child relationship nodes (depicted by circles) which graphically appears as a tree-like structure. Each node stores attribute information as well as information about its own parent/child relationship.
- There are many other types of databases, such as network, object-oriented, graph, document, etc.

##
CLASSIFICATIONS

Another way to view databases is by their classification.  There are many classifications of database technology. For our purposes  we will be focusing on databases in business, and in many businesses  the following two classifications often exist:

- Operational - These are databases that store dynamic data on day to day operations of a business, like product orders, sales, shipping details, customer reviews, etc. These types of operations are often referred to as transactional, meaning each piece of information stored in the database is generated or changed based on a transaction or event. Transactional also generally means that at any given moment we can look at the data and see the results of any of those events.
- Analytical -  These are databases (often called data warehouses) that store static historical data used for things like trends, summaries, etc. The data in an analytical database usually comes from an operational database based on a regular interval. For example, each night (or week, or month, etc.) processes might run that collect and summarize daily transactional data from the operational database and store it in the analytical database. That summarized data is then kept unchanged over time for historical purposes.

---
ERDs

One of the common ways to visualize these ideas is through Entity Relationship Diagrams (ERDs). ERDs are a standardized set of symbols used in the industry to design databases. In the early planning stages of databases we often use paper or a whiteboard to start our diagramming of our design. Then, once we have a preliminary design, we use diagramming software to formalize it.

TERMINOLOGY
- Relational Database Management System (RDBMS)
- Entity Relationship Diagram (ERD)
- Relational Model
- Entity – they are like nouns (person, place, thing)
- Relations (also known as Tables)
- Tuples (also known as Records or Rows)
- Attributes (also known as Fields, Columns or Properties)
- Auto-Increment (AI – Identity)
- Keys
	- Primary Key (PK)
	- Foreign Key (FK)
- Relationships
	- One-to-One
	- One-to-Many
	- Many-to-Many

---
CRUD OPERATIONS

In all forms of software development we perform what is known as CRUD Operations with databases. CRUD stands for Create, Read, Update and Delete.  

CRUD are the operations that we use to  add new data into a database, update (change) data that exists in a  database and delete from a database, as needed. On this page we will  introduce the concepts behind CRUD and begin to learn the SQL code to  add new data to a database. In the next module we will continue learning  more about these operations.

---
INSERT

There are three general forms of SQL INSERT syntax as shown here:

```
INSERT INTO table_name (Column, Column, Column, ...)
VALUES (value, value, value, ...);
```
... this form will insert a row into table_name with the specified column(s) being populated by the specified value(s) in the VALUES list. This is particularly useful when you are inserting rows and only populating a subset of the table's attributes, not all of them.

```
INSERT INTO table_name
VALUES (value, value, value, value, value, value, value);
```
... this form is used when you are going to insert the row and populate every column in the table.

```
INSERT INTO table_name (Column, Column, Column, ...) VALUES
    (value, value, value, ...),
    (value, value, value, ...),
    (value, value, value, ...),
    (value, value, value, ...),
    (value, value, value, ...),
    (value, value, value, ...),
    (value, value, value, ...);
```
... this form is used when  you want to insert multiple rows at one time. You specify the columns  list once, and then a series of value statements, separated by commas.  The very last value statement gets the semicolon to complete the  statement. Note: This form can also be used in conjunction with Form 2 if you are populating every column in the table.

```
-- Imagine we have a data base with records, and we run the following query.

SELECT * FROM products WHERE artist LIKE '%Charles%';

-- Turns out we don't have any albums by any artist with the name Charles. 
-- So, we can conclude we will INSERT records for the new albums.
-- NOTICE: The artist, title and media attributes, being VARCHARs, require quotes around their values.

INSERT INTO products (artist, title, released, price, media, stock) VALUES
    ('Ray Charles','I Got a Woman',1954,25.00,'Vinyl',2);

-- Remember that our table's primary key is populated by the auto-increment function of the database engine, 
-- so we do not (and actually, cannot) include it in our INSERT statement. In this case, the product_id 
-- (of type INT) was auto-populated with the next available id value by the data base engine.

-- Let's say we have additional albums by Ray Charles, and a couple of others, 
-- that we can add to the products table. This time though, 
-- let's use Form 3 of the INSERT statement and add all of them at the same time.

INSERT INTO products (artist, title, released, price, media, stock) VALUES
	('Ray Charles','Georgia on My Mind',1960,25.00,'Vinyl',1),
	('Ray Charles','Hit the Road Jack',1961,25.00,'Vinyl',3),
	('Ray Charles','One Mint Julep',1961,25.00,'Vinyl',4),
	('Ray Charles','Unchain My Heart',1961,25.00,'Vinyl',4),
	('James Brown','Please Please Please',1958,20.00,'Vinyl',3),
	('James Brown','Try Me!',1959,25.00,'Vinyl',3),
	('James Brown','Think!',1960,20.00,'Vinyl',3);

-- We can run a query to check that these inserts worked correctly.
SELECT * FROM products WHERE artist LIKE '%Ray Charles%' OR artist LIKE '%James Brown%';
```

---
UPDATE

In SQL we use the UPDATE command to modify existing records in our database.
The general form of UPDATE specifies the table to be updated, the SET clause, the attributes (fields) and their new values, and (almost always) the WHERE clause.
NOTE: an UPDATE statement without a WHERE clause will make the specified changes to modify every record in the table.

```
UPDATE table_name SET column = value, column = value, ... WHERE condition;
UPDATE customers SET phone = "502 625-9999" WHERE customer_id = 490;

-- What would happen if we left off the WHERE clause?
-- ANSWER: Every customer's phone number in the customers table would be changed to 
-- "502 625-9999", which would be a big mistake.
```

```
-- Let's say we want to increase the price of all albums in the products table that are by the artist Led Zeppelin. 
-- First we can write a query to find those products, like this.

SELECT * FROM products WHERE artist = "Led Zeppelin";

-- Our UPDATE statement will only affect records including "Led Zeppelin."
```

---
DELETE

In SQL we use the DELETE command to delete existing records in our database.
The general form of DELETE specifies the table to be updated from and (almost always) the WHERE clause.
NOTE: a DELETE statement without a WHERE clause will delete ALL records in the specified table.

```
DELETE FROM table_name WHERE condition;

-- We need to be very specific – we should thus implement the PK, which in our case is product_id (make sure there's only one of the kind).
DELETE FROM product WHERE product_id = 47;

-- If we want to be less specific, consider the following:
DELETE FROM product WHERE title = "Horses";
DELETE FROM product WHERE artist = "Patti Smith" AND title = "Horses";
```

```
-- Remember that the order_items table contains the FK product_id, so if we could compare the products table to the order_items table and find all product_id's in the products table that are not in the order_items table, that would give us the list we need. So how can we do that?

-- With a subquery.
SELECT *
    FROM products
    WHERE product_id NOT IN
    (
        SELECT DISTINCT product_id FROM order_items
    )
    ORDER BY product_id;

-- These products are those with product_id values not in the order_items table, which means they have never been ordered.
-- To delete them, we can convert our query above into a DELETE statement to delete those records from the products table.

DELETE
    FROM products
    WHERE product_id NOT IN
    (
        SELECT DISTINCT product_id FROM order_items
    )

-- The only change needed was to remove the SELECT * and replace it with the DELETE command.
```

```
-- Another possibility we might need to accomplish is to delete all records in a table.
-- This DELETE statement could be misunderstood to mean to delete the table, but in fact is deletes every record in the table but the table remains in the database, empty.

DELETE FROM table_name;
```

---
ORPHAN Records

Another potential  problem to be aware of when deleting records is orphan records. Recall  in our ERD diagram we established relationships between tables. For  example, remember that customers who have placed orders have a link to  the orders table through the customer_id field (customers PK to orders  FK). If we were to delete a customer record from the customers table,  who has placed an order, the records in the orders table linked to that  customer would be orphaned. 

Consider cascade deleting:
- https://www.sqlshack.com/delete-cascade-and-update-cascade-in-sql-server-foreign-key/
- https://stackoverflow.com/questions/6260688/how-do-i-use-cascade-delete-with-sql-server/6260736

---
TRUNCATE: Not something we do often, but when you need to empty a table you have two choices – DELETE command or TRUNCATE.

```
TRUNCATE TABLE <table_name>;
```
---
SQL Command Categories
- DQL - Data Query Language: These are the commands that we use to query a database.
- DML - Data Manipulation Language: These are the commands we used to manipulate data in our database.
- DDL - Data Definition Language: These are commands change the structure of the database.
- TCL - Transaction Control Language: These are commands that we use to manage transactions in a database. Transactions are often referred to as units of work. As you recall, SQL works with sets of data. There are concerns when modifying critical data, such as financial data. So database engines provide ways to manage these as individual steps and ways to validate and rollback in case of mistakes.

---
The CREATE command is used to create new databases, new tables and other database elements. 

```
CREATE TABLE <table_name>
(
    column_name_1 <data_type> [NOT NULL][DEFAULT NULL][DEFAULT <value>][AUTO_INCREMENT],
    column_name_2 <data_type> [NOT NULL][DEFAULT NULL][DEFAULT <value>],
    column_name_3 <data_type> [NOT NULL][DEFAULT NULL][DEFAULT <value>],
    . . .
    column_name_n <data_type> [NOT NULL][DEFAULT NULL][DEFAULT <value>],
    PRIMARY KEY (<column_name>)
);

CREATE TABLE employees 
(
    employee_id int NOT NULL AUTO_INCREMENT,
    first_name varchar(45) DEFAULT NULL,
    last_name varchar(45) DEFAULT NULL,
    phone varchar(10) DEFAULT NULL,
    address varchar(128) DEFAULT NULL,
    city varchar(45) DEFAULT NULL,
    state varchar(2) DEFAULT NULL,
    zip varchar(5) DEFAULT NULL,
    hire_date date DEFAULT NULL,
    PRIMARY KEY (`employee_id`)
);

NOTES:
-- The DEFAULT keyword indicates what the database engine should initialize 
-- that attribute to when a new record is created. 
-- NULL is most commonly used as a default, but we could put a value there to have the 
-- engine initialize every new record with that same DEFAULT value. 

-- Example: zip varchar(5) DEFAULT "84101", 
-- If we used this alternative to the zip attribute in our CREATE TABLE command, 
-- it would set the zip attribute (column) for every new record to 84101.
```

```
Create a new table in the database called vendors with the following attributes. You should set the data types and keys the way you think they should be managed.
    Vendor ID
    Vendor Name
    Phone Number
    Point of Contact Name
    Point of Contact Phone Number
    POC Login
    POC Password (set a default value of "CHANGEPASSWORD")

CREATE TABLE vendors 
(
	vendor_id int NOT NULL AUTO_INCREMENT,
	vendor_name varchar(45) DEFAULT NULL,
	phone_number varchar(13) DEFAULT NULL,
	poc_name varchar(128) DEFAULT NULL,
	poc_phone varchar(13) DEFAULT NULL,
	poc_login varchar(45) DEFAULT NULL,
	poc_password varchar(45) DEFAULT 'CHANGEPASSWORD',
	PRIMARY KEY (`vendor_id`)
);
```
##
Details of the CREATE command:
- Requires an indicator what database element to create, in this case a new TABLE, and then a table name is provided.
- Then a set of parenthesis ( ) is required to enclose at list of the attributes (columns) to create in the new table.
- Each line inside the parenthesis represents one attribute (column) in the new table.
- The format of creating an attribute is the name of the column, followed by its data type, then for any attributes that will be the primary key (PK) we specify NOT NULL because PK fields cannot have NULL values. And we also use the AUTO_INCREMENT specifier to indicate we want this field's value to increment automatically.
- All non-PK fields follow the general form described above, that is, the name of the column, its data type and for consistency we normally specify that the default value for that attribute should be NULL, using the DEFAULT NULL specifier.
- Lastly, if our table has a PK, we specify the column name using the PRIMARY KEY specifiers.

---
The ALTER command is used to modify the structure of existing database tables. 

```
ALTER TABLE <table_name> <action> [<column>] [<data_type>] [other options];

ALTER TABLE employees ADD email varchar(128);
-- This command ADDs an attribute to the employees table called email with the data type varchar(128).

ALTER TABLE vendors ADD contract_date DATE;
-- This command ADDs an attribute to the vendors table called contract_date with the data type DATE.

ALTER TABLE employees DROP COLUMN hire_date;
-- This command DROPs (deletes) the specified attribute (hire_date). 
-- We have to be very careful with any DROP (delete) process because any data in that column is lost.

ALTER TABLE employees MODIFY COLUMN city varchar(100);
-- The MODIFY COLUMN action changes the data type of a column to that which is specified in the command. 
-- So in this example this ALTER statement changes the data type of the city attribute to varchar(100).
```

Details of the ALTER command:
- ALTER TABLE <table_name> indicates that we are going to change the structure of a table, specified by <table_name>.
- There are many <action>'s that you can use to modify table details.
- For ALTER operations involving columns, the <column> name is used.
- Some ALTER operations involve specifying the <data_type> of the <column>.
- There are many [other options] available for the ALTER command as well.

---
The DROP command is used to drop (delete) databases, tables and other database elements. This command is very destructive and cannot be undone in most circumstances. In production systems DROP is usually locked except for a very select few individuals in the database administration group.

```
DROP <type> <element>;

DROP TABLE employees;
-- DROPs the employees table from the database.

DROP DATABASE record_store;
-- DROPs the entire record_store database.
```

Details of the DROP command:
- The DROP command means delete, which is a destructive command. 
- Caution should be taken when using DROP, particularly in production systems.
- <type> indicates what kind of DROP are you using: INDEX, TABLE, DATABASE, etc.
- <element> means what part of the database will be DROPped? For example, you can DROP an index, a table, an entire database, etc.

---
Functions
The general form of SQL functions is function_name(parameter(s)). The function_name is set by the database engine. Many, but not all, function_name's are common between different database engines (MySQL, SQL Server, etc.). The function name is followed by a set of parenthesis ( ). Inside the parenthesis functions will have from zero to many parameters, that is, required or optional input values that we supply the function in order for it to perform its task. 

---
String Functions
LENGTH( ) – Takes one parameter and returns the length of the given string. 
```
SELECT last_name, LENGTH(last_name) 
AS ln_length 
FROM customers 
ORDER BY ln_length DESC;
```

LOWER( ) & UPPER( )  – Each takes one parameter and returns the specified string as all lowercase or uppercase. 
```
SELECT UPPER(first_name) AS fn, 
LOWER(last_name) AS ln 
FROM customers 
ORDER BY ln, fn;
```

SUBSTRING( ) – This function has 4 forms, each with a different set of parameters that provide a subset of the characters in a string value.
1. SUBSTRING(str, pos)
2. SUBSTRING(str FROM pos)
3. SUBSTRING(str, pos, len)
4. SUBSTRING(str FROM pos FOR len)

```
–– First let's look at an attribute in the products table that contains a String

SELECT artist FROM products WHERE product_id = 1;
–– which gives us: Led Zeppelin

–– Now let's check the length of the String

SELECT LENGTH(artist) FROM products WHERE product_id = 1;
–– which gives us: 12

... so our String is 12 characters long. 
Let's use the Variation 1 of SUBSTRING(str, pos), 
which will give us a subset of the characters 
from our string starting at the position number 
(pos) that we specify...

SELECT SUBSTRING(artist, 5) 
FROM products 
WHERE product_id = 1;

... which gives us: Zeppelin
```

```
Variation 2 of the function, SUBSTRING(str FROM pos) 
uses the FROM clause and effectively behaves the same 
as the first variation. 

This form SUBSTRING(str FROM pos) is more explicit and also 
is the only method available in some database engines. 
MySQL supports both variation 1 and 2. 

–– Example:

SELECT SUBSTRING(artist FROM 5) 
FROM products 
WHERE product_id = 1;

... which gives us: Zeppelin
```

```
Variation 3 gives us the ability to specify a starting position and a length, 
so we can extract any subset of characters in a string. 

–– Example:

SELECT SUBSTRING(artist, 5, 4) 
FROM products 
WHERE product_id = 1;

... which gives us: Zepp
```

```
Variation 4, SUBSTRING(str, FROM pos FOR len), is the explicit version 
(again, in some database engines the explicit version is required) of Variation 3. 

–– Example:

SELECT SUBSTRING(artist FROM 5 FOR 4) 
FROM products 
WHERE product_id = 1;

... which also gives us: Zepp
```

POSITION( ) –  Returns a number that indicates where the first position of the specified character exists in the String.
```
SELECT artist 
FROM products 
WHERE product_id = 1;

... which gives us: Led Zeppelin

SELECT LENGTH(artist) 
FROM products 
WHERE product_id = 1;

... we see that the length is: 12

–– If we now use the POSITION() function like this:

SELECT POSITION("i" IN artist) 
FROM products 
WHERE product_id = 1;

... we see that the position of the character i 
in the string is at position: 11
```

```
–– Previous code was very useful because we often do not know the position of characters ahead of time. 
In the examples used for SUBSTRING() above, we used hard coded numeric values for the position. 
That is not always practical. So, let's combine SUBSTRING() with POSITION() to make the example more flexible.

SELECT artist 
FROM products 
WHERE product_id = 1;

... which gives us: Led Zeppelin

Now we want to parse this to have the first name and the last name separate.

SELECT 
    SUBSTRING(artist, 1, POSITION(" " IN artist) - 1) AS first_name, 
    SUBSTRING(artist, POSITION(" " IN artist) + 1) AS last_name
    FROM products 
    WHERE product_id = 1;

–– 
The first SUBSTRING() combines SUBSTRING() with POSITION() to get the characters from the string starting at position 1 (beginning of the string) to the position of the blank space between the first name and last name. The -1 reduces the result of the POSITION() value by one so that we exclude the blank space. Also, we use AS to set an attribute name of first_name.
The second SUBSTRING() combines SUBSTRING() with POSITION() to get the characters from the string starting at the position of the blank space, plus 1 to exclude the blank space. The SUBSTRING() function will then return the remaining characters which is the last name. Also, we use AS to set an attribute name of last_name.
```

---
Numeric Functions
MOD( ) – Returns the modulus, which is the remainder of dividing one number by another number. A common use of this is to determine even and odd numbers in a series, because any number divided by 2 will return a remainder (modulus) of zero.
```
SELECT
	44 AS Dividend1, 2 AS Divisor1, (44/2) AS Quotient1, MOD(44, 2) AS Modulus1, 
	45 AS Dividend2, 2 AS Divisor2, (45/2) AS Quotient1, MOD(45, 2) AS Modulus2;
```

POW( ) – Raises the first function parameter to the power of the second function parameter.
```
SELECT 
    25 AS Parameter1, 
    3 AS Parameter2, 
POW(25, 3) AS Power;
```

SQRT( ) – This function returns the square root of the specified value. 
```
SELECT 9 AS Parameter, 
SQRT(9) AS SqrRoot;

SELECT stock,
SQRT(stock) AS square_root
FROM products;
```

---
Date Functions
DAY( ), DAYNAME( ), DAYOFMONTH( ), DAYOFWEEK( ), DAYOFYEAR( ) – This set of DAY* functions return a value based on the day in a date value as indicated by the function name. The date value can be hard coded or the contents of a field in a table.
```
SELECT	order_date, DAY(order_date), 
        DAYNAME(order_date), 
	DAYOFMONTH(order_date), 
        DAYOFWEEK(order_date), 
        DAYOFYEAR(order_date) 
    FROM orders 
    WHERE order_id = 1;
```

CURRENT_TIMESTAMP( ) – Returns the current date and time based on the clock in the computer where the command is executed.
```
SELECT CURRENT_TIMESTAMP();

–– Output is in this form: 
–– 2020-04-03 14:32:27
```

DATE( ) – Returns the date portion of a DATETIME value. To demonstrate, we can use the CURRENT_TIMESTAMP( ) function above in combination with the DATE( ) function.
```
SELECT DATE(CURRENT_TIMESTAMP());

–– Output is in this form: 
–– 2020-04-03 
```

TIME( ) – Returns the time portion of a DATETIME value. To demonstrate, we can use the CURRENT_TIMESTAMP( ) function above in combination with the TIME( ) function. 
```
SELECT TIME(CURRENT_TIMESTAMP());

–– Output is in this form: 
–– 14:32:27
```

---
Additional Functions
USER( ) –  Returns the currently logged in user. This is useful for capturing who made updates to the database and other reasons. The usefulness of this function is somewhat dependent on the overall configuration of the database and the applications involved in an overall system.
```
SELECT USER();

–– Output: root@localhost
```

BIN( ) – Returns a binary representation of a numeric value which is sometimes useful in cryptography, encryption, and other applications.
```
SELECT BIN(2020);

–– Output: 11111100100
```

CAST( ) – Converts a value of any data type into the specified data type. This is often useful during data import processes and other applications.
```
SELECT CAST(1234 AS CHAR) 
AS Number2String;
–– Output: 1234

–– While this looks like a number, it is actually of data type CHAR (String).

SELECT CAST("2020-08-01" AS DATE) 
AS String2Date;
–– Output: 2020-08-01

––
This output is a date data type value, however it originated as an alphanumeric String. 
This is a common use of CAST() when converting data out of a text .csv file to import data into a database.
```

---
VIEWS
  
Often times our need for data are repetitive, for example, we may need to view a list of new customers every week, or a summary of product purchases every month or maybe a single customer's data based on a multi-table query. We can write and run the queries to pull data for those example, or we can create a view. A view is a derived table that is built from a query of one or more base tables. Base tables are the permanent structural tables in the database. To a user the view appears as if it were a table, although they are actually the result of a stored query. Views allow us to simplify data access and restrict access to only the pieces of information needed by a user or application. 

We only need to do this once and the view is created and stored in the database... From then on, the view is accessible to users or processes as if it were a base table in the database and every time it is accessed up to the moment data will be provided in the result set. That access is from the view and not the base tables directly, like this:

##
Create a VIEW
```
–– We want a view that will show the total sales of every product from orders with an order status of "delivered." 

SELECT 
        i.product_id, 
        CONCAT(p.artist,' [ ',p.title,' ]') AS Product, 
        SUM(i.price) AS Product_Total
    FROM orders o
    JOIN order_items i 
        ON o.order_id = i.order_id
    JOIN products p 
        ON i.product_id = p.product_id
    WHERE o.order_status = 14
    GROUP BY i.product_id
    ORDER BY Product;

-- This query will produce a result set with 3 columns: the product id, a concatenated combination of the artist and album, 
-- and the total sales (price) for each product. The query joins the orders, order_items and products tables, with a where 
-- clause to select only delivered orders (order status 14). Lastly it groups by product id so that we can SUM all the orders 
-- of each product and sorts by the artist/title concatenation.
```

```
–– 
Once we have written and tested that query in Workbench, we can right-click the Views option (below the Tables) in our database and select "Create View."
––
This will open the SQL editor tab for creating a view. We need to give our view a name that represents the behavior, like "total_product_sales." 
––
Then we can copy and paste our tested query into the editor window under the CREATE VIEW command and click 'Apply.'
```

```
Now we can access the view directly instead of the base tables any time we want to see the total sales.

SELECT * FROM total_product_sales;
```

Views are very commonly used in production systems to simplify data access by hiding the complexity of queries and providing an additional level of security. SQL programmers can develop the complex queries needed to provide important data (like our total sales example above) and then accessing that data is simplified by providing access to the view to less experienced staff so they can get the data without needing to know the complex details underneath.

---
STORED PROCEDURES
  
They are reusable segments of SQL programming code that we can write, test and then store it in the database. Once stored, those procedures can be executed (called) from queries and other programs and systems. Stored procedures can also be parameterized, which means not only can we run the procedure but we can pass values to the procedure which makes the procedure more flexible. For example, let's say we have a stored procedure that returns the total product sales amount for a given month. When we call the stored procedure we can pass it the month we are interested in and it will provide the sales for that month based on our parameter.

```
SELECT COUNT(o.order_id) AS Month_Order_Count, 
       SUM(i.price) AS Month_Product_Total, 
       (SUM(i.price) / COUNT(o.order_id)) AS Month_Avg_Sale
    FROM orders o
    JOIN order_items i 
        ON o.order_id = i.order_id
    WHERE o.order_status = 14
        AND MONTH(o.order_date) = 3;

-- This code will produce a result set with 3 columns: the number of orders, the total sales and the average sales value. 
-- We include a criteria of delivered orders (order status 14) and since we only want to see these values for a particular month, 
-- in this example, we've set the month number for March (3).
```

```
-- Since we want this code to be flexible enough to run stats on any month we need to provide a parameter (also known as a variable). 
-- A parameter is a label that we use to hold a value that this procedure will receive and then it will use that variable value in our query.

-- Parameters are placed in the CREATE PROCEDURE line between the parenthesis ( ). 
-- To define a parameter, we need to specify the type of parameter, the name (label) of the parameter 
-- and the type of data we expect to receive from the calling program as well. 

The general form looks like this:
<parameter_type> parameter_variable_name data_type

–– Parameter types can be either IN, OUT or INOUT:

IN parameters are values passed into a stored procedure for use within the procedure.
OUT parameters are values passed into a stored procedure, its value changed in the procedure and that value is returned to the calling program.
INOUT parameters are a combination of the IN and OUT parameter types.  

-- In our working example we want to specify which month we want to receive stats for, 
-- the easiest way to do this is to specify the month number (1 for January, 2 for February, 3 for March, etc.). 
-- We can use a number like this because SQL has a function called MONTH() that returns the number of the month from a date value. 

–– So we can write our parameter like this:
IN month_number int
```

##
Create a PROCEDURE
```
CREATE PROCEDURE 'month_stats'
(
    IN month_number int
)
BEGIN
    SELECT COUNT(o.order_id) AS Month_Order_Count, 
           SUM(i.price) AS Month_Product_Total, 
           (SUM(i.price) / COUNT(o.order_id)) AS Month_Avg_Sale
        FROM orders o
        JOIN order_items i 
            ON o.order_id = i.order_id
        WHERE o.order_status = 14
        AND MONTH(o.order_date) = month_number;
END
```

```
––
Once we are satisfied with this code we can right-click the Stored Procedures option in our database and select Create Stored Procedure."
––
This opens an SQL editor tab for creating a new stored procedure. We need to give our stored procedure a name to something relevant to the purpose. 
––
Then we can copy and paste our tested code into the editor window under the CREATE PROCEDURE command and click 'Apply.'
```

```
–– To use the stored procedure now we use the CALL command. 

The general form of the CALL command is:
CALL <stored_procedure_name>(<parameters>);

So to call our month_stats stored procedure and pass it 3 for March (or any other month's number).

The command would look like this:
CALL month_stats(3);
```
	
	
