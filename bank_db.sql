CREATE TABLE employees(
emp_id SERIAL PRIMARY KEY,
fname VARCHAR(50) NOT NULL,
lname VARCHAR(50) NOT NULL,
email VARCHAR(100) NOT NULL UNIQUE,
dept VARCHAR(50),
salary DECIMAL(10,2) DEFAULT 30000.00,
hire_date DATE NOT NULL DEFAULT CURRENT_DATE
);

INSERT INTO employees (emp_id, fname, lname, email, dept, salary, hire_date)
 VALUES
(1, 'Raj', 'Sharma', 'raj.sharma@example.com', 'IT', 50000.00, '2020-01-15'),
(2, 'Priya', 'Singh', 'priya.singh@example.com', 'HR', 45000.00, '2019-03-22'),
(3, 'Arjun', 'Verma', 'arjun.verma@example.com', 'IT', 55000.00, '2021-06-01'),
(4, 'Suman', 'Patel', 'suman.patel@example.com', 'Finance', 60000.00, '2018-07-30'),
(5, 'Kavita', 'Rao', 'kavita.rao@example.com', 'HR', 47000.00, '2020-11-10'),
(6, 'Amit', 'Gupta', 'amit.gupta@example.com', 'Marketing', 52000.00, '2020-09-25'),
(7, 'Neha', 'Desai', 'neha.desai@example.com', 'IT', 48000.00, '2019-05-18'),
(8, 'Rahul', 'Kumar', 'rahul.kumar@example.com', 'IT', 53000.00, '2021-02-14'),
(9, 'Anjali', 'Mehta', 'anjali.mehta@example.com', 'Finance', 61000.00, '2018-12-03'),
(10, 'Vijay', 'Nair', 'vijay.nair@example.com', 'Marketing', 50000.00, '2020-04-19');

SELECT * FROM employees where emp_id=5;

SELECT * from employees where dept='HR';

SELECT * from employees where salary>50000;

SELECT * from employees where dept='HR' OR dept='IT'

SELECT * from employees where dept='IT' AND salary>50000;

SELECT * from employees where dept IN('IT','HR','Finance');

SELECT * from employees where dept NOT IN('IT','HR','Finance');

SELECT * FROM employees
WHERE
salary BETWEEN 40000 AND 65000;

SELECT DISTINCT dept from employees;

SELECT * FROM employees ORDER BY fname;

SELECT * FROM employees LIMIT 3;

SELECT * FROM employees WHERE fname like 'A%';

SELECT * FROM employees WHERE fname like '%a';

SELECT * FROM employees WHERE fname like '%i%';

SELECT * FROM employees WHERE dept like '__';

SELECT * FROM employees WHERE fname like '_a%';

SELECT COUNT(emp_id) FROM employees;

SELECT SUM(salary) from employees;

SELECT AVG(salary) from employees;

SELECT MIN(salary) from employees;

SELECT MAX(salary) from employees;

SELECT dept,COUNT(emp_id) from employees GROUP BY dept;

SELECT dept,SUM(salary) from employees GROUP BY dept;

SELECT CONCAT(fname,lname) AS FullName from employees;

SELECT CONCAT_WS(' ',fname,lname) AS FullName from employees;

SELECT REPLACE(dept,'IT','Technology') from employees;

SELECT fname from employees WHERE LENGTH(fname)>5;

SELECT CONCAT_WS(':',emp_id,fname,lname,dept) from employees;

SELECT CONCAT_WS(':',emp_id,CONCAT_WS(' ',fname,lname),dept,salary) from employees;

SELECT CONCAT_WS(':',emp_id,fname,UPPER(dept)) from employees;

SELECT CONCAT_WS(' ',CONCAT(LEFT(dept,1),emp_id),fname) from employees; 

SELECT * from employees ORDER BY salary desc;

SELECT * from employees WHERE fname like'A%'

SELECT * from employees WHERE LENGTH(lname)=4;

