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

```
CREATE DATABASE biblioteca;
USE biblioteca;
```

#### 1.2 Criando a tabela 'editora'

```
CREATE TABLE editora (
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(100) NOT NULL,
    pais VARCHAR(50)
);
```
#### 1.3 Criando a tabela 'autora'

```
CREATE TABLE editora (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(100) NOT NULL,
    data_nascimento DATE
);
```

#### 1.4 Criando a tabela 'assunto'

```
CREATE TABLE assunto (
    id_assunto INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(500) NOT NULL
);
```

#### 1.5 Criando a tabela 'assunto'

```
CREATE TABLE livro (
    id_ INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(500) NOT NULL
);
```