# Bài 1 + Bài 2
drop database IF exists `SQL_buoi1`;
create database if not exists `SQL_buoi1`;
use `SQL_buoi1`;
drop table if exists `department`;
CREATE TABLE IF NOT EXISTS `department` (
    `DepartmentID` TINYINT PRIMARY KEY AUTO_INCREMENT,
    `DepartmentName` VARCHAR(50) NOT NULL
);
insert into `department`(`DepartmentName`)
values	('P1'),
		('P2'),
        ('P3'),
        ('P4'),
        ('P5'),
        ('P6'),
        ('P7'),
        ('P8'),
        ('P9'),
        ('P10');
drop table if exists `position`;
CREATE TABLE IF NOT EXISTS `position` (
    `positionID` TINYINT PRIMARY KEY AUTO_INCREMENT,
    `positionname` VARCHAR(50) NOT NULL
);
insert into `position`(`positionname`)
values	('Giam doc'),
		('Truong phong'),
		('Pho phong'),
		('Nhan vien'),
		('Nhan vien'),
		('Marketing'),
		('Sales'),
		('Le tan'),
		('Tro ly'),
		('Bao ve');
drop table if exists `account`;
CREATE TABLE IF NOT EXISTS `account` (
    `accountID` TINYINT PRIMARY KEY AUTO_INCREMENT,
    `email` VARCHAR(50) UNIQUE KEY NOT NULL,
    `username` VARCHAR(50) UNIQUE KEY NOT NULL,
    `fullname` VARCHAR(50) NOT NULL,
    `departmentID` TINYINT NOT NULL,
    `positionID` TINYINT NOT NULL,
    `createDate` DATE
);
insert into `account`(`email`,`username`,`fullname`,`departmentID`,`positionID`,`createdate`)
values	('trandung123@gmail.com','dungtran','Tran Dung','1','1','2021-1-1'),
		('tran277@gmail.com','dungtrang','Tran Du','2','2','2021-11-1'),
		('dung213@gmail.com','dung','Tran Hoa','3','3','2021-1-11'),
		('anhdung123@gmail.com','dutra','Tra','4','4','2021-2-2'),
		('hoa1234@gmail.com','hoa','Tran Hoang','5','5','2021-12-21'),
		('lam123@gmail.com','lam','Tran Lam','6','6','2021-12-21'),
		('trung123@gmail.com','trung','Tran Trung','7','7','2021-12-21'),
		('Lan123@gmail.com','lan','Tran Lan','8','8','2021-12-21'),
		('hai123@gmail.com','hai','Tran Hai','9','9','2021-12-21');
drop table if exists `group`;
CREATE TABLE IF NOT EXISTS `group` (
    `groupID` TINYINT PRIMARY KEY AUTO_INCREMENT,
    `groupname` VARCHAR(50) NOT NULL,
    `creatorID` VARCHAR(50) NOT NULL,
    `Createdate` DATE
);
insert into `group`(`groupname`,`creatorID`,`Createdate`)
values	('Sao Kim','1','2021-1-1'),
		('Sao Hoa','2','2021-12-1'),
		('Sao Thuy','3','2021-1-12'),
		('Sao Moc','4','2021-1-11'),
		('Trai dat','5','2021-3-1'),
		('Anh sang','6','2021-3-2'),
		('Nuoc','7','2021-9-11'),
		('Nui','8','2021-4-5'),
		('Thien nhien','9','2021-5-6'),
		('Dai duong','10','2021-6-7');
drop table if exists `groupaccount`;
CREATE TABLE IF NOT EXISTS `groupaccount` (
    `groupID` TINYINT UNSIGNED primary key auto_increment,
    `accountID` TINYINT NOT NULL,
    `joindate` DATE
);
insert into `groupaccount`(`accountID`,`joindate`)
values	('1','2021-1-1'),
		('2','2021-11-1'),
		('3','2021-1-12'),
		('4','2021-1-11'),
		('5','2021-3-1'),
		('6','2021-4-1'),
		('7','2021-3-5'),
		('8','2021-3-6'),
		('9','2021-7-1'),
		('10','2021-8-1');
drop table if exists `typequestion`;
CREATE TABLE IF NOT EXISTS `typequestion` (
    `TypeID` TINYINT PRIMARY KEY AUTO_INCREMENT,
    `typename` VARCHAR(500) NOT NULL
);
insert into `typequestion`(`typename`)
values	('TD1'),
		('TD2'),
		('TD3'),
		('TD4'),
		('TD5'),
        ('TD6'),
        ('TD7'),
        ('TD8'),
        ('TD9'),
        ('TD10');
