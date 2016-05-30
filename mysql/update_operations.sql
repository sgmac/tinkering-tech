
USE Sakila;

DROP TABLE ActorSample;

CREATE TABLE ActorSample(
	actor_id smallint(5) unsigned NOT NULL AUTO_INCREMENT,
    first_name varchar(45) NOT NULL,
	last_name varchar(45) NULL,
    last_update timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(actor_id)
    );
    
    
INSERT INTO sakila.ActorSample (first_name, last_name,last_update)
SELECT first_name, last_name, last_update
FROM sakila.actor;

SELECT * FROM ActorSample;

# Update First_name and Last_name on record_id 1 separetly 

UPDATE sakila.ActorSample
SET first_name = 'Pinal'
WHERE actor_id = 1;

UPDATE sakila.ActorSample
SET last_name = 'Dave'
WHERE actor_id = 1;

UPDATE ActorSample
SET first_name = 'Pinal', last_name = 'Dave' 
WHERE actor_id = 2;

UPDATE ActorSample
SET first_name = 'Pinal', last_name = 'Dave' 
WHERE actor_id IN  (2,3,4);


SELECT * FROM ActorSample WHERE actor_id IN (2,3,4);


# Using subqueries
UPDATE ActorSample
SET first_name = 'Nupur'
WHERE actor_id IN (SELECT actor_id
					FROM film_actor
					WHERE film_id = 1);
                    
                    
                    
DROP table ActorSample;
                    
