
-- Tabela de Eventos

CREATE TABLE Eventos (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Descricao VARCHAR(255) NOT NULL,
    DataEvento DATETIME NOT NULL,
    UsuarioID INT NOT NULL,
    FOREIGN KEY (UsuarioID) REFERENCES Usuarios(ID)
);

-- Tabela de EventosEsportivosExtracurriculares

CREATE TABLE EventosEsportivosExtracurriculares (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    NomeEvento VARCHAR(255) NOT NULL,
    Descricao TEXT,
    DataEvento DATETIME NOT NULL,
    Local VARCHAR(255),
    Organizador VARCHAR(255),
    TipoEvento ENUM('Esportivo', 'Extracurricular') NOT NULL
);
