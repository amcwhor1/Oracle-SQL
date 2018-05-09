-- Alex McWhorter
-- January 25, 2018

--ch3p1
SELECT last_name AS "Employee", salary AS "Salary"
FROM employees
WHERE salary NOT BETWEEN 2000 AND 9500 
ORDER BY salary DESC;

--ch3p2
SELECT s_last AS "Student", s_dob AS "Date of Birth"
FROM student
WHERE s_dob BETWEEN '01-MAY-85' AND '30-SEP-85'
ORDER BY s_last;

--ch3p3
SELECT bldg_code, room, capacity
FROM location
WHERE capacity > 30 AND room LIKE '1%'  --starts with 1
ORDER BY capacity;

--ch3p4
SELECT last_name AS "Name", job_id AS "Job Title"
FROM employees
WHERE UPPER (job_id) LIKE '__\_M%' ESCAPE '\' AND commission_pct IS NULL
ORDER BY last_name;

--ch3p5
SELECT call_id AS "Call ID", course_name AS "Course Name"
FROM course
WHERE course_name LIKE '%C++%' --anywhere in the name
ORDER BY call_id;

--ch3p6 
SELECT s_first || ' ' || s_mi || '. ' || s_last AS "Full Name",
s_dob AS "Date of Birth", ROUND((SYSDATE - s_dob) / 365, 2) AS "Age"
FROM student
WHERE s_dob BETWEEN '01-JAN-86' AND '31-DEC-86'
ORDER BY s_dob;

--ch3p7
SELECT last_name || ', ' || job_id AS "Employees", 
salary AS "Salary"
FROM employees
WHERE salary BETWEEN &low_salary AND &high_salary
ORDER BY last_name;

--ch3p8
SELECT department_id, &&col_name --this column will be SAVED after first run
FROM departments
WHERE department_id > &department_num
ORDER BY &col_name;
UNDEFINE col_name --this deletes the SAVED column 



--ch3p9
--This query has 3 fields... animal's name, weight and age. The where clause
--asks you to enter the min and max weight, followed by min and max age. This is done using the
-- ampersand substitution. Next I specify how to order the data by using column numbers 2 (in ascending)
-- followed by column 3 (ascending as well bc that is the default standard). You do not need to include the
-- UNDEFINE statement at the end because this is SINGLE ampersand substitution.
SELECT animal_name AS "Pet Name", animal_weight AS "Weight", animal_age AS "Age"
FROM animal
WHERE (animal_weight BETWEEN &min_weight AND &max_weight) AND (animal_age BETWEEN &min_age AND &max_age)
ORDER BY 2 ASC, 3;









