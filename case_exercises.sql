USE employees;

-- q1
SELECT CONCAT(first_name,' ', last_name), dept_no, from_date, to_date, 
	IF(to_date > CURDATE(), True, False) AS is_current_employee
FROM employees
JOIN dept_emp USING(emp_no);

-- q2
SELECT CONCAT(last_name, ', ', first_name),
	CASE 
		WHEN last_name REGEXP '^[A-H]' THEN 'A-H'
		WHEN last_name REGEXP '^[I-Q]' THEN 'I-Q'
		ELSE 'R-Z'
	END AS alpha_group
FROM employees;

-- q3
SELECT birth_date FROM employees ORDER BY birth_date;
SELECT
	SUM(CASE WHEN birth_date LIKE '195%' THEN 1 ELSE 0 END) AS '1950s',
	SUM(CASE WHEN birth_date LIKE '196%' THEN 1 ELSE 0 END) AS '1960s'
FROM employees;

-- q4
SELECT
	AVG(
		CASE
			WHEN dept_no = 'd008' THEN salary
			WHEN dept_no = 'd005' THEN salary
			ELSE NULL END
	) AS 'R&D', 
	AVG(
		CASE
			WHEN dept_no = 'd007' THEN salary
			WHEN dept_no = 'd001' THEN salary
			ELSE NULL END
	) AS 'Sales & Marketing',
	AVG(
		CASE
			WHEN dept_no = 'd004' THEN salary
			WHEN dept_no = 'd006' THEN salary
			ELSE NULL END
	) AS 'Prod & QM',
	AVG(
		CASE
			WHEN dept_no = 'd002' THEN salary
			WHEN dept_no = 'd003' THEN salary
			ELSE NULL END 
	) AS 'Finance & HR',
	AVG(
		IF(dept_no = 'd009',salary,NULL)
	) AS 'Customer Service'
	FROM salaries JOIN dept_emp USING(emp_no)
	WHERE dept_emp.to_date > CURDATE();