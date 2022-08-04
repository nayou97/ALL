

Create Table dbo.BookClub_Make
(
	seq int identity(1,1) not null primary key,
	
	--스텝1
	step1_agree varchar(10),  -- 이용약관 동의여부 = 동의합니다
	
	--스텝2
	ClubName VarChar(50) Not Null, -- 모임이름
	Clubhyperlink VarChar(30) Not Null,  -- 북클럽 홈피 주소
	ClubGenre VarChar(10) Not Null,  -- 북클럽 분류(영화/애니/도서 등)
	ClubGreeting  VarChar(200) Not Null,   -- 북클럽 소개글 쓰기

	
	Club_Q1 varchar(50) Not Null,   -- 북클럽 가입질문1
	Club_Q2 varchar(50) Not Null,   -- 북클럽 가입질문2
	Club_Q3 varchar(50) Not Null,   -- 북클럽 가입질문3
	
	--스텝3..는 아무것도 없고, 이하 코드들은 작성자(방장)에 대한 정보
	id varchar(20) not null references Member(id), --아이디
	
	BossName VarChar(50) Not Null, -- 방장이름
	PostDate DateTime Default GetDate() Not Null, --작성일 
	Content Text Not Null, -- 소개내용
	BookCafe_link VarChar(50), --없을경우 없어요~라고 표기함

	-- clubPeopleCnt int default 0,  -- 회원수

) 


	--ImageName varchar(50),  -- 북클럽메인화면사진
	--ImagePath varchar(50),



 
Select * From  BookClub_Make





--[7] 기본형 게시판에 글을 작성하는 저장 프로시저 : WriteBasic 

Create Proc dbo.Write_BookClub_Make
	@step1_agree varchar(10),
	--스텝2
	@ClubName VarChar(50)  , -- 모임이름
	@Clubhyperlink VarChar(30)  ,  -- 북클럽 홈피 주소
	@ClubGenre VarChar(10) ,  -- 북클럽 분류(영화/애니/도서 등)
	@ClubGreeting VarChar(200) ,   -- 북클럽 소개글 쓰기

	@Club_Q1 varchar(50),   -- 북클럽 가입질문1
	@Club_Q2 varchar(50),   -- 북클럽 가입질문2
	@Club_Q3 varchar(50),   -- 북클럽 가입질문3
	
	--스텝3..는 아무것도 없고, 이하 코드들은 작성자(방장)에 대한 정보
	@id varchar(20),	
	@BossName varchar(50),
	@Content text,
	@BookCafe_link VarChar(50) --없을경우 없어요~라고 표기함

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




Write_BookClub 'hong', '2019학년에 만날 모임', '방장이름' ,  '2019학년도 입학생들을 위한 책 모임입니다~',  'bt_list.gif', 'bt_list.gif' 

Write_BookClub 'dadf', '새로운 만남 새로운 인연', '쀼뀨',  '쀼뀨의 새로운 만남 새로운 인연입니다~', 'bt_list.gif', 'bt_list.gif' 









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







