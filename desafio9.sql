SELECT
	COUNT(*) quantidade_musicas_no_historico
FROM SpotifyClone.historico_reproducoes hr
INNER JOIN SpotifyClone.usuarios u ON u.id_usuario = hr.id_usuario
WHERE u.nome_completo = 'Barbara Liskov';