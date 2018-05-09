-- Alex McWhorter
-- 2/18/18


--ch5p1
SELECT last_name || ' earns ' || TO_CHAR(salary, 'fm$99,000.00')
|| ' montly but wants ' || TO_CHAR(3 * salary, 'fm$99,000.00') || '.' AS "Dream Salaries"
FROM employees;

--ch5p2
SELECT last_name, hire_date, TO_CHAR(NEXT_DAY(ADD_MONTHS(hire_date, 6),
'MONDAY'), 'fmDay",the" fmDdspth "of" fmMonth, YYYY') AS "REVIEW" 
FROM employees;


--ch5p3 
SELECT last_name, hire_date, TO_CHAR(hire_date, 'DAY') AS "DAY"
FROM employees
ORDER BY mod(to_char(hire_date, 'D') + 5, 7);


--ch5p4
SELECT last_name, COALESCE(TO_CHAR(commission_pct, 'fm0.9'), 'No Commission') AS "COMM"
FROM employees;



--ch5p5
SELECT job_id, 
    DECODE(job_id, 'AD_PRES', 'A',
                'ST_MAN', 'B',
                'IT_PROG', 'C',
                'SA_REP', 'D',
                'ST_CLERK', 'E',
                            '0') AS "GRADE"
FROM employees;


--ch5p6
SELECT job_id,
    CASE job_id WHEN 'AD_PRES' THEN 'A'
                WHEN 'ST_MAN' THEN 'B'
                WHEN 'IT_PROG' THEN 'C'
                WHEN 'SA_REP' THEN 'D'
                WHEN 'ST_CLERK' THEN 'E'
    ELSE        '0' END "Grade"
FROM employees;


--ch5p7
SELECT bldg_code AS "Building", room AS "Room",
    (CASE WHEN capacity < 30 THEN 'Small'
        WHEN capacity > 30 AND capacity <= 99 THEN 'Medium'
        ELSE 'Large'
    END) as "Capacity"
FROM location;



--ch5p8
SELECT call_id, course_name, 
    (CASE WHEN call_id LIKE '%1__' THEN 'Freshman'
          WHEN call_id LIKE '%2__' THEN 'Sophomore'
          WHEN call_id LIKE '%3__'THEN 'Junior'
          WHEN call_id LIKE '%4__'THEN 'Senior'
        ELSE 'Invalid Level'
    END) AS "Level"
FROM course
ORDER BY "Level" ASC, call_id;


--ch5p9
-- This query looks at the weight of every animal and categorizes them into four
-- categories: "lightweight, medium weight, heavy weight, and SUPER HEAVY"
-- used a case statement to do this, order by animal weight ascending. the furhter
-- you go down the rows, the heavier the animal will be, ending with "SUPER HEAVY"
SELECT animal_name, animal_sex,
    (CASE WHEN animal_weight < 15 THEN 'Light Weight'
          WHEN animal_weight >= 15 AND animal_weight <= 30 THEN 'Medium Weight'
          WHEN animal_weight > 30 AND animal_weight <= 50 THEN 'Heavy Weight'
         ELSE 'SUPER HEAVY'
    END) as "Weight Class"
FROM animal
ORDER BY animal_weight ASC;




