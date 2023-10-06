-- Tabela de Funcionarios

CREATE TABLE Funcionarios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Cargo VARCHAR(100) NOT NULL,
    Email VARCHAR(255),
    Telefone VARCHAR(15)
);

-- Tabela de SalasDeAula

CREATE TABLE SalasDeAula (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NomeSala VARCHAR(255) NOT NULL,
    Capacidade INT NOT NULL
);

-- Tabela de HorariosAulas

CREATE TABLE HorariosAulas (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CursoID INT NOT NULL,
    SalaID INT NOT NULL,
    DiaSemana VARCHAR(10) NOT NULL,
    HoraInicio TIME NOT NULL,
    HoraFim TIME NOT NULL,
    FOREIGN KEY (CursoID) REFERENCES Cursos(ID),
    FOREIGN KEY (SalaID) REFERENCES SalasDeAula(ID)
);

-- Tabela de CalendarioEscolar

CREATE TABLE CalendarioEscolar (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Evento VARCHAR(255) NOT NULL,
    DataEvento DATE NOT NULL
);

-- Tabela de ControlePresenca

CREATE TABLE ControlePresenca (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    AlunoID INT NOT NULL,
    CursoID INT NOT NULL,
    DataPresenca DATE NOT NULL,
    Presente ENUM('Sim', 'Nao') NOT NULL,
    FOREIGN KEY (AlunoID) REFERENCES Alunos(ID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(ID)
);

-- Tabela de Relatorios

CREATE TABLE Relatorios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    TipoRelatorio VARCHAR(255) NOT NULL,
    DataGeracao DATETIME NOT NULL,
    Descricao TEXT,
    Autor VARCHAR(255) NOT NULL
);
