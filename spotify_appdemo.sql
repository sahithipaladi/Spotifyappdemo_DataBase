create database Spotify_appdemo
use Spotify_appdemo
----------creating a User Table-------------
create table SpotifyTable
(
  Id int identity(1,1) primary key,
  FirstName varchar(200),
  LastName varchar(200),
  Age int,
  Country varchar(100),
  PhoneNumber  bigint,
  Email varchar(200)
)

-----------Inserting Values-------------------
insert into SpotifyTable values ('sahithi','p',24,'IN',9456789567,'sahithi@gmail.com'),('sivaangi','k',24,'India',645678965,'sivaangi@gmail.com'),('ashwin','Sk',30,'IN',7487656789,'ashwin@gmail.com')

select * from SpotifyTable;
-----------Retrieve details based on FirstName------------
select *from SpotifyTable Where FirstName='sivaangi'
-----------Update Age based on FirstName------------
update SpotifyTable set Age=28 Where FirstName='ashwin'
select * from SpotifyTable;
------------------creating Playlist table--------------
create table PlaylistTabledemo
(
 Id int ,
 Playlist_Id int identity (1,1) primary key,
 Playlist_Name varchar(50),
 Description varchar(300),
 foreign key (Id) references SpotifyTable(Id),
)

-------------------Inserting values into the Playlist Table------------------
insert into PlaylistTabledemo values (1,'My_playlist','Tollywood songs'),(2,'My favourite','sidsriram songs'),(3,'new_Playlist','Bollywood songs')

select * from PlaylistTabledemo;
----------Sort the Names by Country ----------------
select FirstName,LastName,Age,Country,PhoneNumber,Email,Playlist_Name,Description
from SpotifyTable 
INNER JOIN PlaylistTabledemo on SpotifyTable.Id= PlaylistTabledemo.Id
Where Country='India' order By(FirstName)



----------------------Creating Tracks---------------------------------
create table Tracks
(
  Id int ,
  Playlist_Id int,
  Track_id int,
  Track_Name varchar(200)
  foreign key (Id) references SpotifyTable(Id),
  foreign key (Playlist_Id) references PlaylistTabledemo(Playlist_Id)
)
-----------------Inserting Values into the tracks-----------------------
insert into Tracks values (1,1,1,'kutty patas'),(2,2,2,'never give up'),(3,2,3,'infinty')

select * from Tracks

select *from tracks where  Track_Name='kutty patas'

select FirstName,LastName,Age,Country,PhoneNumber,Email,Playlist_Name,Description,Track_Name 
from SpotifyTable
Full JOIN PlaylistTabledemo on SpotifyTable.ID=PlaylistTabledemo.ID 
Full JOIN Tracks on SpotifyTable.ID=Tracks.ID where FirstName='sivaangi'