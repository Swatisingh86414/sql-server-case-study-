-- Simple Queries:

CREATE DATABASE COMPANY;
use COMPANY;

--4 List all the locations.
create table location(
location_id int primary key,
city varchar(255)
);

insert into location(location_id, city)
values(122,'New YORK'),
(123,'Dallas'),
(124,'chicago'),
(167,'Boston')

select * from location

--2 List all the department details.
create table DEPARTMENT(
Department_Id int primary key,
Name varchar (255), 
location_Id int foreign key references location (location_id)
);

insert into DEPARTMENT( Department_Id, Name,location_Id)
values(10, 'Accounting', 122),
 (20, 'Sales',124),
 (30, 'Research', 123),
 (40, 'Operations', 167)

 select * from DEPARTMENT

 --1
CREATE TABLE EMPLOYEE (
    Employee_Id INT PRIMARY KEY, 
    Last_Name VARCHAR(255), 
    First_Name VARCHAR(255), 
    Middle_Name VARCHAR(255), 
    Job_Id VARCHAR(255), 
    HireDate VARCHAR(255), 
    Salary VARCHAR(255),
    Comm INT NULL, 
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES department(department_id)
);

INSERT INTO EMPLOYEE(Employee_Id, Last_Name, First_Name, Middle_Name, Job_Id, HireDate, Salary, Comm, department_id)
VALUES
(7369, 'Smith', 'John', 'Q', 667, '17-Dec-84', 800, NULL, 20),
(7499, 'Allen', 'Kevin', 'J', 670, '20-Feb-85', 1600, 300, 30),
(7551, 'Doyle', 'Jean', 'K', 671, '04-Apr-85', 2850, NULL, 30),
(7552, 'Dennis', 'Lynn', 'S', 671, '15-May-85', 2750, NULL, 30),
(7553, 'Baker', 'Leslie', 'D', 671, '10-Jun-85', 2200, NULL, 40),
(7521, 'Wark', 'Cynthia', 'D', 670, '22-Feb-85', 1250, 50, 30);

select * from EMPLOYEE

--3 List all job details.
CREATE TABLE JOB (
Job_ID int PRIMARY KEY,
Designation VARCHAR (255)
);

INSERT INTO JOB(job_ID, Designation)
VALUES
 (667, 'Clerk'),
 (668, 'Staff'),
 (669, 'Analyst'),
  (670, 'Sales Person'),
  (671, 'Manager'),
  (672, 'President')
  SELECT* FROM JOB

 --5 List out the First Name, Last Name, Salary, Commission for all Employees.

   select First_Name, Last_Name, Salary, Comm from EMPLOYEE

 --6 List out the Employee ID, Last Name, Department ID for all employees and
alias

   SELECT Employee_Id AS 'Employee ID', Last_Name AS 'Last Name', department_id AS 'Department ID'
FROM EMPLOYEE;

select Employee_Id, Last_Name,department_id from EMPLOYEE

7-- List out the annual salary of the employees with their names only.

SELECT First_Name AS 'First Name', Last_Name AS 'Last Name', (Salary * 12) AS 'Annual Salary'
FROM EMPLOYEE;

--WHERE Condition:

--1 List the details about "Smith".

select * from EMPLOYEE where Last_Name = 'Smith'

--2 List out the employees who are working in department 20.

select  department_id from EMPLOYEE where department_id = 20

--3 List out the employees who are earning salary between 2000 and 3000.

select  salary from EMPLOYEE where Salary between 2000 and 3000

--4 List out the employees who are working in department 10 or 20.

select department_id from EMPLOYEE where department_id in  (10 ,20)

--5 Find out the employees who are not working in department 10 or 30.

select department_id from EMPLOYEE where department_id not in (10,30)

--6 List out the employees whose name starts with 'L'.

select First_name from EMPLOYEE where First_Name like 'L%'

--7 List out the employees whose name starts with 'L' and ends with 'E'.

select First_name from EMPLOYEE where First_Name like 'L%E'

--8 List out the employees whose name length is 4 and start with 'J'.

select first_name from EMPLOYEE where First_Name like 'j___' and len (first_name)= 4;

