use ASPNET



create table debate_paging(
c_seq int identity(1,1) primary key, --��۹�ȣ
b_seq int not null, --�����۹�ȣ(Board)
c_nickname varchar(20) not null references Member(id), -- ���۷��� �ҷ��ٰ�...���Ҵ�. => cs���Ͽ��� ��Ű���� �г������� �����ߴµ� ��.
c_content varchar(1000) not null, --��۳���
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
                               
                declare cur_book scroll cursor for select c_seq from debate_paging order by c_seq    -- ���̺���� �����ϰ�, Ű ���� ���Ѵ�(��Ϲ�ȣ�� ������)
               
                open cur_book
               
                fetch absolute @startingRec from cur_book into @startingBookId
               
                select @recCount=count(*) from debate_paging where c_seq>@startingBookId   -- ���̺���� �����ϰ�, "��Ϲ�ȣ>��Ÿ�þ��̵�(���۹�ȣ)"
               
                if @recCount<@pagesize
                                set @endRec=@startingRec+@recCount
                else
                                set @endRec=@pagenumber * @pagesize

                fetch absolute @endRec from cur_book into @endBookId
               
                close cur_book
               
                deallocate cur_book

                select count(*) from debate_paging    --  ���̺��
                select * from debate_paging where c_seq >= @startingBookId and c_seq <= @endBookId  And b_seq = @b_seq  --  ���̺�� ����///   ��Ϲ�ȣ�� ��Ÿ�ù�ȣ���� ũ��, �����ȣ���� �۴�




-- ������̺�
Create Table Debate_board
(
	seq Int Identity(1,1) Primary Key, --��ȣ
	
	Debate_id varchar(20) references Member(id),   --  �ۼ����� ���̵�
	Title VarChar(150) , --����
	Content Text , --����

	PostDate DateTime Default GetDate() Not Null, --�ۼ��� 
	PostIP VarChar(15) , --�ۼ�IP
	Password VarChar(20) , --��й�ȣ


	ReadCount Int Default 0, --��ȸ��
	commentCount int default(0), --��ۼ�

	ModifyDate SmallDateTime Null,--������
	ModifyIP VarChar(15) Null --���� IP
)




select * from Debate_board


-- drop table Debate_board



select * from Member 

--delete Debate_board where Debate_id='hong'
--getdate()�κп��� ''��ĭ�� ����, 1900�⵵�� �ȴ�

-- insert into Debate_board values('id11','�̹� �ֿ� �𿴴� �ڸ����� ���� å�� ���ؼ� ���ε���','��������',GetDate(), '112.112.2','111',0,0,null,null)
insert into Debate_board values('id11','���������� �����ΰ�? ���ﱤ�ΰ�? <- �� ������ ���Ͽ�','��������2222',GetDate(), '112.112.2','1234',0,0,null,null)
-- insert into Debate_board values('id11','�����ִ� å���� ��̷ο� ���簡 �ִµ�','��������3333',GetDate(), '112.112.2','11',0,0,null,null)










--[12] �ش� �� ����� ���� ���ν��� : DeleteBasic 
Create Proc dbo.DeleteDebate
	@Password VarChar(20),
	@seq Int
As 
	 Declare @cnt Int
     -- ��ȣ�� ��ȣ�� ������ 1�� ��ȯ
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
--[7] �⺻�� �Խ��ǿ� ���� �ۼ��ϴ� ���� ���ν��� : WriteDebate
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
Writedebate 'hong', 'ī', 'na22@nawe', '���󳪶�','1','dd','123'
--���̵� �κ� Ư�� MEmber���̺� �ִ°ɷθ� �ؾ���. �� hong���̵�� �ϰ�, ����� 123�ΰ� ����







--[8]�⺻�� �Խ��ǿ��� �����͸� �о���� ���� ���ν��� : ListDebate
Create Procedure dbo.ListDebate
As 
	Select *From Debate_board
	Order By seq Desc 
Go




--drop proc ListDebate

ListDebate




*/




--[9]��ȸ�� ���� �����ִ� ���� ���ν��� : UpdateReadCount
Create Proc dbo.UpdateReadCountDebate
	@seq Int
As 
	Update Debate_board
	Set ReadCount = ReadCount + 1
	Where seq = @seq
Go


UpdateReadCountDebate '1'



--[10]�ش� ���� ���������� �о���� ���� ���ν��� : ViewBasic 
Create Procedure dbo.View_DebateBoard
	@seq Int
As
	Update Debate_board
	Set ReadCount = ReadCount + 1
	Where seq = @seq 
	
	Select *From Debate_board 
	Where seq = @seq
Go


--'ViewDebate'�� �Ű� ���� '@seq'��(��) �ʿ������� �������� �ʾҽ��ϴ�.
View_DebateBoard '1'


 

--[13] �ش� ���� �����ϴ� ���� ���ν��� : ModifyBasic
Create Proc dbo.ModifyDebate
     @Title VarChar(150), @ModifyIP VarChar(15), 
     @Content Text,
     @Password VarChar(20), @seq Int
As
     Declare @cnt Int
     Select @cnt = Count(*) From Debate_board
     Where seq = @seq And Password = @Password

     If @cnt > 0  -- �Ѱ��� �� ��ȣ�� ��ȣ�� �´� �����Ͱ� �ִٸ�...
          Update Debate_board 
          Set 
               Title = @Title, ModifyIP = @ModifyIP,
               ModifyDate = GetDate(), Content = @Content
          Where seq = @seq And Password = @Password
     Else
          Return -1 -- ��ȣ�� Ʋ���� -1�� ��ȯ����...
Go

ModifyDebate 




-----------------------------------------------------------------------------------














create table Debate_Comment
(

       c_seq int identity(1,1) primary key, --��۹�ȣ
	   
       b_seq int not null, --�����۹�ȣ(Board)

       c_nickname varchar(20) not null references Member(id), -- ���۷��� �ҷ��ٰ�...���Ҵ�. => cs���Ͽ��� ��Ű���� �г������� �����ߴµ� ��.
	   
      -- c_pwd varchar(20) not null,

       c_content varchar(1000) not null, --��۳���

       c_regDate datetime default(getdate()) not null

)



select * from Debate_Comment

--drop table Debate_Comment




-- ��۹�ȣ, ��۰� ������ �۹�ȣ, ��۾��̵�, ��ۻ���� �г���, ��ۻ���� ���, ��� �����, �� �� ��¥
insert into Debate_Comment values(2,'hong', '���̰�� ���� �����~',GETDATE())
insert into Debate_Comment values(3,'dadf','��۳���1',GETDATE())
insert into Debate_Comment values(1,'na11','��۳���22',GETDATE())



--�����۹�ȣ b_seq�� ���ϴ� '����'�� ���� ��۵�(������Ű��)
--�������̺�� ������̺��� �̳����� => �������̺��� seq�� ������̺��� b_seq�� ����
--����Ʈ.aspx���� ���� Ŭ���ϸ� -> seq�� ���� View�� �Ѿ -> seq�۹�ȣ�� �Բ��ִ� �����͵��� ����� -> �׿� ���ÿ� seq�۹�ȣ�� ���� = ������̺��� b_seq�� ����
--���ν����� ���� ���


  

  ------------------------------------------------------------------
    


  -- ���ν��� == ���
  
   

  --��� �о����(select)
create proc SpFilter_Comment
@b_seq int
As 
Select *From Debate_Comment
where b_seq = @b_seq
Order By getdate()


SpFilter_Comment '2'

-- drop proc SpFilter_Comment
 


------------------------------------------------

-- ��� �����ϱ�
-- �ƹ��� ���� ����
-- ��й�ȣ�� �˸� �����ϵ���



--[11]�ش� �ۿ� ���� ��й�ȣ �о���� ���� ���ν��� : ReadPasword
Create Proc dbo.ReadPassword_Debate_Comment
	@c_seq Int 
As 
	Select Password 
	From Debate_board
	Where c_seq = @c_seq and 
Go	




--------------------------------------------------------------------------------------------



 

--[14] �˻� ���� ���ν��� : ���� SQL��
Create Proc dbo.SearchDebate
     @SearchField VarChar(25),
     @SearchQuery VarChar(25)
As
     Declare @strSql VarChar(150) -- ���� ����
     Set @strSql = '
     Select * From Debate_board 
     Where ' 
          + @SearchField + ' Like ''%' 
          + @SearchQuery + '%'' Order By seq Desc'
     --Print @strSql
     Exec (@strSql)
Go

SearchDebate ' 1 = 1; Drop Table Debate_board --', '�޷�~'
Go

-- ��ġ�ʵ�� ��ġ������ �Է��ϰ� �˻� ����
-- ��ġ�ʵ�� �Ĳ��� �������.
-- ��ġ������ ��Ϲ�ȣ������ ���ĵ�
SearchDebate 'Name', 'ī'
Go


--[12] �˻� ���� ���ν��� : ���� ������ 
-- �� �̰ɷ� ������ ����
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


SearchDebate 'Name', 'ī'
Go

	 