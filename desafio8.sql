SELECT
	Ar.artist_name AS artista,
    Al.album_name AS album
FROM 
	SpotifyClone.Artist AS Ar
INNER JOIN
	SpotifyClone.Album AS Al ON Al.artist_id = Ar.artist_id
WHERE Ar.artist_name = 'Walter Phoenix'
GROUP BY artista, album
ORDER BY album ASC;