

Create Table dbo.BookClub_Make
(
	seq int identity(1,1) not null primary key,
	
	--����1
	step1_agree varchar(10),  -- �̿��� ���ǿ��� = �����մϴ�
	
	--����2
	ClubName VarChar(50) Not Null, -- �����̸�
	Clubhyperlink VarChar(30) Not Null,  -- ��Ŭ�� Ȩ�� �ּ�
	ClubGenre VarChar(10) Not Null,  -- ��Ŭ�� �з�(��ȭ/�ִ�/���� ��)
	ClubGreeting  VarChar(200) Not Null,   -- ��Ŭ�� �Ұ��� ����

	
	Club_Q1 varchar(50) Not Null,   -- ��Ŭ�� ��������1
	Club_Q2 varchar(50) Not Null,   -- ��Ŭ�� ��������2
	Club_Q3 varchar(50) Not Null,   -- ��Ŭ�� ��������3
	
	--����3..�� �ƹ��͵� ����, ���� �ڵ���� �ۼ���(����)�� ���� ����
	id varchar(20) not null references Member(id), --���̵�
	
	BossName VarChar(50) Not Null, -- �����̸�
	PostDate DateTime Default GetDate() Not Null, --�ۼ��� 
	Content Text Not Null, -- �Ұ�����
	BookCafe_link VarChar(50), --������� �����~��� ǥ����

	-- clubPeopleCnt int default 0,  -- ȸ����

) 


	--ImageName varchar(50),  -- ��Ŭ������ȭ�����
	--ImagePath varchar(50),



 
Select * From  BookClub_Make





--[7] �⺻�� �Խ��ǿ� ���� �ۼ��ϴ� ���� ���ν��� : WriteBasic 

Create Proc dbo.Write_BookClub_Make
	@step1_agree varchar(10),
	--����2
	@ClubName VarChar(50)  , -- �����̸�
	@Clubhyperlink VarChar(30)  ,  -- ��Ŭ�� Ȩ�� �ּ�
	@ClubGenre VarChar(10) ,  -- ��Ŭ�� �з�(��ȭ/�ִ�/���� ��)
	@ClubGreeting VarChar(200) ,   -- ��Ŭ�� �Ұ��� ����

	@Club_Q1 varchar(50),   -- ��Ŭ�� ��������1
	@Club_Q2 varchar(50),   -- ��Ŭ�� ��������2
	@Club_Q3 varchar(50),   -- ��Ŭ�� ��������3
	
	--����3..�� �ƹ��͵� ����, ���� �ڵ���� �ۼ���(����)�� ���� ����
	@id varchar(20),	
	@BossName varchar(50),
	@Content text,
	@BookCafe_link VarChar(50) --������� �����~��� ǥ����

As 
	Insert BookClub_Make 
	(
		step1_agree, ClubName, Clubhyperlink, ClubGenre, ClubGreeting,
		Club_Q1, Club_Q2, Club_Q3,
		id, BossName, Content, BookCafe_link
	)
	Values
	(
		@step1_agree,@ClubName,@Clubhyperlink,@ClubGenre,@ClubGreeting,
		@Club_Q1,@Club_Q2,@Club_Q3,
		@id,@BossName,@Content,@BookCafe_link
	)
Go  	




Write_BookClub_Make


--  drop proc Write_BookClub_Make




Write_BookClub 'hong', '2019�г⿡ ���� ����', '�����̸�' ,  '2019�г⵵ ���л����� ���� å �����Դϴ�~',  'bt_list.gif', 'bt_list.gif' 

Write_BookClub 'dadf', '���ο� ���� ���ο� �ο�', '�ز�',  '�ز��� ���ο� ���� ���ο� �ο��Դϴ�~', 'bt_list.gif', 'bt_list.gif' 









--[8]�⺻�� �Խ��ǿ��� �����͸� �о���� ���� ���ν��� : ListBasic
Create Procedure dbo.List_BookClub 
As 
	Select * From BookClub 
Go


List_BookClub  


--  drop proc List_BookClub







--[10]�ش� ���� ���������� �о���� ���� ���ν��� : ViewBasic 
Create Procedure dbo.View_BookClub
	@id varchar(20),
	@ClubName VarChar(50)
As
	Select * From BookClub 
	Where id = @id And ClubName = @ClubName
Go


View_BookClub  'hong', '2019�г⿡ ���� ����'
--���̸��� ������, ���λ����� ���



-- drop proc View_BookClub






--[13] �ش� ���� �����ϴ� ���� ���ν��� : ModifyBasic
Create Proc dbo.Modify_BookWrite
     @Title VarChar(50), @BookName VarChar(50),
	 @Genre VarChar(10), @Author varchar(50),
     @ModifyIP VarChar(15), 
     @Content Text, 
     @Password VarChar(20), @ReviewStar varchar(10), @ImageName varchar(50), @PhotoPath varchar(50),
	 @Num Int, @id varchar(20)

As
     Declare @cnt Int
     Select @cnt = Count(*) From BookWrite
     Where Num = @Num And Password = @Password

     If @cnt > 0  -- �Ѱ��� �� ��ȣ�� ��ȣ�� �´� �����Ͱ� �ִٸ�...
          Update BookWrite 
          Set 
               Title = @Title, BookName = @BookName,
			   Genre = @Genre, Author = @Author,
               ModifyIP = @ModifyIP,
			   Content = @Content, 
               ModifyDate = GetDate(), ReviewStar = @ReviewStar, ImageName = @ImageName, PhotoPath = @PhotoPath
          Where Num = @Num And id = @id
		  And Password = @Password 
     Else
          Return -1 -- ��ȣ�� Ʋ���� -1�� ��ȯ����...
Go



Modify_BookWrite ''



--  drop proc Modify_BookWrite







