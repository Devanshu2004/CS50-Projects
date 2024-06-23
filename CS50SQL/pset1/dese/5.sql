SELECT city, COUNT('name') AS 'Number of Public Schools' FROM schools
WHERE type = 'Public School'
GROUP BY city
HAVING COUNT('name') <= 3
ORDER BY COUNT('name') DESC, city ASC;

