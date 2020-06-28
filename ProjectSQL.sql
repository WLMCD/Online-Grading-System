/*
*	CS108 Advanced Database Systems
*	Project : Online Grading System
*	File:				Project.sql
*	Description:		The all sql for project.

*	Designer:		LIU MINGCHEN
*	ID:					17098537-I011-0055
*	E-mail:			504393241@qq.com
*/

/*create database*/
CREATE DATABASE OnlineGrade
ON
(	NAME = 'OnlineGradeData',
	FILENAME = 'D:\学习资料\作业\Project--Database\DB\OnlineGradeData.mdf',
	SIZE = 20MB,
	FILEGROWTH = 5MB )
LOG ON 
(	NAME = 'OnlineGradeLog',
	FILENAME = 'D:\学习资料\作业\Project--Database\DB\OnlineGradeLog.ldf',
	SIZE = 5MB,
	FILEGROWTH = 5MB )
	
/*create table*/
CREATE TABLE StuInfor
(
	StuID		VARCHAR(20) PRIMARY KEY NOT NULL,
	StuName		VARCHAR(50) NOT NULL,
	Gender		VARCHAR(6)	NOT NULL,
	Grade		VARCHAR(10) NOT NULL,
	Academic	VARCHAR(50) NOT NULL,
	Email		VARCHAR(50),
	PhoneNum	VARCHAR(20),
	Passwd	VARCHAR(10)		NOT NULL,
	CHECK(Gender = 'Male' OR Gender = 'Female'),
	CHECK(Grade = 'Freshman' OR Grade = 'Sophomore'
			OR Grade = 'Junior' OR Grade = 'Senior')
)

CREATE TABLE Assignment
(
	AssID		INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
	Question1	VARCHAR(500)	NOT NULL,
	Weight1		DECIMAL(18,2)	NOT NULL,
	Question2	VARCHAR(500)	NOT NULL,
	Weight2		DECIMAL(18,2)	NOT NULL,
	Question3	VARCHAR(500)	NOT NULL,
	Weight3		DECIMAL(18,2)	NOT NULL,
	Question4	VARCHAR(500)	NOT NULL,
	Weight4		DECIMAL(18,2)	NOT NULL,
	Question5	VARCHAR(500)	NOT NULL,
	Weight5		DECIMAL(18,2)	NOT NULL,
	CHECK(Weight1 >= 0),
	CHECK(Weight2 >= 0),
	CHECK(Weight3 >= 0),
	CHECK(Weight4 >= 0),
	CHECK(Weight5 >= 0)
)

CREATE TABLE Answer
(
	StuID		VARCHAR(20) REFERENCES StuInfor(StuID)   NOT NULL,
	AssID		INT			REFERENCES Assignment(AssID) NOT NULL,
	A1			VARCHAR(500) NOT NULL,
	A2			VARCHAR(500) NOT NULL,
	A3			VARCHAR(500) NOT NULL,
	A4			VARCHAR(500) NOT NULL,
	A5			VARCHAR(500) NOT NULL,
	MarkOrNot	VARCHAR(1)	 NOT NULL,
	PRIMARY KEY(StuID, AssID),
	CHECK( MarkOrNot = 'Y' OR MarkOrNot = 'N')
)

CREATE TABLE Comment
(
	StuID		VARCHAR(20) REFERENCES StuInfor(StuID)   NOT NULL,
	AssID		INT			REFERENCES Assignment(AssID) NOT NULL,
	Comment1	VARCHAR(100) NOT NULL,
	Comment2	VARCHAR(100) NOT NULL,
	Comment3	VARCHAR(100) NOT NULL,
	Comment4	VARCHAR(100) NOT NULL,
	Comment5	VARCHAR(100) NOT NULL,
	PRIMARY KEY(StuID,AssID)
)

CREATE TABLE Score
(
	StuID		VARCHAR(20) REFERENCES StuInfor(StuID)   NOT NULL,
	AssID		INT			REFERENCES Assignment(AssID) NOT NULL,
	--Actually score of this question(full mark is 100 for each question)
	Score1		decimal(18,2) NOT NULL,
	Score2		decimal(18,2) NOT NULL,
	Score3		decimal(18,2) NOT NULL,
	Score4		decimal(18,2) NOT NULL,
	Score5		decimal(18,2) NOT NULL,
	--RealScore = Score * Weight
	RealScore1	decimal(18,2) NOT NULL,
	RealScore2	decimal(18,2) NOT NULL,
	RealScore3	decimal(18,2) NOT NULL,
	RealScore4	decimal(18,2) NOT NULL,
	RealScore5	decimal(18,2) NOT NULL,
	--GPA = SUM(all realscore) / SUM(all weight)
	GPA	decimal(18,2) NOT NULL,
	CHECK(Score1 >= 0),
	CHECK(Score2 >= 0),
	CHECK(Score3 >= 0),
	CHECK(Score4 >= 0),
	CHECK(Score5 >= 0),
	CHECK(RealScore1 >= 0),
	CHECK(RealScore2 >= 0),
	CHECK(RealScore3 >= 0),
	CHECK(RealScore4 >= 0),
	CHECK(RealScore5 >= 0),
	CHECK(GPA >= 0),
)

