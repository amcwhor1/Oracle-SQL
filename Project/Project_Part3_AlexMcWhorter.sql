
-- Alex McWhorter
-- 4/2/18




-- ***********DROP SECTION***********

-- create drop commands that are ran in reverse order of create statements
DROP TABLE rankings;
DROP TABLE coaches;
DROP TABLE players;
DROP TABLE team;
DROP TABLE site;


-- ***********CREATE SECTION***********


--create site table
CREATE TABLE site
(location_id NUMBER(3),
address VARCHAR2(30),
city VARCHAR2(15),
state VARCHAR2(15),
stadium_name VARCHAR2(30),
capacity NUMBER(6),
CONSTRAINT site_location_id_pk PRIMARY KEY(location_id));



-- create team table
CREATE TABLE team
(team_id NUMBER(5),
team_name VARCHAR2(15),
team_mascot VARCHAR2(25),
location_id NUMBER (3),
CONSTRAINT team_team_id_pk PRIMARY KEY(team_id),
CONSTRAINT team_location_id_fk FOREIGN KEY (location_id)
    REFERENCES site(location_id));
    
    
  
-- create players table 
CREATE TABLE players
(player_id NUMBER(5),
first_name VARCHAR2(15),
last_name VARCHAR2(15),
position VARCHAR2(10),
team_id NUMBER(5),
CONSTRAINT players_player_id_pk PRIMARY KEY(player_id),
CONSTRAINT players_team_id_fk FOREIGN KEY(team_id)
    REFERENCES team(team_id));



-- create coaches table
CREATE TABLE coaches
(coach_id NUMBER(5),
first_name VARCHAR2(15),
last_name VARCHAR2(15),
coach_title VARCHAR2(10),
team_id NUMBER(5),
CONSTRAINT coaches_coach_id_pk PRIMARY KEY(coach_id),
CONSTRAINT coaches_team_id_fk FOREIGN KEY(team_id)
    REFERENCES team(team_id));
 
 
 
 -- create rankings table       
CREATE TABLE rankings
(team_id NUMBER(5),
season VARCHAR2(10),
rankings NUMBER(2),
wins NUMBER(3),
losses NUMBER(3),
win_streak NUMBER(3),
CONSTRAINT rankings_team_id_pk PRIMARY KEY(team_id),
CONSTRAINT rankings_team_id_fk FOREIGN KEY(team_id)
    REFERENCES team(team_id)); 




-- ***********INSERT VALUES SECTION***********


--- inserting values into site table
INSERT INTO site VALUES
(1, '1 Philips Dr', 'Atlanta', 'Georgia', 'Philips Arena', 21000);

INSERT INTO site VALUES
(2, '1501 Dave Dixon Dr', 'New Orleans', 'Louisiana', 'Smoothie King Center', 18000);

INSERT INTO site VALUES
(3, '7000 Coliseum Way', 'Oakland', 'California', 'Oracle Arena', 23000);

INSERT INTO site VALUES
(4, '1111 S Figueroa St', 'Los Angeles', 'California', 'Staples Center', 21000);

INSERT INTO site VALUES
(5, '4 Pennsylvania Plaza', 'New York City', 'New York', 'Madison Square Garden', 21000);

INSERT INTO site VALUES
(6, 'Center Ct', 'Cleveland', 'Ohio', 'Quicken Loans Arena', 21000);

INSERT INTO site VALUES
(7, '1 ATT Center Pkwy ', 'San Antonio', 'Texas', 'ATT Center', 19000);





--inserting values into TEAM table
INSERT INTO team VALUES
(1, 'Hawks', 'Harry the Hawk', 1);

INSERT INTO team VALUES
(2, 'Pelicans', 'Pierre the Pelican', 2);

INSERT INTO team VALUES
(3, 'Warriors', 'Thunder', 3);

INSERT INTO team VALUES
(4, 'Lakers', null, 4);

INSERT INTO team VALUES
(5, 'Knicks', null, 5);

INSERT INTO team VALUES
(6, 'Cavavliers', 'Moondog', 6);

INSERT INTO team VALUES
(7, 'Spurs', 'The Coyote', 7);






--inserting values into players table
INSERT INTO players VALUES
(1, 'Lonzo', 'Ball', 'pg', 4 );

INSERT INTO players VALUES
(2, 'Kristops', 'Porzingis', 'pf', 5 );

INSERT INTO players VALUES
(3, 'Steph', 'Curry', 'pg', 3 );

INSERT INTO players VALUES
(4, 'Lebron', 'James', 'sf', 6 );

INSERT INTO players VALUES
(5, 'Dennis', 'Schruder', 'pg', 1 );

INSERT INTO players VALUES
(6, 'Anthony', 'Davis', 'c', 2 );

INSERT INTO players VALUES
(7, 'Kawhi', 'Leonard', 'sf', 7 );





-- inserting values into coaches table
INSERT INTO coaches VALUES
(1, 'Steve', 'Kerr', 'head', 3);

INSERT INTO coaches VALUES
(2, 'Greg', 'Popovich', 'head', 7);

INSERT INTO coaches VALUES
(3, 'Luke', 'Walton', 'head', 4);

INSERT INTO coaches VALUES
(4, 'Tyrone', 'Lue', 'head', 6);

INSERT INTO coaches VALUES
(5, 'Mark', 'Madsen', 'assistant', 4);

INSERT INTO coaches VALUES
(6, 'Mike', 'Brown', 'assistant', 3);

INSERT INTO coaches VALUES
(7, 'John', 'Havilcek', 'head', 5);

INSERT INTO coaches VALUES
(8, 'Mike', 'Budenholzer', 'head', 1);

INSERT INTO coaches VALUES
(9, 'Alvin', 'Gentry', 'head', 2);




-- inserting values into the rankings table
INSERT INTO rankings VALUES
(1, '17-18', 2, 70, 12, 13);

INSERT INTO rankings VALUES
(2, '17-18', 4, 41, 41, 2);

INSERT INTO rankings VALUES
(3, '17-18', 1, 71, 11, 6);

INSERT INTO rankings VALUES
(4, '17-18', 7, 27, 55, 0);

INSERT INTO rankings VALUES
(5, '17-18', 3, 55, 27, 1);

INSERT INTO rankings VALUES
(6, '17-18', 5, 38, 44, 3);

INSERT INTO rankings VALUES
(7, '17-18', 6, 35, 47, 0);



-- to commit the above changes to be permanent, commit line is needed
COMMIT; 

