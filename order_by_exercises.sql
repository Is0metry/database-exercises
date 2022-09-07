USE employees;
-- q2
SELECT emp_no, first_name, last_name FROM employees WHERE first_name IN ('Irena','Vidya','Maya') ORDER BY first_name;
-- first row: Irena Reutenauer, last row: Vidya Simmen

-- q3
SELECT emp_no, first_name, last_name FROM employees WHERE first_name = 'Irena'
	OR first_name = 'Vidya' OR first_name = 'Maya' ORDER BY first_name, last_name;
	-- First row: Irena Acton, last row: Vidya Zweizig

-- q4
SELECT emp_no, first_name, last_name FROM employees WHERE first_name = 'Irena'
	OR first_name = 'Vidya' OR first_name = 'Maya' ORDER BY last_name, first_name;
	-- first row: Irena Acton, last row: Maya Zyda
	
-- q5
SELECT emp_no, first_name, last_name FROM employees WHERE last_name LIKE 'E%e' ORDER BY emp_no;
	-- 899 First Row: Ramzi Erde, last row: Tadahiro Erde
	
-- q6
SELECT first_name, last_name, hire_date FROM employees WHERE last_name LIKE 'E%e' ORDER BY hire_date; 
	-- 899 first row: Sergi Erde, last row: Teiji Eldridge
	
-- q7
SELECT first_name, last_name, birth_date, hire_date FROM employees WHERE hire_date > '1989-12-31' AND hire_date < '2000-01-01' AND birth_date LIKE '%-12-31' ORDER BY birth_date ASC, hire_date DESC;
	-- oldest last hired: yannik Chiodo, youngest first hired Przemyslawa Heydon