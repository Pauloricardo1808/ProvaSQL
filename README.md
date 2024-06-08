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
