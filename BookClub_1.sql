use ASPNET



--drop table BookClub




Create Table dbo.BookClub 
(
	seq int identity(1,1) primary key not null,
	BossName varchar(20) not null references Member(id), --���̵�  -- �����̸�
	

	ClubName VarChar(50) Not Null, -- �����̸� 

	clubPeopleCnt int Default 0 , --ȸ����

	PostDate DateTime Default GetDate() Not Null, -- ������ 
	 
	Content Text Not Null, -- �Ұ�����
	
	ImageName varchar(50),
	ImagePath varchar(50)
) 




Select * From BookClub

 
insert into BookClub values('dadf', '¯¯�Ƹ���', 0, getdate() , '�ڱ�Ұ��� �ϼ���.', 'bg-main.png', 'bg-main.png')






--[7] �⺻�� �Խ��ǿ� ���� �ۼ��ϴ� ���� ���ν��� : WriteBasic 
Create Proc dbo.Write_BookClub
	@ClubName VarChar(50),
	@BossName varchar(20),
	@Content text,
	@ImageName varchar(50),
	@ImagePath varchar(50)
As 
	Insert BookClub 
	(
		ClubName,BossName,Content,ImageName,ImagePath
	)
	Values
	(
		@ClubName,@BossName,@Content,@ImageName,@ImagePath
	)
Go  	





Write_BookClub '2019�г⿡ ���� ����', 'dadf', '�����Ӥ����̤������ѹ̴��Ƥ���������������',  'bt_list.gif', 'bt_list.gif'

Write_BookClub '�����Ա�', 'hong',  'asdfasdvadfbfdfadsfdsfsdf', 'bt_list.gif', 'bt_list.gif'


--�����̸��� �߰��ؾ� �׸��� ��µ�


 
--  drop proc Write_BookClub





--[8]�⺻�� �Խ��ǿ��� �����͸� �о���� ���� ���ν��� : ListBasic
Create Procedure dbo.List_BookClub
As 
	Select * From BookClub
Go


List_BookClub  


-- drop proc List_BookClub







--[10]�ش� ���� ���������� �о���� ���� ���ν��� : ViewBasic 
Create Procedure dbo.View_BookClub
	@seq VarChar(50)
As
	Select * From BookClub 
	Where seq  = @seq 
Go




View_BookClub  '1'
--���̸��� ������, ���λ����� ���




--  drop proc View_BookClub







----------------------------------------------------------------------------------



--�˻�
create Proc Search_BookClub
      @SearchField VarChar(25),
      @SearchQuery VarChar(25)
As
     Set @SearchQuery = '%' + @SearchQuery + '%'
     SELECT *
     FROM BookClub
     WHERE
      (
           CASE @SearchField 
                WHEN 'BossName' THEN BossName
                WHEN 'ClubName' THEN ClubName
           ELSE 
                @SearchQuery
           END
      ) 
      LIKE 
      @SearchQuery
     Order By seq Desc
Go


Search_BookClub 'BossName', 'd'
Go




Create Proc SearchUpload

       @SearchField VarChar(25),

       @SearchQuery VarChar(25)

As

       Declare @Sql VarChar(250)

       Set @Sql = '

       Select * From BookClub

       Where ' + @SearchField + ' Like ''%' + @SearchQuery +  '%''

       Order By seq Desc

       '

       Exec(@Sql)

Go

 

SearchUpload 'BossName', 'd'

 



��ó: https://godffs.tistory.com/482?category=126912 [.Net ������]







-----------------------------------------------------------------------------------




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



drop proc Modify_BookWrite











--�˻�
create Proc Search_All_BookClub
      @SearchField VarChar(25),
      @SearchQuery VarChar(25)
As
     Set @SearchQuery = '%' + @SearchQuery + '%'
     SELECT *
     FROM BookClub
     WHERE
      (
           CASE @SearchField 
                WHEN 'BossName' THEN BossName
                WHEN 'ClubName' THEN ClubName
           ELSE 
                @SearchQuery
           END
      ) 
      LIKE 
      @SearchQuery
     Order By seq Desc
Go


Search_All_BookClub 'BossName', 'dadf'
Go
















--[12] �˻� ���� ���ν��� : ���� ������
Create Proc dbo.Search_BookWrite
      @SearchField VarChar(25),
      @SearchQuery VarChar(25)
As
     Set @SearchQuery = '%' + @SearchQuery + '%'
     SELECT *
     FROM BookWrite
     WHERE
      (
           CASE @SearchField 
                WHEN 'Title' THEN Title
                WHEN 'BookName' THEN BookName
                WHEN 'Genre' THEN Genre
                WHEN 'Author' THEN Author
           ELSE 
                @SearchQuery
           END
      ) 
      LIKE 
      @SearchQuery
     Order By Num Desc
Go



Search_BookWrite 'Title', 'a'






	
--Basic �˻�
--Store procedure to get the data:
Create proc [dbo].[SpGetSearch_BookWrite]
AS
BEGIN
Select * from dbo.BookWrite
End



--drop proc SpGetSearch_Basic



SpGetSearch_BookWrite


--drop proc SpFilter_Basic

SpFilter_Basic
--Store procedure to filter (search) the record:
Create PROCEDURE [dbo].[SpFilter_BookWrite]
(
@name varchar(100),
@Title varchar(100)
)
AS
BEGIN
            SET NOCOUNT ON;

Select * from dbo.BookWrite where Name like @name +'%' OR Title like @Title + '%'
END

--   ���İ�����Ʈ    <asp:HyperLinkField ID="HyperLinkField1" runat="server" DataNavigateUrlFields="Num" DataNavigateUrlFormatString="View.aspx?Num={0}" DataTextField="Title" HeaderText="���İ� ����" ItemStyle-Width="350px" />




select * from Employees



create table Employees(
FirstName varchar(100),
Title varchar(100),
City varchar(50),
Country varchar(50),
PhotoPath varchar(50)
)



insert into Employees values('dddd','bdfba','rgtn','trmgh','arrow.gif')
insert into Employees values('333','bdfba','rgtn','trmgh','bt_list.gif')
insert into Employees values('2222','bdfba','rgtn','trmgh','btn_l.gif')


insert into Employees values('88888','bdfba','rgtn','trmgh','bg-main.png')




