--9 List out the employees who are working in department 30 and draw the salaries more than 2500.

select department_id , salary from EMPLOYEE where department_id =30 and salary >2500;

--10 List out the employees who are not receiving commission.

select comm from EMPLOYEE where Comm is null or comm =0;
select * from EMPLOYEE where  COMM is null  --- if comm. coulmn have null value


--ORDER BY Clause:

--1 List out the Employee ID and Last Name in ascending order based on the Employee ID.

select employee_id, last_name from EMPLOYEE order by Employee_Id asc;
   
 --2 List out the Employee ID and Name in descending order based on salary.

 select employee_id, First_name from EMPLOYEE order by Salary desc

 --3 List out the employee details according to their Last Name in ascending-order.

 select * from EMPLOYEE order by last_name asc 

 --4 List out the employee details according to their Last Name in ascending order and then Department ID in descending order.

 select * from EMPLOYEE order by Last_Name asc, department_id desc;  

 --GROUP BY and HAVING Clause:

 --1 List out the department wise maximum salary, minimum salary and average salary of the employees.

 select DEPARTMENT_ID, max(SALARY) as "Maximum Salary",
 MIN(SALARY) as "Minimum Salary", AVG(SALARY) as "Average Salary" from EMPLOYEE
group by DEPARTMENT_ID


--2 select JOB_ID, max(SALARY) as "Maximum Salary", 
MIN(SALARY) as "Minimum Salary", AVG(SALARY) as "Average Salary" from EMPLOYEE
group by JOB_ID

select JOB_ID, max(SALARY) as "Maximum Salary", MIN(SALARY) as 
"Minimum Salary", AVG(SALARY) as "Average Salary" from EMPLOYEE
group by JOB_ID

--3 List out the number of employees who joined each month in ascending order

select month(HIREDATE) as "Month No", datename(MONTH,HIREDATE) as 'Month', 
count(*) as "No of Employees" from EMPLOYEE
group by month(HIREDATE), datename(MONTH,HIREDATE) 
order by 1


--4 List out the number of employees for each month and year in ascending order based on the year and month.

select month(HIREDATE) as "Month No", datename(MONTH,HIREDATE) as 'Month',
YEAR(HIREDATE) as "Year", count(*) as "No of Employees" from EMPLOYEE
group by month(HIREDATE), datename(MONTH,HIREDATE) ,YEAR(HIREDATE) 
order by 3,1


--5 List out the Department ID having at least four employees.


select DEPARTMENT_ID, count(*) as 'No. of Employees' from EMPLOYEE
group by DEPARTMENT_ID
having COUNT(DEPARTMENT_ID) >= 4

--6 How many employees joined in February month.

select datename(month,HIREDATE) as 'Month', COUNT(*) as 'No. of Employees' from EMPLOYEE
where datename(month,HIREDATE) = 'February'
group by  datename(month,HIREDATE)

--7 How many employees joined in May or June month

select datename(month,HIREDATE) as 'Month', COUNT(*) as 'No. of Employees' from EMPLOYEE
where ( datename(month,HIREDATE) = 'May' or datename(month,HIREDATE) = 'June' )
group by  datename(month,HIREDATE)

--8 How many employees joined in 1985?
select 
YEAR(HIREDATE) as "Year", count(*) as "No of Employees" from EMPLOYEE
where YEAR(HIREDATE) = '1985'
group by YEAR(HIREDATE) 
order by 1

--9 How many employees joined each month in 1985?

select month(HIREDATE) as "Month No", datename(MONTH,HIREDATE) as 'Month',
YEAR(HIREDATE) as "Year", count(*) as "No of Employees" from EMPLOYEE
where YEAR(HIREDATE) = '1985'
group by YEAR(HIREDATE) ,month(HIREDATE), datename(MONTH,HIREDATE)
order by 1


--10 How many employees were joined in April 1985?

select datename(month,HIREDATE) +' '+cast(datepart(yyyy,HIREDATE) as varchar) as 'Month Year', count(*) as 'No of Employees' from EMPLOYEE
where (datename(month,HIREDATE) +' '+cast(datepart(yyyy,HIREDATE) as varchar)) = 'April 1985'
group by datename(month,HIREDATE) +' '+cast(datepart(yyyy,HIREDATE) as varchar)

 --11 Which is the Department ID having greater than or equal to 3 employees joining in April 1985?
 
 select DEPARTMENT_ID , count(EMPLOYEE_ID) as 'No of Joinees' from EMPLOYEE
