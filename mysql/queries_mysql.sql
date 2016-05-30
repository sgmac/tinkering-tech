SELECT 'MyFirstValue' AS SomeValue;
SELECT 1+1 AS TWO;
SELECT CURTIME();

USE sakila;

# Order by 

SELECT * from actor ORDER by last_name DESC;

# Select two columns
SELECT first_name, last_name FROM actor ORDER BY first_name DESC;

# Using where
SELECT count(*) from actor WHERE actor_id > 100;

SELECT * from actor WHERE first_name = 'Nick';

SELECT actor_id, first_name, last_name from actor WHERE first_name = 'Nick' ORDER BY first_name, last_name DESC;

SELECT actor_id, first_name, last_name from actor WHERE actor_id > 100 ORDER BY first_name, last_name DESC;

#Doing Maths

SELECT rental_date as RentalDate, inventory_id as Inventory, return_date as ReturnDate FROM rental;

SELECT 	rental_rate as RentalDate, 
       rental_rate + 3 * 4 -1 AS Result1,
	   (rental_rate + 3) * 4 -1 AS Result2,
	   (rental_rate + 3) * (4 -1) AS Result3,
	   rental_rate + (3 * 4) -1 AS Result4
       FROM film;


# Date format

SELECT CONCAT(first_name, ' ', last_name) AS FullName,
	   DATE_FORMAT(last_update, '%m/%d/%y') AS LastUpdate1,
	   DATE_FORMAT(last_update, '%m-%d-%Y') AS LastUpdate2,
	   DATE_FORMAT(last_update, '%d %b %Y %T:%f') AS LastUpdate3
       FROM actor;
       
SELECT rental_date, DAYOFWEEK(rental_date) AS DayOfWeek,
					WEEK(rental_date) AS Week,
					MONTHNAME(rental_date)
                    FROM rental;
       

# Using DISTINCT to avoid duplicates

SELECT DISTINCT first_name FROM actor ORDER BY first_name ;

# Using IN, LIKE, we can use NOT IN, or NOT LIKE '%'

SELECT * FROM actor WHERE first_name IN ('NICK', 'JOHNNY', 'VIVIEN');

SELECT * FROM actor WHERE first_name IN ('NICK', 'JOHNNY', 'VIVIEN')
					OR actor_id IN (SELECT actor_id
									FROM actor WHERE last_name = 'DEGENERES');
                                    
SELECT * FROM actor WHERE actor_id  BETWEEN 10 AND 20;

SELECT * FROM actor WHERE actor_id NOT  BETWEEN 10 AND 20;

# All First Name that start with A 
SELECT * FROM actor WHERE first_name LIKE 'A%';

SELECT * FROM actor WHERE first_name LIKE 'A__E';

SELECT * FROM address WHERE address2 IS NULL;

# Order BY and CONCAT

SELECT actor_id, CONCAT(first_name, ' ', last_name) as FullName FROM actor ORDER BY FullName; 


# LIMIT starts the next 16 and the OFFSET (10 more), so from actor_id 16 up to 25

SELECT * FROM actor  ORDER BY actor_id LIMIT 15,10;

