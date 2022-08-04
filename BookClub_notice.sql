 


--  drop table BookClub_notice
 



Create Table BookClub_notice
(
	seq Int Identity(1,1) Primary Key, --번호
	
	notice_id varchar(20) references Member(id),   --  작성자의 아이디
	Title VarChar(150) , --제목
	Content Text , --내용

	PostDate DateTime Default GetDate() Not Null, --작성일 
	PostIP VarChar(15) , --작성IP
	Password VarChar(20) , --비밀번호


	ReadCount Int Default 0, --조회수

	ModifyDate SmallDateTime Null,--수정일
	ModifyIP VarChar(15) Null --수정 IP
)




select * from BookClub_notice


 

insert into BookClub_notice values('id11','타이틀 제목','이건 내용임~~~',GetDate(), '112.112.2','111',0,null,null)
insert into BookClub_notice values('id11','이건 공지!','이건 내용임~2222~~',GetDate(), '112.112.2','1234',0,null,null)




--[7] 기본형 게시판에 글을 작성하는 저장 프로시저 : WriteBasic 
Create Proc dbo.Write_BookClub_notice 
	@notice_id varchar(20),
	@Title VarChar(50), 
	@Content Text,
	@PostIP VarChar(15), 
	@Password VarChar(20) 
--With Encryption
As 
	Insert BookClub_notice 
	(
		notice_id,Title,PostIP,Content,
		Password
	)
	Values
	(
		@notice_id,@Title,@PostIP,@Content,
		@Password
	)
Go  	



Write_BookClub_notice 'id11', '공지드립니다.', '내용', '121:11:00', '123'

Write_BookClub_notice 'id11', '오늘은.....','내용', '11::', '123'





--   drop proc Write_BookClub_notice








--[8]기본형 게시판에서 데이터를 읽어오는 저장 프로시저 : ListBasic
Create Procedure dbo.List_BookClub_notice
As 
	Select * From BookClub_notice
	Order By seq Desc 
Go


List_BookClub_notice


--  drop proc List_BookClub_notice




--[10]해당 글을 세부적으로 읽어오는 저장 프로시저 : ViewBasic 
Create Procedure dbo.View_BookClub_notice
	@seq Int
As
	Select *From BookClub_notice 
	Where seq = @seq
Go


View_BookClub_notice '1'


--  drop proc View_BookClub_notice




--[11]해당 글에 대한 비밀번호 읽어오는 저장 프로시저 : ReadPasword
Create Proc dbo.ReadPassword_BookClub_notice
	@seq Int 
As 
	Select Password 
	From BookClub_notice
	Where seq = @seq
Go	

--비밀번호는 Delete.aspx에서 쓰인다





--[12] 해당 글 지우는 저장 프로시저 : DeleteBasic 
Create Proc dbo.Delete_BookClub_notice
	@Password VarChar(20),
	@seq Int
As 
	 Declare @cnt Int
     -- 암호와 번호가 맞으면 1을 반환
     Select @cnt = Count(*) From BookClub_notice 
     Where seq = @seq And Password = @Password

     If @cnt > 0 
          Delete BookClub_notice Where seq = @seq And Password = @Password
     Else     
          Return -1

Go	


Delete_BookWrite '1'








--[13] 해당 글을 수정하는 저장 프로시저 : ModifyBasic
Create Proc dbo.Modify_BookClub_notice
     @Title VarChar(50),
     @ModifyIP VarChar(15), 
     @Content Text, 
     @Password VarChar(20),
	 @seq Int, @notice_id varchar(20)

As
     Declare @cnt Int
     Select @cnt = Count(*) From BookClub_notice
     Where seq = @seq And Password = @Password

     If @cnt > 0  -- 넘겨져 온 번호와 암호가 맞는 데이터가 있다면...
          Update BookClub_notice 
          Set 
               Title = @Title,
               ModifyIP = @ModifyIP,
			   Content = @Content, 
               ModifyDate = GetDate()
          Where seq = @seq And notice_id = @notice_id
		  And Password = @Password 
     Else
          Return -1 -- 암호가 틀리면 -1을 반환하자...
Go



Modify_BookClub_notice ''



--  drop proc Modify_BookClub_notice



-------------------------------------------------------------------



--검색
create Proc Search_All_place
      @SearchField VarChar(25),
      @SearchQuery VarChar(25)
As
     Set @SearchQuery = '%' + @SearchQuery + '%'
     SELECT *
     FROM All_place
     WHERE
      (
           CASE @SearchField 
                WHEN 'StoreName' THEN StoreName
                WHEN 'Address' THEN Address
				WHEN 'phone' THEN phone 
                WHEN 'genre' THEN genre
           ELSE 
                @SearchQuery
           END
      ) 
      LIKE 
      @SearchQuery
     Order By StoreName Desc
Go


Search_All_place 'StoreName', '안'
Go


