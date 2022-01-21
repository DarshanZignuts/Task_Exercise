/*
Department
->id, name, created date
Employee
-> id, name, emp_no, dept_id (refers to Department > id), join_date, end_date
salary
Salary - id, emp_id (refers to Employee > id), month, year, amount, generated_date
*/  

-- > A).Write a sql queries to insert data in above tables.
     
DROP DATABASE IF EXISTS darshanp ;
CREATE DATABASE darshanp;
USE darshanp;


-- > CREATE DEPARTMENT TABLE
CREATE TABLE department(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	dept_name VARCHAR(55) NOT NULL,
	created_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	PRIMARY KEY (id));
    
    
-- >INSERT DATA IN DEPARTMENT TABLE
INSERT INTO `darshanp`.`department` 
(`dept_name`, `created_date`) 
VALUES 
	('js_developer', '2022-01-03'),
	('nodeJS', '2022-01-03'),
	('reactJS', '2022-01-03'),
	('php_laravel', '2022-01-03'),
	('devops', '2022-01-03'),
	('android', '2022-01-03'),
	('java', '2022-01-03')
;
SELECT * FROM darshanp.department;


-- > CREATE EMPLOYEE TABLE
CREATE TABLE employee(
	id INT UNSIGNED NOT NULL AUTO_INCREMENT,
	emp_name VARCHAR(55),
    emp_no LONG NOT NULL,
	did INT UNSIGNED NOT NULL,
	join_date DATETIME DEFAULT CURRENT_TIMESTAMP,
	end_date DATE DEFAULT '2024-01-03 ',
	PRIMARY KEY(id),
	FOREIGN KEY(did)REFERENCES department(id)
);


-- > INSERT DATA IN EMPLOYEE TABLE
INSERT INTO `darshanp`.`employee` 
(`emp_name`,`emp_no`, `did`, `join_date`, `end_date`) 
VALUES 
	('Darshan Patel', 5841562086 , '2', '2021-10-03', '2024-01-03'),
	('Vimal Solanki', 5646446585, '2', '2021-11-03', '2024-01-03'),
	('Dhwani Prajapti', 4545480529, '3', '2021-11-03', '2024-01-03'),
	('Kartik Patel', 4859523582, '1', '2021-11-03', '2024-01-03'),
	('Kenil Bhanderi', 1582963582, '6', '2022-01-03', '2024-01-03'),
	('Manthan Panchal',8529637589, '5', '2022-01-03', '2024-01-03'),
	('Krunal Patel', 7958695785, '4', '2022-01-03', '2024-01-03'),
	('Rutvik Bhimani', 8536985697, '4', '2022-01-03', '2024-01-03')
;
SELECT * FROM darshanp.employee;


-- > CREATE SALARY TABLE 
CREATE TABLE salary(
	id INT NOT NULL AUTO_INCREMENT,
	eid INT UNSIGNED NOT NULL,
	sal_month varchar(3),
	sal_year YEAR ,
	sal_amount INT UNSIGNED,
	generated_date DATE,
	PRIMARY KEY(id),
	FOREIGN KEY(eid)REFERENCES employee(id)
);


-- >DATA INSERT IN SALARY TABLE
INSERT INTO `darshanp`.`salary` 
(`eid`, `sal_month`, `sal_year`, `sal_amount`, `generated_date`)
VALUES 
	(1, 'nov', '2021', 19500, '2021-12-03'),
	(2, 'dec', '2021', 10000, '2022-01-03'),
	(4, 'dec', '2021', 20000, '2022-01-03'),
	(1, 'dec', '2021', 10000, '2022-01-03'),
	(6, 'jan', '2022', 11500, '2022-02-03'),
	(5, 'jan', '2022', 10000, '2022-02-03'),
	(3, 'jan', '2022', 12500, '2022-02-03'),
	(7, 'jan', '2022', 10000, '2022-02-03')
;
SELECT * FROM darshanp.salary;

-- > B). Write a sql query to get all employees details along with  department and salary details.

use darshanp;
SELECT `employee`.id ,`employee`.emp_name , `department`.id,`department`.dept_name, `salary`.id, `salary`.sal_amount -- >CHANGE COLUMN AS YOUR NEED;
FROM employee
INNER JOIN `department` ON `employee`.did = `department`.id
INNER JOIN `salary` ON `employee`.id = `salary`.eid
ORDER BY `salary`.id ; -- >CHANGE ORDER AS USER NEED HOW THE LIKE TO WATCH RESULT AND SEQUANCE OF THE DATA

-- > C). Write a sql queries to update data in above tables.

use `darshanp`; 

UPDATE `department` SET `dept_name`= 'vuejs' WHERE id = 7 ;
UPDATE `employee` SET `did` = '7' WHERE id= 1;
UPDATE `salary` SET `sal_amount` = '12500' WHERE id = 3;

-- > GET DATA AS YOUR WISH BY UPDATE THIS METHOD;

-- > D). Write a sql queries to delete data from above tables

-- > LAST TABLE WHICH PRIMARY KEY NOT USE IN ANOTHER TABLE AS A FOREIGN KEY
SET SQL_SAFE_UPDATES = 0;
DELETE FROM `salary` 
WHERE sal_amount = 12500; 
    
-- > ONE TABLE PRIMERY KEY USE AS ANOTHER FOREIGN KEY THEN USE DOUBLE TABLE TABLE DATA BY INNER JOIN TABLE
DELETE `salary` 
	FROM `salary`
	INNER JOIN `employee` ON `salary`.eid = `employee`.id
	WHERE emp_name LIKE "Krunal%";  