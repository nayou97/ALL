use ASPNET



--고치기
create table BookListPlan(
id varchar(20) references Member(id), -- 아이디계정별
Num Int Identity(1,1) Primary Key, -- 전체 번호 (관리자입장에서)
--ReadCount Int Default 0, --조회수
BookName varchar(100), --책이름
Genre varchar(30),
Author varchar(50),
ReviewStar varchar(20),
StartDay varchar(30),
EndDay varchar(30),
TermDay varchar(10), --날짜 세기

ImageName varchar(100) ,--파일이름 =
ImagePath varchar(500)
)

 

select * from Member


select * from BookListPlan



-- drop table BookListPlan



--예시
select Num from BookListPlan where id = 'hong'

 


-- 자동적으로 올라가는건 num이지 b_num이 아님
-- b_num은 직접 지정해줘야 함.
-- cs파일에서 직접 지정할 것임 => num라벨에 자동카운트다운을 실시할 것.



insert into BookListPlan values('dadf','이름을 몰라요', '기타', '루크', '★★★★★', '15-08-2019', '29-08-2019', '14', 'arrow.gif', 'arrow.gif')
insert into BookListPlan values('dadf','반박불가', '미술', '알레이나', '★★★★★', '15-08-2019', '29-08-2019', '14', 'btn_back.gif', 'btn_back.gif')
insert into BookListPlan values('dadf','이심전심', '미술', '알레이나', '★★★★★', '15-08-2019', '29-08-2019', '14', 'btn_members_01.gif', 'btn_members_01.gif')
insert into BookListPlan values('dadf','고고 디지몬헌터!', '기타', '베리.B', '★★★★★', '15-08-2019', '29-08-2019', '14', 'btn_buy.gif', 'btn_buy.gif')
insert into BookListPlan values('dadf','마법천자문', '인문학', '니니 프라이버', '★★★★★', '15-08-2019', '29-08-2019', '14', 'comm_menu_button1_1.gif', 'comm_menu_button1_1.gif')


insert into BookListPlan values('hong','세상을 향해', '인문학', '알레이나', '★★★☆☆', '15-08-2019', '29-08-2019', '14', 'comm_menu_button1_1.gif', 'comm_menu_button1_1.gif')
insert into BookListPlan values('hong','구하자', '미술', '왕칭', '★★★★☆', '15-08-2019', '29-08-2019', '14', 'BookClubButton.png', 'BookClubButton.png')
insert into BookListPlan values('hong','디지털 세상', '기타', '니니 프라이버', '★☆☆☆☆', '15-08-2019', '29-08-2019', '14', 'bt_top_sch.gif', 'bt_top_sch.gif')
insert into BookListPlan values('hong','인문의 미학', '인문학', '베리.B', '★★☆☆☆', '15-08-2019', '29-08-2019', '14', 'btn_attendance_03.gif', 'btn_attendance_03.gif')


insert into BookListPlan values('mama','미미 공주님의 새로운 세상', '기타', '자까', '★★★★★', '15-08-2019', '29-08-2019', '14', 'btn_more.gif', 'btn_more.gif')






--Create a stored procedure to fetch the Book records and bind in DataList
CREATE PROCEDURE Bind_BookListPlan
	@id varchar(50)
AS
BEGIN
   select * from BookListPlan where id = @id
END



Bind_BookListPlan  'hong'
Bind_BookListPlan  'dadf'


-- drop proc Bind_BookListPlan


  



CREATE PROCEDURE Save_BookListPlan
(
	 @id varchar(50),

     @BookName varchar(30),
	 @Genre varchar(10),
	 @Author varchar(50),

     @ReviewStar varchar(10),

	 @StartDay varchar(10),
	 @EndDay varchar(10),
	 @TermDay varchar(10),

	 @ImageName varchar(50),
     @ImagePath varchar(500)
)
AS
BEGIN
    insert into BookListPlan (id,BookName,Genre,Author,ReviewStar,StartDay,EndDay,TermDay,ImageName,ImagePath)
    values (@id,@BookName,@Genre,@Author,@ReviewStar,@StartDay,@EndDay,@TermDay,@ImageName,@ImagePath)
END



-- drop proc Save_BookListPlan


Save_BookListPlan 'mama', '호러를 몰라', '장르', '호러물 취재단 전원', '★★★★★', '24-08-2019', '29-08-2019', '5', '7318e64f-e427-4e1e-9954-1af981ac800bK-102.jpg', '7318e64f-e427-4e1e-9954-1af981ac800bK-102.jpg'

Save_BookListPlan 'mama', '애나벨', '문학-공포/호러', '제임스 완', '★★★☆☆', '24-08-2019', '29-08-2019', '5', '434c0ed5-a019-42fb-8c7c-524212ba7cfeK-102.jpg', '434c0ed5-a019-42fb-8c7c-524212ba7cfeK-102.jpg'

Save_BookListPlan 'dadf', 'Why?', '과학', '과학소년 탐험단', '★★★☆☆', '24-08-2019', '29-08-2019', '5', '1a7316e9-6bcc-48ca-9c52-5a6d7ce13413btn_l.gif', '1a7316e9-6bcc-48ca-9c52-5a6d7ce13413btn_l.gif'


 

--Create a stored procedure to delete the book records.



CREATE PROCEDURE Delete_BookListPlan
(
	@id varchar(20),
	@Num int
)             
AS
BEGIN
   delete from BookListPlan where Num = @Num And id = @id
END


-- drop proc Delete_BookListPlan


--Delete_BookListPlan 'hong', '1002'


--Delete from BookListPlan where Num = 8



