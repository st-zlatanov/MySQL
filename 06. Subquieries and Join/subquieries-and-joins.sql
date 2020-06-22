SELECT e.employee_id, e.job_title, a.address_id, a.address_text 
FROM employees AS e
JOIN addresses as a
ON e.address_id = a.address_id
ORDER BY a.address_id
LIMIT 5;


SELECt e.first_name, e.last_name,t.`name`, a.address_text FROM employees as e
JOIN addresses as a
ON e.address_id = a.address_id
JOIN towns as t
on a.town_id = t.town_id
ORDER BY e.first_name, e.last_name
LIMIT 5;


select e.employee_id, e.first_name
FROM employees as e
LEFT JOIN employees_projects as ep
ON e.employee_id = ep.employee_id
WHERE ep.project_id IS NULL
ORDER BY e.employee_id DESC
LIMIT 3;


SELECT e.employee_id, e.first_name, p.`name`
FROM employees as e
JOIN employees_projects as ep
ON e.employee_id = ep.employee_id
JOIN projects as p
ON ep.project_id  = p.project_id
WHERE DATE(p.start_date) > '20020813'
AND p.end_date IS NULL
ORDER BY e.first_name, p.`name`
LIMIT 5; 



Select e.employee_id, e.first_name, (
	CASE
		WHEN YEAR(p.start_date) > 2004 THEN null
        ELSE p.`name` 
    END
) as 'project_name'
FROM employees as e
JOIN employees_projects as ep
on e.employee_id = ep.employee_id
JOIN projects as p
on ep.project_id = p.project_id
WHERE e.employee_id = 24
ORDER BY project_name;


SELECT e.employee_id, e.first_name, m.employee_id, m.first_name
FROM employees as e
JOIN employees as m
ON e.manager_id = m.employee_id
WHERE e.manager_id IN (3,7)
ORDER BY e.first_name;


select c.country_name,  