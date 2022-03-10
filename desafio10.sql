SELECT
	So.song_name AS nome,
    COUNT(*) as reproducoes
FROM 
	SpotifyClone.User AS Us
INNER JOIN 
	SpotifyClone.Plan AS Pl ON Pl.plan_id = Us.plan_id
INNER JOIN 
	SpotifyClone.PlaybackHistory AS Ph on Ph.user_id = Us.user_id
INNER JOIN
	SpotifyClone.Songs AS So on So.song_id = Ph.song_id
WHERE Pl.plan_type IN ('gratuito', 'pessoal')
GROUP BY nome
ORDER BY nome ASC;