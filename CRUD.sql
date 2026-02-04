CREATE TABLE person(
id INT,
name VARCHAR(100),
city VARCHAR(100)
);

INSERT INTO person(id,name,city)
VALUES(101,'Swaroop','Itahari');


INSERT INTO person(id,name,city)
VALUES
(102,'Swaroop','Itahari'),
(103,'Abc','Dharan'),
(104,'Hey','Biratnagar')
;

SELECT * from person

UPDATE person
	SET city='KTM'
WHERE id = 102;

DELETE FROM person
WHERE id=104;

SELECT * FROM person