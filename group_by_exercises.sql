USE employees;

-- q2
SELECT DISTINCT title FROM titles;
/*
There have been 6 titles:
Senior Engineer
Staff
Engineer
Senior Staff
Assistant Engineer
Technique Leader
Manager
*/

-- q3
SELECT last_name FROM employees 
	GROUP BY last_name
	 HAVING last_name LIKE 'E%e';

-- q4
SELECT first_name, last_name FROM employees
	GROUP BY last_name, first_name
	 HAVING last_name LIKE 'E%e'
	 ORDER BY last_name, first_name;
	 
-- q5
SELECT last_name FROM employees
	GROUP BY last_name
	 HAVING last_name LIKE '%q%'
	 AND last_name NOT LIKE '%qu%';
/*
Last names with 'q' but not 'qu';
Chleq
Lindqvist
Qiwen
*/
-- q6
SELECT COUNT(*) AS last_name_count, last_name FROM employees
	GROUP BY last_name
	HAVING last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';
	
-- q7
SELECT first_name, COUNT(*) AS n_employees FROM employees
	GROUP BY first_name
	HAVING first_name IN ('Irena','Vidya', 'MAYA');


-- q8
SELECT COUNT(*) AS uname_count, LOWER(CONCAT(
	SUBSTR(first_name, 1,1),
	 SUBSTR(last_name, 1,4),
	 '_',
	 SUBSTR(CAST(birth_date AS CHAR),6,2),
	 SUBSTR(CAST(YEAR(birth_date) AS CHAR),3,2)
	 )) AS username FROM employees
	  GROUP BY username
	  HAVING uname_count > 1
	  ORDER BY uname_count DESC;
-- q8 BONUS /* IDK HOW TO DO THIS AHHHHHHH*/
/*
I'm using some more advanced tricks for readability.
*/
-- BONUS 1
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS full_name,ROUND(AVG(salaries.salary),2) FROM salaries
INNER JOIN employees
ON salaries.emp_no = employees.emp_no
GROUP BY full_name;

-- BONUS 2
SELECT departments.dept_name AS dept_name, COUNT(dept_emp.emp_no) AS emp_count 
	FROM dept_emp INNER JOIN departments
	ON departments.dept_no = dept_emp.dept_no
	GROUP BY dept_name;
-- BONUS 3
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS full_name, 
	COUNT(salaries.salary)
	 AS salary_count FROM salaries INNER JOIN employees
	ON employees.emp_no = salaries.emp_no
	 GROUP BY full_name;
-- BONUS 4
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS full_name,
	MAX(salaries.salary) AS max_salary
	FROM salaries INNER JOIN employees
	ON employees.emp_no = salaries.emp_no
	GROUP BY full_name;

-- BONUS 5
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS full_name,
	MIN(salaries.salary) AS min_salary
	FROM salaries INNER JOIN employees
	ON employees.emp_no = salaries.emp_no
	GROUP BY full_name;
	
-- BONUS 6
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS full_name,
	STD(salaries.salary) AS std_salary
	FROM salaries INNER JOIN employees
	ON employees.emp_no = salaries.emp_no
	GROUP BY full_name;
-- BONUS 7
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS full_name,
	MAX(salaries.salary) AS max_salary
	FROM salaries INNER JOIN employees
	ON employees.emp_no = salaries.emp_no
	GROUP BY full_name
	 HAVING max_salary > 150000;
-- Bonus 8
SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS full_name,
	ROUND(AVG(salaries.salary),2) AS avg_salary
	FROM salaries INNER JOIN employees
	ON employees.emp_no = salaries.emp_no
	GROUP BY full_name
	HAVING avg_salary >= 80000
	AND avg_salary <= 90000;