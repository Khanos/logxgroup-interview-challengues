## Clock Problem - 20 Minutes into the Future

Note the current time and what it would look like on an analog clock. Determine what angle the
minute hand and the hour hand would form 20 minutes from now. State any assumptions you
make along with your solution.

Result: 

* The hour hand move:

360/12/60 = 0.5degree.

* The minut hand move:

360/60 = 6 degree

* If we start at 03:00, 20min in the future should be:

angleHour = (currentHour * 30) +  (currentMin * 0.5)

angleMin = (currentMin * 6) +  (20 * 6)


## Coding Challenge

The solution to all VueJs problems are located inside the `challengue` folder. It's using a Vite scafold project and divided into components. In order to run the project refer to you need to:

```
$ cd challenges
$ npm run dev
```

* First challengue: The msg variable needs to be surrounded by curlybraces in order to be used on the view (template) section of a vuejs page.
* Second Challengue: In order to make a computed value writable you need to manually create the getter and setter funcionst.
* Third Challengue: In order to create the composable we need to make all props reactive using the ref module from vue.

## Analytics Challenge

The solution is in the `analitycsChallengue.js` file in the root directory. In order to run the script you need to run the following on the terminal:


```
node analitycsChallengue.js
```

## Database Query Questions
Write SQL queries for:

1. Get the employees hired after 2020 from the employees table
2. Within the employees table find the maximum salary from each department
3. For all employees that are not assigned to more than one project, get their employee

### Running the Database

This project uses Docker to run the PostgreSQL database and PgAdmin. Make sure you have [Docker](https://www.docker.com/products/docker-desktop) installed on your machine.

1. Navigate to the `./database` directory:

```sh
$ cd database
```

2. Build and run the Docker containers:

```sh
$ docker-compose -f docker-compose-postgres.yml up -d
```

This command will start two Docker containers: `container-postgresdb` for the PostgreSQL database and `container-pgadmin` for PgAdmin.

3. Access PgAdmin by opening your web browser and navigating to http://localhost:80. Log in with the email and password specified in the `.env` file (PGADMIN_DEFAULT_EMAIL and PGADMIN_DEFAULT_PASSWORD).

4. In PgAdmin, create a new server with the following connection details:

    * Host: db (the name of the Docker service)
    * Port: 5432
    * Maintenance database: mydatabase (or the value of POSTGRES_DB in the .env file)
    * Username: postgres (or the value of POSTGRES_USER in the .env file)
    * Password: password (or the value of POSTGRES_PASSWORD in the .env file)

5. Once connected, you can run the init.sql script to initialize the database:

    * Right-click on the mydatabase database (or the name you used for POSTGRES_DB) and select Query Tool.
    * Open the init.sql file, copy its contents, and paste them into the Query Tool.
    * Click the Execute button to run the script.

6. You can now view the solution by running the `solution.sql` script in the same way.


```sh
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
```