SELECT 
  Department, 
  Employee, 
  salary as Salary 
FROM 
  (
    SELECT 
      d.name as Department, 
      e.name as Employee, 
      salary, 
      dense_rank() OVER(
        PARTITION BY d.name 
        ORDER BY 
          SALARY DESC
      ) as rankier 
    FROM 
      Employee e 
      LEFT JOIN Department d ON e.departmentId = d.id
  ) as table1 
WHERE 
  rankier < 4;


