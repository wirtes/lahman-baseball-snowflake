
/* DROP TABLES */
DROP TABLE IF EXISTS seriespost;
DROP TABLE IF EXISTS salaries;
DROP TABLE IF EXISTS pitchingpost;
DROP TABLE IF EXISTS pitching;
DROP TABLE IF EXISTS managershalf;
DROP TABLE IF EXISTS managers;
DROP TABLE IF EXISTS homegames;
DROP TABLE IF EXISTS parks;
DROP TABLE IF EXISTS halloffame;
DROP TABLE IF EXISTS fieldingpost;
DROP TABLE IF EXISTS fieldingofsplit;
DROP TABLE IF EXISTS fieldingof;
DROP TABLE IF EXISTS fielding;
DROP TABLE IF EXISTS collegeplaying;
DROP TABLE IF EXISTS schools;
DROP TABLE IF EXISTS battingpost;
DROP TABLE IF EXISTS batting;
DROP TABLE IF EXISTS awardsshareplayers;
DROP TABLE IF EXISTS awardssharemanagers;
DROP TABLE IF EXISTS awardsplayers;
DROP TABLE IF EXISTS awardsmanagers;
DROP TABLE IF EXISTS appearances;
DROP TABLE IF EXISTS allstarfull;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS teamshalf;
DROP TABLE IF EXISTS teams;
DROP TABLE IF EXISTS teamsfranchises;
DROP TABLE IF EXISTS divisions;
DROP TABLE IF EXISTS leagues;



/* TABLES ADDED BY WEBUCATOR */

CREATE TABLE leagues (
  lgID char(2) NOT NULL,
  league varchar(50) NOT NULL,
  active char NOT NULL,
  PRIMARY KEY (lgID)
);


CREATE TABLE divisions (
  ID INT NOT NULL AUTOINCREMENT,
  divID char(2) NOT NULL,
  lgID char(2) NOT NULL,
  division varchar(50) NOT NULL,
  active char NOT NULL,
  PRIMARY KEY (ID)
);


/* LAHMAN TABLES */

CREATE TABLE teamsfranchises (
  franchID varchar(3) NOT NULL,
  franchName varchar(50) DEFAULT NULL,
  active char DEFAULT NULL,
  NAassoc varchar(3) DEFAULT NULL,
  PRIMARY KEY (franchID)
);


CREATE TABLE teams (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  yearID smallint NOT NULL,
  lgID char(2) DEFAULT NULL,
  teamID char(3) NOT NULL,
  franchID varchar(3) DEFAULT NULL,
  divID char(1) DEFAULT NULL,
  div_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO divisions TABLE*/
  teamRank smallint DEFAULT NULL,
  G smallint DEFAULT NULL,
  Ghome smallint DEFAULT NULL,
  W smallint DEFAULT NULL,
  L smallint DEFAULT NULL,
  DivWin varchar(1) DEFAULT NULL,
  WCWin varchar(1) DEFAULT NULL,
  LgWin varchar(1) DEFAULT NULL,
  WSWin varchar(1) DEFAULT NULL,
  R smallint DEFAULT NULL,
  AB smallint DEFAULT NULL,
  H smallint DEFAULT NULL,
  TwoB smallint DEFAULT NULL,
  ThreeB smallint DEFAULT NULL,
  HR smallint DEFAULT NULL,
  BB smallint DEFAULT NULL,
  SO smallint DEFAULT NULL,
  SB smallint DEFAULT NULL,
  CS smallint DEFAULT NULL,
  HBP smallint DEFAULT NULL,
  SF smallint DEFAULT NULL,
  RA smallint DEFAULT NULL,
  ER smallint DEFAULT NULL,
  ERA double DEFAULT NULL,
  CG smallint DEFAULT NULL,
  SHO smallint DEFAULT NULL,
  SV smallint DEFAULT NULL,
  IPouts int DEFAULT NULL,
  HA smallint DEFAULT NULL,
  HRA smallint DEFAULT NULL,
  BBA smallint DEFAULT NULL,
  SOA smallint DEFAULT NULL,
  E int DEFAULT NULL,
  DP int DEFAULT NULL,
  FP double DEFAULT NULL,
  name varchar(50) DEFAULT NULL,
  park varchar(255) DEFAULT NULL,
  attendance int DEFAULT NULL,
  BPF int DEFAULT NULL,
  PPF int DEFAULT NULL,
  teamIDBR varchar(3) DEFAULT NULL,
  teamIDlahman45 varchar(3) DEFAULT NULL,
  teamIDretro varchar(3) DEFAULT NULL,
  PRIMARY KEY (ID)
) ;


