use ASPNET;

--http://kb.supremainc.com/knowledge/doku.php?id=ko:1xfaq_how_to_create_a_sql_server_authentication_login_id
--sql ���̵� �߰� ���

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


--INSERT INTO Member (id, pwd, email, name, Birth, Phone, Adress) VALUES ('mama', '111', 'mama@test.com', '�κ�����', '1990','01089429503','����');

INSERT INTO Member (id, pwd, name, Phone) VALUES ('yyyy', '123', '���', '01033332222');

--INSERT INTO Member (id, pwd, email, name, Birth, Phone, Adress) VALUES ('babo', '1234', 'babo@test.com', '���ϼ�', '1997','01045328938','���');


INSERT INTO Member (id, pwd, name, Phone) VALUES ('nara1234','1234', '���ҷ�', '01042134526');


--ȸ��

INSERT INTO Member (id, pwd, name, Phone) VALUES ('hong1234', '111', 'ȫ�浿', '01089429503');

--INSERT INTO Member (id, pwd, email, name, Birth, Phone, Adress) VALUES ('sua', '123', 'sua@test.com', 'ȫ����', '2001','01033332222','�λ�');

--INSERT INTO Member (id, pwd, email, name, Birth, Phone, Adress) VALUES ('park', '1234', 'park@test.com', '���ϼ�', '1997','01045328938','���');

 
 INSERT INTO Member (id, pwd, name, Phone) VALUES ('dadf1234', '33', '��ټ�', '01012359240');


  INSERT INTO Member (id, pwd, name, Phone) VALUES ('verygood11', '33', '�����', '01733330284');

 





--[7] �⺻�� �Խ��ǿ� ���� �ۼ��ϴ� ���� ���ν��� : WriteDebate
-- ȸ������
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

MemberJoin 'id11', '333', 'ī�󳪶�', '01032248503'




--[13] �ش� ���� �����ϴ� ���� ���ν��� : ModifyBasic
-- MyPage���� ���
Create Proc dbo.ModifyMember
     @pwd VarChar(20), @Name VarChar(25), 
     @Phone varchar(20), 
     @id varchar(20)
As
     Declare @cnt Int
     Select @cnt = Count(*) From Member
	 Where id = @id

     If @cnt > 0  -- �Ѱ��� �� ��ȣ�� ��ȣ�� �´� �����Ͱ� �ִٸ�...
          Update Member 
          Set 
               pwd = @pwd, Name = @Name,
               Phone = @Phone
		  Where id = @id 
     Else
          Return -1 -- ��ȣ�� Ʋ���� -1�� ��ȯ����...
Go


-- ModifyMember '53', 'afd@emils.com', '�˵�', '1953', '01053258594', '�뱸',  'park'


