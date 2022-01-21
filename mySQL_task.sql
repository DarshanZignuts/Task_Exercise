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
CREATE TABLE Department(
	DId INT NOT NULL AUTO_INCREMENT,
	Dept_Name VARCHAR(55) NOT NULL,
	Created_Date DATE,
	PRIMARY KEY (DId));
    
    
-- >INSERT DATA IN DEPARTMENT TABLE
INSERT INTO `darshanp`.`Department` 
(`Dept_Name`, `Created_Date`) 
VALUES 
	('js_developer', '2022-01-03'),
	('nodeJS', '2022-01-03'),
	('reactJS', '2022-01-03'),
	('php_laravel', '2022-01-03'),
	('devops', '2022-01-03'),
	('android', '2022-01-03'),
	('java', '2022-01-03')
;
SELECT * FROM darshanp.Department;


-- > CREATE EMPLOYEE TABLE
CREATE TABLE Employee(
	EId INT NOT NULL AUTO_INCREMENT,
	Emp_Name VARCHAR(55),
    Emp_No LONG NOT NULL,
	DId INT NOT NULL,
	Join_Date DATE,
	End_Date DATE,
	PRIMARY KEY(EId),
	FOREIGN KEY(DId)REFERENCES Department(DId)
);


-- > INSERT DATA IN EMPLOYEE TABLE
INSERT INTO `darshanp`.`Employee` 
(`Emp_Name`,`Emp_No`, `DId`, `Join_Date`, `End_Date`) 
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
SELECT * FROM darshanp.Employee;


-- > CREATE SALARY TABLE 
CREATE TABLE Salary(
	SId INT NOT NULL AUTO_INCREMENT,
	EId INT NOT NULL,
	Sal_MONTH varchar(3),
	Sal_YEAR YEAR,
	Sal_Amount INT(100),
	Generated_Date DATE,
	PRIMARY KEY(SId),
	FOREIGN KEY(EId)REFERENCES Employee(EId)
);


-- >DATA INSERT IN SALARY TABLE
INSERT INTO `darshanp`.`Salary` 
(`EId`, `Sal_MONTH`, `Sal_YEAR`, `Sal_Amount`, `Generated_Date`)
VALUES 
	(1, 'nov', '2021', '9500', '2021-12-03'),
	(2, 'dec', '2021', 10000, '2022-01-03'),
	(4, 'dec', '2021', '20000', '2022-01-03'),
	(1, 'dec', '2021', '10000', '2022-01-03'),
	(6, 'jan', '2022', '11500', '2022-02-03'),
	(5, 'jan', '2022', 10000, '2022-02-03'),
	(3, 'jan', '2022', '12500', '2022-02-03'),
	(7, 'jan', '2022', 10000, '2022-02-03')
;
SELECT * FROM darshanp.Salary;

-- > B). Write a sql query to get all employees details along with  department and salary details.

use darshanp;
SELECT `Employee`.EId ,`Employee`.Emp_Name , `Department`.DId,`Department`.Dept_Name, `Salary`.SId, `Salary`.Sal_Amount -- >CHANGE COLUMN AS YOUR NEED;
FROM Employee
INNER JOIN `Department` ON `Employee`.DId = `Department`.DId
INNER JOIN `Salary` ON `Employee`.EId = `Salary`.EId
ORDER BY `Salary`.SId ; -- >CHANGE ORDER AS USER NEED HOW THE LIKE TO WATCH RESULT AND SEQUANCE OF THE DATA

-- > C). Write a sql queries to update data in above tables.

use `darshanp`; 
SET SQL_SAFE_UPDATES = 0;
UPDATE `Department` SET `Dept_Name`= 'vuejs' WHERE DId = 7 ;
UPDATE `Employee` SET `DId` = '7' WHERE EId= 1;
UPDATE `Salary` SET `Sal_Amount` = '12500' WHERE SId = 3;

-- > GET DATA AS YOUR WISH BY UPDATE THIS METHOD;

-- > D). Write a sql queries to delete data from above tables

-- > LAST TABLE WHICH PRIMARY KEY NOT USE IN ANOTHER TABLE AS A FOREIGN KEY
DELETE FROM `Salary` 
WHERE Sal_Amount = 12500; 
    
-- > ONE TABLE PRIMERY KEY USE AS ANOTHER FOREIGN KEY THEN USE DOUBLE TABLE TABLE DATA BY INNER JOIN TABLE
DELETE `Salary` 
	FROM `Salary`
	INNER JOIN `Employee` ON `Salary`.EId = `Employee`.EId
	WHERE Emp_Name LIKE "Krunal%";  

