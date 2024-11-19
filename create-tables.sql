USE university;

-- Stores basic information about each student.
CREATE TABLE Students
(
    StudentID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    EnrollmentDate DATE DEFAULT GETDATE()
);

-- Stores basic course information.
CREATE TABLE Courses
(
    CourseID INT PRIMARY KEY IDENTITY(1,1),
    CourseName NVARCHAR(100) NOT NULL,
    Credits INT CHECK (Credits > 0),
    DepartmentID INT
);

-- Stores information about instructors.
CREATE TABLE Instructors
(
    InstructorID INT PRIMARY KEY IDENTITY(1,1),
    FirstName NVARCHAR(50) NOT NULL,
    LastName NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
    DepartmentID INT
);

-- Stores department details.
CREATE TABLE Departments
(
    DepartmentID INT PRIMARY KEY IDENTITY(1,1),
    DepartmentName NVARCHAR(100) NOT NULL UNIQUE
);

-- Links students to courses and keeps track of their enrollment status.
CREATE TABLE Enrollments
(
    EnrollmentID INT PRIMARY KEY IDENTITY(1,1),
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    Grade DECIMAL(3, 2) CHECK (Grade BETWEEN 0 AND 4),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);


-- !----------------------------------------------------


-- Insert fake data into the Students table
INSERT INTO Students
    (FirstName, LastName, Email, EnrollmentDate)
VALUES
    ('John', 'Doe', 'johndoe@example.com', '2022-09-01'),
    ('Jane', 'Smith', 'janesmith@example.com', '2023-01-15'),
    ('Alice', 'Johnson', 'alicejohnson@example.com', '2023-09-01'),
    ('Bob', 'Brown', 'bobbrown@example.com', '2022-01-10');

-- Insert fake data into the Courses table
INSERT INTO Courses
    (CourseName, Credits, DepartmentID)
VALUES
    ('Introduction to Programming', 3, 1),
    ('Data Structures', 4, 1),
    ('Calculus I', 3, 2),
    ('Linear Algebra', 3, 2),
    ('General Physics', 4, 3),
    ('Organic Chemistry', 4, 4);

-- Insert fake data into the Instructors table
INSERT INTO Instructors
    (FirstName, LastName, Email, DepartmentID)
VALUES
    ('Dr. Emily', 'Clark', 'emilyclark@example.com', 1),
    ('Dr. Michael', 'Adams', 'michaeladams@example.com', 2),
    ('Dr. Sarah', 'Taylor', 'sarahtaylor@example.com', 3),
    ('Dr. James', 'White', 'jameswhite@example.com', 4);

-- Insert fake data into the Departments table
INSERT INTO Departments
    (DepartmentName)
VALUES
    ('Computer Science'),
    ('Mathematics'),
    ('Physics'),
    ('Biology');

-- Insert fake data into the Enrollments table
INSERT INTO Enrollments
    (StudentID, CourseID, Grade)
VALUES
    (1, 1, 3.5),
    (1, 2, 3.7),
    (2, 3, 3.0),
    (2, 4, 3.8),
    (3, 5, 2.9),
    (4, 6, 3.4);


-- !----------------------------------------------------

-- Simple SELECT query
SELECT *
FROM Students;

SELECT *
FROM Courses;

SELECT *
FROM Instructors;

SELECT *
FROM Departments;

SELECT *
FROM Enrollments;

-- DISTINCT return unique data and don't show repeated data
SELECT DISTINCT FirstName
FROM Students;

-- set condition for SELECTION query
SELECT *
FROM Students
WHERE Age > 20;

SELECT *
FROM Students
WHERE FirstName = 'John';

-- Use LIKE to search for a specified pattern
--      Use % for set search pattern
--      Use _ for ser number of character
SELECT *
FROM Students
WHERE LastName LIKE 'Jo%';

SELECT *
FROM Students
WHERE LastName LIKE '%h';

SELECT *
FROM Students
WHERE LastName LIKE '%o%';

SELECT *
FROM Students
WHERE LastName LIKE '_o_';


-- Use IN for select data with specific value
SELECT *
FROM Students
WHERE Age IN (21,22,23);