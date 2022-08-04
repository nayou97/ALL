use ASPNET





Create Table dbo.BookWrite 
(
	Num Int Identity(1,1) Not Null Primary Key, --번호 

	id varchar(20) not null references Member(id), --아이디

	Title VarChar(50) Not Null, -- 글제목
	BookName VarChar(50) Not Null, -- 책제목
	Genre VarChar(50) Not Null, -- 책 장르

	PostDate DateTime Default GetDate() Not Null, --작성일 
	PostIP VarChar(15) Not Null, --작성IP

	Author VarChar(50) Not Null, --내용

	Content Text Not Null, --내용
	Password VarChar(20) Not Null, --비밀번호
	ReviewStar VarChar(10) Not Null, -- 별점
	 
	ModifyDate SmallDateTime Null,--수정일
	ModifyIP VarChar(15) Null, --수정 IP

) 


-- drop table BookWrite



Select * From BookWrite

 


--[7] 기본형 게시판에 글을 작성하는 저장 프로시저 : WriteBasic 
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





--포스트데이트/수정아이피/수정날짜는 뺐음
--파일 이름도 추가해야 사진이 출력됨

Write_BookWrite 'hong1234', '쓰면서 느낀 점', '붉은 땅의 기억', '역사물' , '121:11:00', '장원거','ㄴ마ㅣㄴ얼이ㅏㄴ마ㅡ미느아ㅁㄴㅎㄷㄱㅎㄹㅇ', '123', '★★★★★'

Write_BookWrite 'hong1234', 'asdfasdf','sbd','미술','11::','wkrrksla','asdfasdvadfbfdfadsfdsfsdf','123','★★★★★'



--  drop proc Write_BookWrite






--[8]기본형 게시판에서 데이터를 읽어오는 저장 프로시저 : ListBasic
Create Procedure dbo.List_BookWrite
	@id varchar(20)
As 
	Select *From BookWrite
	where id = @id
	Order By Num Desc 
Go




List_BookWrite 'hong'




-- drop proc List_BookWrite




--[10]해당 글을 세부적으로 읽어오는 저장 프로시저 : ViewBasic 
Create Procedure dbo.View_BookWrite
	@Num Int,
	@id varchar(20)
As
	Select *From BookWrite 
	Where Num = @Num And id = @id
Go


View_BookWrite '1' , 'hong'


--  drop proc View_BookWrite




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
     @Password VarChar(20), @ReviewStar varchar(10),
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
               ModifyDate = GetDate(), ReviewStar = @ReviewStar
          Where Num = @Num And id = @id
		  And Password = @Password 
     Else
          Return -1 -- 암호가 틀리면 -1을 반환하자...
Go



Modify_BookWrite ''



-- drop proc Modify_BookWrite



