-- Databricks notebook source
CREATE OR REPLACE TABLE employees AS
SELECT * FROM VALUES
(1, 'John', 'IT', 85000),
(2, 'Sara', 'HR', 60000),
(3, 'Mark', 'IT', 75000),
(4, 'Lucy', 'Finance', 95000),
(5, 'Tom', 'HR', 55000)
AS employees(emp_id, emp_name, department, salary);

SELECT *
FROM employees;

SELECT emp_name, department, salary,
    CASE
        WHEN department = 'IT' AND salary > 80000 THEN 'Senior IT'
        WHEN department = 'HR' AND salary > 55000 THEN 'Experienced HR'
    ELSE 'Staff'
END AS `position level`
FROM employees;
-----------------------------------------------------------------------------------------

CREATE OR REPLACE TABLE students AS
SELECT * FROM VALUES
(1, 'Ana', 92),
(2, 'Ben', 76),
(3, 'Cara', 59),
(4, 'David', 83),
(5, 'Ella', 68)
AS students(student_id, student_name, score);

SELECT *
FROM students;

SELECT student_name, score,
CASE
    WHEN score >= 90 THEN 'A'
    WHEN score BETWEEN 80 AND 89 THEN 'B'
    WHEN score BETWEEN 70 AND 79 THEN 'C'
    WHEN score BETWEEN 60 AND 69 THEN 'D'
    WHEN score <60 THEN 'F'
END AS `Grade`
FROM students;
-----------------------------------------------------------------------------------------

CREATE OR REPLACE TABLE deliveries AS
SELECT * FROM VALUES
(1, 45),
(2, 80),
(3, 30),
(4, 65),
(5, 100)
AS t(delivery_id, delivery_time_minutes);

SELECT *
FROM deliveries;

SELECT delivery_id, delivery_time_minutes,
    CASE
        WHEN delivery_time_minutes <= 30 THEN 'Fast'
        WHEN delivery_time_minutes BETWEEN 31 AND 60 THEN 'On time'
        WHEN delivery_time_minutes > 60 THEN 'Late'
    END AS `perfomance`
FROM deliveries; 