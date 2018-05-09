

--Alex McWhorter
-- 3/26/18

--drop tables
DROP TABLE players;
DROP TABLE team;
DROP TABLE site;
DROP SEQUENCE site_location_id;

--create site
CREATE TABLE site
(location_id NUMBER(3) CONSTRAINT site_location_id_nn NOT NULL,
address VARCHAR2(30),
city VARCHAR2(15),
state VARCHAR2(15),
stadium_name VARCHAR2(25),
capacity NUMBER(6),
CONSTRAINT site_location_id_pk PRIMARY KEY(location_id));

-- create team
CREATE TABLE team
(team_id NUMBER(5) CONSTRAINT team_team_id_nn NOT NULL,
team_name VARCHAR2(15),
team_mascot VARCHAR2(25),
location_id NUMBER (3),
CONSTRAINT team_team_id_pk PRIMARY KEY(team_id),
CONSTRAINT team_location_id_fk FOREIGN KEY (location_id)
    REFERENCES site(location_id));
    
-- create players table
CREATE TABLE players
(player_id NUMBER(5) CONSTRAINT players_player_id_nn NOT NULL,
first_name VARCHAR2(15),
last_name VARCHAR2(15),
position VARCHAR2(10),
team_id NUMBER(5),
CONSTRAINT players_player_id_pk PRIMARY KEY(player_id),
CONSTRAINT players_team_id_fk FOREIGN KEY(team_id)
    REFERENCES team(team_id));
    
    
    
-- sequence
CREATE SEQUENCE site_location_id START WITH 1 INCREMENT BY 1;



--- inserting into site table
INSERT INTO site VALUES
(SITE_LOCATION_ID.NEXTVAL, '1 Philips Dr', 'Atlanta', 'Georgia', 'Philips Arena', 21000);

INSERT INTO site VALUES
(SITE_LOCATION_ID.NEXTVAL, '1501 Dave Dixon Dr', 'New Orleans', 'Louisiana', 'Smoothie King Center', 18000);

INSERT INTO site VALUES
(SITE_LOCATION_ID.NEXTVAL, '7000 Coliseum Way', 'Oakland', 'California', 'Oracle Arena', 23000);

INSERT INTO site VALUES
(SITE_LOCATION_ID.NEXTVAL, '1111 S Figueroa St', 'Los Angeles', 'California', 'Staples Center', 21000);

INSERT INTO site VALUES
(SITE_LOCATION_ID.NEXTVAL, '4 Pennsylvania Plaza', 'New York City', 'New York', 'Madison Square Garden', 21000);

INSERT INTO site VALUES
(SITE_LOCATION_ID.NEXTVAL, 'Center Ct', 'Cleveland', 'Ohio', 'Quicken Loans Arena', 21000);

INSERT INTO site VALUES
(SITE_LOCATION_ID.NEXTVAL, '1 ATT Center Pkwy ', 'San Antonio', 'Texas', 'ATT Center', 19000);



--inserting into TEAM table
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



--insert into players table
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



COMMIT;