drop table if exists `Categoryquestion`;
CREATE TABLE IF NOT EXISTS `Categoryquestion` (
    `CategoryID` TINYINT PRIMARY KEY AUTO_INCREMENT,
    `CategoryName` VARCHAR(50) NOT NULL UNIQUE KEY
);
insert into `Categoryquestion`(`Categoryname`)
values	('A'),
		('B'),
		('C'),
		('D'),
		('E'),
		('F'),
		('G'),
		('H'),
		('K'),
		('T');
drop table if exists `question`;
CREATE TABLE IF NOT EXISTS `Question` (
    `QuestionID` TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    `content` VARCHAR(500) NOT NULL,
    `CategoryID` TINYINT NOT NULL,
    `TypeID` TINYINT NOT NULL,
    `CreatorID` TINYINT NOT NULL,
    `Createdate` DATE
);
insert into `question`(`content`,`CategoryID`,`TypeID`,`CreatorID`,`Createdate`)
values ('Hoi ve Java', 1, '1', '1', '2021-1-5'),
       ('Hoi ve PHP', 2, '2', '2', '2021-2-2'),
       ('Hoi ve C#', 3, '3', '3', '2021-3-4'),
       ('Hoi ve Ruby', 4, '4', '4', '2021-5-6'),
       ('Hoi ve Postman', 5, '5', '5', '2021-6-7'),
       ('Hoi ve ADO.NET', 6, '6', '6', '2021-7-8'),
       ('Hoi ve ASP.NET', 7, '7', '7', '2021-8-9'),
       ('Hoi ve C++', 8, '8', '8', '2021-9-7'),
       ('Hoi ve SQL', 9, '9', '9', '2021-9-10'),
       ('Hoi ve Python', 10, '10', '10', '2021-6-9');
drop table if exists `anwser`;
CREATE TABLE IF NOT EXISTS `answer` (
    `answerID` TINYINT PRIMARY KEY AUTO_INCREMENT,
    `content` VARCHAR(500) NOT NULL,
    `QuestionID` TINYINT UNSIGNED NOT NULL,
    `isCorrect` ENUM('T', 'F'),
    CONSTRAINT fk_question FOREIGN KEY (QuestionID)
        REFERENCES Question (QuestionID)
);
insert into `Answer` (`Content`,`QuestionID`,`isCorrect`)
values ('Tra loi 01', 1, 'T'),
       ('Tra loi 02', 2, 'F'),
       ('Tra loi 03', 3, 'F'),
       ('Tra loi 04', 4, 'T'),
       ('Tra loi 05', 5, 'T'),
       ('Tra loi 06', 6, 'F'),
       ('Tra loi 07', 7, 'F'),
       ('Tra loi 08', 8, 'T'),
       ('Tra loi 09', 9, 'T'),
       ('Tra loi 10', 10, 'F');
drop table if exists `exam`;
CREATE TABLE IF NOT EXISTS `Exam` (
    `ExamID` TINYINT PRIMARY KEY AUTO_INCREMENT,
    `Code` VARCHAR(10) NOT NULL,
    `title` VARCHAR(20) NOT NULL,
    `CategoryID` TINYINT NOT NULL,
    `duration` TINYINT,
    `creatorID` TINYINT NOT NULL,
    `Createdate` DATE
);
insert into `Exam` (`Code`,`Title`,`CategoryID`,`Duration`,`CreatorID`,`CreateDate`)
values ('A1', 'Đe thi C#', 1, 60, '1', '2021-1-2'),
       ('A2', 'Đe thi PHP', 2, 90, '2', '2021-2-3'),
       ('A3', 'Đe thi C++', 3, 90, '3', '2021-3-4'),
       ('A4', 'Đe thi Java', 4, 120, '4', '2021-4-5'),
       ('A5', 'Đe thi Ruby', 5, 60, '5', '2021-5-6'),
       ('A6', 'Đe thi Postman', 6, 90, '6', '2021-6-7'),
       ('A7', 'Đe thi SQL', 7, 90, '7', '2021-7-8'),
       ('A8', 'Đe thi Python', 8, 120, '8', '2021-8-9'),
       ('A9', 'Đe thi ADO.NET', 9, 60, '9', '2021-9-10'),
       ('A10','Đe thi ASP.NET', 10, 60, '10', '2021-10-11');
