SELECT
	m.titulo nome,
  COUNT(hr.id_usuario) reproducoes
FROM SpotifyClone.musicas m
INNER JOIN SpotifyClone.historico_reproducoes hr ON m.id_musica = hr.id_musica
INNER JOIN SpotifyClone.usuarios u ON u.id_usuario = hr.id_usuario
INNER JOIN SpotifyClone.planos p ON p.id_plano = u.id_plano
WHERE u.id_plano IN (1, 3)
GROUP BY nome
ORDER BY nome;