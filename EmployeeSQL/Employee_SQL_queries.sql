
-- List the employee number, last name, first name, sex, and 
-- salary of each employee
SELECT employees.emp_no, employees.last_name, employees.first_name, employees.sex, salary.salary
FROM employees
JOIN salaries AS salary
ON employees.emp_no = salary.emp_no;


-- List the first name, last name, and hire date for the employees who were hired in 1986.
SELECT first_name, last_name, hire_data
FROM employees
WHERE employees.hire_data BETWEEN '1986-01-01' AND '1986-12-31';


--  List the manager of each department along with 
-- their department number, department name, employee number, last name, and first name.
SELECT dept_manager.dept_no, dept_manager.emp_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM dept_manager
JOIN employees AS e
ON dept_manager.emp_no = e.emp_no
JOIN departments AS d
ON dept_manager.dept_no = d.dept_no;


-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
SELECT dept_emp.dept_no, dept_emp.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp
JOIN employees AS e
ON dept_emp.emp_no = e.emp_no
JOIN departments as d
ON dept_emp.dept_no = d.dept_no;

-- List first name, last name, and sex of each employee whose first 
-- name is Hercules and whose last name begins with the letter B.
SELECT first_name, last_name, sex
FROM employees
WHERE first_name = 'Hercules' AND last_name LIKE 'B%';
--Had to place % after the B to get the correct results


-- List each employee in the Sales department, including 
-- their employee number, last name, and first name.
SELECT dept_emp.emp_no, d.dept_name, e.last_name, e.first_name
FROM dept_emp
JOIN employees AS e
ON dept_emp.emp_no = e.emp_no
JOIN departments as d
ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales';


-- List each employee in the Sales and Development departments, including their 
-- employee number, last name, first name, and department name.
SELECT dept_emp.emp_no, e.last_name, e.first_name, d.dept_name
FROM dept_emp
JOIN employees AS e
ON dept_emp.emp_no = e.emp_no
JOIN departments as d
ON dept_emp.dept_no = d.dept_no
WHERE d.dept_name = 'Sales' OR d.dept_name = 'Development';


-- List the frequency counts, in descending order, of all the employee last names 
-- (that is, how many employees share each last name).
SELECT last_name, COUNT(last_name) AS Count_Of
FROM employees
GROUP BY last_name
ORDER BY Count_Of DESC;