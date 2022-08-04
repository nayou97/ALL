

<asp:BoundField DataField="BookTitle1" HeaderText="BookTitle1" SortExpression="BookTitle1" />
                                        <asp:BoundField DataField="BookTitle2" HeaderText="BookTitle2" SortExpression="BookTitle2" />
                                        <asp:BoundField DataField="BookTitle3" HeaderText="BookTitle3" SortExpression="BookTitle3" />


                                        <asp:BoundField DataField="Author1" HeaderText="Author1" SortExpression="Author1" />
                                        <asp:BoundField DataField="Author2" HeaderText="Author2" SortExpression="Author2" />
                                        <asp:BoundField DataField="Author3" HeaderText="Author3" SortExpression="Author3" />

                                        <asp:BoundField DataField="Publisher1" HeaderText="Publisher1" SortExpression="Publisher1" />
                                        <asp:BoundField DataField="Publisher2" HeaderText="Publisher2" SortExpression="Publisher2" />
                                        <asp:BoundField DataField="Publisher3" HeaderText="Publisher3" SortExpression="Publisher3" />
										

-- 아나



create table ANA(
num int not null identity(1,1) primary key,
UserID varchar(20) references Member(id) not null,

UserName varchar(20) not null,
Phone int not null,
PostNum varchar(20) not null,
Address1 varchar(50) not null,
Address2 varchar(50) not null,
email varchar(50) not null,
--개인정보


--책정보(2단계)
BookTitle1 varchar(50) not null,
 --  BookTitle2 varchar(50) not null,
--  BookTitle3 varchar(50) not null,


Author1 varchar(50) null,
-- Author2 varchar(50) null,
--- Author3 varchar(50) null,


Publisher1 varchar(50) null,
-- Publisher2 varchar(50) null,
-- Publisher3 varchar(50) null,


WarningText text null,  -- 주의 사항
PostWay varchar(20) not null,
YesOrNo varchar(10) not null
)



-- drop table ANA
 
 select * from ANA

 

 
-- drop proc Insert_ANA



 --insert
create proc Insert_ANA
  @UserID varchar(20),
  @UserName varchar(20),
  @Phone int,
  @PostNum varchar(20),
  @Address1 varchar(50),
  @Address2 varchar(50),
  @email varchar(50),

  @BookTitle1 varchar(50) ,
 -- @BookTitle2 varchar(50),
 -- @BookTitle3 varchar(50) ,
  
  @Author1 varchar(50) ,
--  @Author2 varchar(50) ,
 -- @Author3 varchar(50) ,
  
  @Publisher1 varchar(50) ,
 -- @Publisher2 varchar(50) ,
--  @Publisher3 varchar(50) ,


  @WarningText text,
  @PostWay varchar(20),
  @YesOrNo varchar(10)
As 
  Insert ANA (
		UserID, UserName ,Phone, PostNum, Address1, Address2, email,
		BookTitle1,
		Author1,
		Publisher1,
		WarningText, PostWay, YesOrNo
	)
	Values
	(
		@UserID, @UserName, @Phone, @PostNum, @Address1, @Address2, @email,
		@BookTitle1,
		@Author1,
		@Publisher1,
		@WarningText, @PostWay, @YesOrNo
	)
Go 




Insert_ANA '이영자', '01033334444', '134-222', '서울시 강남구 신사동', '3층 304호', 'ddd11@naver.com', 2, '취급주의해야할 상품입니다. 뽁뽁이로 감싸서 보낼게요.', '택배배송(착불)', '동의', '1234'


 
-- drop proc Insert_ANA

select * from ana



 select BookTitle1,BookTitle2,BookTitle3,  Publisher1,Publisher2,Publisher3,  Author1,Author2,Author3 from ana










----바다


--  drop table BADA



