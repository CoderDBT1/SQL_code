-- Create a database for the project
CREATE DATABASE IF NOT EXISTS StudentPlacementDB;
USE StudentPlacementDB;

-- Create a table for students
CREATE TABLE IF NOT EXISTS Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15),
    GPA FLOAT
);

-- Create a table for companies
CREATE TABLE IF NOT EXISTS Companies (
    CompanyID INT PRIMARY KEY,
    CompanyName VARCHAR(100),
    Industry VARCHAR(50),
    Location VARCHAR(100)
);

-- Create a table for placements
CREATE TABLE IF NOT EXISTS Placements (
    PlacementID INT PRIMARY KEY,
    StudentID INT,
    CompanyID INT,
    PlacementDate DATE,
    Salary DECIMAL(10, 2),
    CONSTRAINT fk_Student FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    CONSTRAINT fk_Company FOREIGN KEY (CompanyID) REFERENCES Companies(CompanyID)
);

-- Insert sample data into Students table
INSERT INTO Students (StudentID, FirstName, LastName, Email, Phone, GPA)
VALUES
    (1, 'John', 'Doe', 'john.doe@email.com', '123-456-7890', 3.8),
    (2, 'Jane', 'Smith', 'jane.smith@email.com', '987-654-3210', 3.5);

-- Insert sample data into Companies table
INSERT INTO Companies (CompanyID, CompanyName, Industry, Location)
VALUES
    (1, 'TechCo', 'Technology', 'Silicon Valley'),
    (2, 'FinCorp', 'Finance', 'New York');

-- Insert sample data into Placements table
INSERT INTO Placements (PlacementID, StudentID, CompanyID, PlacementDate, Salary)
VALUES
    (1, 1, 1, '2023-05-15', 80000.00),
    (2, 2, 2, '2023-06-01', 75000.00);

-- Query to retrieve student placement information
SELECT 
    Students.StudentID,
    Students.FirstName,
    Students.LastName,
    Companies.CompanyName,
    Placements.PlacementDate,
    Placements.Salary
FROM 
    Students
JOIN Placements ON Students.StudentID = Placements.StudentID
JOIN Companies ON Placements.CompanyID = Companies.CompanyID;
