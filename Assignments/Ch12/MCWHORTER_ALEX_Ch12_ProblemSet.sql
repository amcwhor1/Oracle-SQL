
-- Alex McWhorter
-- 4/18/18



-- ch12p1
CREATE OR REPLACE VIEW      EMPLOYEES_VU
AS SELECT employee_id, last_name AS "Employee", department_id 
   FROM employees;
   
-- ch12p2 (listed as #3)
SELECT "Employee", department_id
FROM EMPLOYEES_VU;

-- ch12p3 (listed as #4)
CREATE OR REPLACE VIEW      DEPT50
(EMPNO, EMPLOYEE, DEPTNO)
AS SELECT employee_id, last_name, department_id
FROM employees
WHERE department_id = 50
WITH READ ONLY;

-- ch12p4 (listed as #5) got error as to be expected
UPDATE DEPT50
SET DEPTNO = 80
WHERE EMPLOYEE = 'MATOS';


-- ch12p5 (listed as #7)
CREATE SEQUENCE DEPT11_SEQ
                INCREMENT BY 10
                START WITH 300
                MAXVALUE 1000
                NOCYCLE;

--ch12p6 (listed as #8)
INSERT INTO DEPT11(D_NUM, D_NAME)
VALUES (DEPT11_SEQ.NEXTVAL, 'Education');

INSERT INTO DEPT11(D_NUM, D_NAME)
VALUES (DEPT11_SEQ.NEXTVAL, 'Administration');


--ch12p7 (listed as #9)
CREATE INDEX d11_dname_idx
            ON DEPT11(D_NAME);
            
-- ch12p8 (listed as #10)
CREATE SYNONYM EMP12
for employees;



