# Write your MySQL query statement below
SELECT DISTINCT num AS ConsecutiveNums
FROM Logs l1
WHERE EXISTS (
    SELECT *
    FROM Logs l2
    WHERE l2.id = l1.id + 1 AND l2.num = l1.num
) AND EXISTS (
    SELECT *
    FROM Logs l3
    WHERE l3.id = l1.id + 2 AND l3.num = l1.num
);

