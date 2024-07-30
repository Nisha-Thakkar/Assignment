/*1. Display all information in the tables EMP and DEPT*/
create database HR;
USE HR;
SELECT * FROM EMP;

/*2. Display only the hire date and employee name for each employee*/ 
SELECT HIRE_DATE ,FIRST_NAME FROM EMP ORDER BY FIRST_NAME  ;

/*4. Display the hire date, name and department number for all clerks*/ 
SELECT FIRST_NAME,HIRE_DATE,DEPARTMENT_ID FROM EMP;

/*3.Display the ename concatenated with the job ID, separated by a comma and space, and 
name the column Employee and Title*/
SELECT FIRST_NAME ,LAST_NAME , CONCAT_WS (",", FIRST_NAME ,LAST_NAME,JOB_ID) 
AS EMPLOYEE FROM EMP;

/*5.Create a query to display all the data from the EMP table. Separate each column by a 
comma. Name the column THE OUTPUT */
SELECT  
CONCAT_WS (",", EMPLOYEE_ID, FIRST_NAME, LAST_NAME, EMAIL, PHONE_NUMBER, HIRE_DATE, JOB_ID, SALARY, COMMISSION_PCT, MANAGER_ID, DEPARTMENT_ID, MyUnknownColumn, MANAGER_NAME) 
AS THE_OUTPUT FROM EMP;

/*6.Display the names and salaries of all employees with a salary greater than 2000*/
SELECT * FROM EMP WHERE SALARY > "2000";

/*7. Display the names and dates of employees with the column headers "Name" and "Start
Date*/
SELECT EMPLOYEE_ID AS "NAME",HIRE_DATE AS "START DATE" FROM EMP;

/*8. Display the names and hire dates of all employees in the order they were hired*/
SELECT EMPLOYEE_ID,HIRE_DATE FROM EMP ORDER BY HIRE_DATE ;

/*9. Display the names and salaries of all employees in reverse salary order*/ 
SELECT FIRST_NAME ,SALARY FROM EMP ORDER BY SALARY DESC;

/*10. Display 'ename" and "deptno" who are all earned commission and display salary in
reverse order*/
SELECT FIRST_NAME,LAST_NAME, DEPARTMENT_ID, SALARY FROM EMP ORDER BY SALARY DESC;

/*11. Display the last name and job title of all employees who do not have a manager*/
SELECT LAST_NAME,JOB_ID FROM EMP WHERE NOT MANAGER_ID;

/*12. Display the last name, job, and salary for all employees whose job is sales representative
or stock clerk and whose salary is not equal to $2,500, $3,500, or $5,000*/
SELECT LAST_NAME,JOB_ID,SALARY FROM EMP WHERE JOB_ID NOT IN ("2500","3500","5000");
 
/*13.Display the maximum, minimum and average salary and commission earned*/
SELECT MIN(SALARY)FROM EMP;
SELECT MAX(SALARY)FROM EMP;
SELECT AVG(SALARY)FROM EMP;
SELECT COUNT(SALARY)FROM EMP WHERE COMMISSION_PCT;

/*14.Display the department number, total salary payout and total commission payout for
each department*/ 
SELECT DEPARTMENT_ID, SUM(SALARY) ,SUM(COMMISSION_PCT) FROM EMP GROUP BY DEPARTMENT_ID;

/*15.Display the department number and number of employees in each department*/
SELECT DEPARTMENT_ID, COUNT(DEPARTMENT_ID) FROM EMP GROUP BY DEPARTMENT_ID; 

/*16.Display the department number and total salary of employees in each department*/
SELECT DEPARTMENT_ID, SUM(SALARY) FROM EMP GROUP BY DEPARTMENT_ID;

/*17.Display the employee's name who doesn't earn a commission. Order the result set
without using the column name*/
SELECT FIRST_NAME  AS EMPLOYEE_NAME , COMMISSION_PCT FROM EMP WHERE COMMISSION_PCT IS NULL; 

