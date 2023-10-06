-- Tabela de Alunos
CREATE TABLE Alunos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    PagamentoEmDia ENUM('Em Dia', 'Atrasado') NOT NULL
);

-- Tabela de Professores
CREATE TABLE Professores (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Cargo VARCHAR(100) NOT NULL,
    Email VARCHAR(255),
    Telefone VARCHAR(15)
);

-- Tabela de Cursos
CREATE TABLE Cursos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NomeCurso VARCHAR(255) NOT NULL,
    Descricao TEXT,
    DuracaoEmHoras INT,
    Preco DECIMAL(10, 2) NOT NULL,
    ProfessorID INT,
    FOREIGN KEY (ProfessorID) REFERENCES Professores(ID)
);

-- Tabela de Inscricoes
CREATE TABLE Inscricoes (
    AlunoID INT NOT NULL,
    CursoID INT NOT NULL,
    PRIMARY KEY (AlunoID, CursoID),
    FOREIGN KEY (AlunoID) REFERENCES Alunos(ID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(ID)
);

-- Tabela de NotasAvaliacoes
CREATE TABLE NotasAvaliacoes (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    AlunoID INT NOT NULL,
    CursoID INT NOT NULL,
    Disciplina VARCHAR(255) NOT NULL,
    Nota DECIMAL(5, 2) NOT NULL,
    DataAvaliacao DATE NOT NULL,
    FOREIGN KEY (AlunoID) REFERENCES Alunos(ID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(ID)
);

-- Tabela de Presenca
CREATE TABLE Presenca (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    AlunoID INT NOT NULL,
    CursoID INT NOT NULL,
    DataPresenca DATE NOT NULL,
    Presente ENUM('Sim', 'Nao') NOT NULL,
    FOREIGN KEY (AlunoID) REFERENCES Alunos(ID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(ID)
);

-- Tabela de Mensalidades
CREATE TABLE Mensalidades (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    AlunoID INT NOT NULL,
    CursoID INT NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    DataVencimento DATE NOT NULL,
    Pago ENUM('Sim', 'Nao') NOT NULL,
    FOREIGN KEY (AlunoID) REFERENCES Alunos(ID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(ID)
);

-- Tabela de Descontos
CREATE TABLE Descontos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    AlunoID INT NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    Descricao VARCHAR(255),
    FOREIGN KEY (AlunoID) REFERENCES Alunos(ID)
);

-- Tabela de TaxasMatricula
CREATE TABLE TaxasMatricula (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CursoID INT NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    DataVencimento DATE NOT NULL,
    FOREIGN KEY (CursoID) REFERENCES Cursos(ID)
);
