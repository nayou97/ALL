use ASPNET



--drop table BookClub




Create Table dbo.BookClub 
(
	seq int identity(1,1) primary key not null,
	BossName varchar(20) not null references Member(id), --아이디  -- 방장이름
	

	ClubName VarChar(50) Not Null, -- 모임이름 

	clubPeopleCnt int Default 0 , --회원수

	PostDate DateTime Default GetDate() Not Null, -- 생성일 
	 
	Content Text Not Null, -- 소개내용
	
	ImageName varchar(50),
	ImagePath varchar(50)
) 




Select * From BookClub

 
insert into BookClub values('dadf', '짱짱아모임', 0, getdate() , '자기소개를 하세요.', 'bg-main.png', 'bg-main.png')






--[7] 기본형 게시판에 글을 작성하는 저장 프로시저 : WriteBasic 
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





Write_BookClub '2019학년에 만날 모임', 'dadf', 'ㄴ마ㅣㄴ얼이ㅏㄴ마ㅡ미느아ㅁㄴㅎㄷㄱㅎㄹㅇ',  'bt_list.gif', 'bt_list.gif'

Write_BookClub '땅따먹기', 'hong',  'asdfasdvadfbfdfadsfdsfsdf', 'bt_list.gif', 'bt_list.gif'


--파일이름도 추가해야 그림이 출력됨


 
--  drop proc Write_BookClub





--[8]기본형 게시판에서 데이터를 읽어오는 저장 프로시저 : ListBasic
Create Procedure dbo.List_BookClub
As 
	Select * From BookClub
Go


List_BookClub  


-- drop proc List_BookClub







--[10]해당 글을 세부적으로 읽어오는 저장 프로시저 : ViewBasic 
Create Procedure dbo.View_BookClub
	@seq VarChar(50)
As
	Select * From BookClub 
	Where seq  = @seq 
Go




View_BookClub  '1'
--방이름을 누르면, 세부사항이 뜬다




--  drop proc View_BookClub







----------------------------------------------------------------------------------



--검색
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

 



출처: https://godffs.tistory.com/482?category=126912 [.Net 개발자]







-----------------------------------------------------------------------------------




--[11]해당 글에 대한 비밀번호 읽어오는 저장 프로시저 : ReadPasword
Create Proc dbo.ReadPassword_BookWrite
	@Num Int 
As 
	Select Password 
	From BookWrite
	Where Num = @Num
Go	

--비밀번호는 Delete.aspx에서 쓰인다





--[12] 해당 글 지우는 저장 프로시저 : DeleteBasic 
Create Proc dbo.Delete_BookWrite 
	@Password VarChar(20),
	@Num Int
As 
	 Declare @cnt Int
     -- 암호와 번호가 맞으면 1을 반환
     Select @cnt = Count(*) From BookWrite 
     Where Num = @Num And Password = @Password

     If @cnt > 0 
          Delete BookWrite Where Num = @Num And Password = @Password
     Else     
          Return -1

Go	


Delete_BookWrite '1'



--[13] 해당 글을 수정하는 저장 프로시저 : ModifyBasic
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

     If @cnt > 0  -- 넘겨져 온 번호와 암호가 맞는 데이터가 있다면...
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
          Return -1 -- 암호가 틀리면 -1을 반환하자...
Go



Modify_BookWrite ''



drop proc Modify_BookWrite











--검색
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
















--[12] 검색 저장 프로시저 : 정적 쿼리문
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






	
--Basic 검색
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

--   독후감리스트    <asp:HyperLinkField ID="HyperLinkField1" runat="server" DataNavigateUrlFields="Num" DataNavigateUrlFormatString="View.aspx?Num={0}" DataTextField="Title" HeaderText="독후감 제목" ItemStyle-Width="350px" />




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




















