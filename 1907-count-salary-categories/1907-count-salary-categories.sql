# Write your MySQL query statement below

SELECT 
    category, IFNULL(acc_count, 0) as accounts_count
FROM 
(
    SELECT "High Salary" AS category
    UNION ALL
    SELECT "Low Salary" AS category
    UNION ALL
    SELECT "Average Salary" AS category
) AS category_list
LEFT JOIN 
(
    SELECT 
        case_category, COUNT(*) as acc_count
    FROM 
    (
        SELECT 
        CASE
            WHEN income < 20000 THEN "Low Salary"
            WHEN income BETWEEN 20000 AND 50000 THEN "Average Salary"
            ELSE "High Salary"
        END AS case_category
    FROM Accounts 
    ) AS case_table
    GROUP BY case_category
) as case_table
ON 
category_list.category = case_table.case_category;

