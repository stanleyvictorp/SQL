create database emp_attrition;
select * from emp_attrition.emp;
alter table emp_attrition.emp
rename column ï»¿age to age;
select * from emp_attrition.emp;

--  checking total employees
select count(*) from emp_attrition.emp;

-- employees between age 25 to 35 and experience > 5

select * from emp_attrition.emp
where age between 25 and 35 and totalworkingyears > 5
order by age and totalworkingyears;

-- count of employees between age 25 to 35 and experience > 5
select count(*) from emp_attrition.emp
where age between 25 and 35 and totalworkingyears > 5;

-- fetch details of min and max salary of employees in different dept who received salary hike less than 13%
select * from emp_attrition.emp;

select department, PercentSalaryHike, min(monthlyincome), max(monthlyincome)
from emp
group by department, percentsalaryhike
having PercentSalaryHike < 13;

-- calculate average monthly income of employers who have studied medical and worked more than 3 years

select avg(monthlyincome) as AvgMonthlyIncome, department, EducationField, YearsAtCompany
from emp
where EducationField = 'Medical' and YearsAtCompany > 3
group by EducationField, Department, YearsAtCompany
order by AvgMonthlyIncome desc;

-- fetch total no.of male and female employees under attrition whose marital status is married and not received promotion in last 2 years

select Gender, count(EmployeeNumber) 
from emp
where MaritalStatus = 'Married' and YearsSinceLastPromotion = 2 and Attrition = 'Yes'
group by gender;


-- fetch employees with max performane with no promotion for 4 years and above
select EmployeeNumber from emp
where PerformanceRating = (select max(PerformanceRating) from emp) and YearsSinceLastPromotion >= 4;

-- fetch no. of employees with max performane with no promotion for 4 years and above
select count(EmployeeNumber) from emp
where PerformanceRating = (select max(PerformanceRating) from emp) and YearsSinceLastPromotion >=4;

-- fetch employee with min and max precentage salary hike with max performance rating and not promoted
select EmployeeNumber, min(PercentSalaryHike) as MinSalaryHike, max(PercentSalaryHike) as MaxSalaryHike, 
PercentSalaryHike,  PerformanceRating, YearsSinceLastPromotion
from emp
where PerformanceRating = (select max(PerformanceRating) from emp) and YearsSinceLastPromotion = 0
group by EmployeeNumber, PercentSalaryHike, PerformanceRating, YearsSinceLastPromotion
order by PercentSalaryHike desc;

-- fetch no.of employee with min and max precentage salary hike with max performance rating and not promoted
select EmployeeNumber, min(PercentSalaryHike) as MinSalaryHike, max(PercentSalaryHike) as MaxSalaryHike,  PerformanceRating, YearsSinceLastPromotion
from emp
where PerformanceRating = (select max(PerformanceRating) from emp) and YearsSinceLastPromotion = 0
group by EmployeeNumber, PerformanceRating, YearsSinceLastPromotion
order by  max(PercentSalaryHike) desc;

select distinct department from emp;

-- fetch employees with min salary hike, worked overtime and in company for more than 5 years
select EmployeeNumber, PercentSalaryHike, OverTime, YearsAtCompany
from emp
where overtime = "Yes" and 
PercentSalaryHike = (select min(PercentSalaryHike) from emp) and yearsatcompany > 5
order by PercentSalaryHike desc;

-- fetch employees with max salary hike, worked overtime and in company for less than 5 years
select EmployeeNumber from emp
where OverTime = "Yes" and
PercentSalaryHike = (select max(PercentSalaryHike) from emp) and YearsAtCompany < 5;

-- fetch employees with max salary hike, not worked overtime and in company for less than 5 years
select EmployeeNumber, age, PercentSalaryHike, YearsAtCompany, PerformanceRating from emp
where OverTime = "No" and
PercentSalaryHike = (select max(PercentSalaryHike) from emp) and YearsAtCompany <5; 