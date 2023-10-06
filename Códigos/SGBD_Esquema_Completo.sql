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

-- Tabela de Funcionarios
CREATE TABLE Funcionarios (
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

-- Tabela de Inscrições de Alunos em Cursos
CREATE TABLE Inscricoes (
    AlunoID INT NOT NULL,
    CursoID INT NOT NULL,
    PRIMARY KEY (AlunoID, CursoID),
    FOREIGN KEY (AlunoID) REFERENCES Alunos(ID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(ID)
);

-- Tabela de Registros de Acesso
CREATE TABLE RegistrosDeAcesso (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PessoaID INT NOT NULL,
    HoraEntrada DATETIME NOT NULL,
    HoraSaida DATETIME,
    TempoSessao TIME,
    FOREIGN KEY (PessoaID) REFERENCES Alunos(ID)
);

-- Tabela de Notas e Avaliações
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

-- Tabela de Presença dos Alunos
CREATE TABLE Presenca (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    AlunoID INT NOT NULL,
    CursoID INT NOT NULL,
    DataPresenca DATE NOT NULL,
    Presente ENUM('Sim', 'Nao') NOT NULL,
    FOREIGN KEY (AlunoID) REFERENCES Alunos(ID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(ID)
);

-- Tabela de Taxas de Matrícula
CREATE TABLE TaxasMatricula (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    CursoID INT NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    DataVencimento DATE NOT NULL,
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

-- Tabela de Usuários para Autenticação
CREATE TABLE Usuarios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL
);

-- Tabela de Eventos
CREATE TABLE Eventos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255) NOT NULL,
    DataEvento DATETIME NOT NULL,
    UsuarioID INT NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Tabela de Salas de Aula
CREATE TABLE SalasDeAula (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NomeSala VARCHAR(255) NOT NULL,
    Capacidade INT NOT NULL
);

-- Tabela de Horários das Aulas
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

-- Tabela de Eventos Esportivos e Extracurriculares
CREATE TABLE EventosEsportivosExtracurriculares (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NomeEvento VARCHAR(255) NOT NULL,
    Descricao TEXT,
    DataEvento DATETIME NOT NULL,
    Local VARCHAR(255),
    Organizador VARCHAR(255),
    TipoEvento ENUM('Esportivo', 'Extracurricular') NOT NULL
);

-- Tabela de Calendário Escolar
CREATE TABLE CalendarioEscolar (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Evento VARCHAR(255) NOT NULL,
    DataEvento DATE NOT NULL
);

-- Tabela de Controle de Presença
CREATE TABLE ControlePresenca (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    AlunoID INT NOT NULL,
    CursoID INT NOT NULL,
    DataPresenca DATE NOT NULL,
    Presente ENUM('Sim', 'Nao') NOT NULL,
    FOREIGN KEY (AlunoID) REFERENCES Alunos(ID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(ID)
);

-- Tabela de Relatórios (Esta tabela pode ser usada para armazenar informações de relatórios)
CREATE TABLE Relatorios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    TipoRelatorio VARCHAR(255) NOT NULL,
    DataGeracao DATETIME NOT NULL,
    Descricao TEXT,
    Autor VARCHAR(255) NOT NULL
);