

--Alex McWhorter
-- 3/9/18



-- ch7p1
SELECT DISTINCT e.job_id,l.location_id, l.STATE_PROVINCE
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
INNER JOIN locations l ON d.location_id = l.LOCATION_ID
ORDER BY 1;


-- ch7p2
SELECT e.last_name "Employee", e.job_id "Job Title", d.department_name "Department"
FROM employees e INNER JOIN departments d
ON e.department_id = d.department_id
WHERE department_name = 'IT'
ORDER BY 1;


-- ch7p3
SELECT DISTINCT j.grade_level AS "Grade", d.department_name, TO_CHAR(e.salary, '$999,999') AS "Salary"
FROM employees e RIGHT OUTER JOIN departments d
ON e.department_id = d.department_id
JOIN job_grades j ON e.salary BETWEEN j.lowest_sal AND j.highest_sal
WHERE d.department_name LIKE 'S%'
ORDER BY 1, 2, 3 DESC;


-- ch7p4
SELECT DISTINCT e.first_name || ' ' || e.last_name AS "Upper Management", 
CASE e.job_id WHEN 'AD_VP' THEN 'VICE PRESIDENT'
         ELSE        'PRESIDENT' END "Job Title"
FROM employees e JOIN employees m
ON e.employee_id = m.manager_id
WHERE e.department_id = 90
ORDER BY 1;


--ch7p5
SELECT l.city AS "City", c.country_name AS "Country"
FROM locations l RIGHT OUTER JOIN countries c
USING (country_id);



--ch7p6
SELECT f.f_last AS "Faculty", c.sec_num AS "Section", c.loc_id, l.bldg_code AS "Building"
FROM faculty f JOIN course_section c
ON f.f_id = c.f_id
JOIN location l ON c.loc_id = l.loc_id
WHERE l.bldg_code = 'BUS'
ORDER BY 1, 2;


-- ch7p7
SELECT e.last_name AS "Employee", TO_CHAR(e.hire_date, 'mm/dd/yy') "Emp Hired",
m.last_name AS "Manager", TO_CHAR(m.hire_date, 'mm/dd/yy') AS "Manager Hired"
FROM employees e JOIN employees m
ON e.manager_id = m.employee_id
WHERE (e.hire_date BETWEEN '01-JAN-00' AND '31-DEC-00') AND 
(m.hire_date BETWEEN '01-JAN-00' AND '31-DEC-00');



-- ch7p8
-- In this query, I use the 'left outer join' combining the animal and volunteer table. The 
-- join looks at every animal and the date they arrived, along with the volunteer that was 
-- responsible on the day of arrival. Because the left outer join is used, even though an 
-- animal may not have a volunteer, it will display the animal with a null entry.

SELECT a.animal_name AS "Animal's Name", a.arrival_date AS "Date Arrived", v.vol_first || ' ' || v.vol_last AS "Corresponding Volunteer"
FROM animal a LEFT OUTER JOIN volunteer v
ON a.vol_id = v.vol_id
ORDER BY 2, 1;




















