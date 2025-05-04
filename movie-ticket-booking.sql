Create database Movie_Booking;

create table [User] (
Name varchar(30) not NULL,
Login_id numeric,
Password varchar(15),
Email varchar(30),
Phone_no numeric,
Gender char,
Age numeric,
Ticket_no numeric,
constraint pk_User primary key(Login_id)
);
INSERT into [User](Name,Login_id,Password,Email,Phone_no,Gender,Age,Ticket_no) values('Mannie',1,"abc123",'mannie@gmail.com',9876543210,'F',19,201);
INSERT into [User](Name,Login_id,Password,Email,Phone_no,Gender,Age,Ticket_no) values('Shreesha',2,"def456",'shreesha@gmail.com',0123456789,'M',19,202);
INSERT into [User](Name,Login_id,Password,Email,Phone_no,Gender,Age,Ticket_no) values('Mahir',3,"hello987",'mahir@gmail.com',8763425608,'M',22,203);
INSERT into [User](Name,Login_id,Password,Email,Phone_no,Gender,Age,Ticket_no) values('Virat',4,"hi987",'virat@gmail.com',9871239747,'M',29,204);
INSERT into [User](Name,Login_id,Password,Email,Phone_no,Gender,Age,Ticket_no) values('Levin',5,"xyz123",'levin@gmail.com',8357290966,'M',47,205);
INSERT into [User](Name,Login_id,Password,Email,Phone_no,Gender,Age,Ticket_no) values('Vasurva',6,"kkr143",'vasurva@gmail.com',9863638211,'M',36,206);
INSERT into [User](Name,Login_id,Password,Email,Phone_no,Gender,Age,Ticket_no) values('Aaditya',7,"123pqr",'aaditya@gmail.com',9820963210,'M',65,207);
INSERT into [User](Name,Login_id,Password,Email,Phone_no,Gender,Age,Ticket_no) values('Yash ',8,"a03a",'yash@gmail.com',9098763210,'M',19,208);
INSERT into [User](Name,Login_id,Password,Email,Phone_no,Gender,Age,Ticket_no) values('Vaishnavi A',9,"qwert87",'vaishnavi@gmail.com',1234509876,'F',32,209);
INSERT into [User](Name,Login_id,Password,Email,Phone_no,Gender,Age,Ticket_no) values('Lokendra ',10,"lpr123",'lokendra@gmail.com',9877073518,'M',52,210);
select*from [User];


create table Login (
Login_id numeric,
username  varchar(30) Not Null,
password varchar(15),
constraint fk_Login foreign key(Login_id) references [User](Login_id)
);
INSERT into Login(Login_id, username,password) values (1,"me_mannie","abc123");
INSERT into Login(Login_id, username,password) values (2,"me_shreesha","def456");
INSERT into Login(Login_id, username,password) values (3,"me_mahir","hello987");
INSERT into Login(Login_id, username,password) values (4,"me_virat","hi987");
INSERT into Login(Login_id, username,password) values (5,"me_levin","xyz12");
INSERT into Login(Login_id, username,password) values (6,"me_vasurva","kkr143");
INSERT into Login(Login_id, username,password) values (7,"me_aaditya","123pqr");
INSERT into Login(Login_id, username,password) values (8,"me_yash","a03a");
INSERT into Login(Login_id, username,password) values (9,"me_vaishnavi","qwert87");
INSERT into Login(Login_id, username,password) values (10,"me_lokendra","lpr123");
select*from Login;


create table Payment (
Login_id numeric,
Payment_Type  varchar(15) Not Null,
Amount numeric,
constraint fk_Payment foreign key(Login_id) references [User](Login_id)
);
INSERT into Payment(Login_id,Payment_Type,Amount) values (1, "Credit Card", 350);
INSERT into Payment(Login_id,Payment_Type,Amount) values (2, "Net Banking", 700);
INSERT into Payment(Login_id,Payment_Type,Amount) values (3, "UPI", 1400);
INSERT into Payment(Login_id,Payment_Type,Amount) values (4, "Credit Card", 1050);
INSERT into Payment(Login_id,Payment_Type,Amount) values (5, "Credit Card", 350);
INSERT into Payment(Login_id,Payment_Type,Amount) values (6, "UPI", 350);
INSERT into Payment(Login_id,Payment_Type,Amount) values (7, "UPI", 1400);
INSERT into Payment(Login_id,Payment_Type,Amount) values (8, "Credit Card", 700);
INSERT into Payment(Login_id,Payment_Type,Amount) values (9, "Debit Card", 350);
INSERT into Payment(Login_id,Payment_Type,Amount) values (10, "Net Banking", 1050);
select*from Payment;