/*18.Display the employees name, department id and commission. If an Employee doesn't
earn the commission, then display as 'No commission'. Name the columns appropriately*/
SELECT FIRST_NAME, LAST_NAME, DEPARTMENT_ID, COMMISSION_PCT,
CASE 
  WHEN COMMISSION_PCT IS NULL THEN "NO COMMISSION"
  ELSE COMMISSION_PCT
  END AS "COMMISIION" FROM EMP;
  
  
/*19.Display the employee's name, salary and commission multiplied by 2. If an Employee
doesn't earn the commission, then display as 'No commission. Name the columns
appropriate*/
SELECT FIRST_NAME, SALARY, COMMISSION_PCT,
CASE
WHEN (COMMISSION_PCT*2) THEN "DOUBLE"
WHEN COMMISSION_PCT < 0 THEN "NO COMMISSION"
ELSE "NO COMMISSION"
END FROM EMP;  

/*20.Display the sum of salaries of the employees working under each Manager*/
SELECT MANAGER_ID, SUM(SALARY) FROM EMP
GROUP BY MANAGER_ID;

/*21.Select the Managers name, the count of employees working under and the department
ID of the manager*/
SELECT  DEPARTMENT_ID , COUNT(EMPLOYEE_ID)
 FROM EMP GROUP BY DEPARTMENT_ID ;

/*22.Select the employee name, department id, and the salary. Group the result with the
manager name and the employee last name should have second letter 'a'*/
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY FROM EMP GROUP BY MANAGER_NAME;
SELECT FIRST_NAME,LAST_NAME,DEPARTMENT_ID,SALARY FROM EMP 
 WHERE LAST_NAME LIKE "_A%" ;


/*23.Display the average of sum of the salaries and group the result with the department id.
Order the result with the department id*/
SELECT DEPARTMENT_ID, AVG(SALARY) AS AVG_SALARY
FROM EMP
GROUP BY DEPARTMENT_ID
ORDER BY DEPARTMENT_ID;

/*24.Select the maximum salary of each department along with the department id*/
SELECT DEPARTMENT_ID, MAX(SALARY) FROM EMP GROUP BY DEPARTMENT_ID;


/*25. Display the commission, if not null display 10% of salary, if null display a default value 1*/
SELECT EMPLOYEE_ID,COMMISSION_PCT,
CASE 
    WHEN COMMISSION_PCT = 0.00 THEN '1'
    ELSE 0.10*SALARY
END AS SALARY
FROM EMP;

/*26. Write a query that displays the employee's last names only from the string's 2-5th
position with the first letter capitalized and all other letters lowercase, Give each column an
appropriate label*/
SELECT LAST_NAME, CONCAT(UCASE(SUBSTR(LAST_NAME,2,1)),LCASE(SUBSTR(LAST_NAME,3,3)))
AS FORMATTED_NAME FROM EMP;

/*27. Write a query that displays the employee's first name and last name along with a " in
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the
month on which the employee has joined*/
SELECT FIRST_NAME,LAST_NAME,CONCAT_WS("-",FIRST_NAME,LAST_NAME) AS EMPLOYEE_ID,DATE_FORMAT(HIRE_DATE,"%M") AS HIRE_MONTH
FROM EMP;


/*29. Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end,
department id, salary and the manager name all in Upper case, if the Manager name
consists of 'z' replace it with '$!*/
SELECT EMPLOYEE_ID,CONCAT(INSERT(EMPLOYEE_ID,2,0,"00"),"E") AS EMPLOYEE_ID, DEPARTMENT_ID,SALARY,UCASE(MANAGER_NAME) AS MANAGER,
CASE
  WHEN MANAGER_NAME LIKE 'Z%' THEN '$!'
  WHEN MANAGER_NAME LIKE '%Z%' THEN '$!'
  WHEN MANAGER_NAME LIKE '%Z' THEN '$!'
  ELSE MANAGER_NAME
  END AS MANAGER_EDITED
  FROM EMP;
  
/*30. Write a query that displays the employee's last names with the first letter capitalized and
all other letters lowercase, and the length of the names, for all employees whose name
starts with J, A, or M. Give each column an appropriate label. Sort the results by the
employees' last names*/
SELECT CONCAT(UCASE(SUBSTR(LAST_NAME,1,1)),LCASE(SUBSTR(LAST_NAME,2))) AS SUR_NAME,LENGTH(LAST_NAME) AS CHAR_LENGTH
FROM EMP
WHERE LAST_NAME LIKE 'A%' OR LAST_NAME LIKE 'J%' OR LAST_NAME LIKE 'M%'
ORDER BY LAST_NAME;

