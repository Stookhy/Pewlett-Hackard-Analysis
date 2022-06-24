-- The Number of retiring employees by title. 
SELECT e.emp_no,
        e.first_name,
        e.last_name,
        t.title,
        t.from_date,
        t.to_date
INTO retirement_titles
FROM employees as e
INNER JOIN titles as t
ON (e.emp_no = t.emp_no)
WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY e.emp_no;

SELECT * 
FROM retirement_titles;

   
-- Use Dictinct with Orderby to remove duplicate rows. 
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_titles
ORDER BY emp_no, title DESC;

SELECT * 
FROM unique_titles;


-- Retrieve the number of titles from the unique titles table.
SELECT COUNT(ut.emp_no),
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

SELECT * 
FROM unique_titles;


-- Create a retiring titles table to hold the required information.
SELECT COUNT(ut.emp_no),
ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY title 
ORDER BY COUNT(title) DESC;

SELECT * 
FROM retiring_titles;

---------------------------------------------------------------------------------------------------------------

-- Create a Mentorship Eligibility table that holds the employees who are eligible to participate in a mentorship program
SELECT DISTINCT ON (e.emp_no) e.emp_no,
 	   e.first_name,
 	   e.last_name,
 	   e.birth_date,
 	   de.from_date,
 	   de.to_date,
 	   t.title
INTO mentorship_eligibilty
FROM employees as e
 	INNER JOIN dept_emp as de
 		ON (e.emp_no = de.emp_no)
 	INNER JOIN titles as t
		ON (e.emp_no = t.emp_no)
WHERE (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
AND (t.to_date = '9999-01-01')
AND (de.to_date = '9999-01-01')
ORDER BY e.emp_no ASC, de.from_date DESC;

SELECT * 
FROM mentorship_eligibilty;