drop table if exists `examquestion`;
CREATE TABLE IF NOT EXISTS `Examquestion` (
    `examID` TINYINT NOT NULL,
    `QuestionID` TINYINT NOT NULL
);
insert into ExamQuestion(ExamID, QuestionID)
values (1, 5),
       (2, 6),
       (3, 7),
       (4, 8),
       (5, 9),
       (6, 9),
       (7, 8),
       (8, 7),
       (9, 6),
       (10, 5);
# Bài 3
	#1. Lấy ra các phòng ban
SELECT 
    DepartmentName
FROM
    department;
	SELECT 
    DepartmentID
FROM
    department
WHERE
    DepartmentName = 'P1'
	#2. Lấy ra thông tin account có fullname dài nhất
SELECT 
    *
FROM
    `account`
WHERE
    CHARACTER_LENGTH(fullname) = (SELECT 
            MAX(CHARACTER_LENGTH(fullname))
        FROM
            `account`);
#3. Lấy ra account có fullname dài nhất và thuộc phòng ban có ID =3 
SELECT 
    `fullname`, `departmentID`
FROM
    `account`
WHERE
    (CHARACTER_LENGTH(fullname) = (SELECT 
            MAX(CHARACTER_LENGTH(fullname))
        FROM
            `account`))
        AND (`departmentID` = '3');
	#4.  Lấy tên group đã tham gia trước ngày 20/12/2019
SELECT 
    groupname, DATE(createdate)
FROM
    `group`
WHERE
    createdate < '2019-12-20';	
	#5.  Lấy ra ID của question có >= 4 câu trả lời
SELECT 
    questionID, COUNT(questionID) AS ` so cau tra loi`
FROM
    answer
WHERE
    `so cau tra loi` >= 4;
	#6.  lấy ra các mã đề có thời gian thi >=60 phút và tạo trước ngày 20/12/2019
SELECT 
    `code`, `duration`, `createdate`
FROM
    `exam`
WHERE
    duration >= 60
        AND createdate <= '2021-2-20';
	#7.  lấy ra 5 group được tạo gần đây nhất
SELECT 
    `groupname`, `createdate`
FROM
    `group`
ORDER BY createdate DESC
LIMIT 5;
	#8  Đếm số lượng nhân viên thuộc department có ID =2
SELECT 
    `departmentID`, COUNT(departmentID) AS ` so_nhan_vien`
FROM
    `account`
GROUP BY `departmentID`
HAVING departmentID = 2;
	#9.  Lấy ra nhân viên có tên bắt đầu bằng chữ D và kết thúc bằng chữ O
SELECT 
    *
FROM
    `account`
WHERE
    fullname LIKE 'D%o';
	#10.  xoa tất cả các exam được tạo trước 20/12/2019
DELETE FROM exam 
WHERE
    createdate <= '2019-12-20';
	#11. Xóa tất cả các question có nội dung bắt đầu bằng từ 'Câu hỏi'
DELETE FROM question 
WHERE
    content LIKE 'Câu hỏi%'
	#12.  update thông tin của account có id =5 thành tên Nguyễn Bá Lộc và email thành loc.nguyenba@vti.com.vn
UPDATE `account` 
SET 
    `fullname` = 'Nguyễn Bá Lộc',
    email = 'loc.nguyenba@vti.com.vn'
WHERE
    accountID = 5
	#13.  update account có ID =5 thuộc group có ID =4 
UPDATE `groupAccount` 
SET 
    `groupID` = 4
WHERE
    `accountID` = 5;
# BÀI 4
	#1.  Viết lệnh để lấy danh sách nhân viên và thông tin phòng ban của
SELECT 
    B1.Email, B1.Username, B1.FullName, B2.DepartmentName
FROM
    `Account` B1
        INNER JOIN
    Department B2 ON B1.DepartmentID = B2.DepartmentID;
    #2.  Viết lệnh để lấy ra thông tin các account được tạo sau ngày 20/12/2010
SELECT
    *
FROM
    account
WHERE
    createDate >= '2020-12-20'
	#3.  Viết lệnh để lấy ra tất cả các developer
SELECT 
    B1.FullName, B1.Email, B2.PositionName
FROM
    `Account` B1
        INNER JOIN
    Position B2 ON B1.PositionID = B2.PositionID
WHERE
    B2.PositionName = 'Dev';
	#4.  Viết lệnh để lấy ra danh sách các phòng ban có lớn hơn 3 nhân viên
SELECT 
    B2.DepartmentName, COUNT(B1.DepartmentID) AS ' Số lượng'
FROM
    account B1
        INNER JOIN
    department B2 ON B1.DepartmentID = B2.DepartmentID
