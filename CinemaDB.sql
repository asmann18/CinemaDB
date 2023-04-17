create database CinemaDB

use CinemaDB

create table Languages(
id int primary key identity,
name nvarchar(32) not null)

create table Subjects(
id int primary key identity,
name nvarchar(32) not  null)



create table Movies(
id int primary key identity,
name nvarchar(32) not  null,
languageId int foreign key references Languages(id),
subjectId int foreign key references Subjects(id))



create table Halls(
id int primary key identity,
name nvarchar(32) not  null)


create table Times(
id int primary key identity,
name date not  null)

create table Cinema(
id int primary key identity,
moviesId int foreign key references Movies(id),
hallId int foreign key references Halls(id),
timeId int foreign key references Times(id))


insert into Languages
values ('Azerbaycan'),('Turk'),('Ingilis')


insert into Subjects
values ('Comedy'),('Horror'),('Retro')


insert into Movies
values ('Salam Gencler',1,1),('Salam Ay Bratlar',2,2),('CodeAcademy',3,3)

insert into Halls
values ('HALL 1'),('HALL 2'),('HALL 3')

insert into Times 
values ('2023-04-17'),('2023-04-18'),('2023-04-19')

insert into Cinema
values (1,1,1),(2,2,2),(3,3,3),(1,2,3),(2,3,1),(2,1,3)


create view moviesList
as
select m.name 'Movies name',h.name 'Hall name',t.name 'Time',l.name 'Language',s.name 'subject' from Cinema c
join Movies m
on c.moviesId=m.id
join Languages l
on m.languageId=l.id
join Subjects s
on m.subjectId=s.id
join Halls h
on c.hallId=h.id
join Times t
on c.timeId=t.id

select*from moviesList