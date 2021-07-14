DROP DATABASE IF EXISTS QUAN_LY_DIEM;
CREATE DATABASE QUAN_LY_DIEM;
USE QUAN_LY_DIEM;

#QUESTION1 Tạo table với các ràng buộc và kiểu dữ liệu 
# Thêm ít nhất 3 bản ghi vào table
DROP TABLE IF EXISTS `student`;
create table `student`(
`ID` tinyint primary key,
`name` varchar(50),
`age` tinyint,
`gender` enum('Nam','Nữ'));

drop table if exists `subject`;
create table `subject`(
`ID` varchar(10) primary key,
`Name` varchar(50));

drop table if exists `StudentSubject`;
create table `StudentSubject`(
 `StudentID` varchar(20),
 `SubjectID` varchar(20),
 `Mark` tinyint,
 `Date` date,
 CONSTRAINT `hoc_sinh` PRIMARY KEY (`StudentID`,`SubjectID`));
 
 insert into `Student` values(1,'Trần Văn A', '20','Nam'),
 (2,'Nguyễn Thị B', '19','Nữ'),
 (3,'Đào Thị C', '18','Nữ'),
 (4,'Hoàng Văn D', '21','Nam'),
 (5,'Hà Minh E', '22','Nữ'),
 (6,'Đỗ Thị F', '24','Nữ'),
 (7,'Lê Văn G', '25','Nam'),
 (8,'Đinh Thị H', '23','Nữ'),
 (9,'Lý Trần K', '26','Nam'),
 (10,'Mạc Thị T', '27','Nữ');
 
 insert into `Subject` values('M1','Môn 1'),
 ('M2','Môn 2'),
 ('M3','Môn 3'),
 ('M4','Môn 4'),
 ('M5','Môn 5'),
 ('M6','Môn 6'),
 ('M7','Môn 7'),
 ('M8','Môn 8'),
 ('M9','Môn 9'),
 ('M10','Môn 10');
 
 insert into `StudentSubject` values(1,'M1','9','2020-8-12'),
 (2,'M2','8','2020-9-2'),
 (3,'M3','9','2020-9-10'),
 (4,'M4','7','2020-9-15'),
 (5,'M5','6','2020-9-25'),
 (6,'M6','7','2020-10-12'),
 (7,'M7','8','2020-10-15'),
 (8,'M8','7','2020-10-20'),
 (9,'M9','9','2020-11-16'),
 (10,'M10','6','2020-11-20');

 #Q2. 
 #a. Lấy tất cả các môn học không có bất kì điểm nào
select A.Name, B.mark
from `subject` A
join studentsubject B on A.ID = B.subjectid
where B.mark = null
group by A.name
order by A.name;
 #b. Lấy danh sách các môn học có ít nhất 2 điểm
select A.Name, count(B.subjectid)
from `subject` A
join studentsubject B on A.ID = B.subjectid
group by A.name
having count(B.subjectid) > 1 
order by A.name;

 #Q3. Tạo view có tên là "StudentInfo" lấy các thông tin về học sinh bao gồm: 
 # Student ID,Subject ID, Student Name, Student Age, Student Gender, 
 # Subject Name, Mark, Date
 # (Với cột Gender show 'Male' để thay thế cho 0, 'Female' thay thế cho 1 và 
 # 'Unknow' thay thế cho null)
drop view if exists `StudentInfo`;
create view `StudentInfo`(studentID, subjectID, student_name, student_age, student_gender, subject_name, mark, date) 
as
select B.studentid, B.subjectid, A.name, A.age,
case A.gender when 'Nam' then 'Female' when 'Nữ' then 'Male' else 'Unknow' end,
C.name, B.mark, B.date
from student A
join studentsubject B on A.id = B.studentID
join subject C on B.subjectID = C.id;
select *from studentinfo;
#Q4.
#a. Tạo trigger cho table Subject có tên là SubjectUpdateID: Khi thay đổi data của cột ID của table Subject,
#thì giá trị tương ứng với cột SubjectID của table StudentSubject cũng thay đổi theo
drop trigger if exists `SubjectUpdateID`;
delimiter $$
create trigger `SubjectUpdateID`
after update on `Subject`
for each row
begin 
update StudentSubject set SubjectID = new.id where subjectid = old.id;
end $$
delimiter ;
#b.Tạo trigger cho table Student có tên là StudentDeleteID:Khi xóa data của cột ID của table Student, 
# thì giá trị tương ứng với cột SubjectID của table StudentSubject cũng bị xóa theo
drop trigger if exists `SubjectdeleteID`;
delimiter $$
create trigger `SubjectdeleteID`
after delete on `Student`
for each row
begin 
delete from StudentSubject where subjectid = old.id;
end $$
delimiter ;
#Q5. Viết 1 store procedure (có 2 parameters: student name) sẽ xóa tất cả các thông tin liên quan tới học sinh có cùng tên như parameter
# Trong trường hợp nhập vào student name = "*" thì procedure sẽ xóa tất cả các học sinh
drop procedure if exists DLstudent;
delimiter $$
create procedure DLstudent (in sname varchar(50))
begin
    if (sname = '*') 
    then
        delete from studentsubject;
        delete from student;
    else
        delete
        from studentsubject B
        where B.studentID in (select id from student where name = sname);
        delete from student where name = sname;
    end if;
end $$
delimiter ;