USE employees;

-- q2
SELECT CONCAT(first_name,' ', last_name) AS full_name FROM employees WHERE last_name LIKE 'E%e';

-- q3
SELECT UPPER(CONCAT(first_name,' ', last_name)) AS full_name FROM employees WHERE last_name LIKE 'E%e';

-- q4
SELECT first_name, last_name, hire_date, DATEDIFF(NOW(), hire_date) AS days_working FROM employees WHERE birth_date LIKE '%-12-31' AND hire_date LIKE '199%';

-- q5
SELECT MIN(salary) AS min_salary, MAX(salary) AS max_salary FROM salaries;

-- q6
SELECT first_name, last_name, birth_date, LOWER(CONCAT(
	SUBSTR(first_name, 1,1),
	 SUBSTR(last_name, 1,4),
	 '_',
	 SUBSTR(CAST(birth_date AS CHAR),6,2),
	 SUBSTR(CAST(YEAR(birth_date) AS CHAR),3,2)
	 )) AS username FROM employees;