SELECT extract(YEAR FROM creation_date) AS YEAR, extract(MONTH FROM creation_date) AS MONTH, COUNT(id)
FROM      factquotes
GROUP BY  YEAR, MONTH
ORDER BY  YEAR, MONTH