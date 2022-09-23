SELECT
	u.nome_completo usuario,
  COUNT(h.id_musica) qt_de_musicas_ouvidas,
  ROUND(SUM(m.duracao_segundos) / 60, 2) AS total_minutos
FROM SpotifyClone.usuarios u
INNER JOIN SpotifyClone.historico_reproducoes h ON u.id_usuario = h.id_usuario
INNER JOIN SpotifyClone.musicas m ON m.id_musica = h.id_musica
GROUP BY usuario
ORDER BY usuario;