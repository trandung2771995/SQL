# Bài tập bổ sung
#1 Đếm số lượng nhân viên của các phòng ban

select A. departmentID, A.departmentName,  count(accountID)
from department A 
join account B on A.departmentID = B.departmentID
group by departmentID
order by departmentID;


#2 Đếm số lượng nhân viên phòng ban Nhân sự

select A. departmentID, A.departmentName, count(accountID)
from department A
join account B on A.departmentID = B.departmentID
where A. departmentname = 'Nhân sự'
group by departmentID;

#3. Đếm số lượng nhân viên phòng Marketing và phòng Sale

select A. departmentID, A.departmentName, count(accountID)
from department A
join account B on A.departmentID = B.departmentID
where A.departmentname = 'marketing' or A.departmentname = 'sale'
group by departmentID
order by departmentID;

#4. Đếm xem mỗi phòng có bao nhiêu nhân viên Test
select  B. departmentID, B.positionID, count(accountID)
from position A
join account B on A.positionID = B.positionID
where A.positionname = 'Test'
group by departmentID
order by departmentID;

#5. Đếm xem phòng Kỹ thuật có bao nhiêu nhân viên Test

select B.departmentID, A.positionID, count(accountID)
from account B
join position A on A.positionID = B.positionID
join department C on C.departmentID = B.departmentID
where A.positionname = 'Test' and C.departmentname = 'Kỹ thuật'
group by departmentID
order by departmentID;


