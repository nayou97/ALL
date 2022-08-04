use ASPNET

/*

insert into BookList values('baby', '�۰���', 20130, '2019-08-14',null, '�д� ��')
insert into BookList values('lalalala song', 'ms. marvel', 14300, '2019-03-10',null, '�д� ��' )
insert into BookList values('BookStore', 'MR. Khan', 10000, '2019-01-04',null, '�Ϸ�')
insert into BookList values('java script', 'Smith', 14200, '2019-02-28',  null, '���۵�����')
*/



	--���̺����

CREATE TABLE [dbo].[BookDetails]
(

                [BookId] [int] IDENTITY(1,1) NOT NULL,

                [BookName] [varchar](100),
                [Author] [varchar](100),
                [Publisher] [varchar](200),



)


select * from BookDetails


-- drop table BookDetails


 insert into BookDetails values('�丮��å', '����������Ű', '���ǻ��̸�')
  insert into BookDetails values('blskasdfaf', '��Ƽ�콼', '#31��')
 insert into BookDetails values('lulu', '������', '#44���')
 insert into BookDetails values('java', '����', '#55���̺�')



-- ����ֱ�

CREATE PROCEDURE [dbo].[InsertBookDetails_SP]
                @BookName                    VARCHAR(100),
                @Author                             VARCHAR(100),
                @Publisher                        VARCHAR(200)
AS
BEGIN
                INSERT INTO BookDetails
                 (
                                BookName,Author,Publisher
                  )
                VALUES
                 (
                                @BookName,@Author,@Publisher
                 )
END





InsertBookDetails_SP 'My Name', 'Adam smith', 'Panisilyn'





-- ����

CREATE PROCEDURE [dbo].[UpdateBookRecord_SP]
                @BookId                            INT,
                @BookName                    VARCHAR(100),
                @Author                             VARCHAR(100),
                @Publisher                        VARCHAR(200)
AS
BEGIN
                UPDATE BookDetails SET
                                BookName=@BookName,
                                Author=@Author,
                                Publisher=@Publisher
                WHERE BookId=@BookId
END




UpdateBookRecord_SP





-- �����ϱ�


CREATE PROCEDURE [dbo].[DeleteBookRecords_Sp]
                @BookId            INT
AS
BEGIN
                DELETE FROM BookDetails WHERE BookId=@BookId
END




DeleteBookRecords_Sp







-- ��ü ��ȸ - ����Ʈ
CREATE PROCEDURE [dbo].[FetchBookRecords_Sp]
AS
BEGIN
                SELECT * FROM BookDetails
END





FetchBookRecords_Sp



