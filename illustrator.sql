

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
                               
                declare cur_book scroll cursor for select Num from illustrator order by Num    -- 테이블명을 지정하고, 키 값을 정한다(등록번호가 좋겠지)
               
                open cur_book
               
                fetch absolute @startingRec from cur_book into @startingBookId
               
                select @recCount=count(*) from illustrator where Num > @startingBookId   -- 테이블명을 지정하고, "등록번호>스타팅아이디(시작번호)"
               
                if @recCount<@pagesize
                                set @endRec=@startingRec+@recCount
                else
                                set @endRec=@pagenumber * @pagesize

                fetch absolute @endRec from cur_book into @endBookId
               
                close cur_book
               
                deallocate cur_book

                select count(*) from illustrator    --  테이블명
                select * from illustrator where Num >= @startingBookId and Num <= @endBookId   --  테이블명 지정///   등록번호는 스타팅번호보다 크고, 엔드번호보다 작다






--[0]기본형 게시판(Basic)용 테이블 설계 
--[!] Drop Table dbo.Basic 
Create Table dbo.illustrator 
(
	Num Int Identity(1,1) Not Null Primary Key, --번호 
	
	Writer varchar(20) not null references Member(id), -- 아이디

	Title VarChar(150) Not Null, --제목

	PostDate DateTime Default GetDate() Not Null, --작성일 

	Content Text Not Null, --내용

	Password VarChar(20) Not Null, --비밀번호

	ReadCount Int Default 0, --조회수
	Good int Default 0,  -- 추천수

	ImageName varchar(50),
	ImagePath varchar(50),


	BookName varchar(30),
	Author varchar(30),

	ModifyDate SmallDateTime Null,--수정일 

)




select * from illustrator



-- drop table illustrator




--[7] 기본형 게시판에 글을 작성하는 저장 프로시저 : WriteBasic 
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


--  Write_illustrator 'hong', '타이틀', '라라라라라라','122', '책이름', '자까', 'bg-main.png' , 'bg-main.png'



--  drop proc Write_illustator



--[8]기본형 게시판에서 데이터를 읽어오는 저장 프로시저 : ListBasic
Create Procedure dbo.List_illustrator
As 
	Select * From illustrator
	Order By GetDate() Asc 
Go


List_illustrator





--[9]조회수 증가 시켜주는 저장 프로시저 : UpdateReadCount
Create Proc dbo.UpdateReadCount_illustrator
	@Num Int
As 
	Update illustrator
	Set ReadCount = ReadCount + 1
	Where Num = @Num
Go



 UpdateReadCount_illustrator







 --추천수 늘리기

 Create Proc dbo.Update_Good_Count_illustrator
	@Num Int
As 
	Update illustrator
	Set Good = Good + 1
	Where Num = @Num
Go


Update_REVIEW_Count_illustrator





--[10]해당 글을 세부적으로 읽어오는 저장 프로시저 : ViewBasic 
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



--[11]해당 글에 대한 비밀번호 읽어오는 저장 프로시저 : ReadPasword
Create Proc dbo.ReadPassword_illustrator
	@Num Int 
As 
	Select Password 
	From illustrator
	Where Num = @Num
Go	


select * from Member


--[12] 해당 글 지우는 저장 프로시저 : DeleteBasic 
Create Proc dbo.Delete_illustrator
	@Password VarChar(20),
	@Num Int
As 
	 Declare @cnt Int
     -- 암호와 번호가 맞으면 1을 반환
     Select @cnt = Count(*) From illustrator 
     Where Num = @Num And Password = @Password

     If @cnt > 0 
          Delete illustrator Where Num = @Num And Password = @Password
     Else     
          Return -1

Go	






--[13] 해당 글을 수정하는 저장 프로시저 : ModifyBasic
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

     If @cnt > 0  -- 넘겨져 온 번호와 암호가 맞는 데이터가 있다면...
          Update illustrator 
          Set 
               Writer = @Writer,
               Title = @Title,
               ModifyDate = GetDate(), Content = @Content, BookName = @BookName, Author = @Author,
			   ImageName = @ImageName, ImagePath = @ImagePath
          Where Num = @Num And Password = @Password
     Else
          Return -1 -- 암호가 틀리면 -1을 반환하자...
Go




--  drop proc Modify_illustrator










--  팬픽


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
commentcnt int default 0  -- 댓글수 
)



select * from Rewriting 





--  drop table Rewriting






--[8]기본형 게시판에서 데이터를 읽어오는 저장 프로시저 : ListBasic
Create Procedure dbo.List_Rewriting
As 
	Select * From Rewriting
	Order By GetDate() Asc 
Go


List_Rewriting


--[10]해당 글을 세부적으로 읽어오는 저장 프로시저 : ViewBasic 
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