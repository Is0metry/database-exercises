USE employees;
-- q1
CREATE TEMPORARY TABLE mirzakhani_1940.employees_with_departments AS
SELECT emp_no, first_name, last_name, dept_no, dept_name
FROM employees
JOIN dept_emp USING(emp_no)
JOIN departments USING(dept_no)
LIMIT 100;

USE mirzakhani_1940;

ALTER TABLE employees_with_departments ADD full_name VARCHAR(100);
UPDATE employees_with_departments
SET full_name = CONCAT(first_name, ' ', last_name);

DROP TABLE employees_with_departments;

USE employees;
CREATE TEMPORARY TABLE mirzakhani_1940.employees_with_departments AS
	SELECT emp_no, CONCAT(first_name,' ',last_name) AS full_name,
	 dept_no, dept_name
	 FROM employees
	 JOIN dept_emp USING(emp_no)
	 JOIN departments USING(dept_no)
	 WHERE to_date > CURDATE()
	 LIMIT 100;
	 
-- q2
DROP TABLE sakila_payment;
CREATE TEMPORARY TABLE sakila_payment AS
	SELECT payment_id, customer_id, staff_id, rental_id, CAST(amount * 100 AS UNSIGNED) AS amount, payment_date, last_update FROM sakila.payment;
SELECT * FROM sakila_payment;
SELECT * FROM sakila.payment;

-- q3
DROP TABLE IF EXISTS mirzakhani_1940.employees_with_salary;
USE employees;
CREATE TEMPORARY TABLE mirzakhani_1940.employees_with_salary AS
	SELECT emp_no, dept_no, dept_name, salary
	FROM dept_emp
	JOIN departments USING(dept_no)
	JOIN salaries USING(emp_no)
	WHERE salaries.to_date > CURDATE();
USE mirzakhani_1940;
ALTER TABLE employees_with_salary ADD zscore DOUBLE;

UPDATE employees_with_salary
SET zscore = (salary - (SELECT AVG(salary) FROM employees.salaries))
/ (SELECT STDDEV(salary) FROM employees.salaries);

SELECT dept_name, AVG(zscore) FROM employees_with_salary
GROUP BY dept_name
ORDER BY AVG(zscore) DESC;
