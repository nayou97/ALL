use ASPNET





Create Table dbo.Notice 
(
	Num Int Identity(1,1) Not Null Primary Key, --��ȣ 
	id VarChar(20) Not Null references Member(id), --�̸� id11�� ����̴�.
	Password VarChar(20) Not Null, --��й�ȣ

	Title VarChar(150) Not Null, --����
	PostDate DateTime Default GetDate() Not Null, --�ۼ��� 
	PostIP VarChar(15) Not Null, --�ۼ�IP

	Content Text Not Null, --����

	ReadCount Int Default 0, --��ȸ��

	ModifyDate SmallDateTime Null,--������
	ModifyIP VarChar(15) Null --���� IP
)


---   drop table Notice



Select *From Notice

insert into Notice values('id11', '333', '���������Դϴ�.', GetDate(), '1:::0', '���������', 1, null, null)


--select id from Notice where Num = 1





--[7] �⺻�� �Խ��ǿ� ���� �ۼ��ϴ� ���� ���ν��� : WriteBasic 
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


Write_Notice 'id11', '2019�� 1�� ���� �� ��������~', 'ii2:00', '�����λ�帳�ϴ�.', '1'






--[8]�⺻�� �Խ��ǿ��� �����͸� �о���� ���� ���ν��� : ListBasic
Create Procedure dbo.List_Notice
As 
	Select *From Notice
	Order By Num Desc 
Go


List_Notice





--[9]��ȸ�� ���� �����ִ� ���� ���ν��� : UpdateReadCount
Create Proc dbo.Update_ReadCount_Notice
	@Num Int
As 
	Update Notice
	Set ReadCount = ReadCount + 1
	Where Num = @Num
Go


Update_ReadCount_Notice '1'







--[10]�ش� ���� ���������� �о���� ���� ���ν��� : ViewBasic 
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







--[11]�ش� �ۿ� ���� ��й�ȣ �о���� ���� ���ν��� : ReadPasword
Create Proc dbo.Read_Password_Notice
	@Num Int 
As 
	Select Password 
	From Notice
	Where Num = @Num
Go	



Read_Password_Notice '1'




--[12] �ش� �� ����� ���� ���ν��� : DeleteBasic 
Create Proc dbo.Delete_Notice 
	@Password VarChar(20),
	@Num Int
As 
	 Declare @cnt Int
     -- ��ȣ�� ��ȣ�� ������ 1�� ��ȯ
     Select @cnt = Count(*) From Notice 
     Where Num = @Num And Password = @Password

     If @cnt > 0 
          Delete Notice Where Num = @Num And Password = @Password
     Else     
          Return -1

Go	





--[13] �ش� ���� �����ϴ� ���� ���ν��� : ModifyBasic
Create Proc dbo.Modify_Notice
     @id varchar(20), 
     @Title VarChar(150), @ModifyIP VarChar(15), 
     @Content Text,
     @Password VarChar(20), @Num Int
As
     Declare @cnt Int
     Select @cnt = Count(*) From Notice
     Where Num = @Num And Password = @Password

     If @cnt > 0  -- �Ѱ��� �� ��ȣ�� ��ȣ�� �´� �����Ͱ� �ִٸ�...
          Update Notice 
          Set 
               id = @id, Title = @Title,
			   ModifyIP = @ModifyIP,
               ModifyDate = GetDate(), Content = @Content
          Where Num = @Num And Password = @Password
     Else
          Return -1 -- ��ȣ�� Ʋ���� -1�� ��ȯ����...
Go


