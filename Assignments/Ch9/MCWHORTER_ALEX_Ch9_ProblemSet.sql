

-- Alex McWhorter
-- 4/12/18


--ch9p1
SELECT department_id
FROM departments
MINUS
SELECT department_id
FROM employees
WHERE department_id = 50;



--ch9p2
SELECT country_id AS "Country ID", country_name AS "Country Name"
FROM countries
MINUS
SELECT l.country_id, c.country_name
FROM locations l JOIN countries c
ON l.country_id = c.country_id
JOIN departments d ON l.location_id = d.location_id;


-- ch9p3 this is the best i got
SELECT DISTINCT job_id, department_id
FROM employees
UNION ALL
SELECT DISTINCT e.job_id, d.department_id
FROM departments d JOIN employees e
ON d.department_id = e.department_id
INTERSECT
SELECT DISTINCT j.job_id, e.department_id
FROM employees e JOIN jobs j ON e.job_id = j.job_id
WHERE department_id IN (10, 50, 20);
        
    
    
    
    
-- ch9p4
SELECT employee_id, job_id
FROM employees
INTERSECT
SELECT employee_id, job_id
FROM job_history;


-- ch9p5
SELECT last_name, department_id, TO_CHAR(NULL)
FROM employees
UNION ALL
SELECT NULL, department_id, department_name
FROM departments
ORDER BY 1;


-- ch9p6
-- This will show the breed ID's that are currently not at the animal shelter
-- using the minus operator
SELECT breed_id
FROM breed
MINUS
SELECT breed_id
FROM animal;



