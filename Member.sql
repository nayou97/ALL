use ASPNET;

--http://kb.supremainc.com/knowledge/doku.php?id=ko:1xfaq_how_to_create_a_sql_server_authentication_login_id
--sql 아이디 추가 방법

select * from Member where id = 'hong' and pwd = 111

 SELECT * FROM Member;
  

 CREATE TABLE Member

(

       [id] varchar(20) primary key,

       [pwd] varchar(20) not null,

    --   [email] varchar(50) null,

       [name] varchar(20) not null,
	   
	 --  Birth varchar(10),
	   
	   Phone varchar(20),
	   
	 --  Adress varchar(50)
)
 
  alter table Member drop column email


--INSERT INTO Member (id, pwd, email, name, Birth, Phone, Adress) VALUES ('mama', '111', 'mama@test.com', '부부젤라', '1990','01089429503','서울');

INSERT INTO Member (id, pwd, name, Phone) VALUES ('yyyy', '123', '운영자', '01033332222');

--INSERT INTO Member (id, pwd, email, name, Birth, Phone, Adress) VALUES ('babo', '1234', 'babo@test.com', '박하선', '1997','01045328938','경기');


INSERT INTO Member (id, pwd, name, Phone) VALUES ('nara1234','1234', '김할루', '01042134526');


--회원

INSERT INTO Member (id, pwd, name, Phone) VALUES ('hong1234', '111', '홍길동', '01089429503');

--INSERT INTO Member (id, pwd, email, name, Birth, Phone, Adress) VALUES ('sua', '123', 'sua@test.com', '홍수아', '2001','01033332222','부산');

--INSERT INTO Member (id, pwd, email, name, Birth, Phone, Adress) VALUES ('park', '1234', 'park@test.com', '박하선', '1997','01045328938','경기');

 
 INSERT INTO Member (id, pwd, name, Phone) VALUES ('dadf1234', '33', '김다솜', '01012359240');


  INSERT INTO Member (id, pwd, name, Phone) VALUES ('verygood11', '33', '라라진', '01733330284');

 





--[7] 기본형 게시판에 글을 작성하는 저장 프로시저 : WriteDebate
-- 회원가입
Create Proc dbo.MemberJoin
	@id varchar(20),
	@pwd varchar(20), 
	@Name VarChar(20),
	@Phone varchar(20)
As 
	Insert Member
	(
		id, pwd, Name, Phone
	)
	Values
	(
		@id, @pwd, @Name, @Phone
	)
Go  	

MemberJoin 'id11', '333', '카라나라', '01032248503'




--[13] 해당 글을 수정하는 저장 프로시저 : ModifyBasic
-- MyPage에서 사용
Create Proc dbo.ModifyMember
     @pwd VarChar(20), @Name VarChar(25), 
     @Phone varchar(20), 
     @id varchar(20)
As
     Declare @cnt Int
     Select @cnt = Count(*) From Member
	 Where id = @id

     If @cnt > 0  -- 넘겨져 온 번호와 암호가 맞는 데이터가 있다면...
          Update Member 
          Set 
               pwd = @pwd, Name = @Name,
               Phone = @Phone
		  Where id = @id 
     Else
          Return -1 -- 암호가 틀리면 -1을 반환하자...
Go


-- ModifyMember '53', 'afd@emils.com', '탸델', '1953', '01053258594', '대구',  'park'


