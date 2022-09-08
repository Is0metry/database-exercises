USE employees;

-- q2
SELECT DISTINCT last_name FROM employees ORDER BY last_name LIMIT 10;
/*
Aamodt
Acton
Adachi
Aingworth
Akaboshi
Akazan
Akiyama
Alameldin
Albarhamtoshy
Alblas
*/
-- q3
SELECT first_name, last_name FROM employees WHERE hire_date LIKE '199%-%-%' AND birth_date LIKE '%-12-31' ORDER BY hire_date LIMIT 5;
/*
Magdalena	Guting
Chaosheng	Plavsic
Sachin	    Brodie
Douad       Streit
Ymte	    Schlegelmilch
*/
-- q4 
SELECT first_name, last_name FROM employees WHERE hire_date LIKE '199%-%-%' AND birth_date LIKE '%-12-31' ORDER BY hire_date LIMIT 5 OFFSET 45;
/*
Tomofumi	Ducloy
Willard	    Itschner
Ziyad	    Schueller
Claude	    Ventosa
Alenka	    Garrabrants

OFFSET = Page_Number-1 * LIMIT
*/
