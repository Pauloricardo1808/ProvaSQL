create database JOJO;
use JOJO;
CREATE TABLE Usuarios (
    id_usuario INTEGER auto_increment PRIMARY KEY,
    nome_usuario VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_criacao DATE
);

CREATE TABLE Stands (
    id_stand INTEGER auto_increment PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    poder integer NOT NULL,
    velocidade integer NOT NULL,
    alcance integer NOT NULL,
    precisao integer NOT NULL,
    durabilidade integer NOT NULL,
    data_criacao DATE
);

CREATE TABLE Personagens (
    id_personagem INTEGER auto_increment PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_criacao DATE,
    pais VARCHAR(100) NOT NULL,
    regiao VARCHAR(100) NOT NULL,
    stand_id INTEGER,
    criador_id INTEGER,
    FOREIGN KEY (stand_id) REFERENCES Stands (id_stand),
    FOREIGN KEY (criador_id) REFERENCES Usuarios (id_usuario)
);

CREATE TABLE Viloes (
    id_vilao INTEGER auto_increment PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_criacao DATE,
    stand_id INTEGER,
    criador_id INTEGER,
    FOREIGN KEY (stand_id) REFERENCES Stands (id_stand),
    FOREIGN KEY (criador_id) REFERENCES Usuarios (id_usuario)
);

CREATE TABLE Lutas (
    id_luta INTEGER auto_increment PRIMARY KEY,
    localizacao VARCHAR(100) NOT NULL,
    data DATE
);

CREATE TABLE Luta_Personagem (
    luta_id INTEGER,
    personagem_id INTEGER,
    PRIMARY KEY auto_increment (luta_id, personagem_id),
    FOREIGN KEY (luta_id) REFERENCES Lutas (id_luta),
    FOREIGN KEY (personagem_id) REFERENCES Personagens (id_personagem)
);

CREATE TABLE Luta_Vilao (
    luta_id INTEGER,
    vilao_id INTEGER,
    PRIMARY KEY (luta_id, vilao_id),
    FOREIGN KEY (luta_id) REFERENCES Lutas (id_luta),
    FOREIGN KEY (vilao_id) REFERENCES Viloes (id_vilao)
);

CREATE TABLE Luta_Stand (
    luta_id INTEGER,
    stand_id INTEGER,
    PRIMARY KEY (luta_id, stand_id),
    FOREIGN KEY (luta_id) REFERENCES Lutas (id_luta),
    FOREIGN KEY (stand_id) REFERENCES Stands (id_stand)
);

INSERT INTO Usuarios (nome_usuario, email, data_criacao) 
VALUES
('Jonathan Joestar', 'jojo_star@gmail.com', '2023-01-01'),
('Joseph Joestar', 'jojo_joseph@gmail.com', '2023-01-02'),
('Jotaro Kujo', 'jotaro_jotaro@gmail.com', '2023-01-03'),
('Josuke Higashikata', 'josuke_joestar@gmail.com', '2023-01-04'),
('Giorno Giovanna', 'giorno_giovanna@gmail.com', '2023-01-05'),
('Jolyne Cujoh', 'jolyne_cujoh@gmail.com', '2023-01-06'),
('Johnny Joestar', 'johnny_zeppeli@gmail.com', '2023-01-07'),
('Josuke Higashikata 8', 'josuke8_8@gmail.com', '2023-01-08'),
('Dio Brando', 'dio_the_world@gmail.com', '2023-01-09'),
('Enrico Pucci', 'pucci_madeinheaven@gmail.com', '2023-01-10'),
('Yoshikage Kira', 'kira_killerqueen@gmail.com', '2023-01-11'),
('Diavolo', 'diavolo_kingcrimson@gmail.com', '2023-01-12'),
('Funny Valentine', 'valentine_tusk@gmail.com', '2023-01-13'),
('Kars', 'kars_pillarman@gmail.com', '2023-01-14'),
('Wamuu', 'wamuu_wind@gmail.com', '2023-01-15'),
('Esidisi', 'esidisi_fire@gmail.com', '2023-01-16'),
('Vanilla Ice', 'vanilla_cream@gmail.com', '2023-01-17'),
('Risotto Nero', 'risotto_black_sabbath@gmail.com', '2023-01-18'),
('Prosciutto', 'prosciutto_grateful_dead@gmail.com', '2023-01-19'),
('Pesci', 'pesci_beachboy@gmail.com', '2023-01-20');

