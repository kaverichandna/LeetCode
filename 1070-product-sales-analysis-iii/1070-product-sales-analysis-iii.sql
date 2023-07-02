SELECT 
  T1.product_id, 
  first_year, 
  quantity, 
  price 
FROM 
  (
    SELECT 
      product_id, 
      MIN(year) as first_year 
    FROM 
      Sales 
    GROUP BY 
      product_id
  ) AS T1 
  LEFT JOIN Sales T2 ON T1.product_id = T2.product_id 
WHERE 
  year = first_year;
