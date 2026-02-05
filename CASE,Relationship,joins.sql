SELECT count(emp_id) from employees;

SELECT dept,count(emp_id) from employees GROUP BY dept;

SELECT * FROM employees WHERE salary=(select MAX(salary) from employees); 


SELECT fname,salary,
CASE 
	WHEN salary>= 50000 THEN 'High'
	ELSE 'Low'
END AS sal_cat
FROM employees;

SELECT fname,salary,
CASE WHEN salary>0 THEN ROUND(salary * .10)
END as bonus FROM employees;

SELECT
CASE 
	WHEN salary>= 50000 THEN 'High'
	ELSE 'Low'
END AS sal_cat,COUNT(emp_id)
FROM employees
GROUP BY sal_cat;


