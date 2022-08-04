 


--  drop table BookClub_notice
 



Create Table BookClub_notice
(
	seq Int Identity(1,1) Primary Key, --��ȣ
	
	notice_id varchar(20) references Member(id),   --  �ۼ����� ���̵�
	Title VarChar(150) , --����
	Content Text , --����

	PostDate DateTime Default GetDate() Not Null, --�ۼ��� 
	PostIP VarChar(15) , --�ۼ�IP
	Password VarChar(20) , --��й�ȣ


	ReadCount Int Default 0, --��ȸ��

	ModifyDate SmallDateTime Null,--������
	ModifyIP VarChar(15) Null --���� IP
)




select * from BookClub_notice


 

insert into BookClub_notice values('id11','Ÿ��Ʋ ����','�̰� ������~~~',GetDate(), '112.112.2','111',0,null,null)
insert into BookClub_notice values('id11','�̰� ����!','�̰� ������~2222~~',GetDate(), '112.112.2','1234',0,null,null)




--[7] �⺻�� �Խ��ǿ� ���� �ۼ��ϴ� ���� ���ν��� : WriteBasic 
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



Write_BookClub_notice 'id11', '�����帳�ϴ�.', '����', '121:11:00', '123'

Write_BookClub_notice 'id11', '������.....','����', '11::', '123'





--   drop proc Write_BookClub_notice








--[8]�⺻�� �Խ��ǿ��� �����͸� �о���� ���� ���ν��� : ListBasic
Create Procedure dbo.List_BookClub_notice
As 
	Select * From BookClub_notice
	Order By seq Desc 
Go


List_BookClub_notice


--  drop proc List_BookClub_notice




--[10]�ش� ���� ���������� �о���� ���� ���ν��� : ViewBasic 
Create Procedure dbo.View_BookClub_notice
	@seq Int
As
	Select *From BookClub_notice 
	Where seq = @seq
Go


View_BookClub_notice '1'


--  drop proc View_BookClub_notice




--[11]�ش� �ۿ� ���� ��й�ȣ �о���� ���� ���ν��� : ReadPasword
Create Proc dbo.ReadPassword_BookClub_notice
	@seq Int 
As 
	Select Password 
	From BookClub_notice
	Where seq = @seq
Go	

--��й�ȣ�� Delete.aspx���� ���δ�





--[12] �ش� �� ����� ���� ���ν��� : DeleteBasic 
Create Proc dbo.Delete_BookClub_notice
	@Password VarChar(20),
	@seq Int
As 
	 Declare @cnt Int
     -- ��ȣ�� ��ȣ�� ������ 1�� ��ȯ
     Select @cnt = Count(*) From BookClub_notice 
     Where seq = @seq And Password = @Password

     If @cnt > 0 
          Delete BookClub_notice Where seq = @seq And Password = @Password
     Else     
          Return -1

Go	


Delete_BookWrite '1'








--[13] �ش� ���� �����ϴ� ���� ���ν��� : ModifyBasic
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

     If @cnt > 0  -- �Ѱ��� �� ��ȣ�� ��ȣ�� �´� �����Ͱ� �ִٸ�...
          Update BookClub_notice 
          Set 
               Title = @Title,
               ModifyIP = @ModifyIP,
			   Content = @Content, 
               ModifyDate = GetDate()
          Where seq = @seq And notice_id = @notice_id
		  And Password = @Password 
     Else
          Return -1 -- ��ȣ�� Ʋ���� -1�� ��ȯ����...
Go



Modify_BookClub_notice ''



--  drop proc Modify_BookClub_notice



-------------------------------------------------------------------



--�˻�
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


Search_All_place 'StoreName', '��'
Go


