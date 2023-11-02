CREATE TABLE Alunos (
    RA INTEGER PRIMARY KEY,
    Nome VARCHAR(25)
);

CREATE TABLE Professores (
    CPF INTEGER PRIMARY KEY,
    Nome VARCHAR(35),
    email VARCHAR(50) UNIQUE
);

CREATE TABLE Disciplinas (
    id_disciplinas INTEGER PRIMARY KEY,
    disciplinas VARCHAR(20) UNIQUE,
    id_professores INTEGER
);

CREATE TABLE curso (
    id_curso INTEGER PRIMARY KEY,
    nome_do_curso VARCHAR(25),
    duração VARCHAR(15),
    período VARCHAR(5),
    horario VARCHAR(7)
);

CREATE TABLE turma (
    id_curso INTEGER,
    id_aluno INTEGER,
    id_turma INTEGER PRIMARY KEY
);

CREATE TABLE notas (
    notas FLOAT(2),
    Id INTEGER PRIMARY KEY,
    id_disciplinas INTEGER,
    id_alunos INTEGER
);

CREATE TABLE turmas_professores (
    id_turma INTEGER,
    id_professores INTEGER
);

CREATE TABLE curso_disciplinas (
    id_curso INTEGER,
    id_disciplinas INTEGER
);


ALTER TABLE Professores ADD CONSTRAINT FK_Professores_2
    FOREIGN KEY (CPF)
    REFERENCES turmas_professores(id_professores);

ALTER TABLE Disciplinas ADD CONSTRAINT id_professores
    FOREIGN KEY (id_professores)
    REFERENCES professores(CPF);

ALTER TABLE curso ADD CONSTRAINT disciplinas
    FOREIGN KEY (disciplinas)
    REFERENCES curso_disciplinas(id_curso);

ALTER TABLE turma ADD CONSTRAINT FK_turma_1
    FOREIGN KEY (id_curso)
    REFERENCES curso(id_curso);

ALTER TABLE turma ADD CONSTRAINT id_aluno
    FOREIGN KEY (id_aluno)
    REFERENCES Alunos(RA);

ALTER TABLE notas ADD CONSTRAINT id_disciplinas
    FOREIGN KEY (id_disciplinas)
    REFERENCES Disciplinas(id_disciplinas);

ALTER TABLE notas ADD CONSTRAINT id_alunos
    FOREIGN KEY (id_alunos)
    REFERENCES Alunos(RA);

ALTER TABLE turmas_professores ADD CONSTRAINT id_turma
    FOREIGN KEY (id_turma)
    REFERENCES turma(id_turma);

ALTER TABLE turmas_professores ADD CONSTRAINT id_professor
    FOREIGN KEY (id_professores)
    REFERENCES Professores(CPF);

ALTER TABLE curso_disciplinas ADD CONSTRAINT id_curso
    FOREIGN KEY (id_curso)
    REFERENCES curso(id_curso);

ALTER TABLE curso_disciplinas ADD CONSTRAINT id_relation_disciplinas
    FOREIGN KEY (id_disciplinas)
    REFERENCES Disciplinas(id_disciplinas);