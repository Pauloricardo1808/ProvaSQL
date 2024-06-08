# CENARIO: 

Imagine um sistema de criação de personagens online onde fãs de JoJo's Bizarre Adventure podem criar seus próprios personagens e stands. Este sistema permitirá que os usuários criem personagens detalhados, definam suas características, relacionem personagens a stands, e registrem batalhas épicas entre os personagens criados. O objetivo é proporcionar uma plataforma interativa onde os fãs possam explorar sua criatividade e compartilhar suas criações com a comunidade. 

## Entidades e Atributos 

### Usuários: 

ID do Usuário (PK, simples) 

Nome de Usuário (simples) 

Email (simples) 

Data de Criação (simples) 

Personagens Criados (multivalorado) 

### Personagens: 

ID do Personagem (PK, simples) 

Nome (simples) 

Data de Criação (simples) 

Nacionalidade (composto: País, Região) 

Stand (FK, simples) 

Criador (FK) 

### Vilões: 

ID do Vilão (PK, simples) 

Nome (simples) 

Data de Criação (simples) 

Stand (FK, simples) 

Criador (FK) 

### Stands: 

ID do Stand (PK, simples) 

Nome (simples) 

Tipo (simples) 

Poder (simples) 

Velocidade (simples) 

Alcance (simples) 

Precisão (simples) 

Durabilidade (simples) 

Data de Criação (derivado): Derivado da data de criação do personagem ou vilão. 

### Lutas: 

ID da Luta (PK, simples) 

Localização (simples) 

Data (simples) 

Personagens Envolvidos (N, N - multivalorado) 

Vilões Envolvidos (N, N - multivalorado) 

Stands Envolvidos (N, N, multivalorado) 