/*31. Create a query to display the last name and salary for all employees. Format the salary to
be 15 characters long, left-padded with $. Label the column SALARY*/
SELECT LAST_NAME,SALARY,CONCAT('$'," ",(FORMAT(SALARY,15))) AS SALARY
FROM EMP;


/*32. Display the employee's name if it is a palindrome*/
SELECT FIRST_NAME FROM EMP
WHERE FIRST_NAME = REVERSE(FIRST_NAME);

/*33. Display First names of all employees with initcaps*/
SELECT CONCAT(UCASE(SUBSTR(FIRST_NAME,1,1)),LCASE(SUBSTR(FIRST_NAME,2))) AS INITCAP_NAME FROM EMP;

/*35. Extract first letter from First Name column and append it with the Last Name. Also add
"@systechusa.com" at the end. Name the column as e-mail address. All characters should
be in lower case. Display this along with their First Name*/
SELECT FIRST_NAME,LAST_NAME,LCASE(CONCAT(SUBSTR(FIRST_NAME,1,1),LAST_NAME,"@systechusa.com")) AS EMAIL_ADDRESS
FROM EMP;


/*36.Display the names and job titles of all employees with the same job as Trenna*/
SELECT CONCAT_WS(" ",FIRST_NAME,LAST_NAME) AS FULL_NAME,JOB_ID
FROM EMP 
WHERE JOB_ID IN 
(SELECT JOB_ID FROM EMP WHERE FIRST_NAME ='TRENNA'); 

/*38.Display the name of the employee whose salary is the lowest*/ 
SELECT CONCAT_WS(" ",FIRST_NAME,LAST_NAME) AS FULL_NAME 
FROM EMP
WHERE SALARY IN (SELECT MIN(SALARY) FROM EMP);


/* 39.Display the names of all employees except the lowest paid*/
SELECT CONCAT_WS(" ",FIRST_NAME,LAST_NAME) AS FULL_NAME
FROM EMP
WHERE SALARY NOT IN (SELECT MIN(SALARY) FROM EMP);

/* 40.Write a query that displays the employee's last names only from the string's 2-5th 
position with the first letter capitalized and all other letters lowercase, Give each column an 
appropriate label*/
SELECT LAST_NAME ,SUBSTR(LAST_NAME,2,5) STRINGG
FROM EMP;
SELECT LAST_NAME , CONCAT(UCASE(SUBSTR(LAST_NAME,2,1))
,LCASE(SUBSTR(LAST_NAME,3,20))) AS FORMATED_LN
FROM EMP;
SELECT LAST_NAME ,lcase(LAST_NAME) LCASE
FROM EMP;

/*41.Write a query that displays the employee's first name and last name along with a " in 
between for e.g.: first name : Ram; last name : Kumar then Ram-Kumar. Also displays the 
month on which the employee has joined.*/
SELECT FIRST_NAME , LAST_NAME ,CONCAT_WS("-",FIRST_NAME , LAST_NAME)
FROM EMP;
SELECT FIRST_NAME, LAST_NAME , MONTH(HIRE_DATE) FROM EMP;

/*42. Write a query to display the employee's last name and if half of the salary is greater than 
ten thousand then increase the salary by 10% else by 11.5% along with the bonus amount of 
1500 each. Provide each column an appropriate label.*/
SELECT LAST_NAME,
CASE
WHEN SALARY/2 > 10000
THEN SALARY*0.10
ELSE SALARY *0.115
END AS "ADJUSTED SALARY"
FROM EMP;


/* 43.Display the employee ID by Appending two zeros after 2nd digit and 'E' in the end, 
department id, salary and the manager name all in Upper case, if the Manager name 
consists of 'z' replace it with '$!*/
SELECT EMPLOYEE_ID,
    CONCAT(SUBSTRING(employee_id,1, 2), '00', 'E') AS "Modified Employee ID",
    department_id AS "Department ID",
    UPPER(salary) AS "Salary",
    REPLACE(UPPER(MANAGER_NAME), 'Z', '$!') AS "Manager Name"
