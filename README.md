# Passo a passo: Criação de um banco de dados
Tutorial de como criar um banco de dados SQL que organiza as informações de 'livros', 'editora', 'autores e 'assuntos'. Este guia será dividido em etapas para demonstrar desde a criação de tabelas, chaves e até manipulação/consulta de dados.
 
## Resumo de uma estrutura SQL

* __CREATE__ - para criar "Banco de dados" ou "Tabelas"
* __ALTER__ - modificar e alterar colunas
* __DROP__ - Para remover "Tabelas" e "Bancos"
* __INSERT__ - inserir os dados na tabela
* __UPDATE__ - atualizar os dados do registro
* __DELETE__ - remover registro
* __SELECT__ - consultar e visualizar dados

# Passo a passo: Criação de um banco de dados

## Passo 1: criação do Banco de Dados e das Tabelas
#### 1.1 Criando o DB

```SQL
CREATE DATABASE biblioteca;
USE biblioteca;
```

#### 1.2 Criando a tabela 'editora'

```SQL
CREATE TABLE editora (
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(100) NOT NULL,
    pais VARCHAR(50)
);
```
#### 1.3 Criando a tabela 'autora'

```SQL
CREATE TABLE autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(100) NOT NULL,
    data_nascimento DATE
);
```

#### 1.4 Criando a tabela 'assunto'

```SQL
CREATE TABLE assunto (
    id_assunto INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(500) NOT NULL
);
```

#### 1.5 Criando a tabela 'livro'

```SQL
CREATE TABLE livro (
    id_livro INT PRIMARY KEY AUTO_INCREMENT,
    titulo VARCHAR(150) NOT NULL,
    ano_publicacao YEAR,
    editora INT,
    autor INT,
    assunto INT,
    FOREIGN KEY(editora) REFERENCES editora(id_editora),
    FOREIGN KEY(autora) REFERENCES autor(id_autor),
    FOREIGN KEY(assunto) REFERENCES assunto(id_assunto)
);
```

#### 1.6 Criando a tabela 'extra'

```SQL
CREATE TABLE Extra (
    id INT PRIMARY KEY AUTO_INCREMENT,
    produtos VARCHAR(50),
    quantidade INT(200),
    preco DOUBLE NOT NULL
);
```

## Passo 2: editar tabelas usando "ALTER"
Após a criação da tabela, podemos adicionar novos campos. Vamos adicionar uma coluna 'email' na tabela 'autor'


```SQL
ALTER TABLE autor
ADD COLUMN email VARCHAR(100);
```

## Passo 3: Remover tabela usando 'DROP'
Se precisarmos remover uma tabela usamos o comando 'DROP'.
Neste exemplo vamos remover a tabela 'extra'

```SQL
DROP TABLE extra;
```

## Passo 4: Inserindo dados usando 'INSERT'
Agora que as tabelas já estão prontas, vamos inserir dados nelas.

#### 4.1 Inserindo dados na tabela 'editora'

```SQL
INSERT INTO editora(nome_editora, pais)
VALUES
('Editora Alfa', 'Brasil'),
('Editora Beta', 'Portugal'),
('Editora Bertrand Brasil', 'Brasil');
```

#### 4.2 Inserindo dados na tabela 'autor'

```SQL
INSERT INTO autor(nome_autor, data_nascimento, email)
VALUES
('Jorge Amado', '1912-08-10', 'jorginho@email.com'),
('Machado de Assis', '1839-06-21', 'machadinho@email.com'),
('Matt Haig', '1975-06-03', 'matt@email.com');
```

#### 4.3 Inserindo dados na tabela 'assunto'

```SQL
INSERT INTO assunto(descricao)
VALUES
('Ficção'),
('Mistério'),
('Terror'),
('Romance');
```

#### 4.4 Inserindo dados na tabela 'Livro'

```SQL
INSERT INTO livro (titulo, ano_publicacao, editora, autor, assunto)
VALUES
('Capitães da Areia', '1937', 1, 1, 4),
('Dom Casmuro', '1899', 2, 2, 4),
('Biblioteca da meia noite', '2020', 3, 3 ,1),
('Memorias postumas de Brás Cubas', '1881', 1, 2, 4);
```

## Passo 5: atualizando os dados usando 'UPDATE'
Podemos atualizar os dados com o comando UPDATE.
vamos corrigir a data da publicação do livro 'Capitães da Areia'

```SQL
UPDATE livro
SET ano_publicação = 1938
WHERE titulo = 'Capitães da Areia';
```

## Passo 6: excluindo dados usando 'DELETE'
Para remover colunas usando os registros de uma tabela usamos o comando 'DELETE'.
Vamos Excluir o livro 'Memorias postumas de Brás Cubas' da tabela livro.

```SQL
DELETE FROM livro
WHERE id_livro = 4;
```

## Passo 7: Consultando os dados usando 'SELECT'
É possive selecionar os dados para visualizar da forma como quiser.
Para isso usamos o comando 'SELECT'.

#### Passo 7.1: selecionar todos os livros com suas editoras e autores
Vamos usar dados das tabelas 'livros', 'editora', 'autor', e 'assunto' usando o comando 'JOIN'

```SQL
SELECT  livro.titulo AS titulo,
        editora.nome_editora AS editora,
        autor.nome_autor AS autor,
        assunto.descricao AS tema,
        livro.ano_publicacao AS ano
FROM livro
JOIN editora ON livro.id_editora = editora.id_editora
JOIN autor ON livro.id_autor = autor.id_autor
JOIN assunto ON livro.id_assunto = assunto.id_assunto;
```

#### Passo 7.2: usar apenas livros do mesmo nicho
usando o 'WHERE' para especificar o que se deseja visualizar.

```SQL
SELECT  livro.titulo AS titulo,
        assunto.descricao AS tema
FROM livro
JOIN assunto ON livro.assunto = assunto.id_assunto
WHERE assunto.id_assunto = 4;
```



