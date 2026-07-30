-- Databricks notebook source
-- Creating a database 
CREATE CATALOG IF NOT EXISTS may_intake;

USE CATALOG may_intake;

-- This code is used to create a schema within a database
CREATE SCHEMA IF NOT EXISTS students;

-- To drop is to delete: this code is to delete the schema
-- DROP SCHEMA students_profile;

-- This code is used to create a table in the database
CREATE OR REPLACE TABLE may_intake.students.profiles (
    student_id INT,
    name STRING,
    surname STRING,
    age INT,
    email STRING,
    registration_DT DATE
);

-- Inserting values into the table
INSERT INTO may_intake.students.profiles
VALUES
    (101, 'Rochester', 'Jones', 28, 'rochester@google.com', '2019-06-05'),
    (102, 'Sive', 'Magazi', 33, 'sive@hlaphala.com', '2011-01-01'),
    (103, 'Casper', 'Zuma', 73, 'czuma@kandla.com', '2020-01-12'),
    (104, 'Mbali', 'Hlapo', 41, 'mbali@cleaning.com', '2010-01-12')
    ;

SELECT *
FROM may_intake.students.profiles;

-- We use the DELETE function to remove a specific row from our data based on a specific condition
DELETE FROM may_intake.students.profiles
WHERE AGE > 50;

-- Updating a specific record in the table
UPDATE may_intake.students.profiles
SET age = 25
WHERE student_id IN (101);

-- Setting Delta table properties
ALTER TABLE may_intake.students.profiles
SET TBLPROPERTIES (
    'delta.columnMapping.mode' = 'name',
    'delta.minReaderVersion' = '2',
    'delta.minWriterVersion' = '5'
);

-- Deleting a column from a table
ALTER TABLE may_intake.students.profiles
DROP COLUMN registration_DT;