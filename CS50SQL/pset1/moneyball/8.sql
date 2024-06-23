SELECT salary FROM performances
JOIN players ON players.id = performances.player_id
JOIN salaries ON salaries.player_id = players.id
WHERE salaries.year = 2001
ORDER BY performances.HR DESC
LIMIT 1;
