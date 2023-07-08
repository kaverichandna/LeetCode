SELECT
    request_date AS Day,
    ROUND(
        SUM(CASE
            WHEN status LIKE 'cancelled_%' THEN 1
            ELSE 0
        END) / COUNT(*) , 2
    ) AS `Cancellation Rate`
FROM
    (
    SELECT
        t.request_at AS request_date,
        t.status,
        u.banned AS client_banned,
        u2.banned AS driver_banned
    FROM
        Trips t
        JOIN Users u ON t.client_id = u.users_id
        JOIN Users u2 ON t.driver_id = u2.users_id
    WHERE
        t.request_at BETWEEN '2013-10-01' AND '2013-10-03'
        AND u.banned = 'No'
        AND u2.banned = 'No'
    ) AS subquery
GROUP BY
    request_date;
