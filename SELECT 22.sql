SELECT gengre_name, COUNT(artist_id) FROM artist_list
JOIN artist_in_genres aig ON artist_list.id = aig.artist_id 
JOIN gengre_list gl ON aig.gengre_id = gl.id 
GROUP BY gengre_name;

SELECT COUNT(track_name) FROM track_list tl
LEFT JOIN album_list al ON al.id = tl.album_id 
WHERE year_of BETWEEN 2019 AND 2020;
	
SELECT album_id, AVG(track_time) FROM track_List
GROUP BY album_id;

SELECT alias FROM artist_list al
LEFT JOIN albums a ON al.id = al.id 
LEFT JOIN album_list al2 ON al.id = al2.id 
WHERE year_of != 2020;

SELECT name_song FROM collection_album_track cat 
LEFT JOIN collection_list cl ON cat.id = cl.collection_id 
LEFT JOIN track_list tl ON cl.track_id = tl.id 
LEFT JOIN album_list al ON tl.album_id = al.id 
LEFT JOIN albums a ON al.id = a.album_id 
LEFT JOIN artist_list al2 ON a.artist_id = al2.id 
WHERE al2.alias  LIKE 'B.I.G';

SELECT name FROM album_list al 
LEFT JOIN albums a ON al.id = a.album_id 
LEFT JOIN artist_list al2 ON a.artist_id = al2.id 
LEFT JOIN artist_in_genres aig ON al.id = aig.artist_id 
GROUP BY al2.alias, al.name
HAVING count(aig.gengre_id) > 1; 

SELECT track_name FROM track_list tl 
LEFT JOIN collection_album_track cat ON tl.id = cat.id 
WHERE  cat.song_id IS NULL;

SELECT alias, track_time FROM artist_list al 
LEFT JOIN album_list al2 ON al.id = al2.id 
LEFT JOIN track_list tl ON al2.id = tl.album_id 
LEFT JOIN albums a ON tl.album_id = a.album_id  
WHERE tl.track_time IN (SELECT MIN(track_time) FROM track_list tl2);

SELECT name FROM album_list al 
LEFT JOIN track_list tl ON al.id = tl.album_id 
GROUP BY al.name
HAVING count(tl.track_name) = (
	SELECT min(count) FROM (
		SELECT al.name, count(tl.track_name) FROM album_list al
		JOIN track_list tl ON al.id = tl.album_id 
		GROUP BY al.name) AS foo);
