



*�� ���� ȸ�� + �� ������ �丸�ϸ� ���԰���.
*�� ��Ŭ���� ��Ϲ�ȣ�� �̸��� �޸��ϰ�, ��Ŭ���� �������� �̸��� ȸ������ �ϳ��̸�, �� ��Ŭ���� �����ϴ� �� ��Ŭ���� ��ȣ�̰�,
num int identity(1,1) primary key not null,
ClubName varchar(50),
BossName varchar(20) references Member(id) not null,

����ȸ���� �޴� ��-> �� ���� ������ ��� + ����3�� �� �� ��� -> �ڵ�����
����3���������� bookclub_Member.sql�� �����(��Ŭ�� �����常 ���� ����)
���� ��Ŭ���� ������ ȸ������ �������� ���Ⱑ��(���������ѻ������ ȸ�����Խ� �� ���� �� �����)
member.sql���� �ٸ� bookclub_Member.sql �� ȸ�������� ���� �����(������ - ��Ŭ��ȸ���� ��ȸ�������ѻ������ ���Ǻΰ���, ��Ŭ���� ������ ���еǾ��...-���İ�/���÷�-
, �������-��Ŭ���並 ������� �ٹ̱� ����/����/��������/����/ȸ���������� ����- )



--��Ŭ���� ����/���� �ϱ�
create table bookclub_Member(

-- ��Ŭ������
club_num int identity(1,1) primary key not null,   -- �̰�, �ٷ� �Ϲ�ȸ���� ������ ��Ŭ��ȸ���� �����ϴ� ���. --��Ŭ���信�� ���� �ٸ� �����͸� ������, ��Ŭ����Ϲ�ȣ�� �������� ����
ClubName varchar(50),
BossName varchar(20) references Member(id) not null,

--��Ŭ������ȸ�����
--MemberName varchar(20) references Member(id) not null,
-- email
-- real name
-- birth
-- phone
-- address
--�н����廩�� ���

-- ������ 3���� ����
question1 text,  
Answer1 text,

question2 text,  
Answer2 text,

question3 text,  
Answer3 text,

-- 

)

select * from Member


select * from bookclub_Member


-- drop table bookclub_Member



insert into bookclub_Member values('��Ŭ���̸�', 'mama', '��𿡼� ���̾��?', '������ ����', '������� ������?', '�� �ܵ���', '������ �ϼ���', '��')