CREATE TABLE teamshalf (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  yearID smallint NOT NULL,
  lgID char(2) NOT NULL,
  teamID char(3) NOT NULL,
  team_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO teams TABLE*/
  Half varchar(1) NOT NULL,
  divID char(1) DEFAULT NULL,
  div_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO divisions TABLE*/
  DivWin varchar(1) DEFAULT NULL,
  teamRank smallint DEFAULT NULL,
  G smallint DEFAULT NULL,
  W smallint DEFAULT NULL,
  L smallint DEFAULT NULL,
  PRIMARY KEY (ID)
) ;


CREATE TABLE people (
  playerID varchar(9) NOT NULL,
  birthYear int DEFAULT NULL,
  birthMonth int DEFAULT NULL,
  birthDay int DEFAULT NULL,
  birthCountry varchar(255) DEFAULT NULL,
  birthState varchar(255) DEFAULT NULL,
  birthCity varchar(255) DEFAULT NULL,
  deathYear int DEFAULT NULL,
  deathMonth int DEFAULT NULL,
  deathDay int DEFAULT NULL,
  deathCountry varchar(255) DEFAULT NULL,
  deathState varchar(255) DEFAULT NULL,
  deathCity varchar(255) DEFAULT NULL,
  nameFirst varchar(255) DEFAULT NULL,
  nameLast varchar(255) DEFAULT NULL,
  nameGiven varchar(255) DEFAULT NULL,
  weight int DEFAULT NULL,
  height int DEFAULT NULL,
  bats varchar(255) DEFAULT NULL,
  throws varchar(255) DEFAULT NULL,
  debut varchar(255) DEFAULT NULL,
  finalGame varchar(255) DEFAULT NULL,
  retroID varchar(255) DEFAULT NULL,
  bbrefID varchar(255) DEFAULT NULL,
  birth_date date DEFAULT NULL,
  debut_date date DEFAULT NULL,
  finalgame_date date DEFAULT NULL,
  death_date date DEFAULT NULL,
  PRIMARY KEY (playerID)
) ;


CREATE TABLE allstarfull (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  playerID varchar(9) NOT NULL,
  yearID smallint, /*WEBUCATOR NOTE: Allowing NULL values because ['bailean01', None, None, None, 'OAK', 1512, 'AL', 0, None] has no yearID */
  gameNum smallint NOT NULL,
  gameID varchar(12) DEFAULT NULL,
  teamID char(3) DEFAULT NULL,
  team_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO teams TABLE*/
  lgID char(2) DEFAULT NULL,
  GP smallint DEFAULT NULL,
  startingPos smallint DEFAULT NULL,
  PRIMARY KEY (ID)
) ;


