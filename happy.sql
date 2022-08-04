
-- ���Ͼ��ε����̺�
https://imar.spaanjaars.com/414/storing-uploaded-files-in-a-database-or-in-the-file-system-with-aspnet-20



create table happy
(
 -- �ٿ�ε��ư, ����, ���� ��ư��

       [seq] [int] identity(1,1) not null, -- ��Ϲ�ȣ
	     
	   id varchar(20) references Member(id) not null, -- �ۼ����̸�

       [pwd] [varchar](20) not null,  -- �����ؾ��ϴϱ�

       [subject] [nvarchar](100) not null,  --Ÿ��Ʋ,����

       [content] [nvarchar](3000) not null,  --�Ұ� ����

       [readcount] [int] default(0) not null, 

       [regdate] [datetime] default(getdate()) not null,  -- �����

       [fileName] varchar(100) null, --÷�����ϸ�  -- �ڷ��̸�

	   [filePath] varchar(100) null, 

       [downloadCount] int default(0), --�ٿ�ε�Ƚ�� -- �ٿ�ε� Ƚ��
	    
	   ModifyDate SmallDateTime Null   --������

)

 
--   drop table happy



create table happy_saving -- happy�� ���� �ö��ִ� �����͵��̰�, �̰Ŵ� ��� ����� ������.
(
 -- �ٿ�ε��ư, ����, ���� ��ư��

       [seq] [int] identity(1,1) not null, -- ��Ϲ�ȣ
	     
	   id varchar(20) references Member(id) not null, -- �ۼ����̸�

       [pwd] [varchar](20) not null,  -- �����ؾ��ϴϱ�

       [subject] [nvarchar](100) not null,  --Ÿ��Ʋ,����

       [content] [nvarchar](3000) not null,  --�Ұ� ����

       [readcount] [int] default(0) not null, 

       [regdate] [datetime] default(getdate()) not null,  -- �����

       [fileName] varchar(100) null, --÷�����ϸ�  -- �ڷ��̸�

	   [filePath] varchar(100) null, 

       [downloadCount] int default(0), --�ٿ�ε�Ƚ�� -- �ٿ�ε� Ƚ��
	    
	   ModifyDate SmallDateTime Null   --������

)




 -- ���� �ø� ���� - �������� ���� ���
Create Proc dbo.List_happy_saving
	@id varchar(20)
As 
	select * from happy_saving
	where id = @id
Go



List_happy_saving 'hong'





select * from happy;

 

insert into happy values('hong', '1234','title', '�Ұ����Դϴ�.', 10, GETDATE(),  '2019������ǰ��ȹ��_7��14��_.hwp' , '2019������ǰ��ȹ��_7��14��_.hwp', 2, null )



 





--[13] �ش� ���� �����ϴ� ���� ���ν��� : ModifyBasic
Create Proc dbo.Modify_happy
     @subject VarChar(50), @Content Text,    
     @pwd VarChar(20), @fileName varchar(100), @filePath varchar(100),
	 @seq Int, @id varchar(20)

As
     Declare @cnt Int
     Select @cnt = Count(*) From happy
     Where seq = @seq And pwd = @pwd

     If @cnt > 0  -- �Ѱ��� �� ��ȣ�� ��ȣ�� �´� �����Ͱ� �ִٸ�...
          Update happy 
          Set 
               subject = @subject, Content = @Content,
               ModifyDate = GetDate(), fileName = @fileName, filePath = @filePath
          Where seq = @seq And id = @id
		  And pwd = @pwd 
     Else
          Return -1 -- ��ȣ�� Ʋ���� -1�� ��ȯ����...
Go



Modify_happy ''



--  drop proc Modify_happy







--[12] �ش� �� ����� ���� ���ν��� : DeleteBasic 
Create Proc dbo.Delete_Happy
	@pwd VarChar(20),
	@seq Int
As 
	 Declare @cnt Int
     -- ��ȣ�� ��ȣ�� ������ 1�� ��ȯ
     Select @cnt = Count(*) From happy 
     Where seq = @seq And pwd = @pwd

     If @cnt > 0 
          Delete happy Where seq = @seq And pwd = @pwd
     Else     
          Return -1

Go	




Delete_Happy




--[10]�ش� ���� ���������� �о���� ���� ���ν��� : ViewBasic 
Create Procedure dbo.View_happy
	@seq Int,
	@id varchar(20)
As
	Select * From happy 
	Where seq = @seq And id = @id
Go


 --��õ�� �ø���
  
Update_download_Count_happy 2


 


 

-- ���� �ø� ���� - �������� ���� ���
Create Proc dbo.List_happy
	@id varchar(20)
As 
	select * from happy
	where id = @id
Go




-- drop proc List_happy



List_happy 'dadf'
List_happy 'hong'




 


