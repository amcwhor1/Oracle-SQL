-- Alex McWhorter
-- January 15, 2018

--ch2p1
SELECT DISTINCT s_class AS "Classification"
FROM student;

--ch2p2
SELECT employee_id AS "Emp#", last_name || ', ' || first_name AS "Employee", 
job_id AS "Job Title", hire_date AS "Date Hired"
FROM employees;


--ch2p3
SELECT f_first|| ' ' || f_mi || '. ' || f_last || ': ' || f_phone AS "Faculy Name: Phone"
FROM faculty;


--ch2p4
SELECT last_name || q'<'s full salary is: >' AS "Employee", salary + NVL(commission_pct, 0) * 1000 AS "Full Salary"
FROM employees;

--ch2p5
SELECT employee_id AS "Employee ID", start_date AS "Start Date", end_date AS "End Date", 
(end_date - start_date) AS "Days of Employment"
FROM job_history
ORDER BY (end_date - start_date) ASC;

--ch2p6
-- From the animal table, I displayed the animals name and age and used a quote delimiter followed by the columns of the 
-- animals weight and sex. They were labeled repsectively "Pet's Age", "Weight", & "Gender". I concatenated " lbs" 
-- after the animals weight to be more precise. I then sorted these rows by the animal's age to show the youngest animal first.

SELECT animal_name || q'<'s age: >' ||ANIMAL_AGE AS "Pet's Age", animal_weight || ' lbs' AS "Weight", animal_sex AS "Gender"
FROM animal
ORDER BY animal_age ASC;

