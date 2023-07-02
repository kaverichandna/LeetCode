# Write your MySQL query statement below


SELECT 
    product_id, 
    Sales.year as first_year,
    quantity,
    price
FROM Sales 
WHERE EXISTS
(
    SELECT 
        * 
    FROM 
    (
        SELECT product_id, MIN(year) as min_year
        FROM Sales s
        GROUP BY product_id 
    ) AS T1
    WHERE 
        Sales.product_id = T1.product_id 
        AND 
        Sales.year = T1.min_year
) 

