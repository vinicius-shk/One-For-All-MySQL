DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.planos(
      id_plano INT PRIMARY KEY AUTO_INCREMENT,
      tipo VARCHAR(45) NOT NULL,
      valor DOUBLE NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artistas(
      id_artista INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(45) NOT NULL
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.albuns(
      id_album INT PRIMARY KEY AUTO_INCREMENT,
      nome VARCHAR(45) NOT NULL,
      id_artista INT NOT NULL,
      FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artistas (id_artista)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.usuarios(
      id_usuario INT PRIMARY KEY AUTO_INCREMENT,
      nome_completo VARCHAR(50) NOT NULL,
      idade TINYINT NOT NULL,
      id_plano INT NOT NULL,
      data_assinatura DATETIME NOT NULL,
      FOREIGN KEY (id_plano) REFERENCES SpotifyClone.planos (id_plano)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.musicas(
      id_musica INT PRIMARY KEY AUTO_INCREMENT,
      titulo VARCHAR(45) NOT NULL,
      duracao_segundos INT NOT NULL,
      ano_lancamento YEAR NOT NULL,
      id_album INT NOT NULL,
      FOREIGN KEY (id_album) REFERENCES SpotifyClone.albuns (id_album)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.usuarios_follow(
      id_usuario INT NOT NULL,
      id_artista INT,
      CONSTRAINT PRIMARY KEY (id_usuario, id_artista),
      FOREIGN KEY (id_artista) REFERENCES SpotifyClone.artistas (id_artista),
      FOREIGN KEY (id_usuario) REFERENCES SpotifyClone.usuarios (id_usuario)
  ) engine = InnoDB;
  
  CREATE TABLE SpotifyClone.historico_reproducoes(
      id_usuario INT NOT NULL,
      id_musica INT NOT NULL,
      data_reproducao DATETIME NOT NULL,
      CONSTRAINT PRIMARY KEY (id_usuario, id_musica),
      FOREIGN KEY (id_usuario) REFERENCES SpotifyClone.usuarios (id_usuario),
      FOREIGN KEY (id_musica) REFERENCES SpotifyClone.musicas (id_musica)
  ) engine = InnoDB;

  INSERT INTO SpotifyClone.planos (tipo, valor)
  VALUES
    ('gratuito', 0.00),
    ('universitario', 5.99),
    ('pessoal', 6.99),
    ('familiar', 7.99);
  
  INSERT INTO SpotifyClone.usuarios (nome_completo, idade, id_plano, data_assinatura)
  VALUES
    ('Barbara Liskov', 82, 1, '2019-10-20'),
    ('Robert Cecil Martin', 58, 1, '2017-01-06'),
    ('Ada Lovelace', 37, 4, '2017-12-30'),
    ('Martin Fowler', 46, 4, '2017-01-17'),
    ('Sandi Metz', 58, 4, '2018-04-29'),
    ('Paulo Freire', 19, 2, '2018-02-14'),
    ('Bell Hooks', 26, 2, '2019-01-05'),
    ('Christopher Alexander', 85, 3, '2019-06-05'),
    ('Judith Butler', 45, 3, '2020-05-13'),
    ('Jorge Amado', 58, 3, '2017-02-17');
    
  INSERT INTO SpotifyClone.artistas (nome)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');
    
  INSERT INTO SpotifyClone.albuns (nome, id_artista)
  VALUES
    ('Renaissance', 1),
    ('Jazz', 2),
    ('Hot Space', 2),
    ('Falso Brilhante', 3),
    ('Vento de Maio', 3),
    ('QVVJFA?', 4),
    ('Somewhere Far Beyond', 5),
    ('I Put A Spell On You', 6);
    
  INSERT INTO SpotifyClone.musicas (titulo, duracao_segundos, ano_lancamento, id_album)
  VALUES
    ('BREAK MY SOUL', 279, 2022, 1),
    ('VIRGO’S GROOVE', 369, 2022, 1),
    ('ALIEN SUPERSTAR', 116, 2022, 1),
    ('Don’t Stop Me Now', 203, 1978, 2),
    ('Under Pressure', 152, 1982, 3),
    ('Como Nossos Pais', 105, 1998, 4),
    ('O Medo de Amar é o Medo de Ser Livre', 207, 2001, 5),
    ('Samba em Paris', 267, 2003, 6),
    ('The Bard’s Song', 244, 2007, 7),
    ('Feeling Good', 100, 2012, 8);
    
  INSERT INTO SpotifyClone.usuarios_follow (id_usuario, id_artista)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (6, 1),
    (6, 6),
    (7, 6),
    (9, 3),
    (10, 2);
    
  INSERT INTO SpotifyClone.historico_reproducoes (id_usuario, id_musica, data_reproducao)
  VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');