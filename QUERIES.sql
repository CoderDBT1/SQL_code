//Retrieve the highest salary offered to a student:

SELECT
    Students.StudentID,
    Students.FirstName,
    Students.LastName,
    MAX(Placements.Salary) AS HighestSalary
FROM
    Students
JOIN Placements ON Students.StudentID = Placements.StudentID
GROUP BY
    Students.StudentID, Students.FirstName, Students.LastName;

//Find the average GPA of students placed in each industry:

SELECT
    Companies.Industry,
    AVG(Students.GPA) AS AverageGPA
FROM
    Placements
JOIN Students ON Placements.StudentID = Students.StudentID
JOIN Companies ON Placements.CompanyID = Companies.CompanyID
GROUP BY
    Companies.Industry;

//List the students who have not been placed:

SELECT
    Students.StudentID,
    Students.FirstName,
    Students.LastName
FROM
    Students
LEFT JOIN Placements ON Students.StudentID = Placements.StudentID
WHERE
    Placements.StudentID IS NULL;

//Retrieve the companies and the count of students placed in each:

SELECT
    Companies.CompanyName,
    COUNT(Placements.StudentID) AS StudentCount
FROM
    Companies
LEFT JOIN Placements ON Companies.CompanyID = Placements.CompanyID
GROUP BY
    Companies.CompanyName;

//Find the students who have a GPA above the average GPA:

SELECT
    Students.StudentID,
    Students.FirstName,
    Students.LastName,
    Students.GPA
FROM
    Students
WHERE
    Students.GPA > (SELECT AVG(GPA) FROM Students);
