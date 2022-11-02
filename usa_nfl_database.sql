CREATE DATABASE IF NOT EXISTS NFL_USA;
USE  NFL_USA;
# Create the Club table
CREATE TABLE IF NOT EXISTS Club (
Club_ID INT PRIMARY KEY NOT NULL,
Club_Name VARCHAR(250),
City VARCHAR(250),
State VARCHAR(250),
Head_Coach VARCHAR(250)
);
 # Create the Player table 
 CREATE TABLE IF NOT EXISTS Player (
Player_ID INT PRIMARY KEY NOT NULL,
Fname VARCHAR(250),
Lname VARCHAR(250),
Position VARCHAR(250),
Salary DECIMAL(4,2),
Club_ID INT,
FOREIGN KEY (Club_ID) 
REFERENCES Club(Club_ID)
);
# Add data into the Club table 
INSERT INTO Club (Club_ID, Club_Name, City, State, Head_Coach)
VALUES (99001, "Baltimore Ravens", "Baltimore", "MD", "John Harbaugh"),
   (99002, "Arizona Cardinals", "Glendale", "AZ", "Bruce Arians"),
       (99003, "Washington Redskins", "Landover", "MD", "Jay Gruden"),
       (99004, "Atlanta Falcons", "Atlanta", "GA", "Dan Quinn"),
       (99005, "Kansas City Chiefs", "Kansas City", "MO", "Andy Reid"),
       (99006, "Green Bay Packers", "Green Bay", "WI", "Mike McCarthy"),
       (99007, "Denver Broncos", "Denver", "CO", "Vance Joseph"),
       (99008, "New York Giants", "East Rutherford", "NJ", "Ben McAdoo"),
       (99009, "New England Patriots", "Foxborough", "MA", "Bill Belichick");
# Add data into the Player table 
INSERT INTO Player (Player_ID, Fname, Lname, Position, Salary, Club_ID)
VALUES (11001, "Joe", "Flacco", "quarterback", 24.55, 99001),
   (11002, "Tom", "Brady", "quarterback", 14.00, 99009),
       (11003, "Aaron", "Rodgers", "quarterback", 20.30, 99006),
       (11004, "Kirk", "Cousins", "quarterback", 23.94, 99003),
       (11005, "Matt", "Ryan", "quarterback", 23.75, 99004),
       (11006, "Justin", "Houston", "outside linebacker", 22.10, 99005),
       (11007, "Eli", "Manning", "quarterback", 19.70, 99008),
       (11008, "Von", "Miller", "outside linebacker", 19.90, 99007),
       (11009, "Carson", "Palmer", "quarterback", 24.12, 99002);
 
 #list all values in club table
use nfl_usa;
select * from club limit 3;

#list all names of clubs and coaches
select Club_Name, Head_Coach from club;

#list names of players & their teams
SELECT Fname, Lname, Club_Name # department.Dept_ID
FROM Player p
INNER JOIN Club c
	ON c.Club_ID = p.Club_ID;

#fname and lname who last name is "cousins"
select Fname, Lname
from Player
where Lname = "Cousins";

#list players who play "outside linebacker" position
select Fname, Lname, Position
from Player
where Position like "outside linebacker";

#name of player who make more than 5mil sort by desc
select Fname, Lname, Salary
from Player
where Salary > 5
order by Salary desc;

#fname and lname starts with "Rod"
select Player_ID, Fname, Lname
from Player
where Lname like "Rod%";

#find the position , of the avg salary of player is 21m
select Position, avg(Salary) as Avg_Salary
from Player
group by Position
having avg_Salary = 21;

#how many players play in each position? show column for num of player as Num_of_Players
select Position, count(Player_ID)  Num_of_Players
from Player
group by Position;

#which player has the lowest salary?
select Fname, Lname, Salary 
from Player
where salary=(select min(Salary) from Player);