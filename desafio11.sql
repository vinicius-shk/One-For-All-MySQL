SELECT
	titulo nome_musica,
  CASE
		WHEN titulo LIKE '%Bard%' THEN REPLACE(titulo, 'Bard', 'QA')
    WHEN titulo LIKE '%Amar%' THEN REPLACE(titulo, 'Amar', 'Code Review')
    WHEN titulo LIKE '%Pais%' THEN REPLACE(titulo, 'Pais', 'Pull Requests')
    WHEN titulo LIKE '%SOUL%' THEN REPLACE(titulo, 'SOUL', 'CODE')
    WHEN titulo LIKE '%SUPERSTAR%' THEN REPLACE(titulo, 'SUPERSTAR', 'SUPERDEV')
    ELSE titulo
	END AS novo_nome
FROM SpotifyClone.musicas
WHERE titulo LIKE '%Bard%'
OR titulo LIKE '%Amar%'
OR titulo LIKE '%Pais%'
OR titulo LIKE '%SOUL%'
OR titulo LIKE '%SUPERSTAR%' 
ORDER BY titulo DESC;