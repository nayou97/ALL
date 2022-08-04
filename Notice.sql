use ASPNET





Create Table dbo.Notice 
(
	Num Int Identity(1,1) Not Null Primary Key, --번호 
	id VarChar(20) Not Null references Member(id), --이름 id11가 운영자이다.
	Password VarChar(20) Not Null, --비밀번호

	Title VarChar(150) Not Null, --제목
	PostDate DateTime Default GetDate() Not Null, --작성일 
	PostIP VarChar(15) Not Null, --작성IP

	Content Text Not Null, --내용

	ReadCount Int Default 0, --조회수

	ModifyDate SmallDateTime Null,--수정일
	ModifyIP VarChar(15) Null --수정 IP
)


---   drop table Notice



Select *From Notice

insert into Notice values('id11', '333', '공지사항입니다.', GetDate(), '1:::0', '공지내용들', 1, null, null)


--select id from Notice where Num = 1





--[7] 기본형 게시판에 글을 작성하는 저장 프로시저 : WriteBasic 
Create Proc dbo.Write_Notice
	@id VarChar(20),
	@Title VarChar(150),
	@PostIP VarChar(20),
	@Content Text,
	@Password VarChar(20)
--With Encryption
As 
	Insert Notice 
	(
		id,Title,PostIP,Content,
		Password
	)
	Values
	(
		@id,@Title,@PostIP,@Content,
		@Password
	)
Go  	


Write_Notice 'id11', '2019년 1월 새해 복 받으세요~', 'ii2:00', '새해인사드립니다.', '1'






--[8]기본형 게시판에서 데이터를 읽어오는 저장 프로시저 : ListBasic
Create Procedure dbo.List_Notice
As 
	Select *From Notice
	Order By Num Desc 
Go


List_Notice





--[9]조회수 증가 시켜주는 저장 프로시저 : UpdateReadCount
Create Proc dbo.Update_ReadCount_Notice
	@Num Int
As 
	Update Notice
	Set ReadCount = ReadCount + 1
	Where Num = @Num
Go


Update_ReadCount_Notice '1'







--[10]해당 글을 세부적으로 읽어오는 저장 프로시저 : ViewBasic 
Create Procedure dbo.View_Notice
	@Num Int
As
	Update Notice
	Set ReadCount = ReadCount + 1
	Where Num = @Num 
	
	Select *From Notice 
	Where Num = @Num
Go


View_Notice '1'







--[11]해당 글에 대한 비밀번호 읽어오는 저장 프로시저 : ReadPasword
Create Proc dbo.Read_Password_Notice
	@Num Int 
As 
	Select Password 
	From Notice
	Where Num = @Num
Go	



Read_Password_Notice '1'




--[12] 해당 글 지우는 저장 프로시저 : DeleteBasic 
Create Proc dbo.Delete_Notice 
	@Password VarChar(20),
	@Num Int
As 
	 Declare @cnt Int
     -- 암호와 번호가 맞으면 1을 반환
     Select @cnt = Count(*) From Notice 
     Where Num = @Num And Password = @Password

     If @cnt > 0 
          Delete Notice Where Num = @Num And Password = @Password
     Else     
          Return -1

Go	





--[13] 해당 글을 수정하는 저장 프로시저 : ModifyBasic
Create Proc dbo.Modify_Notice
     @id varchar(20), 
     @Title VarChar(150), @ModifyIP VarChar(15), 
     @Content Text,
     @Password VarChar(20), @Num Int
As
     Declare @cnt Int
     Select @cnt = Count(*) From Notice
     Where Num = @Num And Password = @Password

     If @cnt > 0  -- 넘겨져 온 번호와 암호가 맞는 데이터가 있다면...
          Update Notice 
          Set 
               id = @id, Title = @Title,
			   ModifyIP = @ModifyIP,
               ModifyDate = GetDate(), Content = @Content
          Where Num = @Num And Password = @Password
     Else
          Return -1 -- 암호가 틀리면 -1을 반환하자...
Go


