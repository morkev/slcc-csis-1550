-- ------------------------------------
-- SQL Coding 2 Assignment
-- Data Base: BuildGradingSystemDB.sql
-- 
-- Professor: John Gordon
-- Student: Kevin Mora
-- ------------------------------------

-- PROBLEM #1
SELECT COUNT(class_standing = 'senior')
FROM students
WHERE cumulative_gpa = 4.0
AND major_id = 2; -- Architecture's major_id is 2.

-- PROBLEM #2
SELECT COUNT(cumulative_gpa)
FROM students
WHERE cumulative_gpa >= 3.50;

-- PROBLEM #3
SELECT AVG(cumulative_gpa)
FROM students
WHERE major_id = 4; -- Biology's major_id is 4.

-- PROBLEM #4
SELECT grade, COUNT(grade)
FROM registration
GROUP BY grade
ORDER BY grade;

-- PROBLEM #5
SELECT dept_abbrv, COUNT(department_id)
FROM course_catalog
GROUP BY dept_abbrv
ORDER BY dept_abbrv;

-- PROBLEM #6
SELECT class_standing, AVG(cumulative_gpa)
FROM students
GROUP BY class_standing
HAVING AVG(cumulative_gpa)
ORDER BY class_standing;

-- PROBLEM #7
SELECT grade, COUNT(grade)
FROM registration
GROUP BY grade
HAVING COUNT(grade) > 25
ORDER BY grade;

-- PROBLEM #8
SELECT DISTINCT catalog_id
FROM classes
ORDER BY catalog_id;
