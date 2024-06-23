SELECT "title", "air_date" FROM episodes
WHERE air_date LIKE "200_%" AND topic LIKE "%fraction%"
ORDER BY production_code DESC;
