CREATE TABLE Funcionarios (
    FuncionarioID INT PRIMARY KEY,
    Extensao VARCHAR(255),
    NomeFuncionario VARCHAR(255),
    Genero VARCHAR(255),
    DataAdmissao DATE,
    Escritorio VARCHAR(255),
    Supervisor INT,
    Cargo VARCHAR(255),
    SalarioAnual DECIMAL(10, 2),
    MetaVendas DECIMAL(10, 2)
);
