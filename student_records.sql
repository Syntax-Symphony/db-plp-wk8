
-- Drop the database if it exists (optional for testing)
DROP DATABASE IF EXISTS StudentDB;
-- Create the database
CREATE DATABASE StudentDB;
USE StudentDB;
-- Create Departments table
CREATE TABLE Departments (
    DeptID INT AUTO_INCREMENT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL UNIQUE
);
-- Create Students table
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- Create Courses table
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CreditHours INT DEFAULT 3
);
-- Create Enrollments table
-- Create Enrollments table
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);
-- Drop database if it already exists
DROP DATABASE IF EXISTS StudentDB;

-- Create new database
CREATE DATABASE StudentDB;
USE StudentDB;

-- =========================
-- 📁 Table: Departments
-- =========================
CREATE TABLE Departments (
    DeptID INT AUTO_INCREMENT PRIMARY KEY,
    DeptName VARCHAR(100) NOT NULL UNIQUE
);

-- =========================
-- 📁 Table: Students
-- =========================
CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

-- =========================
-- 📁 Table: Courses
-- =========================
CREATE TABLE Courses (
    CourseID INT AUTO_INCREMENT PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    CreditHours INT DEFAULT 3
);

-- =========================
-- 📁 Table: Enrollments
-- =========================
CREATE TABLE Enrollments (
    EnrollmentID INT AUTO_INCREMENT PRIMARY KEY,
    StudentID INT NOT NULL,
    CourseID INT NOT NULL,
    EnrollmentDate DATE NOT NULL DEFAULT (CURRENT_DATE),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

-- =========================
-- 🌱 Insert Sample Data
-- =========================

-- Departments
INSERT INTO Departments (DeptName) VALUES 
('Computer Science'),
('Business'),
('Engineering');

-- Students
INSERT INTO Students (FullName, Email, DeptID) VALUES
('Alice Wanjiru', 'alice@example.com', 1),
('Brian Omondi', 'brian@example.com', 2),
('Catherine Njeri', 'catherine@example.com', 1),
('David Mwangi', 'david@example.com', 3);

-- Courses
INSERT INTO Courses (CourseName, CreditHours) VALUES
('Intro to Databases', 3),
('Business Ethics', 2),
('Engineering Math', 4),
('Data Structures', 3);

-- Enrollments
INSERT INTO Enrollments (StudentID, CourseID) VALUES
(1, 1),
(1, 4),
(2, 2),
(3, 1),
(3, 4),
(4, 3);
