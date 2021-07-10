-- 1.List the following details of each employee: employee number, last name, first name, sex, and salary.

SELECT e.emp_no, e.first_name, e.last_name, e.sex, s.salary
FROM employees AS e
INNER JOIN salaries AS s ON
e.emp_no=s.emp_no;

-- 2.List first name, last name, and hire date for employees who were hired in 1986.

SELECT *
FROM employees
WHERE hire_date LIKE '%1986'

-- 3. List the manager of each department with the following information: 
-- department number, department name, the manager's employee number, last name, first name.
SELECT dept_manager.dept_no, dept_manager.emp_no, departments.dept_name, e.last_name, e.first_name, 
FROM dept_manager
LEFT JOIN departments
    ON dept_manager.dept_no = departments.dept_no
LEFT JOIN employees AS e
    ON dept_manager.emp_no=e.emp_no
ORDER BY dept_manager.emp_no;


-- 4.List the department of each employee with the following information: 
-- employee number, last name, first name, and department name.

SELECT dept_emp.dept_no, dept_emp.emp_no, departments.dept_name, e.last_name, e.first_name
FROM dept_emp
LEFT JOIN departments
    ON dept_emp.dept_no = departments.dept_no
LEFT JOIN employees AS e
    ON dept_emp.emp_no=e.emp_no
ORDER BY dept_emp.emp_no;

-- 5.List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."
SELECT *
FROM employees
WHERE first_name = 'Hercules'
    AND last_name LIKE 'B%';

-- 6.List all employees in the Sales department, 
-- including their employee number, last name, first name, and department name.

-- create a new table called reorder_manager 
CREATE TABLE reorder_manager(
    emp_no INT REFERENCES employees(emp_no),
    dept_no VARCHAR(10) REFERENCES departments(dept_no),
    PRIMARY KEY (dept_no, emp_no)       
);

-- insert the data from dept_manager into newly created reorder_manager to sort the column oder to be able to union with dept_employee
INSERT INTO reorder_manager(emp_no,dept_no) SELECT emp_no, dept_no FROM dept_manager

--uniton dept_emp and reorder_manager tables adn store the result into the temp_table
SELECT *
INTO temp_table
FROM (
SELECT reorder_manager.dept_no,reorder_manager.emp_no FROM reorder_manager
UNION all
SELECT dept_emp.dept_no,dept_emp.emp_no FROM dept_emp)AS TempTable;

-- Join temp_table with employees and departemnts table and filter by "Sales", including all staff work in sales including managers.
SELECT e.emp_no, e.last_name, e.first_name,departments.dept_name
FROM temp_table
LEFT JOIN employees AS e
    ON temp_table.emp_no=e.emp_no
LEFT JOIN departments
    ON temp_table.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales'
ORDER BY e.emp_no;

-- 7.List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

SELECT e.emp_no, e.last_name, e.first_name,departments.dept_name
FROM temp_table
LEFT JOIN employees AS e
    ON temp_table.emp_no=e.emp_no
LEFT JOIN departments
    ON temp_table.dept_no = departments.dept_no
WHERE departments.dept_name = 'Sales' OR departments.dept_name = 'Development'
ORDER BY e.emp_no;

-- 8.In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.
SELECT last_name,COUNT(last_name) AS "name count"
FROM employees AS e
GROUP BY last_name
ORDER BY "name count" DESC;
