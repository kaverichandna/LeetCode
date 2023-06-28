# Write your MySQL query statement below






SELECT Department, Employee, Salary 
FROM (
    SELECT d.name AS Department, e.name AS Employee, e.Salary AS Salary,
    MAX(salary) OVER (PARTITION BY e.departmentID ORDER BY salary DESC) AS MaxSalary
    FROM Employee e
    LEFT JOIN Department d ON e.departmentID = d.id
) AS table_alias
WHERE Salary = MaxSalary;
