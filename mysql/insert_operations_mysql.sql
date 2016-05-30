USE sakila;

CREATE TABLE ActorSample(
	actor_id smallint(5) unsigned NOT NULL AUTO_INCREMENT,
    first_name varchar(45) NOT NULL,
	last_name varchar(45) NOT NULL,
    last_update timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY(actor_id)
    );
    

INSERT INTO sakila.ActorSample (first_name, last_name,last_update)
VALUES ('Pinal', 'Dave', '2013-04-16');


INSERT INTO sakila.ActorSample VALUES (DEFAULT, 'Nupur', 'Dave', '2013-04-16');
INSERT INTO sakila.ActorSample (first_name, last_name) VALUES ('Pinal', 'Dave');

-- INSERT INTO ActorSample (first_name,last_name,last_update) VALUES ('Pinal',NULL,DEFAULT);

INSERT INTO sakila.ActorSample (first_name, last_name,last_update)
VALUES ('Pinal', 'Dave', '2013-04-16'),
	   ('Pil', 'Dave', '2013-04-16'),
	   ('Pl', 'Dave', '2013-04-16');


INSERT INTO ActorSample (first_name, last_name, last_update) 
(SELECT first_name, last_name, last_update FROM actor WHERE first_name LIKE 'A%');


SELECT * from sakila.ActorSample;

DROP TABLE ActorSample;

