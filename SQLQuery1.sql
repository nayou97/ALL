
create database ASPNET


use ASPNET

create table Member(
UserID varchar(30) primary key,
Password varchar(30) not null,
Name varchar(30) not null,
Phone varchar(30)
)


select * from Member

insert into Member values('n1', '11', '이이이', '01033332222')
insert into Member values('baba1', '3', '이이이', '01033332222')



