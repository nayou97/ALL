use ASPNET



create table debate_paging(
c_seq int identity(1,1) primary key, --댓글번호
b_seq int not null, --원본글번호(Board)
c_nickname varchar(20) not null references Member(id), -- 레퍼런스 할려다가...말았다. => cs파일에서 쿠키값을 닉네임으로 지정했는데 뭐.
c_content varchar(1000) not null, --댓글내용
c_regDate datetime default(getdate()) not null
)




CREATE PROCEDURE Paging_debate
(
    @pagenumber int,
    @pagesize int,
	@b_seq int
)
               
AS
                declare @startingRec int
                declare @endRec int
                declare @startingBookId int
                declare @endBookId int
                declare @recCount int

                set @startingRec=@pagenumber*@pagesize-@pagesize+1
                               
                declare cur_book scroll cursor for select c_seq from debate_paging order by c_seq    -- 테이블명을 지정하고, 키 값을 정한다(등록번호가 좋겠지)
               
                open cur_book
               
                fetch absolute @startingRec from cur_book into @startingBookId
               
                select @recCount=count(*) from debate_paging where c_seq>@startingBookId   -- 테이블명을 지정하고, "등록번호>스타팅아이디(시작번호)"
               
                if @recCount<@pagesize
                                set @endRec=@startingRec+@recCount
                else
                                set @endRec=@pagenumber * @pagesize

                fetch absolute @endRec from cur_book into @endBookId
               
                close cur_book
               
                deallocate cur_book

                select count(*) from debate_paging    --  테이블명
                select * from debate_paging where c_seq >= @startingBookId and c_seq <= @endBookId  And b_seq = @b_seq  --  테이블명 지정///   등록번호는 스타팅번호보다 크고, 엔드번호보다 작다




-- 댓글테이블
Create Table Debate_board
(
	seq Int Identity(1,1) Primary Key, --번호
	
	Debate_id varchar(20) references Member(id),   --  작성자의 아이디
	Title VarChar(150) , --제목
	Content Text , --내용

	PostDate DateTime Default GetDate() Not Null, --작성일 
	PostIP VarChar(15) , --작성IP
	Password VarChar(20) , --비밀번호


	ReadCount Int Default 0, --조회수
	commentCount int default(0), --댓글수

	ModifyDate SmallDateTime Null,--수정일
	ModifyIP VarChar(15) Null --수정 IP
)




select * from Debate_board


-- drop table Debate_board



select * from Member 

--delete Debate_board where Debate_id='hong'
--getdate()부분에서 ''빈칸을 쓰면, 1900년도가 된다

-- insert into Debate_board values('id11','이번 주에 모였던 자리에서 나온 책에 대해서 말인데요','내용적기',GetDate(), '112.112.2','111',0,0,null,null)
insert into Debate_board values('id11','나폴레옹은 영웅인가? 전쟁광인가? <- 이 주제에 대하여','내용적기2222',GetDate(), '112.112.2','1234',0,0,null,null)
-- insert into Debate_board values('id11','집에있는 책들중 흥미로운 소재가 있는데','내용적기3333',GetDate(), '112.112.2','11',0,0,null,null)










--[12] 해당 글 지우는 저장 프로시저 : DeleteBasic 
Create Proc dbo.DeleteDebate
	@Password VarChar(20),
	@seq Int
As 
	 Declare @cnt Int
     -- 암호와 번호가 맞으면 1을 반환
     Select @cnt = Count(*) From Debate_board 
     Where seq = @seq And Password = @Password

     If @cnt > 0 
          Delete Debate_board Where seq = @seq And Password = @Password
     Else     
          Return -1

Go	



DeleteDebate '1', '111'


select * from Debate_board



  /*
--[7] 기본형 게시판에 글을 작성하는 저장 프로시저 : WriteDebate
Create Proc dbo.WriteDebate
	@Debate_id varchar(20),
	@Name VarChar(20),
	@Email VarChar(50),
	@Title VarChar(150),
	@PostIP VarChar(20),
	@Content Text,
	@Password VarChar(20)
--With Encryption
As 
	Insert Debate_board
	(
		Debate_id,Title,Content,PostIP,
		Password
	)
	Values
	(
		@Debate_id,@Title,@Content,@PostIP,
		@Password
	)
Go  	



--drop proc Writedebate
Writedebate 'hong', '카', 'na22@nawe', '나라나라','1','dd','123'
--아이디 부분 특히 MEmber테이블에 있는걸로만 해야함. 난 hong아이디로 하고, 비번은 123인거 ㅇㅇ







--[8]기본형 게시판에서 데이터를 읽어오는 저장 프로시저 : ListDebate
Create Procedure dbo.ListDebate
As 
	Select *From Debate_board
	Order By seq Desc 
Go




--drop proc ListDebate

ListDebate




*/




--[9]조회수 증가 시켜주는 저장 프로시저 : UpdateReadCount
Create Proc dbo.UpdateReadCountDebate
	@seq Int
As 
	Update Debate_board
	Set ReadCount = ReadCount + 1
	Where seq = @seq
Go


UpdateReadCountDebate '1'