create table BADA(
-- 바다에서 입력할, 받는사람의 정보
num int not null identity(1,1) primary key, -- 기부수혜자 등록번호
bada_num int,-- 아나바다 그리드뷰에 있는 기부등록번호

UserID varchar(20) references Member(id) not null,

---------------------------------------
--책정보(2단계)
BookTitle1 varchar(50) not null,
-- BookTitle2 varchar(50) not null,
-- BookTitle3 varchar(50) not null,


Author1 varchar(50) null,
-- Author2 varchar(50) null,
-- Author3 varchar(50) null,


Publisher1 varchar(50) null,
-- Publisher2 varchar(50) null,
-- Publisher3 varchar(50) null,

-----------------------------------

UserName varchar(20),
Phone int,
PostNum varchar(20),
Address1 varchar(50),
Address2 varchar(50),
email varchar(50)


YesOrNo varchar(10)


)



select * from BADA

select * from member


-- drop proc Insert_BADA



create proc Insert_BADA
  @UserID varchar(20),
  @bada_num int,
  @UserName varchar(20),
  @Phone int,
  @PostNum varchar(20),
  @Address1 varchar(50),
  @Address2 varchar(50),
  @email varchar(50),
  
  @Password varchar(30),
  @YesOrNo varchar(10),
   


   @BookTitle1 varchar(50) ,
@BookTitle2 varchar(50) ,
@BookTitle3 varchar(50) ,

@Author1 varchar(50) ,
@Author2 varchar(50) ,
@Author3 varchar(50) ,

@Publisher1 varchar(50) ,
@Publisher2 varchar(50) ,
@Publisher3 varchar(50) 

As 
  Insert BADA (
		UserID, bada_num, UserName ,Phone, PostNum, Address1, Address2, email,
		Password, YesOrNo,
		BookTitle1, BookTitle2, BookTitle3,
		Author1, Author2, Author3,
		Publisher1, Publisher2, Publisher3
	)
	Values
	(
		@UserID, @bada_num, @UserName, @Phone, @PostNum, @Address1, @Address2, @email,
		@Password, @YesOrNo,
		@BookTitle1, @BookTitle2, @BookTitle3,
		@Author1, @Author2, @Author3,
		@Publisher1, @Publisher2, @Publisher3
	)
Go 



select * from member


---------------------------------------------------------------------------------------------------


--내가 한 기증만 보기 => 기증신청서 (아이디를 조건으로. 내것만 조회)


create proc ANA_mypage
	@UserID varchar(20)
As 
	Select num, UserID, UserName
	From ANA
	where UserID = @UserID
	Order By num

	 

ANA_mypage 'hong1234'




create proc BADA_mypage
	@UserID varchar(20)
As 
	Select num, UserID
	From BADA
	where UserID = @UserID
	Order By num

	 

BADA_mypage 'hong1234'



select * from BADA


-- 라벨을 띄우고, 라벨=유저아이디 <= 이렇게
-- 이 창은 로그인을 해야만 들어올 수 있으니까...
-- 운영자 입장에선, 뭐....이름도 주소도 알게 되는거지뭐.


--아이디를 조건으로 삼고(where = id = @id) 그에 맞는 데이터들을 그리드뷰로 쫘르륵.
-- 조회하면, 신청글 양식이 그대로 보인다.
-- 그리고 취소하고 싶다면, 운영자만볼수있는 화면에 있는 그리드뷰(운영자만보기가능)에 데이터추가가 된다.



--  drop proc ANA_mypage

 



 SELECT  Member.id, ANA.*
FROM     ANA CROSS JOIN
               Member
where member.id = 'hong1234'
-- 현재페이지(로그인상태인 아이디)의 계정이 기부한 기록  => this.page.user웅앵







-- 운영자 - 아나


create proc ANA_admin
As 
	Select *
	From ANA
	Order By num

	 ANA_admin



create proc BADA_admin
As 
	Select *
	From BADA
	Order By num

	------//////////////////////////////////////////////////////////






	
--[10]해당 글을 세부적으로 읽어오는 저장 프로시저 : ViewBasic 
Create Procedure dbo.View_ANA
	@Num Int,
	@UserID varchar(20)
As
	Select *From ANA 
	Where Num = @Num And UserID = @UserID
Go


View_ANA '1' , 'hong1234'


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


