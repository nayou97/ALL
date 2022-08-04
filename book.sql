use ASPNET

/*

insert into BookList values('baby', '작가님', 20130, '2019-08-14',null, '읽는 중')
insert into BookList values('lalalala song', 'ms. marvel', 14300, '2019-03-10',null, '읽는 중' )
insert into BookList values('BookStore', 'MR. Khan', 10000, '2019-01-04',null, '완료')
insert into BookList values('java script', 'Smith', 14200, '2019-02-28',  null, '시작도안함')
*/



	--테이블만들기

CREATE TABLE [dbo].[BookDetails]
(

                [BookId] [int] IDENTITY(1,1) NOT NULL,

                [BookName] [varchar](100),
                [Author] [varchar](100),
                [Publisher] [varchar](200),



)


select * from BookDetails


-- drop table BookDetails


 insert into BookDetails values('요리법책', '차이코프스키', '출판사이름')
  insert into BookDetails values('blskasdfaf', '스티븐슨', '#31샵')
 insert into BookDetails values('lulu', '테이텀', '#44라라')
 insert into BookDetails values('java', '졸리', '#55베이비')



-- 적어넣기

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





-- 수정

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





-- 삭제하기


CREATE PROCEDURE [dbo].[DeleteBookRecords_Sp]
                @BookId            INT
AS
BEGIN
                DELETE FROM BookDetails WHERE BookId=@BookId
END




DeleteBookRecords_Sp







-- 전체 조회 - 리스트
CREATE PROCEDURE [dbo].[FetchBookRecords_Sp]
AS
BEGIN
                SELECT * FROM BookDetails
END





FetchBookRecords_Sp