CREATE TABLE Account
(
	ID		VARCHAR(20) NOT NULL PRIMARY KEY,
	Iden	VARCHAR(1)	NOT NULL,
	Passwd	VARCHAR(10) NOT NULL,
	CHECK( Iden = 'T' OR Iden = 'S')
)

CREATE TABLE StuAss
(
	StuID		VARCHAR(20) REFERENCES StuInfor(StuID)   NOT NULL,
	AssID		INT			REFERENCES Assignment(AssID) NOT NULL,
	Done		VARCHAR(1)	NOT NULL,
	PRIMARY KEY(StuID, AssID),
	CHECK( Done = 'Y' OR Done = 'N')
)

/*All transactions*/
/*Those transaction can't execute alone, because need data from website*/
/*Login.aspx.cs*/
--get password from account table to compare
SELECT PassWd 
FROM Account 
WHERE ID = 'uid.Text.ToString()'

--get identity from account table for redirecting
SELECT Iden 
FROM Account 
WHERE Passwd = 'pw.Text.ToString()'

/*S_Acc.aspx.cs*/
--transactions below are get data from database
SELECT StuName FROM StuInfor WHERE StuID = 'uid'
SELECT Gender FROM StuInfor WHERE StuID = 'uid'
SELECT Grade FROM StuInfor WHERE StuID = 'uid'
SELECT Academic FROM StuInfor WHERE StuID = 'uid '
SELECT Email FROM StuInfor WHERE StuID = 'uid'
SELECT PhoneNum FROM StuInfor WHERE StuID = 'uid'
SELECT Passwd FROM StuInfor WHERE StuID = 'uid'

--update student information
UPDATE StuInfor 
SET StuName = 'name.Text.ToString()', Gender = 'gender.SelectedValue', Grade = 'grade.SelectedValue',
 Academic = 'AU.SelectedValue', Email = 'Mail.Text.ToString()', 
 PhoneNum = 'PNum.Text.ToString()', PassWd = 'psd.Text.ToString()'
WHERE StuID = 'uid'

--update password
UPDATE Account 
SET PassWd = 'psd.Text.ToString()' 
WHERE ID = 'uid'

/*S_DoAss.aspx.cs*/
--get done sign, check the assginment whether have been done
SELECT	Done 
FROM StuAss 
WHERE StuID = 'uid' AND AssID = aid

--get max assignment ID which means how many assignment now have
SELECT MAX(AssID) 
FROM Assignment

--select question and weight according to the value of 'que'
SELECT	"que" 
FROM(
	SELECT AssID 
	FROM    StuInfor 
	JOIN    StuAss 
	ON    StuInfor.StuID = StuAss.StuID AND StuInfor.StuID = 'uid') AS QID 
JOIN   Assignment 
  ON    QID.AssID = Assignment.AssID AND Assignment.AssID = aid

--insert answer, default value of MarkOrNot is 'N'
INSERT Answer 
VALUES('uid', 'aid', 'a1.Text.ToString()', 'a2.Text.ToString()', 'a3.Text.ToString()',
 'a4.Text.ToString()', 'a5.Text.ToString()', 'N')

--update StuAss, set Done as 'Y', which means this assignment have done
UPDATE StuAss 
SET Done = 'Y' 
WHERE StuID = 'uid' AND AssID = aid

/*S_Mark.aspx.cs*/
--get score table
SELECT * 
FROM Score 
WHERE StuID = 'uid'

--get average of GPA
SELECT AVG(GPA) 
FROM Score 
WHERE StuID = 'uid'

--get mark sign from answer
SELECT MarkOrNot 
FROM Answer 
WHERE StuID = 'uid' AND AssID = aid.Text.ToString()

/*S_MarkAss.aspx.cs*/
--select question and weight according to the value of 'que'
SELECT	"que" 
FROM(
	SELECT AssID 
	FROM    StuInfor 
	JOIN    StuAss 
	ON    StuInfor.StuID = StuAss.StuID AND StuInfor.StuID = 'uid') AS QID 
JOIN   Assignment 
  ON    QID.AssID = Assignment.AssID AND Assignment.AssID = aid

--select information from table
SELECT	"an" FROM Answer WHERE StuID = 'uid' AND AssID = aid
SELECT	"cm" FROM Comment WHERE StuID = 'uid' AND AssID = aid
SELECT	"sc" FROM Score WHERE StuID = 'uid' AND AssID = aid
SELECT	GPA FROM Score WHERE StuID = 'uid' AND AssID = aid

/*T_AdminAcc.aspx.cs*/
--update administrator password
UPDATE Account 
SET PassWd = 'inpasswd.Text.ToString()'
WHERE ID = 'admin'

