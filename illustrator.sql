

CREATE PROCEDURE Paging_Sp_List_illustrator
(
    @pagenumber int,
    @pagesize int
)
               
AS
                declare @startingRec int
                declare @endRec int
                declare @startingBookId int
                declare @endBookId int
                declare @recCount int

                set @startingRec=@pagenumber*@pagesize-@pagesize+1
                               
                declare cur_book scroll cursor for select Num from illustrator order by Num    -- ���̺���� �����ϰ�, Ű ���� ���Ѵ�(��Ϲ�ȣ�� ������)
               
                open cur_book
               
                fetch absolute @startingRec from cur_book into @startingBookId
               
                select @recCount=count(*) from illustrator where Num > @startingBookId   -- ���̺���� �����ϰ�, "��Ϲ�ȣ>��Ÿ�þ��̵�(���۹�ȣ)"
               
                if @recCount<@pagesize
                                set @endRec=@startingRec+@recCount
                else
                                set @endRec=@pagenumber * @pagesize

                fetch absolute @endRec from cur_book into @endBookId
               
                close cur_book
               
                deallocate cur_book

                select count(*) from illustrator    --  ���̺��
                select * from illustrator where Num >= @startingBookId and Num <= @endBookId   --  ���̺�� ����///   ��Ϲ�ȣ�� ��Ÿ�ù�ȣ���� ũ��, �����ȣ���� �۴�






--[0]�⺻�� �Խ���(Basic)�� ���̺� ���� 
--[!] Drop Table dbo.Basic 
Create Table dbo.illustrator 
(
	Num Int Identity(1,1) Not Null Primary Key, --��ȣ 
	
	Writer varchar(20) not null references Member(id), -- ���̵�

	Title VarChar(150) Not Null, --����

	PostDate DateTime Default GetDate() Not Null, --�ۼ��� 

	Content Text Not Null, --����

	Password VarChar(20) Not Null, --��й�ȣ

	ReadCount Int Default 0, --��ȸ��
	Good int Default 0,  -- ��õ��

	ImageName varchar(50),
	ImagePath varchar(50),


	BookName varchar(30),
	Author varchar(30),

	ModifyDate SmallDateTime Null,--������ 

)




select * from illustrator



-- drop table illustrator




--[7] �⺻�� �Խ��ǿ� ���� �ۼ��ϴ� ���� ���ν��� : WriteBasic 
Create Proc dbo.Write_illustrator
	@Writer VarChar(20),
	@Title VarChar(150),
	@Content Text,
	@Password VarChar(20),
	@BookName varchar(30),
	@Author varchar(30),
	@ImageName varchar(50),
	@ImagePath varchar(50)
As 
	Insert illustrator 
	(
		Writer,Title,Content,BookName,Author,
		Password,ImageName,ImagePath
	)
	Values
	(
		@Writer,@Title,@Content,@BookName,@Author,
		@Password,@ImageName,@ImagePath
	)
Go  	


--  Write_illustrator 'hong', 'Ÿ��Ʋ', '�������','122', 'å�̸�', '�ڱ�', 'bg-main.png' , 'bg-main.png'



--  drop proc Write_illustator



--[8]�⺻�� �Խ��ǿ��� �����͸� �о���� ���� ���ν��� : ListBasic
Create Procedure dbo.List_illustrator
As 
	Select * From illustrator
	Order By GetDate() Asc 
Go


List_illustrator





--[9]��ȸ�� ���� �����ִ� ���� ���ν��� : UpdateReadCount
Create Proc dbo.UpdateReadCount_illustrator
	@Num Int
As 
	Update illustrator
	Set ReadCount = ReadCount + 1
	Where Num = @Num
Go



 UpdateReadCount_illustrator







 --��õ�� �ø���

 Create Proc dbo.Update_Good_Count_illustrator
	@Num Int
As 
	Update illustrator
	Set Good = Good + 1
	Where Num = @Num
Go


Update_REVIEW_Count_illustrator





--[10]�ش� ���� ���������� �о���� ���� ���ν��� : ViewBasic 
Create Procedure dbo.View_illustrator
	@Num Int
As
	Update illustrator
	Set ReadCount = ReadCount + 1
	Where Num = @Num 
	
	Select * From illustrator 
	Where Num = @Num
Go


View_illustrator '1'

--  drop proc View_illustrator



--[11]�ش� �ۿ� ���� ��й�ȣ �о���� ���� ���ν��� : ReadPasword
Create Proc dbo.ReadPassword_illustrator
	@Num Int 
As 
	Select Password 
	From illustrator
	Where Num = @Num
Go	


select * from Member


--[12] �ش� �� ����� ���� ���ν��� : DeleteBasic 
Create Proc dbo.Delete_illustrator
	@Password VarChar(20),
	@Num Int
As 
	 Declare @cnt Int
     -- ��ȣ�� ��ȣ�� ������ 1�� ��ȯ
     Select @cnt = Count(*) From illustrator 
     Where Num = @Num And Password = @Password

     If @cnt > 0 
          Delete illustrator Where Num = @Num And Password = @Password
     Else     
          Return -1

Go	






--[13] �ش� ���� �����ϴ� ���� ���ν��� : ModifyBasic
Create Proc dbo.Modify_illustrator
      @Writer VarChar(20),
     @Title VarChar(150),
     @Content Text,
     @Password VarChar(20),
	 @BookName varchar(30),
	@Author varchar(30),
	 @ImageName varchar(50),
	@ImagePath varchar(50),
	 @Num Int
As
     Declare @cnt Int
     Select @cnt = Count(*) From illustrator
     Where Num = @Num And Password = @Password

     If @cnt > 0  -- �Ѱ��� �� ��ȣ�� ��ȣ�� �´� �����Ͱ� �ִٸ�...
          Update illustrator 
          Set 
               Writer = @Writer,
               Title = @Title,
               ModifyDate = GetDate(), Content = @Content, BookName = @BookName, Author = @Author,
			   ImageName = @ImageName, ImagePath = @ImagePath
          Where Num = @Num And Password = @Password
     Else
          Return -1 -- ��ȣ�� Ʋ���� -1�� ��ȯ����...
Go




--  drop proc Modify_illustrator










--  ����


create table Rewriting(
num int identity(1,1) not null primary key,
title varchar(50),
writer varchar(20) references Member(id),
PostDate datetime default GetDate(),
content text,

PageTerm varchar(20),
PStart Int, 
PEnd Int, 
BookName varchar(20), 
BookAuthor varchar(20),

readcount int default 0,
goodcnt int default 0,
commentcnt int default 0  -- ��ۼ� 
)



select * from Rewriting 





--  drop table Rewriting






--[8]�⺻�� �Խ��ǿ��� �����͸� �о���� ���� ���ν��� : ListBasic
Create Procedure dbo.List_Rewriting
As 
	Select * From Rewriting
	Order By GetDate() Asc 
Go


List_Rewriting


--[10]�ش� ���� ���������� �о���� ���� ���ν��� : ViewBasic 
Create Procedure dbo.View_Rewriting
	@Num Int
As
	Update Rewriting
	Set ReadCount = ReadCount + 1
	Where Num = @Num 
	
	Select * From Rewriting 
	Where Num = @Num
Go



View_Rewriting '1'