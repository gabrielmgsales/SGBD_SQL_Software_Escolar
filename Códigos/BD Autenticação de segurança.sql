
-- Tabela de Usuarios

CREATE TABLE Usuarios (
    ID INT AUTO_INCREMENT PRIMARY KEY,
    Nome VARCHAR(255) NOT NULL,
    Email VARCHAR(255) NOT NULL UNIQUE,
    Senha VARCHAR(255) NOT NULL
);

-- Permissões para Professores
GRANT SELECT ON Alunos, Inscricoes, NotasAvaliacoes, Presenca, ControlePresenca, Cursos TO professores;

-- Permissões para Financeiro
GRANT SELECT ON TaxasMatricula, Mensalidades, Descontos TO financeiro;

-- Permissões para Proprietários (acesso a todas as tabelas)
GRANT ALL PRIVILEGES ON *.* TO proprietarios;

-- Permissões para Funcionários de Segurança (acesso a todas as tabelas)
GRANT ALL PRIVILEGES ON *.* TO funcionarios_seguranca;
