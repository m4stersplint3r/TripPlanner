--CREATE DATABASE TripPlanning

--USE TripPlanning

CREATE TABLE Users (
	ID int PRIMARY KEY IDENTITY(1,1),
	FirstName nvarchar(25),
	LastName nvarchar(25),
	StreetAddress nvarchar(50),
	City nvarchar(20),
	[State] nvarchar(20),
	ZIP nvarchar(5),
	PhoneNumber nvarchar(10),
	DOB Date
)

CREATE TABLE Passport (
	ID int PRIMARY KEY IDENTITY(1,1),
	UserID int,
	ExpirationDate Date NOT NULL,
	StreetAddress nvarchar(50),
	City nvarchar(20),
	[State] nvarchar(20),
	ZIP nvarchar(5),
	CONSTRAINT FK_PassportUserID
	FOREIGN KEY (UserID)
	REFERENCES Users(ID)
)

CREATE TABLE Trip (
	ID int PRIMARY KEY IDENTITY(1,1),
	UserID int,
	Budget Float,
	StartingDestination nvarchar(150),
	EndingDestination nvarchar(150),
	TravelMethod nvarchar(30),
	StartDate DateTime,
	EndDate DateTime,
	CONSTRAINT FK_TripUserID
	FOREIGN KEY (UserID)
	REFERENCES Users(ID)
)

CREATE TABLE Hotels (
	ID int PRIMARY KEY IDENTITY(1,1),
	StreetAddress nvarchar(50),
	City nvarchar(20),
	[State] nvarchar(20),
	ZIP nvarchar(5),
	PhoneNumber nvarchar(10),
	CostPerNight Float,
	CheckInDate DateTime,
	CheckOutDate DateTime
)

CREATE TABLE TripHotel (
	TripID int,
	HotelID int,
	CONSTRAINT FK_TripHotel_Hotel
	FOREIGN KEY (HotelID)
	REFERENCES Hotels(ID),
	CONSTRAINT FK_TripHotel_Trip
	FOREIGN KEY (TripID)
	REFERENCES Trip(ID)
)