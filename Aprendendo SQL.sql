CREATE DATABASE biblioteca;
USE biblioteca;

CREATE TABLE editora (
    id_editora INT PRIMARY KEY AUTO_INCREMENT,
    nome_editora VARCHAR(100) NOT NULL,
    pais VARCHAR(50)
);

CREATE TABLE autor (
    id_autor INT PRIMARY KEY AUTO_INCREMENT,
    nome_autor VARCHAR(100) NOT NULL,
    data_nascimento DATE
);

CREATE TABLE assunto (
    id_assunto INT PRIMARY KEY AUTO_INCREMENT,
    descricao VARCHAR(500) NOT NULL
);

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

CREATE TABLE Extra (
    id INT PRIMARY KEY AUTO_INCREMENT,
    produtos VARCHAR(50),
    quantidade INT(200),
    preco DOUBLE NOT NULL
);

ALTER TABLE autor
ADD COLUMN email VARCHAR(100);

DROP TABLE extra;

INSERT INTO editora(nome_editora, pais)
VALUES
('Editora Alfa', 'Brasil'),
('Editora Beta', 'Portugal'),
('Editora Bertrand Brasil', 'Brasil');

INSERT INTO autor(nome_autor, data_nascimento, email)
VALUES
('Jorge Amado', '1912-08-10', 'jorginho@email.com'),
('Machado de Assis', '1839-06-21', 'machadinho@email.com'),
('Matt Haig', '1975-06-03', 'matt@email.com');

INSERT INTO assunto(descricao)
VALUES
('Ficção'),
('Mistério'),
('Terror'),
('Romance');

INSERT INTO livro (titulo, ano_publicacao, editora, autor, assunto)
VALUES
('Capitães da Areia', '1937', 1, 1, 4),
('Dom Casmuro', '1899', 2, 2, 4),
('Biblioteca da meia noite', '2020', 3, 3 ,1),
('Memorias postumas de Brás Cubas', '1881', 1, 2, 4);

UPDATE livro
SET ano_publicação = 1938
WHERE titulo = 'Capitães da Areia';

DELETE FROM livro
WHERE id_livro = 4;

SELECT  livro.titulo AS titulo,
        editora.nome_editora AS editora,
        autor.nome_autor AS autor,
        assunto.descricao AS tema,
        livro.ano_publicacao AS ano
FROM livro
JOIN editora ON livro.id_editora = editora.id_editora
JOIN autor ON livro.id_autor = autor.id_autor
JOIN assunto ON livro.id_assunto = assunto.id_assunto;

SELECT  livro.titulo AS titulo,
        assunto.descricao AS tema
FROM livro
JOIN assunto ON livro.assunto = assunto.id_assunto
WHERE assunto.id_assunto = 4;