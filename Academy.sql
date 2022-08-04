USE ASPNET;





create table Academy

(

       [seq] [int] identity(1,1) not null,

       [name] nvarchar(20) not null,    
	    
       [pwd] varchar(20) not null, 

	   [genre] varchar(20) not null,

       [subject] [nvarchar](100) not null,

       [content] [nvarchar](3000) not null,

       [userip] [varchar](15) not null,

       [readcount] [int] default(0) not null,

       [regdate] [datetime] default(getdate()) not null,

       [thread] int not null,

       [depth] int not null

)

 




 

SELECT [seq], [name], [subject], [genre], [readCount], [regDate], [depth] FROM Academy ORDER BY [thread] DESC


select * from Academy



-- drop table Academy







