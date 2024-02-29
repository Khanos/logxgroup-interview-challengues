## Clock Problem - 20 Minutes into the Future

Note the current time and what it would look like on an analog clock. Determine what angle the
minute hand and the hour hand would form 20 minutes from now. State any assumptions you
make along with your solution.

Result: 

* The clock show the time of 03:00, so the initial angle is 90 degrees.
* 20 minuts has pass, and the clock should show 03:20. So the angle whould be:
  * 1/3 of 90 degress, wich is the same as 30 degrees.


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
  
query: 'SELECT * FROM employees WHERE YEAR(hiredate) < 2020' 

2. Within the employees table find the maximum salary from each department

query: 'SELECT salary, id, empno, departmentid
FROM employees
GROUP BY departmentid;' 
query: 'SELECT MAX(salary) AS LargestPrice FROM PrevResult;'

3. For all employees that are not assigned to more than one project, get their employee
number, name, department name, and role name