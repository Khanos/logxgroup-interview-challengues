-- 1. Create the tables
CREATE TABLE Departments (
  department_id SERIAL PRIMARY KEY,
  department_name VARCHAR(255) NOT NULL
);

CREATE TABLE Roles (
  role_id SERIAL PRIMARY KEY,
  role_name VARCHAR(255) NOT NULL
);

CREATE TABLE Employees (
  employee_id SERIAL PRIMARY KEY,
  first_name VARCHAR(255) NOT NULL,
  last_name VARCHAR(255) NOT NULL,
  hire_date DATE NOT NULL,
  department_id INT NOT NULL REFERENCES Departments(department_id),
  role_id INT NOT NULL REFERENCES Roles(role_id),
  salary DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Projects (
  project_id SERIAL PRIMARY KEY,
  project_name VARCHAR(255) NOT NULL
);

CREATE TABLE EmployeeProjects (
  employee_id INT NOT NULL REFERENCES Employees(employee_id),
  project_id INT NOT NULL REFERENCES Projects(project_id),
  PRIMARY KEY (employee_id, project_id)
);


-- 2. Create functions to generate random names and dates
CREATE OR REPLACE FUNCTION GenerateName(length integer) 
RETURNS text AS $$
DECLARE
  chars text := 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  name text := '';
BEGIN
  WHILE length(name) < length LOOP
    name := name || substr(chars, trunc(random() * length(chars))::integer + 1, 1);
  END LOOP;
  RETURN name;
END;
$$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION GenerateRandomDate(startDate date, endDate date) 
RETURNS date AS $$
DECLARE
  days integer := endDate - startDate;
BEGIN
  RETURN startDate + (random() * (days + 1))::integer;
END;
$$ LANGUAGE plpgsql;

-- 3. Populate Departments, Roles, and Projects tables with sample data
INSERT INTO Departments (department_name) VALUES ('Marketing'), ('Engineering'), ('Sales'), ('Human Resources'), ('Finance');
INSERT INTO Roles (role_name) VALUES ('Software Engineer'), ('Data Scientist'), ('Marketing Manager'), ('Sales Representative'), ('Accountant');
INSERT INTO Projects (project_name) VALUES ('Project 1'), ('Project 2'), ('Project 3'), ('Project 4'), ('Project 5');

-- 4. Populate Employees table with random data
DO $$
DECLARE 
  numEmployees INT := 100; -- Adjust this value as needed
  i INT;
BEGIN
  FOR i IN 1..numEmployees LOOP
    INSERT INTO Employees (first_name, last_name, hire_date, department_id, role_id, salary)
    VALUES (
      GenerateName(10), 
      GenerateName(10), 
      GenerateRandomDate('2015-01-01'::date, '2023-12-31'::date), 
      trunc(random() * 5 + 1)::integer, 
      trunc(random() * 5 + 1)::integer,
      (random() * 100000)::integer -- Assign a random salary between 0 and 100000
    );
  END LOOP;
END $$;

-- 5. Assign employees to projects
DO $$
DECLARE 
  numEmployeeProjects INT := 200; -- Adjust this value as needed
  i INT;
BEGIN
  FOR i IN 1..numEmployeeProjects LOOP
    INSERT INTO EmployeeProjects (employee_id, project_id)
    VALUES (
      trunc(random() * 100 + 1)::integer, 
      trunc(random() * 5 + 1)::integer -- Adjust this value to match the number of projects
    ) ON CONFLICT DO NOTHING;
  END LOOP;
END $$;