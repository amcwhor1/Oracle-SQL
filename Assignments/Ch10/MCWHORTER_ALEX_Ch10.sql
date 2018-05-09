

-- Alex McWhorter
-- 4/2/18



-- ch10p1
DROP TABLE my_employee;

CREATE TABLE my_employee
  (id  NUMBER(4) CONSTRAINT my_employee_id_nn NOT NULL,
   last_name VARCHAR2(25),
   first_name VARCHAR2(25),
   userid  VARCHAR2(8),
   salary  NUMBER(9,2));
   
   
-- ch10p2   
INSERT INTO my_employee VALUES
(1, 'Parsons', 'Randolph','rparsons', 1895);


-- ch10p3
INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (2, 'Danes', 'Barbara','bdanes', 1860);



-- ch10p4
INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (&id1, '&last_name1', '&first_name1', '&userid1', &salary1);

INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (&id2, '&last_name2', '&first_name2', '&userid2', &salary2);



-- ch10p5
UPDATE my_employee
SET last_name = 'Patel', userid = 'bpatel'
WHERE id = 2;


-- ch10p6 
UPDATE my_employee
SET salary = 2000
WHERE salary < 1900;


-- ch10p7
DELETE FROM my_employee
WHERE id = 3;


-- ch10p8
COMMIT;


-- ch10p9  
INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (5, 'Ropeburn', 'Alice','aropebur', 1550);

-- ch10p10
SAVEPOINT save1;


-- ch10p11 
DELETE FROM my_employee;

-- ch10p12
ROLLBACK TO save1;


-- ch10p13 no idea what is wrong with this one, done looking at it.
INSERT INTO my_employee (id, last_name, first_name, userid, salary)
VALUES (&&id3, '&&last_name3', '&&first_name3', (CONCAT(SUBSTR(LOWER(&first_name3,1,1)) , SUBSTR(LOWER(&last_name3,1,7)))), &&salary3);

UNDEFINE id3;
UNDEFINE last_name3;
UNDEFINE first_name3;


















