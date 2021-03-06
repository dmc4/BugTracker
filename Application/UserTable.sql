
USE BugTracker;

DROP TABLE IF EXISTS USER;
/* CREATE TABLE USER
(
	ID INT AUTO_INCREMENT PRIMARY KEY,
	First_Name VARCHAR(20),
	Family_Name VARCHAR(20),
	Username VARCHAR(30) UNIQUE,
	Email_Address VARCHAR(50) UNIQUE,
	Password CHAR(32),
	Gender ENUM('F', 'M'),
	Reputation INT,
	Role VARCHAR(20),
	MemberSince DATETIME DEFAULT CURRENT_TIMESTAMP,
	ProfilePicture VARCHAR(50)
); */
CREATE TABLE USER
(
    ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(20),
    Family_Name VARCHAR(20),
    Username VARCHAR(30) UNIQUE,
    Email_Address VARCHAR(50) UNIQUE,
    Password CHAR(32),
    Gender VARCHAR(2),
    Reputation INT,
    Role VARCHAR(20),
    MemberSince DATETIME DEFAULT CURRENT_TIMESTAMP,
    LastLoggedIn DATETIME, 
    ProfilePicture VARCHAR(50),
    Status BOOLEAN
);


INSERT INTO USER (First_Name, Family_Name, Username, Email_Address, Password, Gender, Reputation, Role, MemberSince, ProfilePicture,Status)
VALUES
('Nathaniel', 'Smith', 'njs109', 'njs109@uowmail.edu.au', 'mypass', 'M', 0, 'System Administrator', CURDATE(), "Blank",TRUE);

DROP TABLE IF EXISTS BUG;
CREATE TABLE BUG
(
	ID INT AUTO_INCREMENT PRIMARY KEY,
	Title VARCHAR(50),
	Status ENUM('NEW', 'VERIFIED', 'UNDER REVIEW', 'PATCH UPLOADED', 'FIXED', 'CLOSED'),
	Application VARCHAR(30),
	Version DOUBLE(4, 2),
	Description VARCHAR(200),
	Platform VARCHAR(30),
	Component VARCHAR(30),
	Priority ENUM('HIGH', 'MEDIUM','LOW'),
	Severity ENUM('CRITICAL','MAJOR','MINOR'),	
	Walkthrough TEXT,
	History TEXT,
	AssignedTo VARCHAR(30) REFERENCES USER(Username),
	IdentifiedBy VARCHAR(30) REFERENCES USER(Username),
	DateSubmitted DATETIME DEFAULT CURRENT_TIMESTAMP
);
DROP TABLE IF EXISTS COMMENTS;
CREATE TABLE COMMENTS
(
	BugID INT REFERENCES BUG(ID),
	UserID INT REFERENCES USER(ID),
	Submitted DATETIME DEFAULT CURRENT_TIMESTAMP
);
DROP TABLE IF EXISTS SUBSCRIPTIONS;
CREATE TABLE SUBSCRIPTIONS
(
	BugID INT REFERENCES BUG(ID),
	UserID INT REFERENCES USER(ID)
);
