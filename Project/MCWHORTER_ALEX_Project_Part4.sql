
-- Alex McWhorter
-- Project Part 4

-- Query 1:
 -- This query shows all player's first and last names with positions 
 -- that are forwards... either SMALL or POWER forwards
 SELECT first_name || ' ' || last_name AS "Player's Name", position AS "Position"
 FROM players
 WHERE position = 'sf' OR position = 'pf'
 ORDER BY 2 DESC;
 
 
 -- Query 2:
 -- This query uses a CASE statement to convert each player position
 -- into a number convention system that is used often to define the position.
 -- For example, the point guard is referred to as position '1'.
  SELECT first_name || ' ' || last_name AS "Player's Name", 
        (CASE position WHEN 'pg' THEN 1
                       WHEN 'sg' THEN 2
                       WHEN 'sf' THEN 3
                       WHEN 'pf' THEN 4
                       ELSE 5
            END) AS "Position as Number"
 FROM players
 ORDER BY 2, 1;
 
 -- Query 3:
 -- This query looks at the maximum, minimum, average, and the sum of stadium capacity
 -- for all teams in the table... no need to use order by with 1 row
 SELECT MAX(capacity) AS "Maximum Capacity", MIN(capacity) AS "Minimum Capacity",
 ROUND(AVG(capacity)) AS "Average Capacity",SUM(capacity) AS "Total Capacity of all Stadiums"
 FROM site;
 
 
 -- Query 4:
 -- This query joins the team table with the coaches table, pairing each team
 -- with the coaches they have; joined by team_id
 SELECT t.team_name AS "Team", c.first_name || ' ' || c.last_name AS "Coach"
 FROM team t JOIN coaches c
 ON (c.team_id = t.team_id)
 ORDER BY 1, 2;
 
 
 -- Query 5:
 -- This query finds the teams (their IDs) with their win/loss columns 
 -- having a longer win streak than the Cavaliers(a team_id of 6)
 SELECT team_id AS "Team Number", wins AS "Wins", losses AS "Losses"
 FROM rankings
 WHERE win_streak > 
                    (SELECT win_streak
                     FROM rankings
                     WHERE team_id = 6);
 
 
 -- Query 6:
 -- This query takes all players from players table and coaches from coaches table
 -- and puts them in one result set via the UNION set operator
 SELECT first_name AS "First Name", last_name AS "Last Name"
 FROM coaches
 UNION
 SELECT first_name, last_name 
 FROM players
 ORDER BY 2, 1;
 
 
 
 -- Query 7:
 -- This query will use the MONTHS_BETWEEN function on the SEASON START column in the
 -- RANKINGS table. It will find out how long the season is in months
 SELECT DISTINCT ROUND(MONTHS_BETWEEN('11-APR-18', season_start)) || ' months' AS "Months of NBA Season"
 FROM rankings;
 
 
 
 -- Query 8:
 -- This query will take the capacity of each stadium in the site table
 -- and put a comma after the thousands place using the TO_CHAR function
 SELECT stadium_name AS "Stadium", TO_CHAR(capacity, '99,999') AS "Capacity"
 FROM site
 ORDER BY 1;
 
 
 
 -- Query 9:
 -- This query uses the multiple value subquery operator "IN" to look at all the teams 
 -- and their rank and record with the lowest win streak (0 wins)
 SELECT t.team_name AS "Team", r.rankings AS "Rank", r.wins || '-' || r.losses AS "Record", r.win_streak AS "Win Streak"
 FROM team t JOIN rankings r
 ON(t.team_id = r.team_id)
 WHERE r.win_streak IN (SELECT MIN(win_streak)
                        FROM rankings)
ORDER BY 4 DESC;
 
 
 
 -- Query 10:
 -- This query uses a 'left outer join' between players and their respective teams
 -- they play for. If a player's team ID is NULL, that player is a free agent. 
SELECT p.first_name || ' ' || p.last_name AS "Player", t.team_id AS "Team ID"
FROM players p LEFT OUTER JOIN team t
ON t.team_id = p.TEAM_ID
ORDER BY 2;
