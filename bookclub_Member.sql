



*이 웹의 회원 + 이 질문에 답만하면 가입가능.
*각 북클럽별 등록번호와 이름을 달리하고, 북클럽의 주인장의 이름은 회원들중 하나이며, 각 북클럽을 구분하는 건 북클럽의 번호이고,
num int identity(1,1) primary key not null,
ClubName varchar(50),
BossName varchar(20) references Member(id) not null,

가입회원을 받는 법-> 이 웹에 가입한 사람 + 질문3개 다 쓴 사람 -> 자동가입
질문3개쓴내용은 bookclub_Member.sql에 저장됨(북클럽 주인장만 보기 가능)
또한 북클럽에 가입한 회원들의 개인정보 보기가능(이웹가입한사람들이 회원가입시 낸 정보 다 여기로)
member.sql과는 다른 bookclub_Member.sql 에 회원정보가 따로 저장됨(차이점 - 북클럽회원은 웹회원가입한사람들이 조건부가입, 북클럽별 내용이 구분되어야...-독후감/북플랜-
, 방장권한-북클럽뷰를 마음대로 꾸미기 가능/수정/삭제가능/공지/회원개인정보 열람- )



--북클럽에 가입/조인 하기
create table bookclub_Member(

-- 북클럽정보
club_num int identity(1,1) primary key not null,   -- 이게, 바로 일반회원과 각각의 북클럽회원을 구분하는 방법. --북클럽뷰에서 각각 다른 데이터를 보려면, 북클럽등록번호를 조건으로 ㄱㄱ
ClubName varchar(50),
BossName varchar(20) references Member(id) not null,

--북클럽가입회원목록
--MemberName varchar(20) references Member(id) not null,
-- email
-- real name
-- birth
-- phone
-- address
--패스워드빼고 모두

-- 질문글 3가지 내용
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



insert into bookclub_Member values('북클럽이름', 'mama', '어디에서 오셨어요?', '집에서 왔음', '라라진의 본명은?', '라나 콘도르', '열심히 하세요', '네')