create table Booking (
Login_id numeric,
No_of_Tickets numeric,
Price numeric,
Booking_id varchar(10),
Booking_Date date,
constraint fk_Booking foreign key(Login_id) references [User](Login_id)
);
INSERT into Booking(Login_id,No_of_Tickets,Price,Booking_id,Booking_Date) values(1,1,350,"#1234","2024-03-26");
INSERT into Booking(Login_id,No_of_Tickets,Price,Booking_id,Booking_Date) values(2,2,700,"#5678","2024-03-21");
INSERT into Booking(Login_id,No_of_Tickets,Price,Booking_id,Booking_Date) values(3,4,1400,"#3746","2024-02-26");
INSERT into Booking(Login_id,No_of_Tickets,Price,Booking_id,Booking_Date) values(4,3,1050,"#2937","2024-03-30");
INSERT into Booking(Login_id,No_of_Tickets,Price,Booking_id,Booking_Date) values(5,1,350,"#9736","2024-03-31");
INSERT into Booking(Login_id,No_of_Tickets,Price,Booking_id,Booking_Date) values(6,1,350,"#0924","2024-03-5");
INSERT into Booking(Login_id,No_of_Tickets,Price,Booking_id,Booking_Date) values(7,4,1400,"#1952","2024-03-27");
INSERT into Booking(Login_id,No_of_Tickets,Price,Booking_id,Booking_Date) values(8,2,700,"#0176","2024-03-16");
INSERT into Booking(Login_id,No_of_Tickets,Price,Booking_id,Booking_Date) values(9,1,350,"#1298","2024-03-8");
INSERT into Booking(Login_id,No_of_Tickets,Price,Booking_id,Booking_Date) values(10,3,1050,"#1271","2024-03-19");
select*from Booking;


create table Movie (
Movie_id numeric,
Movie_Name varchar(50),
Genre varchar(15),
Language varchar(15),
Movie_Rating decimal(10,1),
constraint pk_Movie primary key(Movie_id)
);
INSERT into Movie(Movie_id,Movie_Name,Genre,Language,Movie_Rating) 
values(16, 'Dangal', 'Biography', 'Hindi',4.2),
      (17, 'Baahubali: The Beginning', 'Action', 'Telugu',4),
	  (18, '3 Idiots', 'Comedy', 'Hindi',4.8),
      (19, 'Drishyam', 'Thriller', 'Malayalam',4.8),
      (20, 'PK', 'Comedy-Drama', 'Hindi',4.6),
      (21, 'Kabir Singh', 'Romance', 'Hindi',3.7),
      (22, 'Rang De Basanti', 'Drama', 'Hindi',3.2),
      (23, 'Queen', 'Drama-Comedy', 'Hindi',3.5),
      (24, 'Ustad Hotel', 'Drama', 'Malayalam',2.8),
      (25, 'Gully Boy', 'Drama', 'Hindi',3.0);
select*from Movie;


create table Movie_Show(
Movie_id numeric,
Show_id numeric,
Show_Date Date,
Show_Time time,
Screen numeric,
constraint fk_Show foreign key(Movie_id) references Movie(Movie_id)
);
INSERT INTO Movie_Show (Movie_id, Show_id, Show_Date, Show_Time,Screen)
VALUES
    (16, 1, '2024-03-27', '15:00',3),
    (17, 2, '2024-03-28', '18:30',6),
    (18, 3, '2024-03-29', '21:00',5),
    (19, 4, '2024-03-27', '17:30',4),
    (20, 5, '2024-03-28', '20:00',3),
    (21, 6, '2024-03-29', '13:00',4),
    (22, 7, '2024-03-27', '16:30',2),
    (23, 8, '2024-03-28', '19:45',5),
    (24, 9, '2024-03-29', '22:15',3),
    (25, 10, '2024-03-27', '14:00',4);
select*from Movie_Show;