where (datename(month,HIREDATE) +' '+cast(datepart(yyyy,HIREDATE) as varchar)) = 'April 1985'
group by DEPARTMENT_ID
having count(EMPLOYEE_ID) >= 3 


-- Joins:
--1 List out employees with their department names.

select EMPLOYEE_ID, FIRST_NAME, LAST_NAME,MIDDLE_NAME, JOB_ID,Employee_Id,HIREDATE,
SALARY, COMM, b.Name as 'Department'
from EMPLOYEE a join DEPARTMENT b on a.DEPARTMENT_ID = b.Department_Id


--2 Display employees with their designations.
select EMPLOYEE_ID, FIRST_NAME, LAST_NAME,MIDDLE_NAME, c.Designation 
as 'Desigation',Employee_Id,HIREDATE,
SALARY, COMM, b.Name as 'Department'
from EMPLOYEE a join DEPARTMENT b
on a.DEPARTMENT_ID = b.Department_Id join job c
on c.Job_ID = a.JOB_ID

--3 Display the employees with their department names and city.
SELECT 
    e.EMPLOYEE_ID,
    e.FIRST_NAME, 
    d.Name AS DepartmentName,
    l.City AS Regional
FROM 
    Employee e JOIN Department d ON e.DEPARTMENT_ID = d.Department_Id
JOIN LOCATION l ON d.Location_Id = l.Location_ID

--4 How many employees are working in different departments? Display with department names.

SELECT d.Name AS DepartmentName, COUNT(e.EMPLOYEE_ID) AS 'Number of Employees'
FROM Department d
JOIN Employee e ON d.Department_Id = e.DEPARTMENT_ID
GROUP BY d.Name;

	
--5 How many employees are working in the sales department?

select b.Name, COUNT(*) as 'No of Employees' from EMPLOYEE a join DEPARTMENT b
 on  a.DEPARTMENT_ID  = b.Department_Id
 where b.Name = 'Sales'
 group by b.Name

--6 Which is the department having greater than or equal 
to 3 employees and display the department names in ascending order.

select b.Name, COUNT(*) as 'No of Employees' from EMPLOYEE a join DEPARTMENT b
 on  a.DEPARTMENT_ID  = b.Department_Id
 group by b.Name
 having  COUNT(*) > 3
 order by b.Name asc


--7 How many employees are working in 'Dallas'?

SELECT COUNT(e.Employee_Id) AS NumberOfEmployees
FROM Employee e
JOIN location ON  location_id = job_ID
WHERE City = 'Dallas';

--8 Display all employees in sales or operation departments.

SELECT * FROM Employee e
JOIN Department d ON e.DEPARTMENT_ID = d.Department_Id
WHERE d.Name IN ('Sales', 'Operations');


select employee_id, first_name, last_name,middle_name, job_id,Employee_Id,hiredate,
salary, comm, b.name as 'department'
 from employee a join department b
 on  a.department_id  = b.department_id
 join location on b.location_id = b.location_id
 and ( b.name = 'sales' or b.name = 'operations' )


-- CONDITIONAL STATEMENT
--1 Display the employee details with salary grades. 
Use conditional statement to create a grade column.

select EMPLOYEE_ID, FIRST_NAME, LAST_NAME,MIDDLE_NAME, JOB_ID,Employee_Id,HIREDATE,
SALARY, COMM, b.Name as 'Department',
case when SALARY > 2500 then 'Grade A'
when SALARY between 1500 and 2500 then 'Grade B'
when salary between 1000 and 1500 then 'Grade C' else 'Grade D' end as "Grade"
 from EMPLOYEE a join DEPARTMENT b
 on  a.DEPARTMENT_ID  = b.Department_Id
 join LOCATION on b. Location_ID = b.Location_Id


 --2 List out the number of employees grade wise. Use conditional 
 statement to create a grade column.

 SELECT COUNT(*) AS NumberOfEmployees,
