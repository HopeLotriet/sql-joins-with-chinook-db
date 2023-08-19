select count(*) from artists;

select *
from playlists;

select *
from genres;

select *
from playlists
where Name like '%s';

select * 
from artists
where Name = "Marvin Gaye";

select *
from albums
where ArtistId = 104;

select *
from artists
inner join albums on artists.ArtistId = albums.ArtistId
where Name = "Amy Winehouse";

select *
from artists
inner join albums on artists.ArtistId = albums.ArtistId
where artists.ArtistId = 252;


--Find all the albums for a given artist
select Name, AlbumId, Title
from artists
join albums on artists.ArtistId = albums.ArtistId
where artists.ArtistId = 17;
--where Name = "Amy Winehouse";

--Find all the songs for a given genre

-- select * from tracks
-- join genres on tracks.TrackId = genres.GenreId


select * from genres
where Genres.Name = "Blues";

select * from Genres
join tracks on Genres.GenreId = tracks.GenreId
where Genres.Name = "Comedy"; 

select * from Genres
join tracks on Genres.GenreId = tracks.GenreId
where Genres.GenreId = 5; 

--* Find all the songs in a playlist - by playlist name...

select * from playlists
join playlist_track 
on playlists.PlaylistId = playlist_track.PlaylistId
-- where playlists.Name = "Classical"
join tracks 
on playlist_track.TrackId = tracks.TrackId
where playlists.Name = "Classical"


--*One: Find all the artists for a given Genre

select * from genres
join tracks on genres.GenreId = tracks.GenreId
join albums on tracks.AlbumId = albums.AlbumId
join artists on albums.ArtistId = artists.ArtistId
where genres.Name = "Comedy";

select DISTINCT artists.Name
from genres
join tracks on genres.GenreId = tracks.GenreId
join albums on tracks.AlbumId = albums.AlbumId
join artists on albums.ArtistId = artists.ArtistId
where genres.Name = "Comedy";



--*Two: Find the Playlist with the most / least songs (will need a group by and count)

SELECT *, COUNT(playlist_track.TrackId) AS Songs
FROM playlists
JOIN Playlist_Track ON playlists.PlaylistId = playlist_track.PlaylistId
GROUP BY playlists.PlaylistId, playlists.Name
ORDER BY Songs DESC
LIMIT 1;

SELECT *, COUNT(playlist_track.TrackId) AS Songs
FROM playlists
JOIN Playlist_Track ON playlists.PlaylistId = playlist_track.PlaylistId
GROUP BY playlists.PlaylistId, playlists.Name
ORDER BY Songs ASC
LIMIT 1;

--*Three: Find the total for a given invoice (will need a sum)

select *, SUM (Total)
from invoices
where CustomerId = 57

--*Four: Find all the playlists containing a given genre

select * from genres
join tracks on genres.GenreId = tracks.GenreId
join playlist_track on tracks.TrackId = playlist_track.TrackId
join playlists on playlist_track.PlaylistId = playlists.PlaylistId
where playlists.PlaylistId = 10;


--*Five: Find the biggest/smallest invoice amounts (needs group by)

SELECT *, MAX(Total) 
from invoices
GROUP BY Total

SELECT *, MIN(Total) 
from invoices
GROUP BY Total

--*Six: Find the artist with the most/least songs (needs group by)

SELECT artists.Name, COUNT(tracks.TrackId) AS MostSongs
FROM artists
JOIN albums ON albums.ArtistId = artists.ArtistId
JOIN tracks ON tracks.AlbumId = albums.AlbumId
GROUP BY artists.Name
ORDER BY MostSongs DESC
LIMIT 1


SELECT artists.Name, COUNT(tracks.TrackId) AS LeastSongs
FROM artists
JOIN albums ON albums.ArtistId = artists.ArtistId
JOIN tracks ON tracks.AlbumId = albums.AlbumId
GROUP BY artists.Name
ORDER BY LeastSongs
LIMIT 1 


