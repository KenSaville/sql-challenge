--check out each table
select * from departments
select * from dept_emp
select * from dept_manager
select * from employees
select * from salaries
select * from titles

-- mislableded hire_date as hored_date.  Will change that here
ALTER TABLE employees 
RENAME COLUMN hired_date TO hire_date;

--1. List the following details of each employee: 
-- employee number, last name, first name, sex, and salary.

SELECT
employees.emp_no, last_name, first_name, sex, salary
FROM employees
INNER JOIN
salaries
ON
employees.emp_no = salaries.emp_no;

--2. List first name, last name, and hire date for employees who were hired in 1986.

SELECT first_name, last_name, hire_date
FROM employees
where hire_date between '1986-01-01' and '1986-12-31'
;

--3. List the manager of each department with the following information: 
--department number, department name, the manager's employee number, 
--last name, first name.  (Need to connect departments, dept_manager, employees)

SELECT
d.dept_no, d.dept_name, dm.emp_no, e.last_name, e.first_name
FROM
	departments d
INNER JOIN dept_manager dm 
    ON d.dept_no = dm.dept_no
INNER JOIN employees e 
    ON dm.emp_no = e.emp_no
; 

--4. List the department of each employee with the following information: 
--employee number, last name, first name, and department name.

SELECT
d.dept_no, d.dept_name, e.emp_no, e.last_name, e.first_name
FROM
	departments d
INNER JOIN dept_emp de
    ON d.dept_no = de.dept_no
INNER JOIN employees e 
    ON de.emp_no = e.emp_no
; 

--5. List first name, last name, and sex for employees whose 
--first name is "Hercules" and last names begin with "B."

Select first_name, last_name, sex
FROM
employees
WHERE
first_name = 'Hercules' and last_name LIKE 'B%'
;

--6. List all employees in the Sales department, 
--including their employee number, last name, first name, and department name.

--7. List all employees in the Sales and Development departments, 
--including their employee number, last name, first name, and department name.

--8. In descending order, list the frequency count of employee last names, 
--i.e., how many employees share each last name.