/*T_CreaAcc.aspx.cs*/
--insert student information and password. Default password is 123456
INSERT StuInfor 
VALUES('sid', 'sName', 'Gder', 'Grade', 'Academic', 'Email', 'pNum', 123456)
INSERT Account VALUES('sid', 'S', '123456')

--update stuAss, add assignment to new account
DELETE FROM StuAss 
WHERE Done = 'N' 
INSERT StuAss 
SELECT  StuID, AssID, 'N' 
FROM    StuInfor 
CROSS JOIN  Assignment 
GROUP BY StuID, AssID 
EXCEPT 
SELECT  StuID, AssID, 'N' 
FROM    StuAss 
WHERE   Done = 'Y'

/*T_CreaAss.aspx.cs*/
--insert assignment
INSERT Assignment 
VALUES('q1', 'w1', 'q2', 'w2', 'q3', 'w3', 'q4', 'w4', 'q5', 'w5')

--update stuAss, add assignment to new account
DELETE FROM StuAss 
WHERE Done = 'N' 
INSERT StuAss 
SELECT  StuID, AssID, 'N' 
FROM    StuInfor 
CROSS JOIN  Assignment 
GROUP BY StuID, AssID 
EXCEPT 
SELECT  StuID, AssID, 'N' 
FROM    StuAss 
WHERE   Done = 'Y'

/*T_EditAcc.aspx.cs*/
--get information
SELECT StuName FROM StuInfor WHERE StuID = 'SID'
SELECT Gender FROM StuInfor WHERE StuID = 'SID'
SELECT Grade FROM StuInfor WHERE StuID = 'SID'
SELECT Academic FROM StuInfor WHERE StuID = 'SID'
SELECT Email FROM StuInfor WHERE StuID = 'SID'
SELECT PhoneNum FROM StuInfor WHERE StuID = 'SID'
SELECT Passwd FROM StuInfor WHERE StuID = 'SID'

--update student information
UPDATE StuInfor 
SET StuName = 'name.Text.ToString()', Gender = 'gender.SelectedValue', Grade = 'grade.SelectedValue', 
Academic = 'AU.SelectedValue', Email = 'Mail.Text.ToString()', 
PhoneNum = 'PNum.Text.ToString()', PassWd = 'psd.Text.ToString()' 
WHERE StuID = 'SID'

--update password
UPDATE Account 
SET PassWd = 'psd.Text.ToString()' 
WHERE ID = 'SID"'

/*T_ManaAcc.aspx.cs*/
--delete data from all table
DELETE FROM StuInfor WHERE StuID = 'sid.Text.ToString()'
DELETE FROM Account WHERE ID = 'sid.Text.ToString()'
DELETE FROM StuAss WHERE StuID = 'sid.Text.ToString()'
DELETE FROM Score WHERE StuID = 'sid.Text.ToString()'
DELETE FROM Answer WHERE StuID = 'sid.Text.ToString()'
DELETE FROM Comment WHERE StuID = 'sid.Text.ToString()'

--check whether student account exist
SELECT * FROM StuInfor WHERE StuID = 'sid.Text.ToString()'

/*T_MarkAss.aspx.cs*/
--select question and weight according to the value of 'que'
SELECT	"que" 
FROM(
	SELECT AssID 
	FROM    StuInfor 
	JOIN    StuAss 
	ON    StuInfor.StuID = StuAss.StuID AND StuInfor.StuID = 'uid') AS QID 
JOIN   Assignment 
  ON    QID.AssID = Assignment.AssID AND Assignment.AssID = aid

--select answer from Answer table
SELECT	"an" FROM Answer WHERE StuID = 'Sid' AND AssID = aid

--insert comment
INSERT Comment 
VALUES('Sid', aid, 'c1.Text.ToString()', 'c2.Text.ToString()', 'c3.Text.ToString()', 
'c4.Text.ToString()', 'c5.Text.ToString()' )

--insert score
INSERT Score 
VALUES('Sid', aid, Double.Parse(s1.Text.ToString()), Double.Parse(s2.Text.ToString()),  Double.Parse(s3.Text.ToString()),
Double.Parse(s4.Text.ToString()), Double.Parse(s5.Text.ToString()), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)

--update sign to 'Y' which means this assignment have been marked
UPDATE Answer SET MarkOrNot = 'Y' WHERE StuID = 'Sid' AND AssID = aid

--after calculating, update real score   
UPDATE Score 
SET Real + sc  = "realScore" 
WHERE StuID = 'Sid' AND AssID = aid

--select each weight according to question number
SELECT	" + wei + " FROM Assignment WHERE AssID = aid

--update GPA after calculating
UPDATE Score SET GPA = GPA WHERE StuID = 'Sid' AND AssID = aid

/*T_MarkAssIndex.aspx.cs*/
--select student id whose assignment have not mark
SELECT	StuID FROM Answer WHERE MarkOrNot = 'N'

--select sign to check whether this assignment have been marked
SELECT MarkOrNot FROM Answer WHERE StuID = 'sid.Text.ToString()' AND AssID = AID.Text.ToString());



