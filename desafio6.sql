SELECT
	FORMAT(ROUND(MIN(p.valor)), 2) faturamento_minimo,
	FORMAT(ROUND(MAX(p.valor), 2), 2) faturamento_maximo,
  FORMAT(ROUND(AVG(p.valor), 2), 2) faturamento_medio,
  FORMAT(ROUND(SUM(p.valor), 2), 2) faturamento_total
FROM SpotifyClone.planos p
INNER JOIN SpotifyClone.usuarios u ON u.id_plano = p.id_plano;