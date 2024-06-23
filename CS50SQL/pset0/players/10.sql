SELECT "first_name" AS "FN", "last_name" AS "LN" FROM players
WHERE bats = 'R'
ORDER BY "first_name" ASC, "last_name" ASC
LIMIT 30;
