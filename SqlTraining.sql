--1. create new database, schema and table
CREATE DATABASE onlineschool;
USE onlineschool;
CREATE TABLE student (
	studentid INT NOT NULL,
	name VARCHAR(255)
);
CREATE TABLE course (
	courseid INT NOT NULL,
	name VARCHAR(255)
);
CREATE TABLE enrollment (
	courseid INT NOT NULL, 
	studentid INT NOT NULL
);
--2. drop database and table
DROP TABLE student;
DROP TABLE course;
DROP TABLE enrollment;
DROP DATABASE onlineschool;

CREATE DATABASE onlineschool;
USE onlineschool;
CREATE TABLE student (
	studentid INT NOT NULL,
	name VARCHAR(255)
);
CREATE TABLE course (
	courseid INT NOT NULL,
	name VARCHAR(255)
);
CREATE TABLE enrollment (
	courseid INT NOT NULL, 
	studentid INT NOT NULL
);
--3. alter table to add unique, primary and foreign key constraints
ALTER TABLE student CHANGE studentid studentid INT AUTO_INCREMENT UNIQUE PRIMARY KEY;
ALTER TABLE course CHANGE courseid courseid INT AUTO_INCREMENT UNIQUE PRIMARY KEY;
ALTER TABLE enrollment 
	ADD FOREIGN KEY (studentid) REFERENCES student(studentid), 
	ADD FOREIGN KEY (courseid) REFERENCES course(courseid)
;

--4. insert values to all 3 tables
INSERT INTO student (name) VALUES ("Miguel");
INSERT INTO student (name) VALUES ("Pedro");
INSERT INTO student (name) VALUES ("Fernando");
INSERT INTO student (name) VALUES ("Ernesto");
INSERT INTO student (name) VALUES ("Leonardo");

INSERT INTO course (name) VALUES ("JAVA FUNDAMENTALS");
INSERT INTO course (name) VALUES ("JAVA II");
INSERT INTO course (name) VALUES ("JAVA III");
INSERT INTO course (name) VALUES ("MYSQL FUNDAMENTALS");
INSERT INTO course (name) VALUES ("MYSQL II");
INSERT INTO course (name) VALUES ("GIT FUNDAMENTALS");
INSERT INTO course (name) VALUES ("GIT FOR PROFESSIONALS");
INSERT INTO course (name) VALUES ("REST SERVICES");
INSERT INTO course (name) VALUES ("SPRING BOOT FUNDAMENTALS");

INSERT INTO enrollment (courseid,studentid) VALUES (2,1);
INSERT INTO enrollment (courseid,studentid) VALUES (4,1);
INSERT INTO enrollment (courseid,studentid) VALUES (2,3);
INSERT INTO enrollment (courseid,studentid) VALUES (5,3);
INSERT INTO enrollment (courseid,studentid) VALUES (7,4);
INSERT INTO enrollment (courseid,studentid) VALUES (2,4);
INSERT INTO enrollment (courseid,studentid) VALUES (4,3);

--5. delete a few courses
DELETE FROM course WHERE name = "JAVA FUNDAMENTALS";
DELETE FROM course WHERE name = "JAVA III";
--6.fetch all the student details who have courses enrolled and all students who have not enrolled also
SELECT * FROM student;
--7. get the number of students enrolled all the courses
SELECT COUNT(DISTINCT studentid) FROM enrollment;
--8. get the course name with the maximum number of enrollments
SELECT name FROM course WHERE courseid = (SELECT courseid FROM enrollment GROUP BY courseid HAVING COUNT(*) > 1 LIMIT 1);