FROM EMP;

/*44. Write a query that displays the employee's last names with the first letter capitalized and 
all other letters lowercase, and the length of the names, for all employees whose name 
starts with J, A, or M. Give each column an appropriate label. Sort the results by the 
employees' last names.*/ 
SELECT 
    CONCAT(UCASE(LEFT(last_name, 1)), LCASE(SUBSTRING(last_name, 2))) AS "Name",
    LENGTH(last_name) AS "Name Length"
FROM emp
WHERE last_name LIKE 'J%'
OR last_name LIKE 'A%' 
OR last_name LIKE 'M%'
ORDER BY last_name;

/*45. Create a query to display the last name and salary for all employees. Format the salary to 
be 15 characters long, left-padded with $. Label the column SALARY.*/
SELECT last_name,
LPAD((SALARY), 15, '$') 
AS "SALARY"
FROM emp;

/*46.Display the employee's name if it is a palindrome.*/
 SELECT CONCAT(first_name, ' ', last_name) AS "Employee Name"
FROM EMP
WHERE 
(first_name) = REVERSE(first_name);

/*47. Display First names of all employees with initcaps.*/
SELECT CONCAT(UCASE(SUBSTRING(FIRST_NAME,1,1)) 
,LCASE(SUBSTRING(FIRST_NAME,2)))
FROM emp;

/*48. From LOCATIONS table, extract the word between first and second space from the 
STREET ADDRESS column.*/
SELECT 
SUBSTRING_INDEX(SUBSTRING_INDEX(PRODUCT_NAME, ' ', 2), ' ', -1) AS "Word Between First and Second Space"
FROM DEP;

/*49.Extract first letter from First Name column and append it with the Last Name. Also add 
"@systechusa.com" at the end. Name the column as e-mail address. All characters should 
be in lower case. Display this along with their First Name.*/
SELECT 
CONCAT(LOWER(SUBSTRING(first_name, 1, 1)), last_name, '@systechusa.com') AS "e-mail address",    
first_name
FROM emp;

/*50. Display the names and job titles of all employees with the same job as Trenna.*/
SELECT first_name,last_name,job_ID
FROM emp
WHERE job_ID = (
SELECT job_ID
FROM emp
WHERE first_name = 'Trenna'
);

/*51.Display the names and department name of all employees working in the same city as 
Trenna.*/
SELECT first_name,last_name,department_name
FROM emp 
WHERE city = (
SELECT city
FROM emp
WHERE first_name = 'Trenna'
);

/*52. Display the name of the employee whose salary is the lowest.*/
SELECT FIRST_NAME ,MIN(SALARY)
FROM EMP GROUP BY FIRST_NAME;

/*53. Display the names of all employees except the lowest paid.*/
SELECT FIRST_NAME , SALARY FROM EMP
WHERE (salary) > min("salary");

/* 54. Write a query to display the last name, department number, department name for all 
employees. */
SELECT e.last_name,e.department_id ,d.department_name from emp e 
inner join dep d  on e.employee_id = d.sales_order_id ;

/* 55. Create a unique list of all jobs that are in department 4. Include the location of the 
department in the output.*/
SELECT DISTINCT JOB_ID
FROM EMP
WHERE department_id = 4;

/*56. Write a query to display the employee last name,department name,location id and city of 
all employees who earn commission.*/
SELECT emp.last_name, emp.DEPARTMENT_ID
from emp
left join dep on emp.last_name = dep.city;
 
/*57.Display the employee last name and department name of all employees who have an 'a' 
in their last name */
SELECT LAST_NAME, DEPARTMENT_ID FROM EMP
WHERE last_name LIKE '%a' ;

/* 58.  Write a query to display the last name,job,department number and department name for 
all employees who work in ATLANTA.*/
SELECT LAST_NAME, JOB_ID, DEPARTMENT_ID
FROM emp
WHERE city = 'ATLANTA';

