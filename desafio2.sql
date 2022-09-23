SELECT COUNT(*) albuns, (
	SELECT COUNT(*)
  FROM SpotifyClone.artistas) artistas, (
  SELECT COUNT(*)
  FROM SpotifyClone.musicas) cancoes
FROM SpotifyClone.albuns;