USE employees;
-- q2
SELECT emp_no, first_name, last_name FROM employees WHERE first_name IN ('Irena','Vidya','Maya');
-- 709

-- q3
SELECT emp_no, first_name, last_name FROM employees 
	WHERE first_name = 'Irena'
	OR first_name = 'Vidya' OR first_name = 'Maya';
-- 709
-- They match :D

-- q4
SELECT emp_no, first_name, last_name FROM employees 
	WHERE first_name = 'Irena'
	OR first_name = 'Vidya' OR first_name = 'Maya' AND gender = 'M';
	-- 441
	
-- q5
SELECT emp_no, first_name, last_name 
	FROM employees 
	 WHERE last_name
	 LIKE 'E%' 
	 ORDER BY last_name;
	-- 7330
	
-- q6
SELECT emp_no, first_name, last_name 
	FROM employees
	 WHERE last_name LIKE 'E%' 
	 OR last_name LIKE '%e';
	-- 30723 start or end with 'e'.
	-- 23393 end but do not start with 'e'.
	
-- q7
SELECT emp_no, first_name, last_name 
	FROM employees 
	 WHERE last_name 
	 LIKE 'E%e';
	-- 899 start AND end with 'e'.
	-- 24292 end with 'e'.
	
-- q8
SELECT first_name, last_name, hire_date 
	FROM employees 
	 WHERE hire_date > '1989-12-25' 
	 AND hire_date < '2000-01-01';
	-- 135214
	
-- q9
SELECT first_name, last_name, birth_date 
	FROM employees 
	 WHERE birth_date LIKE '%-12-25';
	-- 818

-- q10
SELECT first_name, last_name, birth_date, hire_date 
	FROM employees 
	 WHERE hire_date > '1989-12-25' 
	 AND hire_date < '2000-01-01' 
	 AND birth_date LIKE '%-12-31';
	-- 358

-- q11
SELECT emp_no, first_name, last_name
	FROM employees 
	 WHERE last_name LIKE '%q%';
	-- 1873 with q in the name.

-- q12
SELECT emp_no, first_name, last_name 
	FROM employees 
	 WHERE last_name LIKE '%q%' 
	 AND last_name NOT LIKE '%qu%';
	-- 547
