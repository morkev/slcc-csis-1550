-- ------------------------------------
-- SQL CRUD Assignment
-- 
-- Professor: John Gordon
-- Student: Kevin Mora
-- ------------------------------------

-- Challenge #1 | What's Data Validation?

-- Data validation consists of details such as making sure 
-- the data has a meaning (for example, if a user wants to input 
-- the name of a product, then you can't allow them to write a 
-- string of random numbers, etc.), and you must always make sure
-- there's a limit of letters/characters used to name a product 
-- (something like 60 characters long). 

-- As programmers, we need to notify the user if their input is an invalid entry.

-- Validation like this is needed in all types of software development;
-- corporate desktop software, dynamic web development, automation software, etc.

-- Query Challenge #2
  INSERT INTO products (artist, title, released, price, media, stock) 
  VALUES ('Nirvana','Nevermind',1991,25.69,'CD',5);

-- Query Challenge #3
INSERT INTO customers (first_name, last_name, address1, city, state, zip, country, phone, email, twitter) 
VALUES
	('Kevin','Mora','1830 Lambda Squared','Salt Lake City','UT','63457-9530','US','3854569820','sci.kevinmora@gmail.com','@FermionicSoup'),
	('Peter','Pogba','420 Man Sky','Shaw','TX','75405-6470','US','4537891203','pogbaServices@gmail.com','@sdoihg'),
    	('Mabel','Loara','271 Pi Equal Three','Ray Center','PA','35827-4418','US','5643829330','mabelForeverLove@gmail.com','@UniCornZombie'),
    	('Steve','Works','666 Cupertino','Lucern','UT','51340-5458','US','2837480392','mrAppleHimself@gmail.com','@applhe1'),
    	('Ibahm','Watson','69 Computer Vale','Elba','PE','64371-7067','CA','8593245118','ibmWatson@gmail.com','@fastAsCivic');
