# Physical

departments
-
dept_no VARCHAR(10) FK -< dept_manager.dept_no
dept_name VARCHAR(25) PK 


dept_emp
-
emp_no INT FK - employees.emp_no 
dept_no VARCHAR(10) FK - departments.dept_no 


dept_manager
-
dept_no VARCHAR(10) PK 
emp_no INT FK - employees.emp_no


employees
-
emp_no INT PK
emp_title_id VARCHAR(10) FK - titles.title_id
birth_date DATE 
first_name VARCHAR(40)
last_name VARCHAR(40)
sex VARCHAR(1)
hire_date DATE 


salaries
-
emp_no INT FK - employees.emp_no
salary INT PK


titles
-
title_id VARCHAR(10) PK
title VARCHAR(25)
