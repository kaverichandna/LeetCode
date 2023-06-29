# Write your MySQL query statement below




SELECT name  as results FROM 
(
  SELECT name, count(*) as rating_count 
  FROM MovieRating mr
  LEFT JOIN Users u
  ON mr.user_id = u.user_id
  GROUP BY u.user_id
  ORDER BY rating_count DESC, name ASC
  LIMIT 1
) as table1
UNION ALL
SELECT title FROM
(
  SELECT title, avg(rating) as avg_rating
  FROM MovieRating mr INNER JOIN Movies m
  ON mr.movie_id = m.movie_id
  WHERE MONTH(created_at) = 2
  GROUP BY m.movie_id
  ORDER BY avg_rating DESC, title ASC
  LIMIT 1
) as table2;
