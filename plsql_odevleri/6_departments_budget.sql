/*
*    AUTHOR:       Taha Yasir Kıroğlu
*    DATE:         21.06.2018
*    DESCRIPTION : This code lists salaries high to low according to department name
*/

SELECT
    department_name AS "Department Name",
    SUM(salary) AS "Total Salary"
FROM
    hr.employees emp,
    hr.departments dep
WHERE
    emp.department_ıd = dep.department_ıd
GROUP BY
    dep.department_name
ORDER BY
    "Total Salary" ASC;