create table Theater (
Theatre_id numeric,
Theatre_Name varchar(50),
Location varchar(15),
Screen numeric,
constraint pk_Theater primary key(Theatre_id)
);
INSERT INTO Theater (Theatre_id, Theatre_Name, Location, Screen)
VALUES
    (101, 'Regal Cinemas', 'Colaba', 3),
    (102, 'PVR Cinemas', 'Andheri', 6),
    (103, 'INOX Cinemas', 'Bandra', 5),
    (104, 'Cinepolis', 'Malad', 4),
    (105, 'Miraj Cinemas', 'Chembur', 3),
    (106, 'Carnival Cinemas', 'Borivali', 4),
    (107, 'Metro Cinema', 'Marine Lines', 2),
    (108, 'MAX Cinemas', 'Goregaon', 5),
    (109, 'Movietime Cinemas', 'Kandivali', 3),
    (110, 'Fame Cinemas', 'Vashi', 4);
select*from Theater;


create table Seat (
Seat_id numeric,
Seat_Type varchar(50),
Row_no  varchar(5),
constraint pk_Seat primary key(Seat_id)
);
INSERT INTO Seat (Seat_id, Seat_Type, Row_no)
VALUES
    (1, 'Standard', "J"),
    (2, 'Standard', "I"),
    (3, 'Standard', "H"),
    (4, 'Standard', "G"),
    (5, 'VIP', "D"),
    (6, 'VIP', "E"),
    (7, 'VIP', "F"),
    (8, 'Premium', "A"),
    (9, 'Premium', "B"),
    (10, 'Premium', "C");
select*from Seat;


create table Manager(
Theatre_id numeric,
M_Name varchar(20),
M_Gender char,
M_Age numeric,
constraint fk_Manager foreign key(Theatre_id) references Theater(Theatre_id)
);
INSERT INTO Manager (Theatre_id, M_Name, M_Gender, M_Age)
VALUES
    (101, 'Priya Sharma', 'F', 32),
    (102,'Rahul Desai', 'M', 29),
    (103,'Anjali Patel', 'F', 35),
    (104,'Amit Kumar', 'M', 40),
    (105, 'Neha Gupta', 'F', 28),
    (106,'Rajesh Singh', 'M', 45),
    (107,'Pooja Joshi', 'F', 33),
    (108,'Vikram Sharma', 'M', 38),
    (109,'Sunita Reddy', 'F', 30),
    (110,'Alok Verma', 'M', 42);
select*from Manager;

CREATE INDEX idx_show_time_date ON Movie_Show (Show_Time, Show_Date);

CREATE TABLE ticket (
    Movie_id numeric,
    Ticket_no numeric,
    Seat_id numeric,
    Show_Time time,
    Show_Date date,
    Price DECIMAL(10, 2),
    Screen VARCHAR(50),
    Movie_Name VARCHAR(100),
    FOREIGN KEY (Movie_id) REFERENCES Movie(Movie_id),
    FOREIGN KEY (Seat_id) REFERENCES Seat(Seat_id),
    FOREIGN KEY (Show_Time, Show_Date) REFERENCES Movie_Show(Show_Time, Show_Date)
);

INSERT INTO ticket (Movie_id, Ticket_no, Seat_id, Show_Time, Show_Date, Price, Screen, Movie_Name)
VALUES
    (16, 201, 1, '15:00', '2024-03-27', 300, 3, 'Dangal'),
    (17, 202, 2, '18:30', '2024-03-28', 700, 6, 'Baahubali: The Beginning'),
    (18, 203, 3, '21:00', '2024-03-29', 1400, 5, '3 Idioits'),
    (16, 204, 4, '15:00', '2024-03-27', 1050, 4, 'Dangal'),
    (25, 205, 5, '14:00', '2024-03-27', 700, 4, 'Gully Boy'),
    (22, 206, 6, '16:30:00', '2024-03-27', 350, 2, 'Rand De Basanti'),
    (19, 207, 7, '17:30', '2024-03-27', 350, 4, 'Drishyam'),
    (24, 208, 8, '22:15', '2024-03-29', 1050, 3, 'Ustad Hotel'),
    (23, 209, 9, '19:45', '2024-03-28', 1400, 5, 'Queen'),
    (25, 210, 10, '14:00', '2024-03-27', 700, 4, 'Gully Boy');
select*from Ticket;    


-- Query 1
-- Add a new user
INSERT into [User](Name,Login_id,Password,Email,Phone_no,Gender,Age,Ticket_no) values('Nisha Patel',11,"ohwg",'nisha@gmail.com',9839210210,'F',23,'211');
select*from [User];


-- Query 2
-- Update email 
Update [User] set Email="Mannie123@gmail.com" where Login_id=3;
select*from [User];


