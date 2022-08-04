use ASPNET



--��ġ��
create table BookListPlan(
id varchar(20) references Member(id), -- ���̵������
Num Int Identity(1,1) Primary Key, -- ��ü ��ȣ (���������忡��)
--ReadCount Int Default 0, --��ȸ��
BookName varchar(100), --å�̸�
Genre varchar(30),
Author varchar(50),
ReviewStar varchar(20),
StartDay varchar(30),
EndDay varchar(30),
TermDay varchar(10), --��¥ ����

ImageName varchar(100) ,--�����̸� =
ImagePath varchar(500)
)

 

select * from Member


select * from BookListPlan



-- drop table BookListPlan



--����
select Num from BookListPlan where id = 'hong'

 


-- �ڵ������� �ö󰡴°� num���� b_num�� �ƴ�
-- b_num�� ���� ��������� ��.
-- cs���Ͽ��� ���� ������ ���� => num�󺧿� �ڵ�ī��Ʈ�ٿ��� �ǽ��� ��.



insert into BookListPlan values('dadf','�̸��� �����', '��Ÿ', '��ũ', '�ڡڡڡڡ�', '15-08-2019', '29-08-2019', '14', 'arrow.gif', 'arrow.gif')
insert into BookListPlan values('dadf','�ݹںҰ�', '�̼�', '�˷��̳�', '�ڡڡڡڡ�', '15-08-2019', '29-08-2019', '14', 'btn_back.gif', 'btn_back.gif')
insert into BookListPlan values('dadf','�̽�����', '�̼�', '�˷��̳�', '�ڡڡڡڡ�', '15-08-2019', '29-08-2019', '14', 'btn_members_01.gif', 'btn_members_01.gif')
insert into BookListPlan values('dadf','��� ����������!', '��Ÿ', '����.B', '�ڡڡڡڡ�', '15-08-2019', '29-08-2019', '14', 'btn_buy.gif', 'btn_buy.gif')
insert into BookListPlan values('dadf','����õ�ڹ�', '�ι���', '�ϴ� �����̹�', '�ڡڡڡڡ�', '15-08-2019', '29-08-2019', '14', 'comm_menu_button1_1.gif', 'comm_menu_button1_1.gif')


insert into BookListPlan values('hong','������ ����', '�ι���', '�˷��̳�', '�ڡڡڡ١�', '15-08-2019', '29-08-2019', '14', 'comm_menu_button1_1.gif', 'comm_menu_button1_1.gif')
insert into BookListPlan values('hong','������', '�̼�', '��Ī', '�ڡڡڡڡ�', '15-08-2019', '29-08-2019', '14', 'BookClubButton.png', 'BookClubButton.png')
insert into BookListPlan values('hong','������ ����', '��Ÿ', '�ϴ� �����̹�', '�ڡ١١١�', '15-08-2019', '29-08-2019', '14', 'bt_top_sch.gif', 'bt_top_sch.gif')
insert into BookListPlan values('hong','�ι��� ����', '�ι���', '����.B', '�ڡڡ١١�', '15-08-2019', '29-08-2019', '14', 'btn_attendance_03.gif', 'btn_attendance_03.gif')


insert into BookListPlan values('mama','�̹� ���ִ��� ���ο� ����', '��Ÿ', '�ڱ�', '�ڡڡڡڡ�', '15-08-2019', '29-08-2019', '14', 'btn_more.gif', 'btn_more.gif')






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


Save_BookListPlan 'mama', 'ȣ���� ����', '�帣', 'ȣ���� ����� ����', '�ڡڡڡڡ�', '24-08-2019', '29-08-2019', '5', '7318e64f-e427-4e1e-9954-1af981ac800bK-102.jpg', '7318e64f-e427-4e1e-9954-1af981ac800bK-102.jpg'

Save_BookListPlan 'mama', '�ֳ���', '����-����/ȣ��', '���ӽ� ��', '�ڡڡڡ١�', '24-08-2019', '29-08-2019', '5', '434c0ed5-a019-42fb-8c7c-524212ba7cfeK-102.jpg', '434c0ed5-a019-42fb-8c7c-524212ba7cfeK-102.jpg'

Save_BookListPlan 'dadf', 'Why?', '����', '���мҳ� Ž���', '�ڡڡڡ١�', '24-08-2019', '29-08-2019', '5', '1a7316e9-6bcc-48ca-9c52-5a6d7ce13413btn_l.gif', '1a7316e9-6bcc-48ca-9c52-5a6d7ce13413btn_l.gif'


 

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



