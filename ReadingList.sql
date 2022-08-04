use ASPNET




 create table BookPlace(
storeName varchar(30) primary key, -- 도서관명
Address varchar(10), -- 주소
genre varchar(10), -- 전화번호
)

--  drop table BookPlace





-- 



--전체 데이터
create table All_place(
seq int identity(1,1) primary key, --번호가 있어야 지도도 알아서 버튼뙇누르면 나오지.
StoreName varchar(30) not null, -- 도서관명
Address varchar(30) not null, -- 주소
phone varchar(20) not null, -- 전화번호
genre varchar(10) default '도서관' , --장르분류(도서관/서점/북카페)
Map varchar(50) --이미지파일
)


insert into All_place values('강남도서관', '서울 강남구 선릉로116길 45', '02-3448-4741', '도서관', 'bg-main.png')
insert into All_place values('강동도서관', '서울 강동구 양재대로116길 57', '02-2225-9800', '도서관', 'btn_next.gif')
insert into All_place values('강서도서관', '서울 강서구 등촌로51나길 29', '02-3219-7000', '도서관', 'bt_list.gif')


select * from All_place 


--drop table All_place



--Create a stored procedure to fetch the Book records and bind in DataList
CREATE PROCEDURE Bind_All_place
AS
BEGIN
                select * from All_place
END

Bind_All_place



CREATE PROCEDURE Save_All_place
(
@StoreName varchar(30),
@Address varchar(30),
@phone varchar(20),
@genre  varchar(10),
@Map varchar(50)
)             
AS
BEGIN
    insert into All_place (StoreName, Address, phone, genre, Map)
    values (@StoreName, @Address, @phone, @genre, @Map)
END

Save_All_place '안라자', '서울시 강남구', '010-3333-4444', '도서관', 'btn_report.gif'



--검색
create Proc Search_All_place
      @SearchField VarChar(25),
      @SearchQuery VarChar(25)
As
     Set @SearchQuery = '%' + @SearchQuery + '%'
     SELECT *
     FROM All_place
     WHERE
      (
           CASE @SearchField 
                WHEN 'StoreName' THEN StoreName
                WHEN 'Address' THEN Address
				WHEN 'phone' THEN phone 
                WHEN 'genre' THEN genre
           ELSE 
                @SearchQuery
           END
      ) 
      LIKE 
      @SearchQuery
     Order By StoreName Desc
Go


Search_All_place 'StoreName', '안'
Go


--  drop proc Search_All_place















--도서관 버튼 sql
create table library_db(
libraryName varchar(30) primary key, -- 도서관명
Address varchar(30), -- 주소
phone varchar(20), -- 전화번호
genre varchar(10) default '도서관', --장르분류(도서관/서점/북카페)
Map varchar(50) --이미지파일
)

select * from library_db 


-- drop table library_db
-- drop proc Bind_BookPlace


insert into library_db values('강남도서관', '서울 강남구 선릉로116길 45', '02-3448-4741', '도서관', 'bg-main.png')
insert into library_db values('강동도서관', '서울 강동구 양재대로116길 57', '02-2225-9800', '도서관', 'btn_next.gif')
insert into library_db values('강서도서관', '서울 강서구 등촌로51나길 29', '02-3219-7000', '도서관', 'bt_list.gif')



  

  

--서점 버튼 sql
create table BookStore_db(
BookStoreName varchar(30) primary key, -- 도서관명
Address varchar(30), -- 주소
phone varchar(20), -- 전화번호
genre varchar(10) default '서점', --장르분류(도서관/서점/북카페)
Map varchar(50) --이미지파일
)

select * from BookStore_db 


--drop table BookStore_db 


insert into BookStore_db values('일신서점', '서울 강남구 선릉로116길 45', '02-3448-4741', '서점', 'bg-main.png')
insert into BookStore_db values('청담서점', '서울 강동구 양재대로116길 57', '02-2225-9800', '서점', 'btn_next.gif')
insert into BookStore_db values('강서서점', '서울 강서구 등촌로51나길 29', '02-3219-7000', '서점', 'bt_list.gif')











create table BookCafe_db(
BookCafeName varchar(30) primary key, -- 도서관명
Address varchar(30), -- 주소
phone varchar(20), -- 전화번호
genre varchar(10) default '북카페', --장르분류(도서관/서점/북카페)
Map varchar(50) --이미지파일
)

select * from BookCafe_db 


--drop table BookCafe_db 


insert into BookCafe_db values('카페나래', '서울 강남구 선릉로116길 45', '02-3448-4741', '북카페', 'bg-main.png')
insert into BookCafe_db values('라라', '서울 강동구 양재대로116길 57', '02-2225-9800', '북카페', 'btn_next.gif')
insert into BookCafe_db values('베스킨', '서울 강서구 등촌로51나길 29', '02-3219-7000', '북카페', 'bt_list.gif')









  --예시



--Create a stored procedure to fetch the Book records and bind in DataList
CREATE PROCEDURE Bind_BookStore_db
AS
BEGIN
                select * from BookStore_db
END

Bind_BookStore_db  



 
CREATE PROCEDURE Save_BookPlace
                (
                                @storeName                  varchar(30),
                                @Address                             varchar(10),
                                @genre  varchar(10)
                )             
AS
BEGIN
                insert into BookPlace (storeName, Address, genre)
    values (@storeName, @Address, @genre)
END


Save_BookPlace '알랓', '서울', '북카페'
Save_BookPlace '커피가게', '경기', '북카페'
Save_BookPlace '부산대도서관', '부산', '도서관'



<img src="http://prt.map.naver.com/mashupmap/print?key=p1566385113257_-369744164" width="460" height="340" alt="지도 크게 보기" title="지도 크게 보기" border="0" style="vertical-align:top;"/>

<img src="http://prt.map.naver.com/mashupmap/print?key=p1566385113257_-369744164" width="460" height="340"


 

create Proc Search_BookPlace
      @SearchField VarChar(25),
      @SearchQuery VarChar(25)
As
     Set @SearchQuery = '%' + @SearchQuery + '%'
     SELECT *
     FROM BookPlace
     WHERE
      (
           CASE @SearchField 
                WHEN 'storeName' THEN storeName
                WHEN 'Address' THEN Address
                WHEN 'genre' THEN genre
           ELSE 
                @SearchQuery
           END
      ) 
      LIKE 
      @SearchQuery
     Order By storeName Desc
Go


Search_BookPlace 'storeName', '알'
Go



