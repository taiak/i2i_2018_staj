-- soru1
SELECT  
    DEPARTMENT_ID, 
    LISTAGG (first_name || ' ' || LAST_NAME, ';') 
        WITHIN GROUP (
            ORDER BY DEPARTMENT_ID
        ) AS SONUC 
FROM employees 
GROUP BY DEPARTMENT_ID;

-- soru2
SELECT 
    e.*, 
    LAG(SALARY, 1) OVER(
        PARTITION BY JOB_ID 
        ORDER BY e.EMPLOYEE_ID
    ) PREVIOUS_VALUE,
    LEAD(SALARY, 1) OVER(
        PARTITION BY JOB_ID
        ORDER BY e.EMPLOYEE_ID
    ) NEXT_VALUE 
FROM employees e;

-- soru3
SELECT 
    e.*, 
    LEAD(SALARY, 1) OVER(
        PARTITION BY e.DEPARTMENT_ID 
        ORDER BY e.HIRE_DATE
    ) PREVIOUS_PHONE 
FROM employees e;

-- soru4
SELECT 
    e.*, 
    DENSE_RANK() OVER(
        ORDER BY e.SALARY, e.HIRE_DATE 
    ) 
FROM employees e;

-- soru5
SELECT e.*, 
    CEIL(
        ROW_NUMBER()
        OVER(ORDER BY e.EMPLOYEE_ID)/10
    ) 
FROM employees e;

-- soru6
SELECT 
    e.*,
    CASE 
        WHEN salary >= AVG(e.SALARY) OVER (ORDER BY e.DEPARTMENT_ID) THEN '1'
    ELSE '0'
    END "MORE_THAN_AVG"
FROM employees e;

-- soru7
SELECT 
    e.*, 
    TO_CHAR(e.HIRE_DATE, 'YYYY') 
FROM employees e 
WHERE TO_CHAR(e.HIRE_DATE, 'YYYY') = TO_CHAR(SYSDATE,'YYYY');

-- soru8
SELECT 
    e.first_name,
    e.department_id,
    e.salary, 
    ROW_NUMBER() OVER (
        PARTITION BY department_id 
        ORDER BY e.salary DESC
    ) seq
FROM employees e
WHERE seq > 1;

-- soru9
SELECT *
FROM (
    SELECT e.*,
        DENSE_RANK() over(
            partition by department_id
            order by SALARY
        ) as row_rank
    FROM employees e
)
WHERE row_rank < 3;

-- soru10
SELECT e.first_name, 
    LAG(e.first_name,1) OVER (
        ORDER BY e.HIRE_DATE
    ) PREVIOUS_PERSON, 
    LEAD(e.first_name,1) OVER (
        ORDER BY e.HIRE_DATE
    ) NEXT_PERSON
FROM employees e;