## MODELO CONCEITUAL:
![](https://github.com/Pauloricardo1808/ProvaSQL/blob/f2bcc3f13534cacb94ed1ca033f7249867a00756/imagens/Conceitual%201.png)
![](https://github.com/Pauloricardo1808/ProvaSQL/blob/f2bcc3f13534cacb94ed1ca033f7249867a00756/imagens/Conceitual%202.png)
<p align="center">
  <img src="https://github.com/Pauloricardo1808/ProvaSQL/blob/f2bcc3f13534cacb94ed1ca033f7249867a00756/imagens/Conceitual%203.png" width="400" />
</p>

## MODELO LOGICO:
![](https://github.com/Pauloricardo1808/ProvaSQL/blob/f2bcc3f13534cacb94ed1ca033f7249867a00756/imagens/logico.png)

# MODELAGEM FISICA:
## TABELA DE USUARIOS
```sql
CREATE TABLE Usuarios (
    id_usuario INTEGER auto_increment PRIMARY KEY,
    nome_usuario VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    data_criacao DATE
);
```
## TABELA DE PERSONAGENS
```sql
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
```
## TABELA DE STANDS
```sql
CREATE TABLE Stands (
    id_stand INTEGER auto_increment PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    tipo VARCHAR(50) NOT NULL,
    poder INTEGER NOT NULL,
    velocidade INTEGER NOT NULL,
    alcance INTEGER NOT NULL,
    precisao INTEGER NOT NULL,
    durabilidade INTEGER NOT NULL,
    data_criacao DATE
);
```
## TABELA DE VILÕES
```sql
CREATE TABLE Viloes (
    id_vilao INTEGER auto_increment PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    data_criacao DATE,
    stand_id INTEGER,
    criador_id INTEGER,
    FOREIGN KEY (stand_id) REFERENCES Stands (id_stand),
    FOREIGN KEY (criador_id) REFERENCES Usuarios (id_usuario)
);
```
## TABELA DE LUTAS
```sql
CREATE TABLE Lutas (
    id_luta INTEGER auto_increment PRIMARY KEY,
    localizacao VARCHAR(100) NOT NULL,
    data DATE
);
```
## TABELA LUTA_PERSONAGEM
```sql
CREATE TABLE Luta_Personagem (
    luta_id INTEGER,
    personagem_id INTEGER,
    PRIMARY KEY auto_increment (luta_id, personagem_id),
    FOREIGN KEY (luta_id) REFERENCES Lutas (id_luta),
    FOREIGN KEY (personagem_id) REFERENCES Personagens (id_personagem)
);
```
## TABELA LUTA_VILÃO
```sql
CREATE TABLE Luta_Vilao (
    luta_id INTEGER,
    vilao_id INTEGER,
    PRIMARY KEY (luta_id, vilao_id),
    FOREIGN KEY (luta_id) REFERENCES Lutas (id_luta),
    FOREIGN KEY (vilao_id) REFERENCES Viloes (id_vilao)
);
```
## TABELA LUTA_STAND
```sql
CREATE TABLE Luta_Stand (
    luta_id INTEGER,
    stand_id INTEGER,
    PRIMARY KEY (luta_id, stand_id),
    FOREIGN KEY (luta_id) REFERENCES Lutas (id_luta),
    FOREIGN KEY (stand_id) REFERENCES Stands (id_stand)
);
```
# INSERÇÃO DE DADOS
## USUARIOS
```sql
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
```
## PERSONAGENS
```sql
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
```
## STANDS
```sql
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
```
## LUTAS
```sql
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
```
VILÕES
```sql
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
```
## LUTA_PERSONAGEM
```sql
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
```
LUTA_VILÃO
```sql
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
```
## LUTA_STAND
```sql
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
```
# CRUD
## ADICIONAR DADOS NA TABELA:
![](https://github.com/Pauloricardo1808/ProvaSQL/blob/1e67de541b9cefb46d8c5c111dff90eb24869d09/imagens/Inserir%20tabela.png)
## SELECIONANDO DADOS DE UMA TABELA:
![](https://github.com/Pauloricardo1808/ProvaSQL/blob/1e67de541b9cefb46d8c5c111dff90eb24869d09/imagens/Selecionar%20tabela.png)
## ALTERANDO DADOS DE UMA TABELA:
![](https://github.com/Pauloricardo1808/ProvaSQL/blob/1e67de541b9cefb46d8c5c111dff90eb24869d09/imagens/update%20tabela.png)
## DELETANDO DADOS DE UMA TABELA:
![](https://github.com/Pauloricardo1808/ProvaSQL/blob/1e67de541b9cefb46d8c5c111dff90eb24869d09/imagens/delete%20tabela.png)

# RELATORIOS

## 1 - Lutas em data decrescente:

![](https://github.com/Pauloricardo1808/ProvaSQL/blob/c750f71f3986cbb84bc190ee127d60aa3848da26/imagens/Lutas%20decrescente.png)

Aqui foi feito uma seleção de todas as lutas ordenando a data de forma decrescente

## 2 - Região dos personagens:

![](https://github.com/Pauloricardo1808/ProvaSQL/blob/c750f71f3986cbb84bc190ee127d60aa3848da26/imagens/Regiao%20escolhida.png)

Aqui foi feito a seleção do nome e região dos personagens pedindo uma região especifica como parametro

## 3 - Localização de Lutas:

![](https://github.com/Pauloricardo1808/ProvaSQL/blob/c750f71f3986cbb84bc190ee127d60aa3848da26/imagens/localiza%C3%A7%C3%A3o.png)

Aqui foi feito a seleção de todas as lutas filtrando apenas aquelas com a mesma localização

## 4 - Seleção de Mês:

![](https://github.com/Pauloricardo1808/ProvaSQL/blob/c750f71f3986cbb84bc190ee127d60aa3848da26/imagens/lutas%20do%20mes%201.png)

Aqui foi feito a seleção da data e localização de lutas filtrando apenas aquelas no mês 1 do ano 2023

## 5 - Personagens e seu criador:

![](https://github.com/Pauloricardo1808/ProvaSQL/blob/c750f71f3986cbb84bc190ee127d60aa3848da26/imagens/personagens%20e%20seu%20criador.png)

Aqui selecionou todos os personagens e filtrou apenas aqueles criados pelo usuario de id 1

## 6 - Personagens e seus respectivos stands:

![](https://github.com/Pauloricardo1808/ProvaSQL/blob/c750f71f3986cbb84bc190ee127d60aa3848da26/imagens/personagens%20e%20seus%20stands.png)

Aqui selecionou o nome dos personagens e stands e pediu mostrar qual personagem cada stand pertence

## 7 - Stands Fortes:

![](https://github.com/Pauloricardo1808/ProvaSQL/blob/c750f71f3986cbb84bc190ee127d60aa3848da26/imagens/stand%20poder.png)

Aqui selecionou o nome dos stands que possuem poder acima de 80

## 8 - Stands Precisos:

![](https://github.com/Pauloricardo1808/ProvaSQL/blob/c750f71f3986cbb84bc190ee127d60aa3848da26/imagens/stand%20precis%C3%A3o.png)

Aqui selecionou o nome dos stands que possuem precisão acima de 80

## 9 - Stands Forte com ordenação:

![](https://github.com/Pauloricardo1808/ProvaSQL/blob/c750f71f3986cbb84bc190ee127d60aa3848da26/imagens/stands%20especifico.png)

Aqui foi feito a seleção do nome, tipo e poder de stands com poder acima de 80 ordenando eles pelo tipo e o poder

## 10 - Vilões e seus respectivos stands:

![](https://github.com/Pauloricardo1808/ProvaSQL/blob/c750f71f3986cbb84bc190ee127d60aa3848da26/imagens/villoes%20e%20seus%20stands.png)

Aqui selecionou o nome dos vilões e stands e pediu mostrar qual vilão cada stand pertence
