use ASPNET




 create table BookPlace(
storeName varchar(30) primary key, -- ��������
Address varchar(10), -- �ּ�
genre varchar(10), -- ��ȭ��ȣ
)

--  drop table BookPlace





-- 



--��ü ������
create table All_place(
seq int identity(1,1) primary key, --��ȣ�� �־�� ������ �˾Ƽ� ��ư�������� ������.
StoreName varchar(30) not null, -- ��������
Address varchar(30) not null, -- �ּ�
phone varchar(20) not null, -- ��ȭ��ȣ
genre varchar(10) default '������' , --�帣�з�(������/����/��ī��)
Map varchar(50) --�̹�������
)


insert into All_place values('����������', '���� ������ ������116�� 45', '02-3448-4741', '������', 'bg-main.png')
insert into All_place values('����������', '���� ������ ������116�� 57', '02-2225-9800', '������', 'btn_next.gif')
insert into All_place values('����������', '���� ������ ���̷�51���� 29', '02-3219-7000', '������', 'bt_list.gif')


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

Save_All_place '�ȶ���', '����� ������', '010-3333-4444', '������', 'btn_report.gif'



--�˻�
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


Search_All_place 'StoreName', '��'
Go


--  drop proc Search_All_place















--������ ��ư sql
create table library_db(
libraryName varchar(30) primary key, -- ��������
Address varchar(30), -- �ּ�
phone varchar(20), -- ��ȭ��ȣ
genre varchar(10) default '������', --�帣�з�(������/����/��ī��)
Map varchar(50) --�̹�������
)

select * from library_db 


-- drop table library_db
-- drop proc Bind_BookPlace


insert into library_db values('����������', '���� ������ ������116�� 45', '02-3448-4741', '������', 'bg-main.png')
insert into library_db values('����������', '���� ������ ������116�� 57', '02-2225-9800', '������', 'btn_next.gif')
insert into library_db values('����������', '���� ������ ���̷�51���� 29', '02-3219-7000', '������', 'bt_list.gif')



  

  

--���� ��ư sql
create table BookStore_db(
BookStoreName varchar(30) primary key, -- ��������
Address varchar(30), -- �ּ�
phone varchar(20), -- ��ȭ��ȣ
genre varchar(10) default '����', --�帣�з�(������/����/��ī��)
Map varchar(50) --�̹�������
)

select * from BookStore_db 


--drop table BookStore_db 


insert into BookStore_db values('�Ͻż���', '���� ������ ������116�� 45', '02-3448-4741', '����', 'bg-main.png')
insert into BookStore_db values('û�㼭��', '���� ������ ������116�� 57', '02-2225-9800', '����', 'btn_next.gif')
insert into BookStore_db values('��������', '���� ������ ���̷�51���� 29', '02-3219-7000', '����', 'bt_list.gif')











create table BookCafe_db(
BookCafeName varchar(30) primary key, -- ��������
Address varchar(30), -- �ּ�
phone varchar(20), -- ��ȭ��ȣ
genre varchar(10) default '��ī��', --�帣�з�(������/����/��ī��)
Map varchar(50) --�̹�������
)

select * from BookCafe_db 


--drop table BookCafe_db 


insert into BookCafe_db values('ī�䳪��', '���� ������ ������116�� 45', '02-3448-4741', '��ī��', 'bg-main.png')
insert into BookCafe_db values('���', '���� ������ ������116�� 57', '02-2225-9800', '��ī��', 'btn_next.gif')
insert into BookCafe_db values('����Ų', '���� ������ ���̷�51���� 29', '02-3219-7000', '��ī��', 'bt_list.gif')









  --����



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


Save_BookPlace '�ˍ�', '����', '��ī��'
Save_BookPlace 'Ŀ�ǰ���', '���', '��ī��'
Save_BookPlace '�λ�뵵����', '�λ�', '������'



<img src="http://prt.map.naver.com/mashupmap/print?key=p1566385113257_-369744164" width="460" height="340" alt="���� ũ�� ����" title="���� ũ�� ����" border="0" style="vertical-align:top;"/>

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


Search_BookPlace 'storeName', '��'
Go



