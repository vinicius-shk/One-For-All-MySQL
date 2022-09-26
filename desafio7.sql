SELECT
	art.nome artista,
  alb.nome album,
  COUNT(uf.id_artista) seguidores
FROM SpotifyClone.artistas art
INNER JOIN SpotifyClone.albuns alb ON art.id_artista = alb.id_artista
INNER JOIN SpotifyClone.usuarios_follow uf ON uf.id_artista = art.id_artista
GROUP BY artista, album
ORDER BY seguidores DESC, artista, album;