CASE 
        WHEN SALARY > 2500 THEN 'Grade A'
        WHEN SALARY BETWEEN 1500 AND 2500 THEN 'Grade B'
        WHEN SALARY BETWEEN 1000 AND 1500 THEN 'Grade C'
        ELSE 'Grade D' 
END AS Grade FROM EMPLOYEE a
JOIN 
    DEPARTMENT b ON a.DEPARTMENT_ID = b.Department_Id
JOIN 
    LOCATION ON b.Location_ID = b.Location_Id
WHERE 
    SALARY BETWEEN 2000 AND 5000
GROUP BY 
    CASE 
        WHEN SALARY > 2500 THEN 'Grade A'
        WHEN SALARY BETWEEN 1500 AND 2500 THEN 'Grade B'
        WHEN SALARY BETWEEN 1000 AND 1500 THEN 'Grade C'
        ELSE 'Grade D' 
    END;


 
 --3 Display the employee salary grades and the number of employees
 between 2000 to 5000 range of salary.

select EMPLOYEE_ID, FIRST_NAME, LAST_NAME,MIDDLE_NAME, JOB_ID,Employee_Id,HIREDATE,
SALARY, COMM, b.Name as 'Department',
case when SALARY > 2500 then 'Grade A'
when SALARY between 1500 and 2500 then 'Grade B'
when salary between 1000 and 1500 then 'Grade C' else 'Grade D' end as Grade
 from EMPLOYEE a join DEPARTMENT b
 on  a.DEPARTMENT_ID  = b.Department_Id
 and SALARY between 2000 and 5000
 join LOCATION on b.Location_ID = b.Location_Id



--Subqueries:

--1. Display the employees list who got the maximum salary.

SELECT EMPLOYEE_ID, Salary,first_name
FROM Employee
WHERE Salary = (SELECT MAX(Salary) FROM Employee);


--2 Display the employees who are working in the sales department.

SELECT * FROM Employee
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM Department WHERE Name = 'Sales');

--3 Display the employees who are working as 'Clerk'.

SELECT * FROM Employee
WHERE job_id=(select Job_ID from job WHERE Designation = 'Clerk');

--4 Display the list of employees who are living in "New York".
SELECT * FROM EMPLOYEE WHERE Department_Id=
(select Department_Id from DEPARTMENT where Location_Id=(select Location_ID from LOCATION where City='New York'));
--no record becouze no departmnetid=10

--5. Find out the number of employees working in the sales department.

SELECT COUNT(*) AS 'Number of Sales Employees' FROM Employee
WHERE DEPARTMENT_ID = (SELECT DEPARTMENT_ID FROM Department WHERE Name = 'Sales');


--6.Update the salaries of employees who are working as clerks on the basis of--10%.

 Update employee  set salary = salary + (salary/100*10) 
 where job_id in (select  job_id from job
                where designation='CLERK')

 --7 Display the second highest salary drawing employee details
 select * from employee
where salary in (select max(salary) from employee
where salary < ( select max(salary) from employee))
		
SELECT employee_id, first_name, last_name, middle_name, job_id, hiredate, salary, comm
FROM (
SELECT employee_id, first_name, last_name, middle_name, job_id, hiredate, salary, comm, 
DENSE_RANK() OVER (ORDER BY salary DESC) AS salary_rank
FROM employee ) AS ranked_employees WHERE salary_rank = 2;

--8 List out the employees who earn more than every employee in department 30.

SELECT * FROM employee WHERE salary > ALL (SELECT salary FROM employee
WHERE department_id = 30
);
SELECT * FROM employee WHERE salary > (SELECT MAX(salary) 
FROM employee WHERE department_id = 30
);

--9 Find out which department has no employees

select department_id,name from department
where department_id not in(select department_id from employee)


select a.* from department a left join employee b
on a.department_id = b.department_id
where b.department_id is null

--10. Find out the employees who earn greater than the average salary for their department.


SELECT * FROM employee e WHERE salary > (SELECT AVG(CAST(salary AS FLOAT))
FROM employee WHERE department_id = e.department_id
GROUP BY department_id
);