--[10]해당 글을 세부적으로 읽어오는 저장 프로시저 : ViewBasic 
Create Procedure dbo.View_DebateBoard
	@seq Int
As
	Update Debate_board
	Set ReadCount = ReadCount + 1
	Where seq = @seq 
	
	Select *From Debate_board 
	Where seq = @seq
Go


--'ViewDebate'에 매개 변수 '@seq'이(가) 필요하지만 제공되지 않았습니다.
View_DebateBoard '1'


 

--[13] 해당 글을 수정하는 저장 프로시저 : ModifyBasic
Create Proc dbo.ModifyDebate
     @Title VarChar(150), @ModifyIP VarChar(15), 
     @Content Text,
     @Password VarChar(20), @seq Int
As
     Declare @cnt Int
     Select @cnt = Count(*) From Debate_board
     Where seq = @seq And Password = @Password

     If @cnt > 0  -- 넘겨져 온 번호와 암호가 맞는 데이터가 있다면...
          Update Debate_board 
          Set 
               Title = @Title, ModifyIP = @ModifyIP,
               ModifyDate = GetDate(), Content = @Content
          Where seq = @seq And Password = @Password
     Else
          Return -1 -- 암호가 틀리면 -1을 반환하자...
Go

ModifyDebate 




-----------------------------------------------------------------------------------














create table Debate_Comment
(

       c_seq int identity(1,1) primary key, --댓글번호
	   
       b_seq int not null, --원본글번호(Board)

       c_nickname varchar(20) not null references Member(id), -- 레퍼런스 할려다가...말았다. => cs파일에서 쿠키값을 닉네임으로 지정했는데 뭐.
	   
      -- c_pwd varchar(20) not null,

       c_content varchar(1000) not null, --댓글내용

       c_regDate datetime default(getdate()) not null

)



select * from Debate_Comment

--drop table Debate_Comment




-- 댓글번호, 댓글과 연동된 글번호, 댓글아이디, 댓글사용자 닉네임, 댓글사용자 비번, 댓글 내용들, 댓 쓴 날짜
insert into Debate_Comment values(2,'hong', '아이고야 드디어 댓글을~',GETDATE())
insert into Debate_Comment values(3,'dadf','댓글내용1',GETDATE())
insert into Debate_Comment values(1,'na11','댓글내용22',GETDATE())



--원본글번호 b_seq가 말하는 '원본'에 딸린 댓글들(연동시키기)
--보드테이블과 댓글테이블을 이너조인 => 보드테이블의 seq와 댓글테이블의 b_seq는 같다
--리스트.aspx에서 뭐를 클릭하면 -> seq를 통해 View로 넘어감 -> seq글번호와 함께있는 데이터들을 출력함 -> 그와 동시에 seq글번호와 같은 = 댓글테이블의 b_seq도 같이
--프로시저를 통해 출력


  

  ------------------------------------------------------------------
    


  -- 프로시저 == 댓글
  
   

  --댓글 읽어오기(select)
create proc SpFilter_Comment
@b_seq int
As 
Select *From Debate_Comment
where b_seq = @b_seq
Order By getdate()


SpFilter_Comment '2'

-- drop proc SpFilter_Comment
 


------------------------------------------------

-- 댓글 삭제하기
-- 아무나 삭제 못함
-- 비밀번호를 알면 삭제하도록



--[11]해당 글에 대한 비밀번호 읽어오는 저장 프로시저 : ReadPasword
Create Proc dbo.ReadPassword_Debate_Comment
	@c_seq Int 
As 
	Select Password 
	From Debate_board
	Where c_seq = @c_seq and 
Go	




--------------------------------------------------------------------------------------------



 

--[14] 검색 저장 프로시저 : 동적 SQL문
Create Proc dbo.SearchDebate
     @SearchField VarChar(25),
     @SearchQuery VarChar(25)
As
     Declare @strSql VarChar(150) -- 변수 선언
     Set @strSql = '
     Select * From Debate_board 
     Where ' 
          + @SearchField + ' Like ''%' 
          + @SearchQuery + '%'' Order By seq Desc'
     --Print @strSql
     Exec (@strSql)
Go

SearchDebate ' 1 = 1; Drop Table Debate_board --', '메롱~'
Go

-- 서치필드와 서치쿼리를 입력하고 검색 ㄱㄱ
-- 서치필드는 꼼꼼히 적어야함.
-- 서치쿼리는 등록번호순으로 정렬됨
SearchDebate 'Name', '카'
Go


--[12] 검색 저장 프로시저 : 정적 쿼리문 
-- 나 이걸로 수정함 ㅅㄱ
Alter Proc dbo.SearchDebate
      @SearchField VarChar(25),
      @SearchQuery VarChar(25)
As
     Set @SearchQuery = '%' + @SearchQuery + '%'
     SELECT *
     FROM Debate_board
     WHERE
      (
           CASE @SearchField 
                WHEN 'Name' THEN Name
                WHEN 'id' THEN Debate_id
                WHEN 'Title' THEN Title
           ELSE 
                @SearchQuery
           END
      ) 
      LIKE 
      @SearchQuery
     Order By seq Desc
Go


SearchDebate 'Name', '카'
Go

	 