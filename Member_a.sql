create database ASPNET


create table Member_a(
UserID varchar(30) primary key,
Password varchar(30) not null,
email varchar(50) not null,
Name varchar(30) not null,
birth varchar(30) not null,
Phone varchar(30),
Address varchar(30) not null

)


-- @id, @pwd, @email, @name, @birth, @Phone, @Address



select * from Member_a

insert into Member_a values('n1', '11', '이이이', '01033332222')
insert into Member_a values('baba1', '3', '이이이', '01033332222')



use ASPNET

create table Member_m(
UserID varchar(30) primary key,
Password varchar(30) not null,
Name varchar(30) not null,
Phone varchar(30)
)


select * from Member

insert into Member_m values('n1', '11', '이이이', '01033332222')
insert into Member_m values('baba1', '3', '이이이', '01033332222')



