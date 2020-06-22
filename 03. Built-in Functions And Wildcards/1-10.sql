SELECT `first_name`, `last_name` FROM employees
WHERE `first_name` LIKE 'Sa%';

SELECT `first_name`, `last_name` FROM employees
WHERE `last_name` LIKE '%ei%';

SELECT `first_name` FROM employees
WHERE `department_id` IN (3,10)
AND YEAR(`hire_date`) between 1995 AND 2005
ORDER BY `employee_id`; 

SELECT `first_name`, `last_name` FROM employees
WHERE `job_title` NOT LIKE '%engineer%';

SELECT `name` FROM towns
WHERE length(`name`) = 5
OR length(`name`) = 6
ORDER BY `name`;

SELECT `town_id`, `name` FROM towns
WHERE LEFT(`name`, 1) IN ('m','k','b', 'e')
ORDER BY `name`;

SELECT `town_id`, `name` FROM towns
WHERE SUBSTRING(`name`, 1, 1) NOT IN ('r','b','d')
ORDER BY `name`;

CREATE VIEW v_employees_hired_after_2000 AS
SELECT `first_name`, `last_name` FROM employees
WHERE YEAR(`hire_date`) > 2000;
SELECT * FROM v_employees_hired_after_2000;

SELECT `first_name`, `last_name` FROM employees
WHERE CHAR_LENGTH(`last_name`) = 5;

