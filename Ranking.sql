use ASPNET



create table Ranking(
 
id VarChar(20) Not Null references Member(id), -- ����

R_year int,  -- �� ��
R_month int,  -- �� ��

RM_Write int,   --���İ��۰���
RM_sharing int , -- �ڷṫ�ᳪ���Խñۼ�
RM_essay int  --���÷�踹�̹���ȸ��
)

 
-- 2019�� 10�� ������
-- �򰡱���

-- ���İ� �� ����
-- �ڷ���ǿ��� �Խù�Ƚ������ȸ��
-- ���÷�� ���� ���� ���ȸ��:����ۿø����

-- ���̵�, ����, ����, ���İ��۰���/�ڷṫ�ᳪ���Խñۼ�/���÷�踹�̹���ȸ��
insert into Ranking values('dadf1234', 2019, 10, 44, 12, 3)  
insert into Ranking values('hong1234', 2019, 10, 41, 23, 7)
insert into Ranking values('nara1234', 2019, 10, 333, 4, 11)
insert into Ranking values('verygood11', 2019, 10, 100, 21, 5)
insert into Ranking values('sua', 2019, 10, 120, 9, 9)
insert into Ranking values('yyyy', 2019, 10, 22, 0, 0)


--��й��� ����,
-- �Ҿ�Ʈ/���� ����.... �ű⼭ ī��Ʈ����
-- �Ƴ��ٴٴ� ��� �����̴� ��....


select * from Ranking




SELECT ROW_NUMBER() OVER(
    ORDER BY RM_Write DESC) [���İ� ���� �� ����],
    id, R_year, R_month, RM_Write
    FROM Ranking;





--  drop table Ranking
 

select * from Member
select * from Ranking


---//////////////////////////////////////////////////////////////////



-- 2018�� 8/9�� ������
insert into Ranking values('babo', 2018, 8, 444, 2)
insert into Ranking values('mama', 2018, 8, 41, 23)
insert into Ranking values('nara11', 2018, 8, 333, 4)
insert into Ranking values('park', 2018, 8, 100, 21)
insert into Ranking values('sua', 2018, 8, 120, 9)
insert into Ranking values('yyyy', 2018, 8, 22, 0)



-- 2019�� 8/9�� ������
insert into Ranking values('babo', 2019, 9, 444, 2)
insert into Ranking values('mama', 2019, 8, 41, 23)
insert into Ranking values('nara11', 2019, 9, 333, 4)
insert into Ranking values('park', 2019, 8, 100, 21)
insert into Ranking values('sua', 2019, 9, 120, 9)
insert into Ranking values('yyyy', 2019, 8, 22, 0)


---//////////////////////////////////////////////////////////////////





-- ����/��
-- ��ŷ�Űܾ���
-- ���Ե� ���̵���� ������
-- ī��Ʈ�ϴ¹� = �ϸ���Ʈ����/���İ�����




-- drop proc Bind_Ranking_writing
	

CREATE PROCEDURE Bind_Ranking_writing 
	@R_year int,  -- �� ��
	@R_month int  -- �� ��
AS
BEGIN
    SELECT ROW_NUMBER() OVER(
    ORDER BY RM_Write DESC) [���İ� ���� �� ȸ��],
    id,  RM_Write
    FROM Ranking
	where R_month = @R_month  -- R_month = 8
END



Bind_Ranking_writing  2019, 10





 ------------------------------------------------


 --   drop proc Bind_Ranking_sharing


create proc Bind_Ranking_sharing
	@R_year int,  -- �� ��
	@R_month int  -- �� ��
AS
BEGIN
    SELECT ROW_NUMBER() OVER(
    ORDER BY RM_sharing DESC) [�ڷ� ���ᳪ�� ���� �� ȸ��],
    id, RM_sharing
    FROM Ranking
	where R_month = @R_month  -- R_month = 8
END



Bind_Ranking_sharing 2019, 10


select * from ranking


-------------------------------------------------------




 --   drop proc Bind_Ranking_essay


create proc Bind_Ranking_essay
	@R_year int,  -- �� ��
	@R_month int  -- �� ��
AS
BEGIN
    SELECT ROW_NUMBER() OVER(
    ORDER BY RM_essay DESC) [���÷�� ���� ���� ȸ��],
    id, RM_essay
    FROM Ranking
	where R_month = @R_month  -- R_month = 8
END



Bind_Ranking_essay 2019, 10