GROUP BY B1.DepartmentID
HAVING COUNT(B1.DepartmentID) > 3;
	#5.  Viết lệnh để lấy ra câu hỏi được sử dụng trong để thi nhiều nhất
SELECT 
    B1.QuestionID, B2.Content
FROM
    examquestion B1
        INNER JOIN
    question B2 ON B2.QuestionID = B2.QuestionID
GROUP BY B1.QuestionID
HAVING COUNT(B1.QuestionID) = (SELECT 
        MAX(countQues) AS maxcountQues
    FROM
        (SELECT 
            COUNT(B1.QuestionID) AS countQues
        FROM
            examquestion B2
        GROUP BY B1.QuestionID) AS countTable);
	#6.  Thống kê mỗi Category question được sử dụng trong bao nhiêu question
SELECT 
    B1.CategoryID, B1.CategoryName, COUNT(B2.CategoryID)
FROM
    categoryquestion B1
        JOIN
    question B2 ON B1.CategoryID = B2.CategoryID
GROUP BY B2.CategoryID
	#7.  Thống kê mỗi question được sử dụng trong bao nhiêu exam
SELECT 
    B1.QuestionID, B1.Content, COUNT(B2.QuestionID)
FROM
    examquestion B2
        RIGHT JOIN
    question B1 ON B1.QuestionID = B2.QuestionID
GROUP BY B1.QuestionID;
	#8. Lấy ra question có nhiều câu trả lời nhất
SELECT 
    B1.QuestionID, B1.Content, COUNT(B2.QuestionID)
FROM
    answer B2
        INNER JOIN
    question B1 ON B1.QuestionID = B2.QuestionID
GROUP BY B2.QuestionID
HAVING COUNT(B2.QuestionID) = (SELECT 
        MAX(countQues)
    FROM
        (SELECT 
            COUNT(B1.QuestionID) AS countQues
        FROM
            answer B1
        GROUP BY B1.QuestionID) AS countAnsw);
	#9.  Thống kê số lượng account trong mỗi group
SELECT 
    B1.Content, COUNT(B2.QuestionID) AS 'SO LUONG'
FROM
    Question B1
        LEFT JOIN
    ExamQuestion B2 ON B2.QuestionID = B1.QuestionID
GROUP BY B1.QuestionID
ORDER BY B2.ExamID ASC;
	#10.  Tìm chức vụ có ít người nhất
SELECT 
    B1.Content, COUNT(B2.QuestionID) AS 'SO LUONG'
FROM
    Question B1
        LEFT JOIN
    ExamQuestion B2 ON B2.QuestionID = B1.QuestionID
GROUP BY B1.QuestionID
ORDER BY B2.ExamID ASC;
	#11. Thống kê mỗi phòng ban có bao nhiêu dev, test, scrum master, PM
SELECT 
    B1.DepartmentID,
    B1.DepartmentName,
    B2.PositionName,
    COUNT(B2.PositionName)
FROM
    `account` B3
        INNER JOIN
    department B1 ON B3.DepartmentID = B1.DepartmentID
        INNER JOIN
    position B2 ON B3.PositionID = B2.PositionID
GROUP BY B1.DepartmentID , B2.PositionID;
	#12.  Lấy thông tin chi tiết các câu hỏi bao gồm: 
    # thông tin cơ bản của question, loại câu hỏi, ai là người tạo ra câu hỏi, câu trả lời là gì...   
SELECT 
    B1.Content, COUNT(B2.QuestionID) AS 'SO LUONG'
FROM
    Question B1
        LEFT JOIN
    ExamQuestion B2 ON B2.QuestionID = B1.QuestionID
GROUP BY B1.QuestionID
ORDER BY B2.ExamID ASC;
	#13.  lấy số lượng câu hỏi của mỗi loại tự luận hay trắc nghiệm
SELECT 
    B1.TypeID, B1.TypeName, COUNT(B2.TypeID) AS 'Số lượng'
FROM
    question B2
        INNER JOIN
    typequestion B1 ON B2.TypeID = B1.TypeID
GROUP BY B1.TypeID;
	#14.  Lấy ra group không có account nào (sử dụng left join)
SELECT 
    *
FROM
    `group` B1
        LEFT JOIN
    groupaccount B2 ON B1.GroupID = B2.GroupID
WHERE
    B2.AccountID IS NULL
    #15.  Lấy ra group không có account nào (sử dụng right join)
SELECT 
    *
