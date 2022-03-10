SELECT 
	MIN(plan_value) AS faturamento_minimo,
	ROUND(SUM(Plan_value)/COUNT(user_id), 2) AS faturamento_medio,
    MAX(plan_value) AS faturamento_maximo,
    ROUND(SUM(plan_value), 2) AS faturamento_total
FROM SpotifyClone.Plan AS Pl
INNER JOIN SpotifyClone.`User` AS Us
ON Pl.plan_id = Us.plan_id;