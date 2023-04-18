create database CinemaDatabase
use CinemaDatabase

create table Genres(
id int primary key identity,
name nvarchar(24) not null)


create table Actors(
id int primary key identity,
name nvarchar(24) not null)


create table Languages(
id int primary key identity,
name nvarchar(24) not null)


create table Time(
id int primary key identity,
hours decimal not null)


create table Tickets(
id int primary key identity,
ticketsAmount int not null)


create table Movies(
id int primary key identity,
name nvarchar(32) not null,
genreId int foreign key references Genres(id),
actorId int foreign key references Actors(id),
languageId int foreign key references Languages(id),
timeId int foreign key references Time(id))


create table Halls(
id int primary key identity,
name nvarchar(24) not null,
ticketAmountId int foreign key references Tickets(id))

create table Dates(
id int primary key identity,
date date not null)

create table Selling(
movieId int foreign key references Movies(id),
hallId int foreign key references Halls(id),
dateId int foreign key references Dates(id))


--butun tablelar hazirdi 


insert into Genres
values ('Comedy'),('Drama'),('Retro'),('Love')

insert into Actors
values ('Asiman'),('Ayxan'),('Huseyn'),('Fikret')


insert into Languages
values ('Azerbaycan'),('Ingilis'),('Rus'),('Turk')

insert into Time
values (2.3),(2.0),(3.1),(1.2),(0.45)

insert into Tickets
values (100),(150),(80),(83)

insert into Movies
values('Codeacademy',1,1,1,1),('Salam Ay Bratlar',2,2,2,2),('Huseynin Maceralari',3,3,3,3),('Tamam mi?',4,4,4,4)


insert into Halls
values ('Sun',1),('Jupiter',2),('Neptune',3),('Saturn',4)


insert into Dates
values ('2023-04-18'),('2023-04-19'),('2023-04-20'),('2023-04-21')


insert into Selling
values (1,1,1),(2,2,2),(3,3,3),(4,4,4)


--insertler hazir


create view Cinema
as
select m.name 'Movie Name', g.name 'Genre',a.name 'Main Role',l.name 'Language',h.name 'Hall',tck.ticketsAmount 'Ticket Amount',d.date 'Date'   from Selling s
join Movies m
on s.movieId=m.id
join Genres g
on m.genreId=g.id
join Actors a
on m.actorId=a.id
join Languages l
on m.languageId=l.id
join Time t
on m.timeId=t.id
join Halls h
on s.hallId=h.id
join Tickets tck
on h.ticketAmountId=tck.id
join Dates d
on s.dateId=d.id


select*from Cinema