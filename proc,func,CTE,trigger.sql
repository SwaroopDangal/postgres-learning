CREATE OR REPLACE PROCEDURE update_emp_salary(
p_employee_id INT,
p_new_salary NUMERIC
)
LANGUAGE plpgsql
AS $$
BEGIN
UPDATE employees
SET salary = p_new_salary
WHERE emp_id = p_employee_id;
END;
$$;

CALL update_emp_salary(3,12345)

select * from employees;

CREATE OR REPLACE FUNCTION dept_max_sal_emp1(dept_name VARCHAR)
RETURNS TABLE(emp_id INT, fname VARCHAR, salary NUMERIC)
AS $$
BEGIN
RETURN QUERY
SELECT
e.emp_id, e.fname, e.salary
FROM
employees e
WHERE
e.dept = dept_name
AND e.salary = (
SELECT MAX(emp.salary)
FROM employees emp
WHERE emp.dept = dept_name
);
END;
$$ LANGUAGE plpgsql;

select * FROM dept_max_sal_emp1('Finance');


WITH avg_sal AS(
select dept,AVG(salary) as avg_salary from employees GROUP BY dept 
)
SELECT e.emp_id,e.fname,e.dept,e.salary,a.avg_salary
FROM employees e
JOIN avg_sal a ON e.dept = a.dept
WHERE e.salary>a.avg_salary;

WITH highest_paid AS(
select dept,MAX(salary) as max_salary from employees GROUP BY dept
)
SELECT  e.emp_id,e.fname,e.dept,e.salary
from employees e
JOIN highest_paid hp ON e.dept=hp.dept
WHERE hp.max_salary = e.salary;

CREATE OR REPLACE FUNCTION check_salary()
RETURNS TRIGGER AS $$
BEGIN
	IF NEW.salary<0 THEN
		NEW.salary := 0;
	END IF;
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_change_salary
BEFORE INSERT OR UPDATE ON employees
FOR EACH ROW
EXECUTE FUNCTION check_salary();

CALL update_emp_salary(1,-100000)

select * from employees;