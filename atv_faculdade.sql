CREATE SCHEMA atv_faculdade;
USE atv_faculdade;

CREATE TABLE alunos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(20),
    email VARCHAR(100) NOT NULL,
    cpf VARCHAR(15),
    id_curso INT,
    nome_curso VARCHAR(25) NOT NULL,
    FOREIGN KEY (id_curso) REFERENCES cursos(id_curso)
);

INSERT INTO alunos(nome, email) VALUES('Maria', "aaaaaaae@gggg");

SELECT * FROM alunos WHERE nome = 'Esdras';

SELECT * FROM alunos;

