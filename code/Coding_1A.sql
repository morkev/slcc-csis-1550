-- ----------------------------------
-- SQL Coding 1 Assignment
-- BuildGradingSystemDB.sql
-- 
-- Professor: John Gordon
-- Student: Kevin Mora
-- ----------------------------------

-- ----------------------------------
-- Problem #1
 SELECT * FROM students;
-- ----------------------------------

-- ----------------------------------
-- Problem #2
SELECT last_name, first_name, class_standing, cumulative_gpa
FROM students
ORDER BY last_name, first_name ASC;
-- ----------------------------------

-- ----------------------------------
-- Problem #3
 SELECT * FROM students
 ORDER BY major_id, cumulative_gpa, last_name, first_name;
-- ----------------------------------

-- ----------------------------------
-- Problem #4
 SELECT dept_abbrv, course_number, course_name
 FROM course_catalog
 WHERE dept_abbrv = 'CSIS'
 ORDER BY course_number DESC;
-- ----------------------------------

-- ----------------------------------
-- Problem #5
 SELECT class_standing, cumulative_gpa, last_name, first_name
 FROM students
 WHERE class_standing = 'senior'
 AND cumulative_gpa > 3.0
 ORDER BY cumulative_gpa DESC;
-- ----------------------------------

-- ----------------------------------
-- Problem #6
 SELECT dept_abbrv, course_number, course_name
 FROM course_catalog
 WHERE course_number >= 1
 AND course_number <= 2000
 ORDER BY dept_abbrv, course_number;
-- ----------------------------------

-- ----------------------------------
-- Problem #7
SELECT major_name
FROM majors
WHERE major_name LIKE '%ology%';
-- ----------------------------------

-- ----------------------------------
-- Problem #8
SELECT dept_abbrv, course_number
FROM course_catalog
WHERE dept_abbrv IN ('COMM','FILM','SOC');
-- ----------------------------------