-- ref https://en.wikipedia.org/wiki/Associative_entity

-- Drop the table is exists
DROP TABLE IF EXISTS departments;
DROP TABLE IF EXISTS dept_emp;
DROP TABLE IF EXISTS dept_manager;
DROP TABLE IF EXISTS employees;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS titles;


-- 1.Create departements table
CREATE TABLE departments (
    dept_no VARCHAR(10) NOT NULL,
    dept_name VARCHAR(25) NOT NULL,
    PRIMARY KEY (dept_no)
       
);

-- 2.Create titles table
CREATE TABLE titles (
    title_id VARCHAR(10) NOT NULL,
    title VARCHAR(25) NOT NULL,
    PRIMARY KEY (title_id)
       
);

SELECT * FROM 

-- 3. Create employees table
CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(10) NOT NULL,
    birth_date VARCHAR(10)  NOT NULL,
    first_name VARCHAR(40) NOT NULL,
    last_name VARCHAR(40)  NOT NULL,
    sex VARCHAR(1) NOT NULL,
    hire_date VARCHAR(10) NOT NULL,
    PRIMARY KEY (emp_no),
    FOREIGN KEY (emp_title_id) REFERENCES titles(title_id)
);

-- 4.Create salarie table
CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    PRIMARY KEY (emp_no)
);


-- 5. Create dept_emp table, this is a junction table
CREATE TABLE dept_emp (
    emp_no INT REFERENCES employees(emp_no),
    dept_no VARCHAR(10) REFERENCES departments(dept_no),
    PRIMARY KEY (dept_no, emp_no)
);


-- 6. Create dept_manager table, this is a junction table
CREATE TABLE dept_manager (
    dept_no VARCHAR(10) REFERENCES departments(dept_no),
    emp_no INT REFERENCES employees(emp_no),
    PRIMARY KEY (dept_no, emp_no)
);