/* 59. Display the employee last name and employee number along with their manager's last 
name and manager number.*/
SELECT manager_id,  MIN(MANAGER_NAME)  FROM EMP GROUP BY MANAGER_ID;

/*59. Display the employee last name and employee number along with their manager's last 
name and manager number (including the employees who have no manager).*/
SELECT  LAST_NAME , EMPLOYEE_ID FROM EMP 
WHERE MANAGER_NAME ORDER BY MANAGER_ID DESC ;

/*60. Create a query that displays employees last name,department number,and all the 
employees who work in the same department as a given employee.*/
SELECT 
last_name,department_id
FROM emp
WHERE department_id = '60';

/* 61. Create a query that displays the name,job,department name,salary,grade for all 
employees. Derive grade based on salary(>=50000=A, >=30000=B,<30000=C) */
SELECT FIRST_NAME, JOB_ID, DEPARTMENT_ID,SALARY,GRADE,
CASE
WHEN salary >= 50000 THEN 'A'
WHEN salary >= 30000 THEN 'B'
ELSE 'C'
END AS "Grade"
FROM emp;

/* 62.  Display the names and hire date for all employees who were hired before their 
managers along with their manager names and hire date. Label the columns as Employee 
name, emp_hire_date,manager name,man_hire_date. */
SELECT CONCAT(FIRST_NAME,LAST_NAME) AS EMPLOYEE_NAME,
MANAGER_NAME AS MANAGER_NAME,
HIRE_DATE AS EMP_HIRE_DATE FROM EMP  
WHERE MANAGER_NAME ORDER BY HIRE_DATE ;

/* 63. Write a query to display employee numbers and employee name (first name, last name) 
of all the sales employees who received an amount of 2000 in bonus.*/
SELECT employee_id AS "Employee Number",
CONCAT(first_name, last_name) AS "Employee Name"
FROM emp
WHERE job_title = 'Sales' AND amount = 2000;

/* 64. Fetch address details of employees belonging to the state CA. If address is null, provide 
default value N/A. */
SELECT * FROM DEP WHERE CITY = "CA";
SELECT CITY,
CASE 
WHEN ADDRESS = NULL THEN N/A 
END AS ADDRESSS ;


/*65. Write a query that displays all the products along with the Sales OrderID even if an order 
has never been placed for that product.*/
SELECT Product_Name, Product_Number, 
Sales_Order_Id, Sales_Price FROM DEP; 

/* 66.Find the subcategories that have at least two different prices less than $15.*/
SELECT Subcategories FROM DEP
WHERE Sales_Price < "10000"
GROUP BY Subcategories
HAVING COUNT(DISTINCT Sales_Price) < "10000" ;
-- $15 = 1,252.59 --

/* 67. A. Write a query to display employees and their manager details. Fetch employee id, 
employee first name, and manager id, manager name.
B. Display the employee id and employee name of employees who do not have manager.*/
SELECT EMPLOYEE_ID, FIRST_NAME, MANAGER_ID, MANAGER_NAME FROM EMP ;
SELECT EMPLOYEE_ID, FIRST_NAME FROM EMP WHERE MANAGER_NAME = '' OR MANAGER_ID = "";

/* 68. A. Display the names of all products of a particular subcategory 15 and the names of their 
vendors.
B. Find the products that have more than one vendor. */
SELECT Product_Name  FROM DEP WHERE SUBCATEGORIES = 15 ;

SELECT Product_Name FROM DEP WHERE Sales_Order_Id > 1 ;
-- Sales_Order_Id = VENDOR_ID --

/* 69. . Find all the customers who do not belong to any store.*/
SELECT CUSTOMER_ID  CUSTOMER_NAME FROM DEP
WHERE SALES_ORDER_ID IS NULL;
-- SALES_ORDER_ID = STORE_ID --

/* 70. . Find sales prices of product 718 that are less than 
the list price recommended for that product. */
SELECT PRODUCT_NAME , SALES_PRICE
FROM DEP
WHERE Product_Number = 718 < SALES_PRICE;

 /* 71.Display product number, description and sales of each product in the year 2001.*/
SELECT product_number, descriptionn , sales_order_id from dep
WHERE YEAR(sales_date) = 2001;

