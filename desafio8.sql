SELECT
	art.nome artista,
  alb.nome album
FROM SpotifyClone.artistas art
INNER JOIN SpotifyClone.albuns alb ON art.id_artista = alb.id_artista
WHERE art.nome = 'Elis Regina'
ORDER BY album;