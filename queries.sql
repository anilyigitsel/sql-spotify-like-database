-- Creating Database
create database SpotifyTermProject

use SpotifyTermProject

-- Creating Tables

create table Album (
AlbumId INT AUTO_INCREMENT PRIMARY KEY,
Title VARCHAR(255) NOT NULL,
ReleaseDate YEAR NOT NULL,
Genre VARCHAR(100)
);

create table Artist (
ArtistId INT AUTO_INCREMENT PRIMARY KEY,
ArtistName VARCHAR (255) NOT NULL,
Country VARCHAR (255),
ContactName VARCHAR (255),
ArtistEmail VARCHAR (255) NOT NULL
);

create table Playlist (
PlaylistId INT AUTO_INCREMENT PRIMARY KEY,
Title VARCHAR (255) NOT NULL,
CreationDate DATE,
PrivacyStatus VARCHAR (50)
);

create table Subscription ( 
SubscriptionId INT AUTO_INCREMENT PRIMARY KEY,
MainAccountId INT , 
Type VARCHAR(100),
Price DECIMAL (8,2),
StartDate DATE,
EndDate DATE 
) AUTO_INCREMENT= 101 ;

create table User (

UserId INT AUTO_INCREMENT PRIMARY KEY,
SubscriptionId INT NOT NULL,
UserName VARCHAR(255) NOT NULL,
Email VARCHAR(255) NOT NULL UNIQUE,
Password VARCHAR(255) NOT NULL,
DateofBirth DATE NOT NULL,
Country VARCHAR(255) NOT NULL,
JoinDate DATE NOT NULL,
FOREIGN KEY (SubscriptionId) REFERENCES Subscription (SubscriptionId)
);

Alter table Subscription 
ADD CONSTRAINT fk_mainaccount FOREIGN KEY (MainAccountId) REFERENCES User (UserId) ;

create table Song (
SongId INT AUTO_INCREMENT PRIMARY KEY,
Title VARCHAR(255) NOT NULL,
Duration INT NOT NULL,
ReleaseDate YEAR NOT NULL,
Genre VARCHAR (100),
PlayCount INT NOT NULL
) AUTO_INCREMENT = 201 ;

create table Log (
LogId INT AUTO_INCREMENT PRIMARY KEY,
SongId INT NOT NULL,
TimeStamp TIMESTAMP NOT NULL,
ActionType VARCHAR(255) NOT NULL,
DeviceInfo VARCHAR(255),
FOREIGN KEY (SongId) REFERENCES Song (SongId) );

create table Payment (
PaymentId INT AUTO_INCREMENT PRIMARY KEY,
SubscriptionId INT NOT NULL,
Amount DECIMAL (8,2) NOT NULL,
PayDate DATE,
PaymentMethod VARCHAR (255),
Currency VARCHAR (100),
FOREIGN KEY (SubscriptionId) REFERENCES Subscription (SubscriptionId) );

create table Intersection1 (
Intersection1Id INT AUTO_INCREMENT PRIMARY KEY,
PlaylistId INT NOT NULL,
UserId INT NOT NULL,
FOREIGN KEY (PlaylistId) REFERENCES Playlist (PlaylistId),
FOREIGN KEY (UserId) REFERENCES User (UserId) 
);

create table Intersection2 (
Intersection2Id INT AUTO_INCREMENT PRIMARY KEY,
PlaylistId INT NOT NULL,
SongId INT NOT NULL,
FOREIGN KEY (PlaylistId) REFERENCES Playlist (PlaylistId),
FOREIGN KEY (SongId) REFERENCES Song (SongId)
);

create table Intersection3 (
Intersection3Id INT AUTO_INCREMENT PRIMARY KEY,
ArtistId INT NOT NULL,
SongId INT NOT NULL,
FOREIGN KEY (ArtistId) REFERENCES Artist (ArtistId),
FOREIGN KEY (SongId) REFERENCES Song (SongId)
);

create table Intersection4 (
Intersection4Id INT AUTO_INCREMENT PRIMARY KEY,
ArtistId INT NOT NULL,
AlbumId INT NOT NULL,
FOREIGN KEY (ArtistId) REFERENCES Artist (ArtistId),
FOREIGN KEY (AlbumId) REFERENCES Album (AlbumId)
);

create table Intersection5 (
Intersection5Id INT AUTO_INCREMENT PRIMARY KEY,
LogId INT NOT NULL,
UserId INT NOT NULL,
FOREIGN KEY (LogId) REFERENCES Log (LogId),
FOREIGN KEY (UserId) REFERENCES User (UserId)
);