FROM
    groupaccount B2
        RIGHT JOIN
    `group` B1 ON B2.GroupID = B1.GroupID
WHERE
    B2.AccountID IS NULL;
	#16.  Lấy ra question không có anwser nào
SELECT 
    *
FROM
    Question
WHERE
    QuestionID NOT IN (SELECT 
            QuestionID
        FROM
            Answer);
	#17.  Lấy ra account thuộc nhóm 1
SELECT 
    B1.FullName
FROM
    `Account` B1
        JOIN
    GroupAccount B2 ON B1.AccountID = B2.AccountID
WHERE
    B2.GroupID = 1;
    #18.  Lấy ra account thuộc nh
SELECT 
    B1.FullName
FROM
    Account B1
        JOIN
    GroupAccount B2 ON B1.AccountID = B2.AccountID
WHERE
    B2.GroupID = 2
	#19.   Ghép 2 kết quả từ câu a) và câu b) sao cho không có record nào trùng nhau
SELECT 
    B1.FullName
FROM
    `Account` B1
        JOIN
    GroupAccount B2 ON B1.AccountID = B2.AccountID
WHERE
    B2.GroupID = 1 
UNION SELECT 
    B1.FullName
FROM
    `Account` B1
        JOIN
    GroupAccount B2 ON B1.AccountID = B2.AccountID
WHERE
    B2.GroupID = 2;
	#20.  Lấy các group có lớn hơn 5 thành viên
SELECT 
    B1.GroupName, COUNT(B2.GroupID) AS 'Số lượng'
FROM
    GroupAccount B2
        JOIN
    `Group` B1 ON B2.GroupID = B1.GroupID
GROUP BY B1.GroupID
HAVING COUNT(B2.GroupID) >= 5;
 #21.  Lấy các group có lớn hơn 7 thành viên
SELECT 
    B1.GroupName, COUNT(B2.GroupID) AS 'Số lượng'
FROM
    GroupAccount B2
        JOIN
    `Group` B1 ON B2.GroupID = B1.GroupID
GROUP BY B1.GroupID
HAVING COUNT(B2.GroupID) <= 7;
	#22.  Ghép 2 kết quả từ câu a) và câu b
SELECT 
    B1.GroupName, COUNT(B2.GroupID) AS 'Số lượng'
FROM
    GroupAccount B2
        JOIN
    `Group` B1 ON B2.GroupID = B1.GroupID
GROUP BY B1.GroupID
HAVING COUNT(B2.GroupID) >= 5 
UNION SELECT 
    B1.GroupName, COUNT(B2.GroupID) AS 'Số lượng'
FROM
    GroupAccount B2
        JOIN
    `Group` B1 ON B2.GroupID = B1.GroupID
GROUP BY B1.GroupID
HAVING COUNT(B2.GroupID) <= 7;
	# BÀI 5
	#1.  Tạo view có có chứa danh sách nhân viên thuộc phòng ban Sale
drop view if exists V_acd;
CREATE VIEW V_acd AS
    (SELECT 
        accountID, departmentName
    FROM
        `account` A
            JOIN
        `department` B USING (DepartmentID)
    GROUP BY accountID
    HAVING DepartmentName = 'sale');
SELECT 
    *
FROM
    V_acd;

	#2. Tạo view có chứa thông tin  các account tham gia vào nhiều group nhất
with CTE_abc as ( 
select A.accountID, A.fullname, count(groupID)
from `account` A 
join `groupaccount` B
Using (accountID)
group by accountID)
SELECT 
    *
FROM
    CTE_abc;
	#3.  Tạo view có chứa câu hỏi có những content quá dài (content có quá 300 từ được coi là quá dài) và 
	# xóa nó đi
drop view if exists V_abc;
CREATE VIEW V_abc AS
    SELECT 
        *
    FROM
        question
    WHERE
        CHARACTER_LENGTH(content) > 300;

	#4.  Tạo view có chứa danh sách các phòng ban có nhiều nhân viên nhất 
with CTE_NVN as(
select A.departmentID, count(accountID), DepartmentName
from `account` A
join department B
using(departmentID)
group by departmentID)
Select*from CTE_NVN;
	#5.  Tạo view có chưa tất cả các câu hỏi do user họ "Nguyễn" tạo ra
with CTE_N as(
select A.Fullname, B.QuestionID, B.content, B.creatorID
from `question` B
join `account` A on A.accountID = B.CreatorID
where A.fullname = 'Nguyễn%')
select * from CTE_N
# BÀI 6
	#1. Tạo store để người dùng nhập vào tên phòng ban và in ra tất cả các
	# account thuộc phòng ban đó
