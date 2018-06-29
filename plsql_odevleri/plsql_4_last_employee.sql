/*
*    AUTHOR:       Taha Yasir Kıroğlu
*    DATE:         21.06.2018
*    DESCRIPTION : This code lists salaries high to low according to department name
*/

SELECT
    first_name
FROM
    hr.employees e
WHERE
    e.employee_ıd = (
        SELECT
            MAX(e.employee_ıd)
        FROM
            hr.employees e
    );