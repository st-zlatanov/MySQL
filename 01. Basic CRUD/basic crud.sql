SELECT * FROM `departments`;

SELECT `name` FROM `departments`
order by `department_id`;

SELECT `first_name`, last_name, salary FROM employees;

SELECT first_name, middle_name, last_name FROM employees;

SELECT 
    CONCAT(`first_name`,
            '.',
            `last_name`,
            '@softuni.bg') AS `full_email_address`
FROM
    employees;
    
   SELECT DISTINCT salary FROM employees;
   
   SELECT * FROM employees
   WHERE job_title = 'Sales Representative';
   
   SELECT first_name, last_name, job_title FROM employees
   WHERE salary BETWEEN 20000 AND 30000;
   
   SELECT concat_ws(' ', first_name, middle_name, last_name) as `Full Name` from employees
   WHERE salary  IN (25000, 14000, 12500, 23600);
   
   SELECT first_name, last_name FROM employees
   WHERE manager_id IS NULL;
   
SELECT first_name, last_name, salary FROM employees
   WHERE salary > 50000
   ORDER BY salary DESC;
   
   
   SELECT first_name, last_name FROM employees
   ORDER BY salary DESC LIMIT 5;
   
	SELECT first_name, last_name FROM employees
	WHERE department_id <> 4;
    
    SELECT first_name, last_name FROM employees
	WHERE NOT (department_id = 4);
    
    SELECT * FROM employees
    ORDER BY salary DESC, first_name, last_name DESC, middle_name;
    
    CREATE VIEW v_employees_salaries AS
    SELECT first_name, last_name, salary FROM employees;
    SELECT * FROM v_employees_salaries;
    
    CREATE VIEW v_employees_job_titles AS
    SELECT concat(`first_name`, ' ' , IFNULL(`middle_name`,''), ' ', `last_name`) AS 'full_name',
    `job_title` FROM employees;
    SELECT * FROM v_employees_job_titles;
    
    SELECT DISTINCT job_title from employees
    ORDER BY job_title;
    
   SELECT * FROM projects
ORDER BY start_date ASC, name
LIMIT 10;

SELECT first_name, last_name, hire_date FROM employees
ORDER BY hire_date DESC
LIMIT 7;


UPDATE employees
SET `salary` = `salary` + (salary * 0.12)
WHERE department_id IN (12,4,46,42);
SELECT salary FROM employees;
SELECT * FROM employees;
    
   
   