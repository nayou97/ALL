
-- 파일업로드테이블
https://imar.spaanjaars.com/414/storing-uploaded-files-in-a-database-or-in-the-file-system-with-aspnet-20



create table happy
(
 -- 다운로드버튼, 수정, 삭제 버튼들

       [seq] [int] identity(1,1) not null, -- 등록번호
	     
	   id varchar(20) references Member(id) not null, -- 작성자이름

       [pwd] [varchar](20) not null,  -- 삭제해야하니까

       [subject] [nvarchar](100) not null,  --타이틀,제목

       [content] [nvarchar](3000) not null,  --소개 내용

       [readcount] [int] default(0) not null, 

       [regdate] [datetime] default(getdate()) not null,  -- 등록일

       [fileName] varchar(100) null, --첨부파일명  -- 자료이름

	   [filePath] varchar(100) null, 

       [downloadCount] int default(0), --다운로드횟수 -- 다운로드 횟수
	    
	   ModifyDate SmallDateTime Null   --수정일

)

 
--   drop table happy



create table happy_saving -- happy는 현재 올라가있는 데이터들이고, 이거는 모든 기록을 포함함.
(
 -- 다운로드버튼, 수정, 삭제 버튼들

       [seq] [int] identity(1,1) not null, -- 등록번호
	     
	   id varchar(20) references Member(id) not null, -- 작성자이름

       [pwd] [varchar](20) not null,  -- 삭제해야하니까

       [subject] [nvarchar](100) not null,  --타이틀,제목

       [content] [nvarchar](3000) not null,  --소개 내용

       [readcount] [int] default(0) not null, 

       [regdate] [datetime] default(getdate()) not null,  -- 등록일

       [fileName] varchar(100) null, --첨부파일명  -- 자료이름

	   [filePath] varchar(100) null, 

       [downloadCount] int default(0), --다운로드횟수 -- 다운로드 횟수
	    
	   ModifyDate SmallDateTime Null   --수정일

)




 -- 내가 올린 파일 - 계정별로 따로 출력
Create Proc dbo.List_happy_saving
	@id varchar(20)
As 
	select * from happy_saving
	where id = @id
Go



List_happy_saving 'hong'





select * from happy;

 

insert into happy values('hong', '1234','title', '소개글입니다.', 10, GETDATE(),  '2019졸업작품계획서_7월14일_.hwp' , '2019졸업작품계획서_7월14일_.hwp', 2, null )



 





--[13] 해당 글을 수정하는 저장 프로시저 : ModifyBasic
Create Proc dbo.Modify_happy
     @subject VarChar(50), @Content Text,    
     @pwd VarChar(20), @fileName varchar(100), @filePath varchar(100),
	 @seq Int, @id varchar(20)

As
     Declare @cnt Int
     Select @cnt = Count(*) From happy
     Where seq = @seq And pwd = @pwd

     If @cnt > 0  -- 넘겨져 온 번호와 암호가 맞는 데이터가 있다면...
          Update happy 
          Set 
               subject = @subject, Content = @Content,
               ModifyDate = GetDate(), fileName = @fileName, filePath = @filePath
          Where seq = @seq And id = @id
		  And pwd = @pwd 
     Else
          Return -1 -- 암호가 틀리면 -1을 반환하자...
Go



Modify_happy ''



--  drop proc Modify_happy







--[12] 해당 글 지우는 저장 프로시저 : DeleteBasic 
Create Proc dbo.Delete_Happy
	@pwd VarChar(20),
	@seq Int
As 
	 Declare @cnt Int
     -- 암호와 번호가 맞으면 1을 반환
     Select @cnt = Count(*) From happy 
     Where seq = @seq And pwd = @pwd

     If @cnt > 0 
          Delete happy Where seq = @seq And pwd = @pwd
     Else     
          Return -1

Go	




Delete_Happy




--[10]해당 글을 세부적으로 읽어오는 저장 프로시저 : ViewBasic 
Create Procedure dbo.View_happy
	@seq Int,
	@id varchar(20)
As
	Select * From happy 
	Where seq = @seq And id = @id
Go


 --추천수 늘리기
  
Update_download_Count_happy 2


 


 

-- 내가 올린 파일 - 계정별로 따로 출력
Create Proc dbo.List_happy
	@id varchar(20)
As 
	select * from happy
	where id = @id
Go




-- drop proc List_happy



List_happy 'dadf'
List_happy 'hong'




 