INSERT INTO Stands (nome, tipo, poder, velocidade, alcance, precisao, durabilidade, data_criacao) 
VALUES
('Noite Fria', 'Curto Alcance', 99, 60, 50, 85, 90, '2023-11-06'),
('Fênix de Platina', 'Curto Alcance', 95, 80, 60, 85, 90, '2023-01-03'),
('Vinha Mística', 'Remoto', 70, 65, 75, 70, 75, '2023-01-02'),
('Dínamo de Diamante', 'Curto Alcance', 60, 85, 60, 90, 90, '2023-01-04'),
('Crescimento Dourado', 'Curto Alcance', 70, 70, 60, 90, 80, '2023-01-05'),
('Espírito Livre', 'Curto Alcance', 75, 80, 60, 85, 85, '2023-01-06'),
('Tornado Tusko', 'Longo Alcance', 80, 70, 85, 70, 70, '2023-01-07'),
('Explosão de Bolhas', 'Curto Alcance', 70, 80, 60, 90, 85, '2023-01-08'),
('Titã Temporal', 'Curto Alcance', 90, 80, 60, 85, 85, '2023-01-09'),
('Esmagador Cósmico', 'Curto Alcance', 85, 70, 70, 75, 75, '2023-01-10'),
('Eco Explosivo', 'Curto Alcance', 90, 80, 60, 90, 85, '2023-01-11'),
('Rei Carmesim', 'Curto Alcance', 100, 90, 60, 85, 85, '2023-01-12'),
('Doppelganger Dimensional', 'Curto Alcance', 90, 80, 60, 85, 85, '2023-01-13'),
('Vácuo do Vazio', 'Curto Alcance', 100, 90, 60, 85, 85, '2023-01-14'),
('Espírito Selvagem', 'Curto Alcance', 80, 80, 60, 85, 85, '2023-01-15'),
('Instinto de Ferro', 'Curto Alcance', 85, 80, 60, 85, 85, '2023-01-16'),
('Alquimista do Envelhecimento', 'Curto Alcance', 70, 80, 60, 85, 85, '2023-01-17'),
('Fúria da Pesca', 'Longo Alcance', 80, 70, 85, 70, 70, '2023-01-18'),
('Praga Púrpura', 'Curto Alcance', 90, 80, 60, 90, 85, '2023-01-19'),
('Sentinela das Sombras', 'Curto Alcance', 70, 80, 60, 85, 85, '2023-01-20');

INSERT INTO Personagens (nome, data_criacao, pais, regiao, stand_id, criador_id) VALUES
('Josephine Wavestorm', '2023-01-01', 'Inglaterra', 'Wessex', 1, 1),
('Jameson Jetstream', '2023-01-02', 'Inglaterra', 'London', 2, 2),
('Jett Jotaro', '2023-01-03', 'Japão', 'Kanto', 3, 3),
('Jazzy Higashikata', '2023-01-04', 'Japão', 'M Prefecture', 4, 4),
('Giovanni Goldcrest', '2023-01-05', 'Itália', 'Naples', 5, 5),
('Jenna Cujoh', '2023-01-06', 'Estados Unidos', 'Florida', 6, 6),
('John Johnnyson', '2023-01-07', 'Estados Unidos', 'Missouri', 7, 7),
('Jayden Higashikata', '2023-01-08', 'Japão', 'M Prefecture', 8, 8),
('Diana Dusk', '2023-01-09', 'Inglaterra', 'London', 9, 9),
('Elena Eclipse', '2023-01-10', 'Itália', 'Rome', 10, 10),
('Yuri Kira', '2023-01-11', 'Japão', 'M Prefecture', 11, 11),
('Dominic Diablo', '2023-01-12', 'Itália', 'Naples', 12, 12),
('Felix Valentine', '2023-01-13', 'Estados Unidos', 'New Jersey', 13, 13),
('Karl Karst', '2023-01-14', 'Itália', 'Rome', 14, 14),
('Winston Wamuu', '2023-01-15', 'Itália', 'Rome', 15, 15),
('Eli Esidisi', '2023-01-16', 'Itália', 'Rome', 16, 16),
('Vincent Iceberg', '2023-01-17', 'Egito', 'Cairo', 17, 17),
('Rachel Noir', '2023-01-18', 'Itália', 'Naples', 18, 18),
('Paul Prosciutto', '2023-01-19', 'Itália', 'Naples', 19, 19),
('Peter Pesci', '2023-01-20', 'Itália', 'Naples', 20, 20);

