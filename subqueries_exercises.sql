USE employees;

-- q1
SELECT CONCAT(first_name, ' ', last_name) AS full_name, hire_date
	FROM employees
	 WHERE hire_date = (
	 	SELECT hire_date FROM employees
	 	WHERE emp_no = 101010
	 )
	 ORDER BY full_name ;

-- q2

SELECT emp_no, title FROM titles
	WHERE emp_no IN (
	SELECT emp_no FROM employees
		WHERE first_name = 'Aamod'
	) AND emp_no IN (
			SELECT emp_no FROM salaries
			WHERE to_date LIKE '9999%'
	)
	ORDER BY emp_no, from_date;

-- q3
SELECT * FROM employees
	WHERE emp_no NOT IN (
			SELECT emp_no FROM salaries
			WHERE to_date LIKE '9999%'
	);
-- There are 59,900 former employees.

-- q4
SELECT CONCAT(first_name, ' ',last_name) AS full_name FROM employees
	WHERE emp_no IN (
		SELECT emp_no FROM dept_manager
		WHERE to_date LIKE '9999%'
	) AND gender = 'F';
/*
Isamu Legleitner
Karsten Sigstam
Leon DasSarma
Hilary Kambil
*/

-- q5;

SELECT employees.first_name, employees.last_name,salaries.salary FROM employees
	JOIN salaries ON salaries.emp_no = employees.emp_no
	WHERE salaries.to_date > CURDATE()
	AND salaries.salary > (SELECT AVG(salary) FROM salaries);

-- q6

SELECT * FROM salaries
	WHERE to_date > CURDATE()
	AND salary > (
		SELECT MAX(salary) FROM salaries
			WHERE to_date > CURDATE()
	) - (SELECT STD(salary) FROM salaries
		WHERE to_date > CURDATE()
	
	);