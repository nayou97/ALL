

<asp:BoundField DataField="BookTitle1" HeaderText="BookTitle1" SortExpression="BookTitle1" />
                                        <asp:BoundField DataField="BookTitle2" HeaderText="BookTitle2" SortExpression="BookTitle2" />
                                        <asp:BoundField DataField="BookTitle3" HeaderText="BookTitle3" SortExpression="BookTitle3" />


                                        <asp:BoundField DataField="Author1" HeaderText="Author1" SortExpression="Author1" />
                                        <asp:BoundField DataField="Author2" HeaderText="Author2" SortExpression="Author2" />
                                        <asp:BoundField DataField="Author3" HeaderText="Author3" SortExpression="Author3" />

                                        <asp:BoundField DataField="Publisher1" HeaderText="Publisher1" SortExpression="Publisher1" />
                                        <asp:BoundField DataField="Publisher2" HeaderText="Publisher2" SortExpression="Publisher2" />
                                        <asp:BoundField DataField="Publisher3" HeaderText="Publisher3" SortExpression="Publisher3" />
										

-- �Ƴ�



create table ANA(
num int not null identity(1,1) primary key,
UserID varchar(20) references Member(id) not null,

UserName varchar(20) not null,
Phone int not null,
PostNum varchar(20) not null,
Address1 varchar(50) not null,
Address2 varchar(50) not null,
email varchar(50) not null,
--��������


--å����(2�ܰ�)
BookTitle1 varchar(50) not null,
 --  BookTitle2 varchar(50) not null,
--  BookTitle3 varchar(50) not null,


Author1 varchar(50) null,
-- Author2 varchar(50) null,
--- Author3 varchar(50) null,


Publisher1 varchar(50) null,
-- Publisher2 varchar(50) null,
-- Publisher3 varchar(50) null,


WarningText text null,  -- ���� ����
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




Insert_ANA '�̿���', '01033334444', '134-222', '����� ������ �Ż絿', '3�� 304ȣ', 'ddd11@naver.com', 2, '��������ؾ��� ��ǰ�Դϴ�. �Ȼ��̷� ���μ� �����Կ�.', '�ù���(����)', '����', '1234'


 
-- drop proc Insert_ANA

select * from ana



 select BookTitle1,BookTitle2,BookTitle3,  Publisher1,Publisher2,Publisher3,  Author1,Author2,Author3 from ana










----�ٴ�


--  drop table BADA



create table BADA(
-- �ٴٿ��� �Է���, �޴»���� ����
num int not null identity(1,1) primary key, -- ��μ����� ��Ϲ�ȣ
bada_num int,-- �Ƴ��ٴ� �׸���信 �ִ� ��ε�Ϲ�ȣ

UserID varchar(20) references Member(id) not null,

---------------------------------------
--å����(2�ܰ�)
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


--���� �� ������ ���� => ������û�� (���̵� ��������. ���͸� ��ȸ)


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


-- ���� ����, ��=�������̵� <= �̷���
-- �� â�� �α����� �ؾ߸� ���� �� �����ϱ�...
-- ��� ���忡��, ��....�̸��� �ּҵ� �˰� �Ǵ°�����.


--���̵� �������� ���(where = id = @id) �׿� �´� �����͵��� �׸����� �Ҹ���.
-- ��ȸ�ϸ�, ��û�� ����� �״�� ���δ�.
-- �׸��� ����ϰ� �ʹٸ�, ��ڸ������ִ� ȭ�鿡 �ִ� �׸����(��ڸ����Ⱑ��)�� �������߰��� �ȴ�.



--  drop proc ANA_mypage

 



 SELECT  Member.id, ANA.*
FROM     ANA CROSS JOIN
               Member
where member.id = 'hong1234'
-- ����������(�α��λ����� ���̵�)�� ������ ����� ���  => this.page.user����







-- ��� - �Ƴ�


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






	
--[10]�ش� ���� ���������� �о���� ���� ���ν��� : ViewBasic 
Create Procedure dbo.View_ANA
	@Num Int,
	@UserID varchar(20)
As
	Select *From ANA 
	Where Num = @Num And UserID = @UserID
Go


View_ANA '1' , 'hong1234'


--  drop proc View_BookWrite




--[11]�ش� �ۿ� ���� ��й�ȣ �о���� ���� ���ν��� : ReadPasword
Create Proc dbo.ReadPassword_BookWrite
	@Num Int 
As 
	Select Password 
	From BookWrite
	Where Num = @Num
Go	

--��й�ȣ�� Delete.aspx���� ���δ�





--[12] �ش� �� ����� ���� ���ν��� : DeleteBasic 
Create Proc dbo.Delete_BookWrite 
	@Password VarChar(20),
	@Num Int
As 
	 Declare @cnt Int
     -- ��ȣ�� ��ȣ�� ������ 1�� ��ȯ
     Select @cnt = Count(*) From BookWrite 
     Where Num = @Num And Password = @Password

     If @cnt > 0 
          Delete BookWrite Where Num = @Num And Password = @Password
     Else     
          Return -1

Go	


Delete_BookWrite '1'



--[13] �ش� ���� �����ϴ� ���� ���ν��� : ModifyBasic
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

     If @cnt > 0  -- �Ѱ��� �� ��ȣ�� ��ȣ�� �´� �����Ͱ� �ִٸ�...
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
          Return -1 -- ��ȣ�� Ʋ���� -1�� ��ȯ����...
Go



Modify_BookWrite ''



-- drop proc Modify_BookWrite


