SELECT 
	Ar.artist_name AS 'artista',
    Al.album_name AS 'album',
    COUNT(*) AS 'seguidores'
FROM 
	SpotifyClone.Artist AS Ar
INNER JOIN SpotifyClone.Album AS Al ON Al.artist_id = Ar.artist_id
INNER JOIN SpotifyClone.FollowingArtists AS Fa ON Fa.artist_id = Al.artist_id
GROUP BY Ar.artist_name, Al.album_name
ORDER BY seguidores DESC, artista ASC, album ASC;