-- Query 3
-- Update amount in payment to add taxes 
Update payment 
set amount= amount+(0.15*amount);
select*from payment;
select*from [User];


-- Query 4
-- Add  10% festive discount  
select*,price-(price*0.1) from Booking;


-- Query 5
-- Query to find details of a customer whose name contains "Ag" string
SELECT *FROM [User] WHERE Name LIKE '%Ag%';


-- Query 6
-- Query to calculate the total earning from the site (sum of Price)
SELECT SUM(Price) AS Total_Earning FROM Booking;


-- Query 7
-- Query to get the count of number of male and female managers
SELECT M_Gender AS Gender,
COUNT(*) AS Total_Managers
FROM Manager GROUP BY M_Gender;

-- Query 8
-- Query to order movies by ratings in ascending order
SELECT Movie_id,Movie_Name, Genre,Language,Movie_Rating FROM Movie
ORDER BY Movie_Rating DESC;

-- Query 9
-- Query to delete an account (entry) from the User table
DELETE FROM [User] WHERE Login_id = 11;
select* from [user];


-- Query 10
-- Query to Search movie by movie by genre and language
SELECT * FROM Movie WHERE Genre = 'Comedy' and language="Hindi";


-- Query 11
-- Query to display all the data about the movie with its show timings and other details.
SELECT * 
FROM movie_Show 
INNER JOIN Movie 
ON movie_Show.Movie_id = Movie.Movie_id;

-- Query 12
-- Query to search for a manager working in the particular theater
SELECT * FROM Manager WHERE Theatre_id = 101;


-- Query 13
-- query to get details about users under 30
select * from [User] where age>=30;


-- Query 14
-- Count the total number of seats by seat type (Standard, VIP, Premium) and 
-- display them in a descending order based on the number of seats for each type:
SELECT Seat.Seat_Type,
COUNT(*) as Seat_Count FROM Seat
GROUP BY Seat.Seat_Type
ORDER BY Seat_Count DESC;


-- Query 15
-- Retrieve the names and ages of managers who oversee theaters with at least 5 screens.
SELECT M_Name, M_Age
FROM Manager
WHERE Theatre_id IN (
    SELECT Theatre_id
    FROM Theater
    WHERE Screen >= 5
);



-- Query 16
-- Retrieve Movie Names and Show Dates for Movies Scheduled on March 27, 2024:
SELECT m.Movie_Name, ms.Show_Date
FROM Movie_Show ms
JOIN Movie m ON ms.Movie_id = m.Movie_id
WHERE ms.Show_Date = '2024-03-27';


-- Query 17
-- Create a view to show total amount spent by each user
GO
CREATE VIEW TotalAmountSpent AS
SELECT Login_id, SUM(Price) AS Total_Amount_Spent
FROM Booking
GROUP BY Login_id;
GO
SELECT * FROM TotalAmountSpent;


-- Query 18
-- Modifying table by adding a column Salary in the manager
ALTER TABLE Manager
ADD Salary numeric(10, 2);

UPDATE Manager SET Salary = 50000.00 WHERE Theatre_id = 101;
UPDATE Manager SET Salary = 60000.00 WHERE Theatre_id = 102;
UPDATE Manager SET Salary = 70000.00 WHERE Theatre_id = 103;
UPDATE Manager SET Salary = 80000.00 WHERE Theatre_id = 104;
UPDATE Manager SET Salary = 90000.00 WHERE Theatre_id = 105;
UPDATE Manager SET Salary = 100000.00 WHERE Theatre_id = 106;
UPDATE Manager SET Salary = 110000.00 WHERE Theatre_id = 107;
UPDATE Manager SET Salary = 120000.00 WHERE Theatre_id = 108;
UPDATE Manager SET Salary = 130000.00 WHERE Theatre_id = 109;
UPDATE Manager SET Salary = 140000.00 WHERE Theatre_id = 110;
select * from Manager;

-- Query 19
-- Display the names of managers whose salray is between 50000 and 70000
SELECT M_Name, Salary
FROM Manager
WHERE Salary BETWEEN 50000.00 AND 70000.00;


UPDATE Ticket
SET Price = Price * 0.9
WHERE Show_Date = '2024-03-28' -- Women's Day
AND Ticket.Ticket_no IN (
    SELECT [User].Ticket_no
    FROM [User]
    WHERE [User].Gender = 'F'
);
select*from Ticket;



