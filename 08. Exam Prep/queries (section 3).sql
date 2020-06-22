select id, full_name from clients order by id;

select id, concat(first_name, ' ', last_name) as full_name,
concat('$', salary), started_on
 FROM employees
 WHERE salary >= 100000 and started_on >=  '2018-01-01'
ORDER BY salary DESC, id;


select c.id, CONCAT(c.card_number,' : ', cl.full_name) from cards as c
JOIN bank_accounts as ba
ON c.bank_account_id = ba.id
JOIN clients as cl
ON ba.client_id = cl.id
ORDER BY c.id DESC;


select concat(first_name, ' ', last_name) as `name`,
started_on, count(ec.client_id) as cnt
 from employees as emp
LEFT JOIN employees_clients as ec
ON ec.employee_id = emp.id
GROUP BY ec.employee_id
ORDER BY cnt desc, emp.id ASC
LIMIT 5;


select b.`name`, count(ca.id) as count_of_cards from branches as b
LEFT JOIN employees as e
ON e.branch_id = b.id
LEFT JOIN employees_clients as ec
ON ec.employee_id = e.id
LEFT JOIN clients as cl
ON cl.id = ec.client_id
LEFT JOIN bank_accounts as ba
ON ba.client_id = cl.id
LEFT JOIN cards as ca
ON ca.bank_account_id = ba.id
GROUP BY b.id
ORDER BY count_of_cards DESC, b.`name` ASC