/* 72. Build the logic on the above question to extract sales for each category by year. Fetch 
Product Name, Sales_2001, Sales_2002, Sales_2003.*/
SELECT 
product_name,
SUM(CASE WHEN YEAR(sales_date) = 2001 THEN sales ELSE 0 END) AS Sales_2001,
SUM(CASE WHEN YEAR(sales_date) = 2002 THEN sales ELSE 0 END) AS Sales_2002,
SUM(CASE WHEN YEAR(sales_date) = 2003 THEN sales ELSE 0 END) AS Sales_2003
FROM dep
GROUP BY product_name;

/*73. Write a query to display the last name and hire date 
of any employee in the same department as SALES.*/
SELECT last_name , hire_date ,department_id from emp
where hire_date order by department_id ;

/* 74.Create a query to display the employee numbers and last names of all employees who 
earn more than the average salary. Sort the results in ascending order of salary.*/
SELECT employee_id,last_name,salary FROM emp
WHERE salary > (SELECT AVG(salary)FROM emp)
ORDER BY salary ASC;

/* 75.Write a query that displays the employee numbers and last names of all employees who 
work in a department with any employee whose last name contains a' u.*/
 SELECT EMPLOYEE_ID , LAST_NAME FROM emp WHERE LAST_NAME LIKE '%u';
 
 /*76.  Display the last name, department number, and job ID of all employees whose 
department location is ATLANTA.*/
SELECT last_name,department_id,job_id
FROM emp
WHERE last_name = 'ATLANTA';

/*77. Display the last name and salary of every employee who reports to FILLMOR*/
SELECT last_name,salary
FROM emp
WHERE last_name = 'FILLMOR';

/* 78.Display the department number, last name, and job ID for every employee in the 
OPERATIONS department.*/
SELECT department_id,last_name,job_id FROM emp
WHERE department_id = 'OPERATIONS';

/*79. Modify the above query to display the employee numbers, last names, and salaries of all 
employees who earn more than the average salary and who work in a department with any 
employee with a 'u'in their name.*/
SELECT employee_id,last_name,salary FROM emp
WHERE salary > (SELECT avg(salary) FROM emp) and
 first_name like "%u%";

/* 80.Display the names of all employees whose job title is the same as anyone in the sales 
dept.*/
SELECT last_name FROM emp
WHERE job_id IN (SELECT DISTINCT job_id FROM emp
WHERE department_id = (SELECT department_id FROM emp
WHERE department_id = 'Sales'));

/* 81. Write a compound query to produce a list of employees showing raise percentages, 
employee IDs, and salaries. Employees in department 1 and 3 are given a 5% raise, 
employees in department 2 are given a 10% raise, employees in departments 4 and 5 are 
given a 15% raise, and employees in department 6 are not given a raise. */
SELECT EMPLOYEE_ID, SALARY,
case
WHEN EMPLOYEE_ID IN (101, 103)
THEN SALARY+SALARY*0.05 
WHEN EMPLOYEE_ID = 2 
THEN SALARY+SALARY*0.10
WHEN EMPLOYEE_ID IN (104, 105)
THEN SALARY+SALARY*0.15
WHEN EMPLOYEE_ID = 106
THEN "NOT GIVEN A RAISE"
END AS "SALARY_RAISE"
FROM EMP; 
# ( HERE DEPARTMENT_ID = EMPLOYEE_ID , 1,2,3... LIKE 101,102,103...) #

/*82. Write a query to display the top three earners in the EMPLOYEES table. Display their last 
names and salaries.*/
SELECT first_name,last_name,salary FROM emp
ORDER BY salary DESC LIMIT 3;

/*83. Display the names of all employees with their salary and commission earned. Employees 
with a null commission should have O in the commission column.*/
SELECT last_name,salary,
CASE WHEN COMMISSION_PCT= " " THEN COMMISSION_PCT = 0 
END AS COMMISSION 
FROM EMP;

/*84. Display the Managers (name) with top three salaries along with their salaries and 
department information.*/
SELECT  Manager_Name,department_id,salary
FROM emp
where salary ORDER BY salary desc LIMIT 3;
 

