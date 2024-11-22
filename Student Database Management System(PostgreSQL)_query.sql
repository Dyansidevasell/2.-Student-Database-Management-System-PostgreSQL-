/*Project: Student Database Management System (PostgreSQL) 
1. Database Setup 
Create a database named "student_database." 
Create a table called " student_table " with the following columns: Student_id (integer), Stu_name (text), Department (text), email_id (text), Phone_no (numeric), Address (text), Date_of_birth (date), Gender (text), Major (text), GPA (numeric), Grade (text) should be A,B,C etc */

CREATE TABLE student_table (
    student_id SERIAL PRIMARY KEY,           -- Auto-incrementing primary key
    stu_name TEXT NOT NULL,                 -- Student's name (cannot be null)
    Department TEXT,                        -- Department (optional)
    Email_ID TEXT UNIQUE,                   -- Email address (must be unique)
    Phone_No VARCHAR(20),                   -- Phone number (allows for formatting)
    Address TEXT,                           -- Address (optional)
    date_of_birth DATE,                     -- Date of birth
    Gender TEXT CHECK (Gender IN ('Male', 'Female', 'Other')), -- Gender with allowed values
    Major TEXT,                             -- Major (optional)
    GPA NUMERIC(3, 2), -- GPA
    Grade CHAR(1) CHECK (grade IN ('A', 'B', 'C', 'D', 'E', 'F'))  -- Grade with allowed values
);


/* 2. Data Entry 
Insert 10 sample records into the "student_table" using INSERT command */

INSERT INTO student_table (stu_name, department, email_id, phone_no, address, date_of_birth, gender, major, gpa, grade)
VALUES
('Hanny', 'Aerospace', 'hanny@gmail.com', '3245675432', 'first street', '2000-02-24', 'Male', 'Aerospace Engineering', 8.65, 'B'),
('Raelyn', 'Arts', 'rae@yahoo.com', '7645239876', 'second daredevils St', '2001-04-03', 'Female', 'Homescience', 7.90, 'C'),
('Joma', 'Bioscience', 'joma@orkut.com', '5434768902', 'third cements road', '2002-03-08', 'Female', 'Biotechnology', 5.87, 'E'),
('Janez', 'Applied Maths', 'janez@gmail.com', '6545345676', 'fourth maidan St', '2004-12-07', 'Male', 'Scientific Engineering', 6.90, 'D'),
('Gianna', 'Human Resource', 'giana@gmail.com', '3423876543', 'fifth gardens', '2003-05-06', 'Female', 'MBA', 9.34, 'B'),
('Johans', 'Aerospace', 'johan@gmail.com', '2386754376', 'sixth St', '2001-12-01', 'Male', 'Aerospace Engineering', 9.30, 'B'),
('Hannah', 'Maths', 'hannah@gmail.com', '6547890324', 'seventh stadium', '2005-11-11', 'Female', 'Mathemetician Enginner', 8.70, 'B'),
('Ancy', 'Tamil', 'ancy@yahoo.com', '4573489765', 'eight St', '2004-01-14', 'Female', 'Language Learning', 7.45, 'C'),
('Arthur', 'Architect', 'arthur@gmail.com', '4398765423', 'nineth admin St', '2003-07-22', 'Male', 'Civil Engineering', 8.60, 'B'),
('Dyansi', 'Archeology', 'dd@gmail.com', '8855664433', 'tenth St', '2002-11-27', 'Female', 'Archeology Engineer', 9.80, 'A'),
('Zuriel', 'Geology', 'zuriel@gmail.com', '9966778844', 'eleventh St', '2001-09-27', 'Male', 'Geological Enginnering', 7.50, 'C'),
('Zyannah', 'Geography', 'zya@gmail.com', '3344556677', 'twelth St', '2000-09-27', 'Female', 'Applied Geography', 7.58, 'C');

SELECT * FROM student_table;

/* 3. Student Information Retrieval 
Develop a query to retrieve all students' information from the "student_table" and sort them in descending order by their grade */

SELECT * 
FROM student_table
ORDER BY grade ASC;

/* 4. Query for Male Students: 
Implement a query to retrieve information about all male students from the "student_table." */

SELECT *
FROM student_table
WHERE gender = 'Male';

/* 5. Query for Students with GPA less than 5.0 
Create a query to fetch the details of students who have a GPA less than 5.0 from the "student_table." */

SELECT *
FROM student_table
WHERE gpa < 5.0;

/* 6. Update Student Email and Grade 
Write an update statement to modify the email and grade of a student with a specific ID in the "student_table." */

UPDATE student_table
SET email_id = 'hannyboy@gmail.com',  
grade = 'A', gpa = '9.90' --  changed gpa to A grade as it has to be between 9-9.9 ( the student prior GPA was 8.65)
WHERE student_id = 1; 

select * from student_table
WHERE student_id = 1; 

/* 7. Query for Students with Grade "B" 
Develop a query to retrieve the names and ages of all students who have a grade of "B" from the "student_table." */

SELECT stu_name,
EXTRACT(YEAR FROM AGE(date_of_birth)) AS age
FROM student_table
WHERE grade = 'B';

/* 8. Grouping and Calculation 
Create a query to group the "student_table" by the "Department" and "Gender" columns and calculate the average GPA for each combination. */

SELECT department, gender, ROUND(AVG(gpa), 2) AS average_gpa
FROM student_table
GROUP BY department, gender
ORDER BY department, gender;

/* 9. Table Renaming 
Rename the "student_table" to "student_info" using the appropriate SQL statement. */

ALTER TABLE student_table
RENAME TO student_info;

/* 10. Retrieve Student with Highest GPA
Write a query to retrieve the name of the student with the highest GPA from the "student_info" table. */

SELECT stu_name
FROM student_info
ORDER BY GPA DESC
LIMIT 1;