create table Intersection6 (
Intersection6Id INT AUTO_INCREMENT PRIMARY KEY,
SongId INT NOT NULL,
AlbumId INT NOT NULL,
FOREIGN KEY (SongId) REFERENCES Song (SongId),
FOREIGN KEY (AlbumId) REFERENCES Album (AlbumId)
);

-- Inserting Opearations

insert into Album (Title, ReleaseDate, Genre)
values ('Good Girl Gone Bad', 2008, 'Pop'),
       ('Globalization', 2014, 'Pop'),
       ('The Eminem Show',2002, 'Rap'),
       ('Listen Up!',2010, 'Pop'),
       ('Nevermind', 1991, 'Rock'),
       ('Recovery', 2010, 'HipHop'),
       ('Shakira.', 2014, 'Pop') ;
       
       
insert into Artist (ArtistName,Country,ContactName,ArtistEmail)
values ('Rihanna','Barbados','Jay Brown','rihanna.business@gmail.com'),
       ('Pitbull','USA','Robert Hernandez','pitbull.business@gmail.com'),
	   ('Eminem','USA','Paul Rosenberg','eminem.business@hotmail.com'),
       ('Shakira','Colombia','Nadina Eliya','shakira.business@outlook.com'),
	   ('Nirvana','USA',NULL,'nirvana@gmail.com') ;
       
       
insert into Playlist (Title, CreationDate, PrivacyStatus)
values      ('Summer Vibes', '2024-06-15', 'Public'),
			('Workout Hits', '2020-07-10', 'Private'),
            ('Chill Out Sessions','2024-08-01', 'Public'),
			('Study Playlist', '2021-09-05', 'Private'),
			('Road Trip Tunes',	'2022-02-05', 'Public') ;
       
       
insert into Subscription (Type,Price, StartDate, EndDate)  
values ('Individual',  59.99,	'2024-01-01', '2024-10-12'),
       ('Student', 6.39, '2024-06-15', '2025-06-14'),
	   ('Family',  19.99,	'2024-03-10', '2025-03-09'),
       ('Duo', 19.99, '2024-05-01', '2025-05-01'),
       ('Free',0.00, '2024-12-01', '2025-01-01') ;  
       
       
insert into User (UserName, Email, Password, DateofBirth, Country, JoinDate, SubscriptionId)
values ('firdevsss', 'kartalfirdevs6171@gmail.com', 'password123', '1990-05-15', 'Turkey', '2024-01-10',101),
       ('janesmith', 'jane.smith456@yahoo.com',	'mypassword!', '1985-10-22', 'Canada', '2023-11-05',102),
       ('anilsel24', 'anillsell24@hotmail.com',	'securePass1', '1993-12-30', 'UK', '2024-06-18',103),
       ('lucybrown0', 'lucy.brown321@outlook.com', 'lucy1234', '1998-03-07', 'Australia', '2024-04-25',104),
       ('silakiroglu', 'silakiroglu@gmail.com',	'password2024', '1992-08-12', 'USA', '2024-07-14',105) ;
       
       
insert into Subscription (MainAccountId)
values(1),
      (2),
	  (3),
	  (4),
	  (5) ;


insert into Song (Title,Duration,ReleaseDate,Genre,PlayCount)
values ('Umbrella',	205, 2008, 'Pop',1500),
	   ('Fireball',260, 2014, 'Pop',2200),
	   ('Without Me', 310, 2002, 'Rap', 980),
	   ('Waka waka', 210, 2010, 'Pop', 450),
	   ('Lithium', 240, 1991, 'Rock', 1200),
	   ('Love the Way You Lie', 178, 2010, 'HipHop',9200),
	   ('Cant Remember to Forget You', 230, 2014, 'Pop', 3800) ;

       
       insert into Log (ActionType,	TimeStamp,	SongId,	DeviceInfo)
       values ('Like', '2024-12-28 08:15:00', 201, 'iPhone 14, iOS 16'),
              ('Pause', '2024-12-28 08:20:00', 202, 'Samsung Galaxy S23, Android 13'),
			  ('Skip', '2024-12-28 08:25:00', 203, 'MacBook Pro, macOS 14'),
              ('Play', '2024-12-28 08:30:00' ,204, 'Google Pixel 7, Android 14'),
              ('Add to Queue', '2024-12-28 08:35:00', 205,'Windows 11 PC, Spotify App') ;
              
              
      insert into Payment (SubscriptionId, Amount, PayDate,	PaymentMethod, Currency)
      values (101,	59.99, '2024-01-02','Credit Card', 'TL'),
             (102,	06.39, '2024-06-16', 'PayPal', 'CAD'),
             (103,	19.99, '2024-03-11', 'Debit Card', 'GBP'),
             (104,	19.99, '2024-05-02', 'Bank Transfer', 'AUD'),
             (105,	0.00, '2024-12-02', 'Credit Card','USD');
             
             
  insert into Intersection1 (PlaylistId, UserId)
  values (1 , 1),
         (1	, 2),
         (2	, 2),
         (3	, 3),
		 (4	, 4),
         (5	, 5);
         
  insert into Intersection2 (PlaylistId, SongId) 
  values (1, 201),
         (2, 202),
         (3, 203),
		 (4, 204),
         (5, 205);
         
  insert into Intersection3 (ArtistId, SongId) 
  values (1,201),
         (2,202),
         (3,203),
         (4,204),
         (5,205),
         (1,206),
         (3,206),
         (1,207),
		 (4,207);
         
   insert into Intersection4 (ArtistId, AlbumId)   
   values (1,1),
          (2,2),
          (3,3),
          (4,4),
          (5,5),
          (3,6),
		  (4,7);
       
 insert into Intersection5 (LogId, UserId)    
 values (1,	1),
        (2, 1),
		(2, 2),
        (3,	3),
        (4,	4),
		(5,	5);
       
