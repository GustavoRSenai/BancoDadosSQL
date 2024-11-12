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
CREATE TABLE autora (
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
    FOREING KEY (id_editora) REFERENCES editora(id_editora),
    FOREING KEY (id_autor) REFERENCES autor(id_autor),
    FOREING KEY (id_assunto) REFERENCES assunto(id_assunto),
);
```

#### 1.6 Criando a tabela 'extra'

```SQL
CREATE TABLE livro (
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

## Passo 4: 