drop procedure if exists store_account;
delimiter $$
create procedure store_account()
begin 
select A.departmentName, B.departmentID, B.accountID
from `account` B
join `department` A on A.departmentID = B.departmentID;
end $$

delimiter ;
call store_account;
	#2.  Tạo story để in ra số lượng account trong mỗi group
drop procedure if exists store_SL;
delimiter $$
create procedure store_SL()
begin 
select  A.groupID, count(accountID) as num
from `group` A
join groupaccount B on A.groupID = B.groupID
group by A.groupID;
end $$
delimiter ;
call store_SL;
	#3. Tạo ra story để thống kê type question có bao nhiêu question được tạo trong tháng hiện tại
drop procedure if exists store_SLQ;
delimiter $$
create procedure store_SLQ()
begin
select count(questionID) as num1, A.typeID, A.typename
from `typequestion` A
join `question` B on B.typeID = A.typeID
where month(createdate) = month(now())
	and year(createdate) = year(now())
group by A.typeID;
end $$
delimiter ;
call store_SLQ;
	#4.  Tạo store để trả ra ID của type question có nhiều câu hỏi nhất
drop procedure if exists store_QM;
delimiter $$
create procedure store_QM(in abc tinyint,out store_id int unsigned)
begin
select A.typeID, count(questionID) 
from `typequestion` A 
join question B on A.typeID = B.typeID
group by A.typeID
order by count(questionID) 
limit 1;
end $$
delimiter ;
#5.  Sử dụng store ở question 4 để tìm ra tên của type question
set @a= '';
call store_QM('10',@a);
select @a;
#6.  Viết 1 store cho phép người dùng nhập vào 1 chuỗi và trả về group có tên chứa chuỗi của người 
# dùng nhập vào hoặc trả về user có username chứa chuỗi của người dùng nhập vào 
drop procedure if exists store_GR;
delimiter $$
create procedure store_GR(in abc varchar(50), out abcd varchar(50))
begin
    select  GroupName as Name
    from `Group` G
    where GroupName like concat('%', abc, '%')
    union
    select  username as Name
    from Account
    where username like concat('%', abc, '%');
end $$
delimiter ;
#7.  Viết store cho phép người dùng nhập vào thông tin fullname, email và trong story sẽ tự động gán:
# username sẽ giống email nhưng bỏ phần @..mail đi
# positionID: sẽ có default là developer 
# departmentID: sẽ được cho vào 1 phòng chờ 
# Sau đó in ra kết quả tạo thành công

drop procedure if exists store_AB;
delimiter $$
create procedure store_AB(in fullname varchar(50), in email varchar(50))
begin

    select PositionID from Position where PositionName like '%dev%' limit 1;
    set user_name = left(@email, 20);
    insert into Account(email, username, fullname, PositionID, createdate)
    values (email_in, user_name, full_name, position_id, curdate());
    select 'thanh cong';
end $$
delimiter ;

#8.  Viết 1 store cho phép người dùng nhập vào Essay  hoặc Multiple_ choice để thống kê câu hỏi 
# essay hoặc multiple_choice nào có content dài nhất 
drop procedure if exists store_QSM;
delimiter $$
create procedure store_QSM(in abc enum('essay', 'multiple_choice'))
begin 
declare length_max 
end $$

delimiter ;
#9.  Viết 1 store cho phép người dùng xóa exam dựa vào ID 
drop procedure if exists store_DEX;
delimiter $$
create procedure store_DEX (in exam_ID tinyint)
begin if exists(select * from exam where examID = exam_ID)
then begin delete from exam where exam_ID = examID;
end; end if;
end $$
delimiter ;
#10.  Tìm ra các exam được tạo từ 3 năm trước và xóa các exam đó đi (sử dụng store ở câu 9 để xóa)
# Sau đó in số lượng record đã removed từ các table liên quan trong khi removing 
drop procedure if exists store_ER;
delimiter $$
create procedure store_ER

#11.  Viết story cho phép người dùng xóa phòng ban bằng cách người dùng nhập vào tên phòng ban và 
# các account thuộc phòng ban đó sẽ được chuyển về phòng ban default là phòng ban chờ việc 

#12.  Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong năm nay

#13.  Viết store để in ra mỗi tháng có bao nhiêu câu hỏi được tạo trong 6 tháng gần đây nhất
#(Nếu tháng nào không có thì sẽ in ra là "không có câu hỏi nào trong tháng")

 