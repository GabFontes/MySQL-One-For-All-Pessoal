SELECT
	COUNT(*) AS quantidade_musicas_no_historico
FROM SpotifyClone.PlaybackHistory AS Ph
INNER JOIN SpotifyClone.User AS Us ON Ph.user_id = Us.user_id
WHERE Us.user_name = 'Bill';