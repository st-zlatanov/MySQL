DELETE emp FROM employees as emp
LEFT JOIN employees_clients as ec
ON ec.employee_id = emp.id
WHERE ec.client_id IS NULL
