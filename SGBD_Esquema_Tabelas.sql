-- Tabela de Alunos
CREATE TABLE Alunos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Endereco VARCHAR(255),
    Telefone VARCHAR(15),
    PagamentoEmDia ENUM('Em Dia', 'Atrasado') NOT NULL
);

-- Tabela de Cursos
CREATE TABLE Cursos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NomeCurso VARCHAR(255) NOT NULL,
    Descricao TEXT,
    DuracaoEmHoras INT,
    Preco DECIMAL(10, 2) NOT NULL
);

-- Tabela de Inscrições de Alunos em Cursos
CREATE TABLE Inscricoes (
    AlunoID INT NOT NULL,
    CursoID INT NOT NULL,
    PRIMARY KEY (AlunoID, CursoID),
    FOREIGN KEY (AlunoID) REFERENCES Alunos(ID),
    FOREIGN KEY (CursoID) REFERENCES Cursos(ID)
);

-- Regras de Acesso com base no Pagamento
DELIMITER //
CREATE TRIGGER VerificarPagamento
BEFORE INSERT ON RegistrosDeAcesso FOR EACH ROW
BEGIN
    DECLARE pagamentoStatus ENUM('Em Dia', 'Atrasado');
    SELECT PagamentoEmDia INTO pagamentoStatus FROM Alunos WHERE ID = NEW.PessoaID;
    IF pagamentoStatus = 'Atrasado' THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Acesso negado devido ao pagamento em atraso';
    END IF;
END;
//
DELIMITER ;

-- Tabela de Registros de Acesso
CREATE TABLE RegistrosDeAcesso (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    PessoaID INT NOT NULL,
    HoraEntrada DATETIME NOT NULL,
    HoraSaida DATETIME,
    TempoSessao TIME,
    FOREIGN KEY (PessoaID) REFERENCES Alunos(ID)
);