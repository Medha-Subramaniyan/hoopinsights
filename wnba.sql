--This data shows TOTAL stats 2016-17

--identify high scoring players 
SELECT name, team, pts FROM wnba_stats
ORDER BY pts DESC
LIMIT 10; 
--Spot young breakout players who might be undervalued (players under 24 who scored more than 500 pts in the season)
SELECT name, team, pts, age FROM wnba_stats
WHERE age <= 24 AND pts >= 500 
ORDER BY pts DESC;
--Surface elite free throw shooters 
SELECT name, team, "FT%", FTA FROM wnba_stats
WHERE FTA >= 30
ORDER BY "FT%" DESC
LIMIT 10; 
--Analyze talent sources by school (Top 10 schools producing talent)
SELECT college, COUNT(college) FROM wnba_stats
GROUP BY college
ORDER BY COUNT(college) DESC
LIMIT 10; 
-- Identify flexible WNBA players. Find WNBA players who play multiple positions (e.g., G/F, F/C). 
--Return distinct position values and count how many players fall into each category.
SELECT DISTINCT pos, COUNT(name) as Player_Count FROM wnba_stats
WHERE pos LIKE '%/%'
GROUP BY pos;
--Find efficient passers
SELECT name, team, ast, 
       ROUND((ast::DOUBLE PRECISION / "TO")::NUMERIC, 2) AS ratio,
       "TO"
FROM wnba_stats
WHERE ast >= 30 AND "TO" >= 10
LIMIT 10;