CREATE TABLE appearances (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  yearID smallint NOT NULL,
  teamID char(3) NOT NULL,
  team_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO teams TABLE*/
  lgID char(2) DEFAULT NULL,
  playerID varchar(9) NOT NULL,
  G_all smallint DEFAULT NULL,
  GS smallint DEFAULT NULL,
  G_batting smallint DEFAULT NULL,
  G_defense smallint DEFAULT NULL,
  G_p smallint DEFAULT NULL,
  G_c smallint DEFAULT NULL,
  G_1b smallint DEFAULT NULL,
  G_TwoB smallint DEFAULT NULL,
  G_ThreeB smallint DEFAULT NULL,
  G_ss smallint DEFAULT NULL,
  G_lf smallint DEFAULT NULL,
  G_cf smallint DEFAULT NULL,
  G_rf smallint DEFAULT NULL,
  G_of smallint DEFAULT NULL,
  G_dh smallint DEFAULT NULL,
  G_ph smallint DEFAULT NULL,
  G_pr smallint DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE awardsmanagers (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  playerID varchar(10) NOT NULL,
  awardID varchar(75) NOT NULL, /* WEBUCATOR ASKS: Where does this come from? */
  yearID smallint NOT NULL,
  lgID char(2) NOT NULL,
  tie varchar(1) DEFAULT NULL,
  notes varchar(100) DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE awardsplayers (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  playerID varchar(9) NOT NULL,
  awardID varchar(255) NOT NULL,
  yearID smallint NOT NULL,
  lgID char(2), /* WEBUCATOR NOTE: Allowing NULL values because ['cruzne02', 'Outstanding DH Award', 2017, None, None, None] has no lgID */
  tie varchar(1) DEFAULT NULL,
  notes varchar(100) DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE awardssharemanagers (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  awardID varchar(25) NOT NULL,
  yearID smallint NOT NULL,
  lgID char(2) NOT NULL,
  playerID varchar(10) NOT NULL,
  pointsWon smallint DEFAULT NULL,
  pointsMax smallint DEFAULT NULL,
  votesFirst smallint DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE awardsshareplayers (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  awardID varchar(25) NOT NULL,
  yearID smallint NOT NULL,
  lgID char(2) NOT NULL,
  playerID varchar(9) NOT NULL,
  pointsWon double DEFAULT NULL,
  pointsMax smallint DEFAULT NULL,
  votesFirst double DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE batting (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  playerID varchar(9) NOT NULL,
  yearID smallint NOT NULL,
  stint smallint NOT NULL,
  teamID char(3) DEFAULT NULL,
  team_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO teams TABLE*/
  lgID char(2) DEFAULT NULL,
  G smallint DEFAULT NULL,
  G_batting smallint DEFAULT NULL,
  AB smallint DEFAULT NULL,
  R smallint DEFAULT NULL,
  H smallint DEFAULT NULL,
  TwoB smallint DEFAULT NULL,
  ThreeB smallint DEFAULT NULL,
  HR smallint DEFAULT NULL,
  RBI smallint DEFAULT NULL,
  SB smallint DEFAULT NULL,
  CS smallint DEFAULT NULL,
  BB smallint DEFAULT NULL,
  SO smallint DEFAULT NULL,
  IBB smallint DEFAULT NULL,
  HBP smallint DEFAULT NULL,
  SH smallint DEFAULT NULL,
  SF smallint DEFAULT NULL,
  GIDP smallint DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE battingpost (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  yearID smallint NOT NULL,
  round varchar(10) NOT NULL,
  playerID varchar(9) NOT NULL,
  teamID char(3) DEFAULT NULL,
  team_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO teams TABLE*/
  lgID char(2) DEFAULT NULL,
  G smallint DEFAULT NULL,
  AB smallint DEFAULT NULL,
  R smallint DEFAULT NULL,
  H smallint DEFAULT NULL,
  TwoB smallint DEFAULT NULL,
  ThreeB smallint DEFAULT NULL,
  HR smallint DEFAULT NULL,
  RBI smallint DEFAULT NULL,
  SB smallint DEFAULT NULL,
  CS smallint DEFAULT NULL,
  BB smallint DEFAULT NULL,
  SO smallint DEFAULT NULL,
  IBB smallint DEFAULT NULL,
  HBP smallint DEFAULT NULL,
  SH smallint DEFAULT NULL,
  SF smallint DEFAULT NULL,
  GIDP smallint DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE schools (
  schoolID varchar(15) NOT NULL,
  name_full varchar(255) DEFAULT NULL,
  city varchar(55) DEFAULT NULL,
  state varchar(55) DEFAULT NULL,
  country varchar(55) DEFAULT NULL,
  PRIMARY KEY (schoolID)
);


CREATE TABLE collegeplaying (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  playerID varchar(9) NOT NULL,
  schoolID varchar(15) DEFAULT NULL,
  yearID smallint DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE fielding (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  playerID varchar(9) NOT NULL,
  yearID smallint NOT NULL,
  stint smallint NOT NULL,
  teamID char(3) DEFAULT NULL,
  team_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO teams TABLE*/
  lgID char(2) DEFAULT NULL,
  POS varchar(2) NOT NULL,
  G smallint DEFAULT NULL,
  GS smallint DEFAULT NULL,
  InnOuts smallint DEFAULT NULL,
  PO smallint DEFAULT NULL,
  A smallint DEFAULT NULL,
  E smallint DEFAULT NULL,
  DP smallint DEFAULT NULL,
  PB smallint DEFAULT NULL,
  WP smallint DEFAULT NULL,
  SB smallint DEFAULT NULL,
  CS smallint DEFAULT NULL,
  ZR double DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE fieldingof (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  playerID varchar(9) NOT NULL,
  yearID smallint NOT NULL,
  stint smallint NOT NULL,
  Glf smallint DEFAULT NULL,
  Gcf smallint DEFAULT NULL,
  Grf smallint DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE fieldingofsplit (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  playerID varchar(9) NOT NULL,
  yearID smallint NOT NULL,
  stint smallint NOT NULL,
  teamID char(3) DEFAULT NULL,
  team_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO teams TABLE*/
  lgID char(2) DEFAULT NULL,
  POS varchar(2) NOT NULL,
  G smallint DEFAULT NULL,
  GS smallint DEFAULT NULL,
  InnOuts smallint DEFAULT NULL,
  PO smallint DEFAULT NULL,
  A smallint DEFAULT NULL,
  E smallint DEFAULT NULL,
  DP smallint DEFAULT NULL,
  PB smallint DEFAULT NULL,
  WP smallint DEFAULT NULL,
  SB smallint DEFAULT NULL,
  CS smallint DEFAULT NULL,
  ZR double DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE fieldingpost (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  playerID varchar(9) NOT NULL,
  yearID smallint NOT NULL,
  teamID char(3) DEFAULT NULL,
  team_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO teams TABLE*/
  lgID char(2) DEFAULT NULL,
  round varchar(10) NOT NULL,
  POS varchar(2) NOT NULL,
  G smallint DEFAULT NULL,
  GS smallint DEFAULT NULL,
  InnOuts smallint DEFAULT NULL,
  PO smallint DEFAULT NULL,
  A smallint DEFAULT NULL,
  E smallint DEFAULT NULL,
  DP smallint DEFAULT NULL,
  TP smallint DEFAULT NULL,
  PB smallint DEFAULT NULL,
  SB smallint DEFAULT NULL,
  CS smallint DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE halloffame (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  playerID varchar(10) NOT NULL,
  yearid smallint NOT NULL,
  votedBy varchar(64) NOT NULL,
  ballots smallint DEFAULT NULL,
  needed smallint DEFAULT NULL,
  votes smallint DEFAULT NULL,
  inducted varchar(1) DEFAULT NULL,
  category varchar(20) DEFAULT NULL,
  needed_note varchar(25) DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE parks (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  parkalias varchar(255) DEFAULT NULL,
  parkkey varchar(255) DEFAULT NULL,
  parkname varchar(255) DEFAULT NULL,
  city varchar(255) DEFAULT NULL,
  state varchar(255) DEFAULT NULL,
  country varchar(255) DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE homegames (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  yearkey int DEFAULT NULL,
  leaguekey char(2) DEFAULT NULL,
  teamkey char(3) DEFAULT NULL,
  team_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO teams TABLE*/
  parkkey varchar(255) DEFAULT NULL,
  park_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO parks TABLE*/
  spanfirst varchar(255) DEFAULT NULL,
  spanlast varchar(255) DEFAULT NULL,
  games int DEFAULT NULL,
  openings int DEFAULT NULL,
  attendance int DEFAULT NULL,
  spanfirst_date date DEFAULT NULL,
  spanlast_date date DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE managers (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  playerID varchar(10) DEFAULT NULL,
  yearID smallint NOT NULL,
  teamID char(3) NOT NULL,
  team_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO teams TABLE*/
  lgID char(2) DEFAULT NULL,
  inseason smallint NOT NULL,
  G smallint DEFAULT NULL,
  W smallint DEFAULT NULL,
  L smallint DEFAULT NULL,
  teamRank smallint DEFAULT NULL,
  plyrMgr varchar(1) DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE managershalf (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  playerID varchar(10) NOT NULL,
  yearID smallint NOT NULL,
  teamID char(3) NOT NULL,
  team_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO teams TABLE*/
  lgID char(2) DEFAULT NULL,
  inseason smallint DEFAULT NULL,
  half smallint NOT NULL,
  G smallint DEFAULT NULL,
  W smallint DEFAULT NULL,
  L smallint DEFAULT NULL,
  teamRank smallint DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE pitching (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  playerID varchar(9) NOT NULL,
  yearID smallint NOT NULL,
  stint smallint NOT NULL,
  teamID char(3) DEFAULT NULL,
  team_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO teams TABLE*/
  lgID char(2) DEFAULT NULL,
  W smallint DEFAULT NULL,
  L smallint DEFAULT NULL,
  G smallint DEFAULT NULL,
  GS smallint DEFAULT NULL,
  CG smallint DEFAULT NULL,
  SHO smallint DEFAULT NULL,
  SV smallint DEFAULT NULL,
  IPouts int DEFAULT NULL,
  H smallint DEFAULT NULL,
  ER smallint DEFAULT NULL,
  HR smallint DEFAULT NULL,
  BB smallint DEFAULT NULL,
  SO smallint DEFAULT NULL,
  BAOpp double DEFAULT NULL,
  ERA double DEFAULT NULL,
  IBB smallint DEFAULT NULL,
  WP smallint DEFAULT NULL,
  HBP smallint DEFAULT NULL,
  BK smallint DEFAULT NULL,
  BFP smallint DEFAULT NULL,
  GF smallint DEFAULT NULL,
  R smallint DEFAULT NULL,
  SH smallint DEFAULT NULL,
  SF smallint DEFAULT NULL,
  GIDP smallint DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE pitchingpost (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  playerID varchar(9) NOT NULL,
  yearID smallint NOT NULL,
  round varchar(10) NOT NULL,
  teamID char(3) DEFAULT NULL,
  team_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO teams TABLE*/
  lgID char(2) DEFAULT NULL,
  W smallint DEFAULT NULL,
  L smallint DEFAULT NULL,
  G smallint DEFAULT NULL,
  GS smallint DEFAULT NULL,
  CG smallint DEFAULT NULL,
  SHO smallint DEFAULT NULL,
  SV smallint DEFAULT NULL,
  IPouts int DEFAULT NULL,
  H smallint DEFAULT NULL,
  ER smallint DEFAULT NULL,
  HR smallint DEFAULT NULL,
  BB smallint DEFAULT NULL,
  SO smallint DEFAULT NULL,
  BAOpp double DEFAULT NULL,
  ERA double DEFAULT NULL,
  IBB smallint DEFAULT NULL,
  WP smallint DEFAULT NULL,
  HBP smallint DEFAULT NULL,
  BK smallint DEFAULT NULL,
  BFP smallint DEFAULT NULL,
  GF smallint DEFAULT NULL,
  R smallint DEFAULT NULL,
  SH smallint DEFAULT NULL,
  SF smallint DEFAULT NULL,
  GIDP smallint DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE salaries (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  yearID smallint NOT NULL,
  teamID char(3) NOT NULL,
  team_ID INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO teams TABLE*/
  lgID char(2) NOT NULL,
  playerID varchar(9) NOT NULL,
  salary double DEFAULT NULL,
  PRIMARY KEY (ID)
);


CREATE TABLE seriespost (
  ID INT NOT NULL AUTOINCREMENT, /* ADDED BY WEBUCATOR */
  yearID smallint NOT NULL,
  round varchar(5) NOT NULL,
  teamIDwinner varchar(3) DEFAULT NULL,
  lgIDwinner varchar(2) DEFAULT NULL,
  team_IDwinner INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO teams TABLE*/
  teamIDloser varchar(3) DEFAULT NULL,
  team_IDloser INT DEFAULT NULL, /* ADDED BY WEBUCATOR AS FK TO teams TABLE*/
  lgIDloser varchar(2) DEFAULT NULL,
  wins smallint DEFAULT NULL,
  losses smallint DEFAULT NULL,
  ties smallint DEFAULT NULL,
  PRIMARY KEY (ID)
);
