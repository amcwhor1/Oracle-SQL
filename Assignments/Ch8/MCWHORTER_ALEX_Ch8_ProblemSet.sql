
-- Alex McWhorter
-- 3/15/18


--ch8p1
SELECT s_first || ' ' || s_last AS "Enrolled Student"
FROM student 
WHERE s_id IN 
            (SELECT s_id
            FROM enrollment);
            
--ch8p2
SELECT employee_id, last_name, salary
FROM employees e JOIN departments d
ON e.department_id = d.department_id
JOIN locations l 
ON d.location_id = l.location_id
WHERE e.salary >  
            (SELECT AVG(salary)
            FROM employees
            WHERE l.city LIKE '%San Francisco%' )
            ORDER BY 3 DESC;
            
            
            
--ch8p3
SELECT last_name, department_id, salary
FROM employees main
WHERE salary = 
                (SELECT AVG(salary)
                FROM employees sub
                WHERE main.department_id = sub.department_id)
                ORDER BY 1;
 
 -- ch8p4               
SELECT last_name, job_id, salary AS "TOTAL SAL"
FROM employees
WHERE salary > ANY
                    (SELECT salary
                    FROM employees
                    WHERE job_id LIKE '%MAN%' OR job_id LIKE '%MGR%')
 AND job_id = 'SA_REP'
 ORDER BY 3;



--ch8p5
SELECT last_name, hire_date
FROM employees
WHERE  department_id IN
                    (SELECT department_id 
                     FROM employees
                     WHERE UPPER(last_name) = UPPER('&&Enter_name'))
AND  last_name != '&Enter_name'
ORDER BY 1;                   
UNDEFINE Enter_name


-- ch8p6
SELECT department_id, last_name, job_id
FROM employees
WHERE department_id IN
                        (SELECT department_id
                         FROM employees
                         WHERE department_id = 90)
ORDER BY 3;


-- ch8p7
--this query takes all MALE animals and compares their age to the average
-- age of all other MALE animals. if their age is larger, that animals name,
-- age and weight are returned in order of age, then name.
SELECT animal_name, animal_age, animal_weight
FROM animal
WHERE animal_age > 
                    (SELECT AVG(animal_age)
                     FROM animal
                     WHERE animal_sex = 'M')
AND animal_sex = 'M'
ORDER BY 2;
                        









             
            
            
            