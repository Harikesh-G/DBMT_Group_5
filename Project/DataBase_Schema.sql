CREATE SCHEMA IF NOT EXISTS ProjectDBMT;

USE ProjectDBMT;

CREATE TABLE IF NOT EXISTS Role ( 
	RoleID INT NOT NULL PRIMARY KEY,
    RoleName VARCHAR(20) NOT NULL);

INSERT INTO role VALUES (1, 'Employer');
INSERT INTO role VALUES (0, 'Seeker');

CREATE TABLE IF NOT EXISTS User (
	UserID INT NOT NULL PRIMARY KEY,
    UserName VARCHAR(20) NOT NULL,
    PasswordHash VARCHAR(100) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    RoleID INT NOT NULL,
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID));

INSERT INTO User VALUES (0, 'user0', '000', 'test@test.com', 0);

CREATE TABLE IF NOT EXISTS Organization (
	OrganizationID INT NOT NULL PRIMARY KEY,
    OrganizationName VARCHAR(50) NOT NULL,
    Industry VARCHAR(50) NOT NULL,
    Location VARCHAR(100));

CREATE TABLE IF NOT EXISTS WorkExperience (
	ExperienceID  INT NOT NULL PRIMARY KEY,
    OrganizationID INT NOT NULL,
    Position VARCHAR(20) NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    FOREIGN KEY (OrganizationID) REFERENCES Organization(OrganizationID));

CREATE TABLE IF NOT EXISTS UserProfile (
	UserID INT NOT NULL,
    RoleID INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    ContactInfo VARCHAR(100),
    Education VARCHAR(300) NOT NULL,
    Resume VARCHAR(300) NOT NULL,
    Website VARCHAR(300),
    ExperienceID INT,
    PRIMARY KEY (UserID, RoleID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID),
    FOREIGN KEY (ExperienceID) REFERENCES WorkExperience(ExperienceID));

CREATE TABLE IF NOT EXISTS Skill (
	SkillID  INT NOT NULL PRIMARY KEY,
    SkillName VARCHAR(20) NOT NULL,
    SkillDescription VARCHAR(300));

CREATE TABLE IF NOT EXISTS UserSkill (
	UserID INT NOT NULL,
    SkillID INT NOT NULL,
    PRIMARY KEY (UserID, SkillID),
    FOREIGN KEY (UserID) REFERENCES UserProfile(UserID),
    FOREIGN KEY (SkillID) REFERENCES Skill(SkillID));

CREATE TABLE IF NOT EXISTS Employer (
	UserID INT NOT NULL,
    RoleID INT NOT NULL,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    JobRole VARCHAR(50) NOT NULL,
    Email VARCHAR(50) NOT NULL,
    ContactInfo VARCHAR(100),
    Website VARCHAR(300),
    OrganizationID INT NOT NULL,
    PRIMARY KEY (UserID, RoleID),
    FOREIGN KEY (UserID) REFERENCES User(UserID),
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID),
    FOREIGN KEY (OrganizationID) REFERENCES Organization(OrganizationID));

CREATE TABLE IF NOT EXISTS JobListing (
	JobID  INT NOT NULL PRIMARY KEY,
    UserID INT NOT NULL,
    OrganizationID INT NOT NULL,
    Title VARCHAR(20) NOT NULL,
    Description VARCHAR(300) NOT NULL,
    JobType VARCHAR(100) NOT NULL,
    Salary VARCHAR(20) NOT NULL,
    FOREIGN KEY (UserID) REFERENCES Employer(UserID),
    FOREIGN KEY (OrganizationID) REFERENCES Organization(OrganizationID));

CREATE TABLE IF NOT EXISTS Application (
	ApplicationID INT NOT NULL PRIMARY KEY,
    JobID  INT NOT NULL,
    UserID INT NOT NULL,
    FOREIGN KEY (JobID) REFERENCES JobListing(JobID),
    FOREIGN KEY (UserID) REFERENCES UserProfile(UserID));