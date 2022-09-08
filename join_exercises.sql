USE `join_example_db`;


-- q2
/* INNER JOIN */
SELECT users.name AS username, roles.name AS role_name
	FROM users
	INNER JOIN roles ON users.role_id = roles.id;
	
/* LEFT JOIN */
SELECT users.name AS username, roles.name AS role_name
	FROM users
	LEFT JOIN roles ON users.role_id = roles.id;
	
/* RIGHT JOIN */
SELECT users.name AS username, roles.name AS role_name
	FROM users
	RIGHT JOIN roles ON users.role_id = roles.id;

-- q3
SELECT roles.name, COUNT(users.id) AS role_count
	FROM roles
	 LEFT JOIN users ON users.role_id = roles.id
	 GROUP BY roles.name;

USE employees;

-- q2
SELECT depts.dept_name AS department, 
	CONCAT(e.first_name,' ',e.last_name) as full_name
	FROM departments AS depts
	JOIN dept_manager 
	   ON depts.dept_no = dept_manager.dept_no
	 JOIN employees AS e
	   ON dept_manager.emp_no = e.emp_no
	 WHERE dept_manager.to_date = '9999-01-01'
	 ORDER BY department;

-- q3
SELECT depts.dept_name AS department, 
	CONCAT(e.first_name,' ',e.last_name) as full_name
	FROM departments AS depts
	JOIN dept_manager 
	   ON depts.dept_no = dept_manager.dept_no
	 JOIN employees AS e
	   ON dept_manager.emp_no = e.emp_no
	 WHERE dept_manager.to_date = '9999-01-01'
	  AND e.gender = 'F'
	 ORDER BY department;
-- q4 
SELECT titles.title AS Title, COUNT(employees.emp_no) AS Count
	FROM titles
	 JOIN employees
	 ON titles.emp_no = employees.emp_no
	 JOIN dept_emp
	 ON employees.emp_no = dept_emp.emp_no
	 JOIN departments
	 ON dept_emp.dept_no = departments.dept_no
	 WHERE departments.dept_name = 'Customer Service'
	 AND dept_emp.to_date LIKE '9999%'
	 AND titles.to_date LIKE '9999%'
	 GROUP BY Title
	 ORDER BY Title;
-- q5
SELECT departments.dept_name AS Department, CONCAT(employees.first_name, ' ', employees.last_name) AS Full_name, salaries.salary AS Salary
	FROM departments
	JOIN dept_manager ON departments.dept_no = dept_manager.dept_no
	JOIN employees ON dept_manager.emp_no = employees.emp_no
	JOIN salaries ON employees.emp_no = salaries.emp_no
	WHERE dept_manager.to_date LIKE '9999%'
	AND salaries.to_date LIKE '9999%'
	ORDER BY Department;
-- q6
SELECT departments.dept_no, departments.dept_name, COUNT(employees.emp_no) AS num_employees
	FROM departments 
	JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
	JOIN employees ON dept_emp.emp_no = employees.emp_no
	WHERE dept_emp.to_date LIKE '9999%'
	GROUP BY departments.dept_no
	ORDER BY departments.dept_no;
	
-- q7
SELECT departments.dept_name, AVG(salaries.salary) AS avg_salary
	FROM departments
	JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
	JOIN salaries ON dept_emp.emp_no = salaries.emp_no
	WHERE salaries.to_date LIKE '9999%'
	AND dept_emp.to_date LIKE '9999%'
	GROUP BY departments.dept_no
	ORDER BY avg_salary DESC
	LIMIT 1;
	
-- q8
SELECT employees.first_name, employees.last_name
	FROM employees
	JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
	JOIN salaries ON dept_emp.emp_no = salaries.emp_no
	WHERE dept_emp.dept_no = 'd001'
	AND dept_emp.to_date LIKE '9999%'
	ORDER BY salaries.salary DESC
	LIMIT 1;
	
-- q9
SELECT employees.first_name, employees.last_name,
	salaries.salary,departments.dept_name
	FROM employees
	JOIN salaries ON employees.emp_no = salaries.emp_no
	JOIN dept_manager ON employees.emp_no = dept_manager.emp_no
	JOIN departments ON dept_manager.dept_no = departments.dept_no
	WHERE dept_manager.to_date LIKE '9999%'
	AND salaries.to_date LIKE '9999%'
	ORDER BY salaries.salary DESC
	LIMIT 1;
	
-- q10
SELECT departments.dept_name, ROUND(AVG(salaries.salary)) as avg_salary
	FROM departments
	JOIN dept_emp ON departments.dept_no = dept_emp.dept_no
	JOIN salaries ON salaries.emp_no = dept_emp.emp_no
	GROUP BY departments.dept_name
	ORDER BY avg_salary DESC
	