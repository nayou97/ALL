use ASPNET



-- drop table BookClub


 




Select * From BookClub



--[7] 기본형 게시판에 글을 작성하는 저장 프로시저 : WriteBasic 
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



Write_BookClub 'hong', '2019학년에 만날 모임', '방장이름' ,  '2019학년도 입학생들을 위한 책 모임입니다~',  'bt_list.gif', 'bt_list.gif' 

Write_BookClub 'dadf', '새로운 만남 새로운 인연', '쀼뀨',  '쀼뀨의 새로운 만남 새로운 인연입니다~', 'bt_list.gif', 'bt_list.gif' 

--파일이름도 추가해야 그림이 출력됨


 


--[8]기본형 게시판에서 데이터를 읽어오는 저장 프로시저 : ListBasic
Create Procedure dbo.List_BookClub 
As 
	Select * From BookClub 
Go


List_BookClub  


--  drop proc List_BookClub







--[10]해당 글을 세부적으로 읽어오는 저장 프로시저 : ViewBasic 
Create Procedure dbo.View_BookClub
	@id varchar(20),
	@ClubName VarChar(50)
As
	Select * From BookClub 
	Where id = @id And ClubName = @ClubName
Go


View_BookClub  'hong', '2019학년에 만날 모임'
--방이름을 누르면, 세부사항이 뜬다



-- drop proc View_BookClub



-----------------------------------------------------------------------------------

--나중에


--[11]해당 글에 대한 비밀번호 읽어오는 저장 프로시저 : ReadPasword
Create Proc dbo.ReadPassword_BookWrite
	@Num Int 
As 
	Select Password 
	From BookWrite
	Where Num = @Num
Go	

--비밀번호는 Delete.aspx에서 쓰인다


--  drop proc ReadPassword_BookWrite 







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



--  drop proc Modify_BookWrite




