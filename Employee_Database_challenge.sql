--Deliverable 1: 
-----------------------------------------------------------------------------------------
-- Retrieve the emp_no, first_name, and last_name columns from the Employees table.
SELECT emp_no, first_name, last_name 
from Employees

-- Retrieve the title, from_date, and to_date columns from the Titles table.
Select title, from_date, to_date 
from Titles 

-- Filter the data on the birth_date column to retrieve the employees who were born between 1952 and 1955. Then, order by the employee number.
SELECT first_name,last_name
FROM employees 
WHERE birth_date BETWEEN '1952-01-01' AND '1955-12-31'
order by emp_no

--The Number of Retiring Employees by Title.
SELECT e.emp_no,
	e.first_name, 
	e.last_name, 
	ti.title, 
	ti.from_date, 
	ti.to_date	
INTO retirement_titles
FROM employees as e
INNER JOIN titles as ti
ON (e.emp_no = ti.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;


select *from  retirement_titles

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (r.emp_no)
r.emp_no,
r.first_name,
r.last_name,
r.title
INTO unique_titles
FROM retirement_titles as r 
ORDER BY r.emp_no, r.to_date DESC;

select *from unique_titles


---- The number of employees by their most recent job title who are about to retire.
select title,count(ut.title) as Employee_Number
INTO retiring_titles
FROM unique_titles as ut
group by ut.title
order by (Employee_Number) DESC;

SELECT * FROM RETIRING_TITLES
-----------------------------------------------------------------------------------------
--Deliverable 2: 
-----------------------------------------------------------------------------------------
--create a Mentorship Eligibility table for current employees who were born between January 1, 1965 and December 31, 1965.

SELECT DISTINCT ON (e.emp_no)
e.emp_no,e.first_name,e.last_name,
d.from_date, d.to_date,ti.title
INTO mentorship_eligibilty
FROM employees AS e
JOIN dept_emp as d 
ON (e.emp_no = d.emp_no)
JOIN titles as ti
ON (e.emp_no = ti.emp_no)
WHERE (e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (d.to_date = '9999-01-01')
ORDER BY e.emp_no, ti.from_date DESC;

select *from mentorship_eligibilty

-- There is a title, and there are multiple sections
-- Each section has a heading and subheading.
-- Links to images are working and displayed correctly
-----------------------------------------------------------------------------------------
--Deliverable 3:
-----------------------------------------------------------------------------------------
--Roles per Staff and Departament:
SELECT DISTINCT ON (rt.emp_no) 
	rt.emp_no,
	rt.first_name,
	rt.last_name,
	rt.title,
	d.dept_name
INTO unique_titles_department
FROM retirement_titles as rt
INNER JOIN dept_emp as de
ON (rt.emp_no = de.emp_no)
INNER JOIN departments as d
ON (d.dept_no = de.dept_no)
ORDER BY rt.emp_no, rt.to_date DESC;

select *from  unique_titles_department


-- How many roles will need to be fill per title and department?
SELECT ut.dept_name, ut.title, COUNT(ut.title) 
INTO rolls_to_fill
FROM (SELECT title, dept_name from unique_titles_department) as ut
GROUP BY ut.dept_name, ut.title
ORDER BY ut.dept_name DESC;

select *from  rolls_to_fill 
-- How many roles will need to be fill per title and department?
SELECT ut.dept_name, ut.title, COUNT(ut.title) 
INTO rolls_to_fill
FROM (SELECT title, dept_name from unique_titles_department) as ut
GROUP BY ut.dept_name, ut.title
ORDER BY ut.dept_name DESC;

-- Qualified staff, retirement-ready to mentor next generation.
SELECT ut.dept_name, ut.title, COUNT(ut.title) 
INTO qualified_staff
FROM (SELECT title, dept_name from unique_titles_department) as ut
WHERE ut.title IN ('Senior Engineer', 'Senior Staff', 'Technique Leader', 'Manager')
GROUP BY ut.dept_name, ut.title
ORDER BY ut.dept_name DESC;


select *from qualified_staff