INSERT INTO Lutas (localizacao, data) VALUES
('Praia de Waikiki', '2023-01-11'),
('Ponte Golden Gate', '2023-01-12'),
('Monte Everest', '2023-01-13'),
('Castelo de Bran', '2023-01-14'),
('Grande Muralha da China', '2023-01-15'),
('Big Ben', '2023-01-16'),
('Ilha de Páscoa', '2023-01-17'),
('Estátua da Liberdade', '2023-01-18'),
('Taj Mahal', '2023-01-19'),
('Machu Picchu', '2023-01-20'),
('Coliseu Romano', '2023-01-01'),
('Monte Fuji', '2023-01-02'),
('Torre Eiffel', '2023-01-03'),
('Central Park', '2023-01-04'),
('Cataratas do Niágara', '2023-01-05'),
('Deserto do Saara', '2023-01-06'),
('Muralha da China', '2023-01-07'),
('Pirâmides de Gizé', '2023-01-08'),
('Machu Picchu', '2023-01-09'),
('Grand Canyon', '2023-01-10');

INSERT INTO Viloes (nome, data_criacao, stand_id, criador_id) VALUES
('Dio Brando', '2023-01-01', 1, 1),
('Kars', '2023-01-02', 2, 2),
('Yoshikage Kira', '2023-01-03', 3, 3),
('Diavolo', '2023-01-04', 4, 4),
('Enrico Pucci', '2023-01-05', 5, 5),
('Funny Valentine', '2023-01-06', 6, 6),
('Dio Brando (Parte 7)', '2023-01-07', 7, 7),
('Kars (Parte 7)', '2023-01-08', 8, 8),
('Yoshikage Kira (Parte 8)', '2023-01-09', 9, 9),
('Diavolo (Parte 8)', '2023-01-10', 10, 10),
('Enrico Pucci (Parte 8)', '2023-01-11', 11, 11),
('Dio Brando (Versão alternativa)', '2023-01-12', 12, 12),
('Kars (Versão alternativa)', '2023-01-13', 13, 13),
('Yoshikage Kira (Versão alternativa)', '2023-01-14', 14, 14),
('Diavolo (Versão alternativa)', '2023-01-15', 15, 15),
('Enrico Pucci (Versão alternativa)', '2023-01-16', 16, 16),
('Dio Brando (Versão alternativa 2)', '2023-01-17', 17, 17),
('Kars (Versão alternativa 2)', '2023-01-18', 18, 18),
('Yoshikage Kira (Versão alternativa 2)', '2023-01-19', 19, 19),
('Diavolo (Versão alternativa 2)', '2023-01-20', 20, 20);

INSERT INTO Luta_Personagem (luta_id, personagem_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

INSERT INTO Luta_Vilao (luta_id, vilao_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

INSERT INTO Luta_Stand (luta_id, stand_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20);

SELECT *
FROM Lutas
WHERE data < '2024-01-01'
ORDER BY data DESC;

SELECT *
FROM Stands
WHERE precisao > 80;

SELECT nome, regiao
FROM Personagens
WHERE regiao = 'M Prefecture';

SELECT nome
FROM Stands
WHERE poder > 80;

SELECT Personagens.nome, Stands.nome
FROM Personagens, Stands
WHERE Personagens.stand_id = Stands.id_stand;

SELECT *
FROM Lutas
WHERE localizacao = 'Ilha de Páscoa';

SELECT Viloes.nome, Stands.nome
FROM Viloes, Stands
WHERE Viloes.stand_id = Stands.id_stand;

SELECT * FROM Personagens 
WHERE criador_id = 1;

SELECT nome, tipo, poder
FROM Stands
WHERE poder > 80
ORDER BY tipo, poder; 

SELECT localizacao, data
FROM Lutas
WHERE MONTH(data) = 1 AND YEAR(data) = 2023
ORDER BY data;
