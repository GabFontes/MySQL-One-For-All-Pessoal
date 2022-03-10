SELECT
	So.song_name AS cancao,
    COUNT(Ph.song_id) AS reproducoes
FROM SpotifyClone.Songs AS So
INNER JOIN SpotifyClone.PlaybackHistory AS Ph
ON So.song_id = Ph.song_id
GROUP BY So.song_name
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;