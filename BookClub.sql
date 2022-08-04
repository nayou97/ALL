use ASPNET



-- drop table BookClub


 




Select * From BookClub



--[7] �⺻�� �Խ��ǿ� ���� �ۼ��ϴ� ���� ���ν��� : WriteBasic 
Create Proc dbo.Write_BookClub
	@id varchar(20),
	@ClubName VarChar(50),
	@BossName varchar(50),
	@Content text,
	@ImageName varchar(50),
	@ImagePath varchar(50),
	@clubPeopleCnt int
As 
	Insert BookClub 
	(
		id,ClubName,BossName,Content,ImageName,ImagePath 
	)
	Values
	(
		@id,@ClubName,@BossName,@Content,@ImageName,@ImagePath 
	)
Go  	




--  drop proc Write_BookClub



Write_BookClub 'hong', '2019�г⿡ ���� ����', '�����̸�' ,  '2019�г⵵ ���л����� ���� å �����Դϴ�~',  'bt_list.gif', 'bt_list.gif' 

Write_BookClub 'dadf', '���ο� ���� ���ο� �ο�', '�ز�',  '�ز��� ���ο� ���� ���ο� �ο��Դϴ�~', 'bt_list.gif', 'bt_list.gif' 

--�����̸��� �߰��ؾ� �׸��� ��µ�


 


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



-----------------------------------------------------------------------------------

--���߿�


--[11]�ش� �ۿ� ���� ��й�ȣ �о���� ���� ���ν��� : ReadPasword
Create Proc dbo.ReadPassword_BookWrite
	@Num Int 
As 
	Select Password 
	From BookWrite
	Where Num = @Num
Go	

--��й�ȣ�� Delete.aspx���� ���δ�


--  drop proc ReadPassword_BookWrite 







--[12] �ش� �� ����� ���� ���ν��� : DeleteBasic 
Create Proc dbo.Delete_BookWrite 
	@Password VarChar(20),
	@Num Int
As 
	 Declare @cnt Int
     -- ��ȣ�� ��ȣ�� ������ 1�� ��ȯ
     Select @cnt = Count(*) From BookWrite 
     Where Num = @Num And Password = @Password

     If @cnt > 0 
          Delete BookWrite Where Num = @Num And Password = @Password
     Else     
          Return -1

Go	


Delete_BookWrite '1'



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




