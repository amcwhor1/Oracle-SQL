SET PAGESIZE 22
SET LINESIZE 70
SET FEEDBACK OFF
SET PAUSE ON
TTITLE 'Coaches|Report'
BTITLE 'Public Information'
BREAK ON t.team_name SKIP 1
COL "Title" HEADING 'Coaching|Title' FORMAT A15
COL "Coach" HEADING 'Coach|Name' FORMAT A20
COL "Team" HEADING 'Team|Name' 
-- SQL statement
SELECT c.coach_title AS "Title", c.first_name || ' ' || c.last_name AS "Coach", t.team_name AS "Team"
FROM coaches c JOIN team t
ON c.team_id = t.team_id
ORDER BY 1, 3;
SET FEEDBACK ON
SET PAGESIZE 24
SET LINESIZE 80
SET PAUSE OFF
CLEAR COL
CLEAR BREAKS
TTITLE OFF
BTITLE OFF
