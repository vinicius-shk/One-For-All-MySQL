SELECT
	m.titulo cancao,
	COUNT(h.id_musica) reproducoes
FROM SpotifyClone.musicas m
INNER JOIN SpotifyClone.historico_reproducoes h ON m.id_musica = h.id_musica
GROUP BY cancao
ORDER BY reproducoes DESC, cancao
LIMIT 2;