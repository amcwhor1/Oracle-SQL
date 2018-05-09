
--Alex McWhorter
-- 2/25/18

--ch6p1
SELECT job_id AS "Job", TO_CHAR(MAX(salary),'$999,900') AS "Maximum", TO_CHAR(MIN(salary), '$999,900') AS "Minimum",
TO_CHAR(SUM(salary), '$999,900') AS "Total", COUNT(job_id) AS "Number"
FROM employees
GROUP BY job_id
ORDER BY 1;

--ch6p2
SELECT department_id AS "Department", (MAX(salary) - MIN(salary)) AS "Difference"
FROM employees
GROUP BY department_id
HAVING (MAX(salary) - MIN(salary)) != 0
ORDER BY 1;


--ch6p3
SELECT manager_id, MIN(salary) AS "Small Sal"
FROM employees
WHERE manager_id IS NOT NULL
GROUP BY manager_id
HAVING MIN(salary) > 1000 
ORDER BY 2 DESC;


--ch6p4
SELECT c_sec_day AS "Days", COUNT(c_sec_id) AS "Number of Classes"
FROM course_section
GROUP BY c_sec_day;


--ch6p5
SELECT c_sec_day AS "Days", TO_CHAR(c_sec_time,'HH:MI p.m.') AS "Time", COUNT(c_sec_id) AS "Number of Classes"
FROM course_section
GROUP BY c_sec_day, TO_CHAR(c_sec_time,'HH:MI p.m.')
ORDER BY 1,2 ASC;

--ch6p6
 SELECT CASE c_sec_day WHEN 'MTWRF' THEN 'Every day of the week'
                       WHEN 'MWF' THEN 'Mon - Wed - Fri'
          ELSE        'Tues - Thurs' END "Days",
        TO_CHAR(c_sec_time, 'fmHH:MI p.m.') AS "Time", COUNT(c_sec_id) AS "Number of Classes" 
FROM course_section
GROUP BY CASE c_sec_day WHEN 'MTWRF' THEN 'Every day of the week' WHEN 'MWF' THEN 'Mon - Wed - Fri' ELSE 'Tues - Thurs' END, TO_CHAR(c_sec_time, 'fmHH:MI p.m.')
ORDER BY 1, 2 DESC;


--ch6p7
-- This query uses 2 different aggregate functions: count, and avg. The query shows how many of animals there are of each breed,
-- the weight average of that breed as well as the average age. it is order first by the number of animals, followed by age of the animals
SELECT breed_id, COUNT(animal_id) AS "Number of Animals", ROUND(AVG(animal_age), 2) AS "Average Age", ROUND(AVG(animal_weight), 2) AS "Average Weight" 
FROM animal
GROUP BY breed_id
ORDER BY 2, 3;








