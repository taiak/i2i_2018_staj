/*
    AUTHOR:       Taha Yasir Kıroğlu
    DATE:         21.06.2018
    DESCRIPTION : This code lists rank of salaries high to low according to  each department name
*/

SELECT
    department_ıd,
    fırst_name,
    salary,
    DENSE_RANK() OVER(
        PARTITION BY department_ıd
        ORDER BY
            salary
    ) rank
FROM
    hr.employees;