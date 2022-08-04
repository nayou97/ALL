use ASPNET





Create Table dbo.BookWrite 
(
	Num Int Identity(1,1) Not Null Primary Key, --��ȣ 

	id varchar(20) not null references Member(id), --���̵�

	Title VarChar(50) Not Null, -- ������
	BookName VarChar(50) Not Null, -- å����
	Genre VarChar(50) Not Null, -- å �帣

	PostDate DateTime Default GetDate() Not Null, --�ۼ��� 
	PostIP VarChar(15) Not Null, --�ۼ�IP

	Author VarChar(50) Not Null, --����

	Content Text Not Null, --����
	Password VarChar(20) Not Null, --��й�ȣ
	ReviewStar VarChar(10) Not Null, -- ����
	 
	ModifyDate SmallDateTime Null,--������
	ModifyIP VarChar(15) Null, --���� IP

) 


-- drop table BookWrite



Select * From BookWrite

 


--[7] �⺻�� �Խ��ǿ� ���� �ۼ��ϴ� ���� ���ν��� : WriteBasic 
Create Proc dbo.Write_BookWrite 
	@id varchar(20),
	@Title VarChar(50),
	@BookName varchar(50),
	@Genre varchar(10),

	@PostIP VarChar(15),
	@Author varchar(50),
	@Content Text,
	@Password VarChar(20),
	@ReviewStar varchar(10)
--With Encryption
As 
	Insert BookWrite 
	(
		id,
		Title,BookName,Genre,
		PostIP,Author,Content,
		Password,ReviewStar
	)
	Values
	(
		@id,
		@Title,@BookName,@Genre,
		@PostIP,@Author,@Content,
		@Password, @ReviewStar
	)
Go  	





--����Ʈ����Ʈ/����������/������¥�� ����
--���� �̸��� �߰��ؾ� ������ ��µ�

Write_BookWrite 'hong1234', '���鼭 ���� ��', '���� ���� ���', '���繰' , '121:11:00', '�����','�����Ӥ����̤������ѹ̴��Ƥ���������������', '123', '�ڡڡڡڡ�'

Write_BookWrite 'hong1234', 'asdfasdf','sbd','�̼�','11::','wkrrksla','asdfasdvadfbfdfadsfdsfsdf','123','�ڡڡڡڡ�'



--  drop proc Write_BookWrite






--[8]�⺻�� �Խ��ǿ��� �����͸� �о���� ���� ���ν��� : ListBasic
Create Procedure dbo.List_BookWrite
	@id varchar(20)
As 
	Select *From BookWrite
	where id = @id
	Order By Num Desc 
Go




List_BookWrite 'hong'




-- drop proc List_BookWrite




--[10]�ش� ���� ���������� �о���� ���� ���ν��� : ViewBasic 
Create Procedure dbo.View_BookWrite
	@Num Int,
	@id varchar(20)
As
	Select *From BookWrite 
	Where Num = @Num And id = @id
Go


View_BookWrite '1' , 'hong'


--  drop proc View_BookWrite




--[11]�ش� �ۿ� ���� ��й�ȣ �о���� ���� ���ν��� : ReadPasword
Create Proc dbo.ReadPassword_BookWrite
	@Num Int 
As 
	Select Password 
	From BookWrite
	Where Num = @Num
Go	

--��й�ȣ�� Delete.aspx���� ���δ�





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
     @Password VarChar(20), @ReviewStar varchar(10),
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
               ModifyDate = GetDate(), ReviewStar = @ReviewStar
          Where Num = @Num And id = @id
		  And Password = @Password 
     Else
          Return -1 -- ��ȣ�� Ʋ���� -1�� ��ȯ����...
Go



Modify_BookWrite ''



-- drop proc Modify_BookWrite



