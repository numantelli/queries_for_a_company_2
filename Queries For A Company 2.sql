--QUESTIONS : 

--Calculate amount of countries based on regions.

SELECT region_id,
COUNT(country_name) as number_of_country
FROM countries
GROUP BY 1

--Which location has the most departments?

SELECT location_id as location,
COUNT (department_name) as number_of_department
FROM departments
GROUP BY 1
ORDER BY 2 desc
LIMIT 1


--What are total salaries based on departments and job_id?

SELECT department_id as department,
job_id as job,
SUM(salary)
FROM employees
GROUP BY 1,2
ORDER BY 1,2


--In which department are employees with a salary range of 10000-15000 units mostly working?

SELECT department_id,
COUNT (department_id)
FROM employees
WHERE salary BETWEEN 10000 and 15000
GROUP BY 1
ORDER BY 2 desc
LIMIT 1


--What is the avarage salary of employees who are working in team of manager 100 ID?

SELECT AVG(salary)
FROM employees
WHERE manager_id = '100'



--What is the average salary of employees who are working in departments located in postcode 26192?

SELECT AVG(salary)
FROM employees
WHERE department_id IN (SELECT department_id
FROM departments 
WHERE location_id IN (SELECT location_id
FROM locations
WHERE postal_code = '26192'))



--How many people are working under the title of 'Programmer'?

SELECT COUNT(employee_id)
FROM employees
WHERE job_id IN (SELECT job_id
FROM jobs
WHERE job_title = 'Programmer')



--How many people are working in the 'Sales' department and what is their average salary?

SELECT COUNT(employee_id) as number_of_employee,
AVG(salary) as avg_salary
FROM employees
WHERE department_id IN (SELECT department_id
FROM departments
WHERE department_name = 'Sales')




