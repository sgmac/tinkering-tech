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

#Check data
SELECT * FROM ActorSample WHERE actor_id BETWEEN 1 AND 10;

# Delete 

DELETE 
FROM ActorSample
WHERE actor_id = 1;


DELETE 
FROM ActorSample
WHERE actor_id IN (2,3,4);

DELETE 
FROM ActorSample
WHERE actor_id IN (SELECT actor_id
					FROM film_actor
					WHERE film_id = 1);
                    
SELECT * FROM ActorSample;

DROP TABLE ActorSample;
DELETE 
FROM ActorSample;
