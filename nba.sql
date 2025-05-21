--This data shows TOTAL stats 2014-15

--identify high scoring players 
SELECT name, team, pts FROM players_stats
ORDER BY pts DESC 
LIMIT 10; 
--Spot young breakout players who might be undervalued (players under 24 who scored more than 500 pts in the season)
SELECT name, team, pts, age FROM players_stats
WHERE age <= 24 AND pts >= 500 
ORDER BY pts DESC; 
--Surface elite free throw shooters 
SELECT name, team, fta, fg_pct FROM players_stats
WHERE fga >= 30
ORDER BY fg_pct DESC
LIMIT 10; 
--Analyze talent sources by school.  (Top 10 schools producing talent)
SELECT collage, COUNT(collage) from players_stats
GROUP BY collage 
ORDER BY COUNT(collage) DESC
LIMIT 10;
--Find efficient passers
SELECT name, team, ast, 
       ROUND((ast::DOUBLE PRECISION / tov)::NUMERIC, 2) AS ratio,
       tov
FROM players_stats
WHERE ast >= 30 AND tov >= 10
LIMIT 10;