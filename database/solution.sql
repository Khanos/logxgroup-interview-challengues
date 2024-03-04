-- 1. Get the employees hired after 2020 from the employees table

SELECT *
FROM Employees
WHERE hire_date > '2020-12-31';

-- 2. Within the employees table find the maximum salary from each department

SELECT d.department_name, MAX(e.salary) as max_salary
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
GROUP BY d.department_name;

-- 3. For all employees that are not assigned to more than one project, get their employee
-- number, name, department name, and role name

SELECT e.employee_id, e.first_name, e.last_name, d.department_name, r.role_name
FROM Employees e
JOIN Departments d ON e.department_id = d.department_id
JOIN Roles r ON e.role_id = r.role_id
WHERE e.employee_id NOT IN (
  SELECT employee_id
  FROM EmployeeProjects
  GROUP BY employee_id
  HAVING COUNT(project_id) > 1
);