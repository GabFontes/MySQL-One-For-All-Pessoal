SELECT 
	Us.user_name AS usuario,
    COUNT(Ph.song_id) AS qtde_musicas_ouvidas,
    ROUND(SUM(So.duration)/60, 2) AS total_minutos
FROM SpotifyClone.`User` AS Us
INNER JOIN SpotifyClone.PlaybackHistory AS Ph
ON Us.user_id = Ph.user_id
INNER JOIN SpotifyClone.Songs AS So
ON Ph.song_id = So.song_id
GROUP BY Us.user_id
ORDER BY Us.user_name;