insert into Intersection6 (SongId, AlbumId)     
values (201,1),
	   (202,2),
       (203,3),
	   (204,4),
       (205,5),
       (206,6),
       (207,7);    
       
-- Stored Procedures

DELIMITER $$
CREATE PROCEDURE AuthorizeLogin(
    IN inputEmail VARCHAR(255),
    IN inputPassword VARCHAR(255)
)
BEGIN
    DECLARE MatchCount INT;
    SELECT COUNT(*) INTO MatchCount
    FROM User
    WHERE Email = inputEmail AND Password = inputPassword;
    IF MatchCount = 1 THEN
        SELECT 'Successfully Logged In' AS Message;
    ELSE
        SELECT 'Invalid Name or Password' AS Message;
    END IF;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE UserActivityLog(IN NewUserId INT)
BEGIN
SELECT
u.UserName,
l.ActionType,
l.TimeStamp,
s.Title,
l.DeviceInfo
FROM User u
JOIN Intersection5 ul ON u.UserId = ul.UserId
JOIN Log l ON ul.LogId = l.LogId 
JOIN Song s ON l.SongId = s.SongId
WHERE NewUserId = u.UserId;
END $$
DELIMITER ;


DELIMITER $$
CREATE PROCEDURE GetUserPaymentHistory (IN inputUserId INT)
BEGIN
    SELECT 
        u.UserName,
        s.Type,
        p.Amount,
        p.PayDate,
        p.PaymentMethod,
        p.Currency
    FROM Payment p 
    JOIN Subscription s ON S.SubscriptionId = p.SubscriptionId
    JOIN User u ON u.SubscriptionId = s. SubscriptionId
    WHERE u.UserId = inputUserId
    ORDER BY p.PayDate;
END $$
DELIMITER ;

-- Indexes

CREATE INDEX mail_idx
ON User (Email);

    
CREATE INDEX genre_idx
ON Song (Genre);


CREATE INDEX playlistname_idx
ON Playlist (Title);

-- Views


CREATE VIEW MostListenedSongs AS
SELECT 
s.Title as SongName,
a.ArtistName as ArtistName,
al.Title as AlbumName,
s.PlayCount,
s.Duration,
s.ReleaseDate
FROM Artist a
JOIN Intersection3 sa ON a.ArtistId=sa.ArtistId
JOIN Song s ON sa.SongId=s.SongId
JOIN Intersection6 als ON als.SongId=s.SongId
JOIN Album al ON als.AlbumId=al.AlbumId
ORDER BY PlayCount DESC
LIMIT 5;


CREATE VIEW LikedSongs AS
SELECT
u.UserId,
s.Title as SongName,
al.Title as AlbumName,
s.Duration,
u.UserName as AddedBy
FROM User u
JOIN Intersection5 ul ON u.UserId=ul.UserId
JOIN Log l ON l.LogId=ul.LogId
JOIN Song s ON l.SongId=s.SongId
JOIN Intersection6 sa ON s.SongId=sa.SongId
JOIN Album al ON sa.AlbumId=al.AlbumId 
WHERE l.ActionType='Like';


CREATE VIEW UserCountryStatus AS
SELECT
u.Country,
COUNT(u.UserId) AS UserCount,
p.Currency
FROM User u 
JOIN Subscription s ON u.SubscriptionId=s.SubscriptionId
JOIN Payment p ON p.SubscriptionId=s.SubscriptionId
GROUP BY 
u.Country
ORDER BY 
UserCount DESC;













