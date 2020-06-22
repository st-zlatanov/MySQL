Update employees_clients as ec
SET ec.employee_id = (
SELECT ecc.employee_id FROM (SELECT * FROM employees_clients) as ecc
GROUP BY employee_id
ORDER BY count(ecc.client_id), ecc.employee_id ASC
LIMIT 1
)
WHERE ec.employee_id = ec.client_id;

