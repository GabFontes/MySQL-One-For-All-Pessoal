SELECT 
	Us.username AS usuario,
    IF(YEAR(MAX(Ph.reproduction_date)) = '2021', 'Usuário ativo', 'Usuário inativo') AS condicao_usuario
FROM SpotifyClone.User AS Us
INNER JOIN SpotifyClone.PlaybackHistory AS Ph
ON Us.user_id = Ph.user_id
GROUP BY Us.username
ORDER BY Us.username;