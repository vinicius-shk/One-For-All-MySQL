SELECT DISTINCT
	u.nome_completo usuario,
	IF(MAX(YEAR(h.data_reproducao)) >= 2021, 'Usuário ativo', 'Usuário inativo') status_usuario
FROM SpotifyClone.usuarios u
INNER JOIN SpotifyClone.historico_reproducoes h ON u.id_usuario = h.id_usuario
GROUP BY usuario
ORDER BY usuario, status_usuario DESC;