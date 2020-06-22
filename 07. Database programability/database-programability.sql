select * from soft_uni.employees;

DELIMITER $$
CREATE PROCEDURE usp_get_employees_salary_above_35000()
BEGIN
	select first_name, last_name
FROM employees
WHERE	salary > 35000
order by first_name, last_name, employee_id;
END $$

DELIMITER $$
create procedure usp_get_employees_salary_above(min_salary DECIMAL(19,4))
BEGIN  
	SELECT first_name, last_name
    FROM employees
    WHERE salary >= min_salary
    ORDER BY first_name, last_name, employee_id;

END $$

DELIMITER $$
Create procedure usp_get_towns_starting_with(starts_with VARCHAR(20))
BEGIN
	SELECT `name` from towns 
    WHERE `name` LIKE concat(starts_with, '%') 
    ORDER BY `name`;
END $$


DELIMITER $$
Create procedure usp_get_employees_from_town(town_name VARCHAR(20))
BEGIN
	SELECT e.first_name, e.last_name
    FROM employees as e
    JOIN addresses as a 
    ON e.address_id = a.address_id
    JOIN towns as t
    WHERE t.`name` = town_name
    ORDER  by e.first_name, e.last_name, e.employee_id;
END $$

call usp_get_employees_from_town('Sofia');

DELIMITER $$
 CREATE function ufn_get_salary_level(salary_emp DECIMAL(19,4))
 RETURNS varchar(10)
 DETERMINISTIC
 BEGIN
	DECLARE result varchar(10);
		IF salary_emp < 30000 THEN set result := 'Low';
		ELSEIF salary_emp BETWEEN 30000 AND 50000 THEN set result := 'Average';
		ELSE set result := 'High';
        END IF;
        
    RETURN result;
END $$

DELIMITER $$
CREATE PROCEDURE usp_get_employees_by_salary_level(salary_level VARCHAR(10))
BEGIN 
SELECT first_name, last_name FROM employees
WHERE LOWER(ufn_get_salary_level(salary)) = salary_level
ORDER BY first_name DESC, last_name DESC;
END $$

DELIMITER $$
CREATE PROCEDURE usp_get_holders_with_balance_higher_than(salary_level DECIMAL)
BEGIN 
SELECT ah.first_name, ah.last_name
FROM account_holders as ah
Join accounts as a
on a.account_holder_id = ah.id
group by a.account_holder_id
HAVING SUM(balance) > salary_level
ORDER BY a.id;
END $$


DELIMITER $$
CREATE PROCEDURE usp_deposit_money(acc_id INT, money_amount DECIMAL(19,4))
BEGIN
START transaction;
IF(money_amount <= 0) THEN ROLLBACK;
ELSE UPDATE accounts
		SET balance = balance + money_amount
        WHERE id = acc_id;
        END IF;
END $$