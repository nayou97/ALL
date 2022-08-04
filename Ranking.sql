use ASPNET



create table Ranking(
 
id VarChar(20) Not Null references Member(id), -- 계정

R_year int,  -- 몇 월
R_month int,  -- 몇 달

RM_Write int,   --독후감글갯수
RM_sharing int , -- 자료무료나눔게시글수
RM_essay int  --논술첨삭많이받은회원
)

 
-- 2019년 10월 데이터
-- 평가기준

-- 독후감 글 갯수
-- 자료겟판에서 게시물횟수많은회원
-- 논술첨삭 많이 받은 우수회원:논술글올린사람

-- 아이디, 연도, 월별, 독후감글갯수/자료무료나눔게시글수/논술첨삭많이받은회원
insert into Ranking values('dadf1234', 2019, 10, 44, 12, 3)  
insert into Ranking values('hong1234', 2019, 10, 41, 23, 7)
insert into Ranking values('nara1234', 2019, 10, 333, 4, 11)
insert into Ranking values('verygood11', 2019, 10, 100, 21, 5)
insert into Ranking values('sua', 2019, 10, 120, 9, 9)
insert into Ranking values('yyyy', 2019, 10, 22, 0, 0)


--토론방은 빼고,
-- 팬아트/팬픽 또한.... 거기서 카운트하자
-- 아나바다는 기부 목적이니 뭐....


select * from Ranking




SELECT ROW_NUMBER() OVER(
    ORDER BY RM_Write DESC) [독후감 많이 쓴 순위],
    id, R_year, R_month, RM_Write
    FROM Ranking;





--  drop table Ranking
 

select * from Member
select * from Ranking


---//////////////////////////////////////////////////////////////////



-- 2018년 8/9월 데이터
insert into Ranking values('babo', 2018, 8, 444, 2)
insert into Ranking values('mama', 2018, 8, 41, 23)
insert into Ranking values('nara11', 2018, 8, 333, 4)
insert into Ranking values('park', 2018, 8, 100, 21)
insert into Ranking values('sua', 2018, 8, 120, 9)
insert into Ranking values('yyyy', 2018, 8, 22, 0)



-- 2019년 8/9월 데이터
insert into Ranking values('babo', 2019, 9, 444, 2)
insert into Ranking values('mama', 2019, 8, 41, 23)
insert into Ranking values('nara11', 2019, 9, 333, 4)
insert into Ranking values('park', 2019, 8, 100, 21)
insert into Ranking values('sua', 2019, 9, 120, 9)
insert into Ranking values('yyyy', 2019, 8, 22, 0)


---//////////////////////////////////////////////////////////////////





-- 연도/달
-- 랭킹매겨야함
-- 가입된 아이디들을 범위로
-- 카운트하는법 = 북리스트에서/독후감에서




-- drop proc Bind_Ranking_writing
	

CREATE PROCEDURE Bind_Ranking_writing 
	@R_year int,  -- 몇 월
	@R_month int  -- 몇 달
AS
BEGIN
    SELECT ROW_NUMBER() OVER(
    ORDER BY RM_Write DESC) [독후감 많이 쓴 회원],
    id,  RM_Write
    FROM Ranking
	where R_month = @R_month  -- R_month = 8
END



Bind_Ranking_writing  2019, 10





 ------------------------------------------------


 --   drop proc Bind_Ranking_sharing


create proc Bind_Ranking_sharing
	@R_year int,  -- 몇 월
	@R_month int  -- 몇 달
AS
BEGIN
    SELECT ROW_NUMBER() OVER(
    ORDER BY RM_sharing DESC) [자료 무료나눔 많이 한 회원],
    id, RM_sharing
    FROM Ranking
	where R_month = @R_month  -- R_month = 8
END



Bind_Ranking_sharing 2019, 10


select * from ranking


-------------------------------------------------------




 --   drop proc Bind_Ranking_essay


create proc Bind_Ranking_essay
	@R_year int,  -- 몇 월
	@R_month int  -- 몇 달
AS
BEGIN
    SELECT ROW_NUMBER() OVER(
    ORDER BY RM_essay DESC) [논술첨삭 많이 받은 회원],
    id, RM_essay
    FROM Ranking
	where R_month = @R_month  -- R_month = 8
END



Bind_Ranking_essay 2019, 10










