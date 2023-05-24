SET XACT_ABORT ON

BEGIN TRANSACTION QUICKDBD

CREATE TABLE [Endereco_Empresa] (
    [ID_Endereco_Empresa] int NOT NULL ,
    [CEP] varchar  NOT NULL ,
    [Rua] varchar  NOT NULL ,
    [Numero_Endereco_Empresa] int  NOT NULL ,
    [Complemento_Endereco_Empresa] varchar  NOT NULL ,
    CONSTRAINT[PK_Endereco_Empresa] PRIMARY KEY CLUSTERED (
        [ID_Endereco_Empresa] ASC
    )
)

CREATE TABLE[Empresa] (
    [ID_Empresa] int NOT NULL ,
    [ID_Endereco_Empresa] int  NOT NULL ,
    [CNPJ] varchar  NOT NULL ,
    [Email] varchar  NOT NULL ,
    [Nome] varchar  NOT NULL ,
    [Razao_Social] varchar  NOT NULL ,
    CONSTRAINT[PK_Empresa] PRIMARY KEY CLUSTERED (
        [ID_Empresa] ASC
    ),
    CONSTRAINT[UK_Empresa_CNPJ] UNIQUE(
        [CNPJ]
    ),
    CONSTRAINT[UK_Empresa_Email] UNIQUE(
        [Email]
    ),
    CONSTRAINT[UK_Empresa_Nome] UNIQUE(
        [Nome]
    )
)

CREATE TABLE[Departamento] (
    [ID_Departamento] int NOT NULL ,
    [ID_Empresa] int  NOT NULL ,
    [Codigo] int  NOT NULL ,
    [Nome_Departamento] varchar  NOT NULL ,
    CONSTRAINT[PK_Departamento] PRIMARY KEY CLUSTERED (
        [ID_Departamento] ASC
    )
)

CREATE TABLE[Funcionario] (
    [ID_Funcionario] int NOT NULL ,
    [ID_Departamento] int  NOT NULL ,
    [CPF] varchar  NOT NULL ,
    [RG] varchar  NOT NULL ,
    [Matricula] int  NOT NULL ,
    [Telefone] int  NOT NULL ,
    [Email_Funcionario] varchar  NOT NULL ,
    [Cargo] varchar  NOT NULL ,
    [Banco] varchar  NOT NULL ,
    [Conta] int  NOT NULL ,
    [Agencia] int  NOT NULL ,
    [Data_Admissao] dateTime  NOT NULL ,
    [Genero] varchar  NOT NULL ,
    [Nome_Funcioanario] varchar  NOT NULL ,
    CONSTRAINT[PK_Funcionario] PRIMARY KEY CLUSTERED (
        [ID_Funcionario] ASC
    ),
    CONSTRAINT[UK_Funcionario_CPF] UNIQUE(
        [CPF]
    ),
    CONSTRAINT[UK_Funcionario_RG] UNIQUE(
        [RG]
    ),
    CONSTRAINT[UK_Funcionario_Matricula] UNIQUE(
        [Matricula]
    ),
    CONSTRAINT[UK_Funcionario_Telefone] UNIQUE(
        [Telefone]
    ),
    CONSTRAINT[UK_Funcionario_Email_Funcionario] UNIQUE(
        [Email_Funcionario]
    ),
    CONSTRAINT[UK_Funcionario_Conta] UNIQUE(
        [Conta]
    )
)

CREATE TABLE[Endereco_Funcionario] (
    [ID_Endereco_Funcionario] int NOT NULL ,
    [ID_Funcionario] int  NOT NULL ,
    [CEP_Funcionario] varchar  NOT NULL ,
    [Rua_Funcionario] varchar  NOT NULL ,
    [Numero_Endereco_Func] int  NOT NULL ,
    [Complemento_Endereco_Func] varchar  NOT NULL ,
    CONSTRAINT[PK_Endereco_Funcionario] PRIMARY KEY CLUSTERED (
        [ID_Endereco_Funcionario] ASC
    )
)

CREATE TABLE[Ferias] (
    [ID_Ferias] int NOT NULL ,
    [ID_Funcionario] int  NOT NULL ,
    [Data_Inicio] dateTime  NOT NULL ,
    [Data_Fim] dateTime  NOT NULL ,
    [Valor] decimal  NOT NULL ,
    [Tempo] dateTime  NOT NULL ,
    CONSTRAINT[PK_Ferias] PRIMARY KEY CLUSTERED (
        [ID_Ferias] ASC
    )
)

CREATE TABLE[Ponto] (
    [ID_Ponto] int NOT NULL ,
    [ID_Funcionario] int  NOT NULL ,
    [Dia] dateTime  NOT NULL ,
    [Atraso] dateTime  NOT NULL ,
    [Horario_Entrada] dateTime  NOT NULL ,
    [Horario_Saida] dateTime  NOT NULL ,
    [Horas_Trabalhada] dateTime  NOT NULL ,
    CONSTRAINT[PK_Ponto] PRIMARY KEY CLUSTERED (
        [ID_Ponto] ASC
    )
)

CREATE TABLE[Pagamento] (
    [ID_Pagamento] int NOT NULL ,
    [ID_Funcionario] int  NOT NULL ,
    [ID_Ponto] int  NOT NULL ,
    [INSS] varchar  NOT NULL ,
    [IRRF] varchar  NOT NULL ,
    [Salario] decimal  NOT NULL ,
    [Data_Pagamento] dateTime  NOT NULL ,
    [Hora_Extra] dateTime  NOT NULL ,
    [Adicional_Noturno] dateTime  NOT NULL ,
    CONSTRAINT[PK_Pagamento] PRIMARY KEY CLUSTERED (
        [ID_Pagamento] ASC
    )
)

CREATE TABLE[Beneficio] (
    [ID_Beneficio] int NOT NULL ,
    [ID_Funcionario] int  NOT NULL ,
    [VR] decimal  NOT NULL ,
    [VA] decimal  NOT NULL ,
    [VT] decimal  NOT NULL ,
    CONSTRAINT[PK_Beneficio] PRIMARY KEY CLUSTERED (
        [ID_Beneficio] ASC
    )
)

ALTER TABLE[Empresa] WITH CHECK ADD CONSTRAINT [FK_Empresa_ID_Endereco_Empresa] FOREIGN KEY([ID_Endereco_Empresa])
REFERENCES[Endereco_Empresa]([ID_Endereco_Empresa])

ALTER TABLE[Empresa] CHECK CONSTRAINT [FK_Empresa_ID_Endereco_Empresa]

ALTER TABLE[Departamento] WITH CHECK ADD CONSTRAINT [FK_Departamento_ID_Empresa] FOREIGN KEY([ID_Empresa])
REFERENCES[Empresa]([ID_Empresa])

ALTER TABLE[Departamento] CHECK CONSTRAINT [FK_Departamento_ID_Empresa]

ALTER TABLE[Funcionario] WITH CHECK ADD CONSTRAINT [FK_Funcionario_ID_Departamento] FOREIGN KEY([ID_Departamento])
REFERENCES[Departamento]([ID_Departamento])

ALTER TABLE[Funcionario] CHECK CONSTRAINT [FK_Funcionario_ID_Departamento]

ALTER TABLE[Endereco_Funcionario] WITH CHECK ADD CONSTRAINT [FK_Endereco_Funcionario_ID_Funcionario] FOREIGN KEY([ID_Funcionario])
REFERENCES[Funcionario]([ID_Funcionario])

ALTER TABLE[Endereco_Funcionario] CHECK CONSTRAINT [FK_Endereco_Funcionario_ID_Funcionario]

ALTER TABLE[Ferias] WITH CHECK ADD CONSTRAINT [FK_Ferias_ID_Funcionario] FOREIGN KEY([ID_Funcionario])
REFERENCES[Funcionario]([ID_Funcionario])

ALTER TABLE[Ferias] CHECK CONSTRAINT [FK_Ferias_ID_Funcionario]

ALTER TABLE[Ponto] WITH CHECK ADD CONSTRAINT [FK_Ponto_ID_Funcionario] FOREIGN KEY([ID_Funcionario])
REFERENCES[Funcionario]([ID_Funcionario])

ALTER TABLE[Ponto] CHECK CONSTRAINT [FK_Ponto_ID_Funcionario]

ALTER TABLE[Pagamento] WITH CHECK ADD CONSTRAINT [FK_Pagamento_ID_Funcionario] FOREIGN KEY([ID_Funcionario])
REFERENCES[Funcionario]([ID_Funcionario])

ALTER TABLE[Pagamento] CHECK CONSTRAINT [FK_Pagamento_ID_Funcionario]

ALTER TABLE[Pagamento] WITH CHECK ADD CONSTRAINT [FK_Pagamento_ID_Ponto] FOREIGN KEY([ID_Ponto])
REFERENCES[Ponto]([ID_Ponto])

ALTER TABLE[Pagamento] CHECK CONSTRAINT [FK_Pagamento_ID_Ponto]

ALTER TABLE[Beneficio] WITH CHECK ADD CONSTRAINT [FK_Beneficio_ID_Funcionario] FOREIGN KEY([ID_Funcionario])
REFERENCES[Funcionario]([ID_Funcionario])

ALTER TABLE[Beneficio] CHECK CONSTRAINT [FK_Beneficio_ID_Funcionario]

COMMIT TRANSACTION QUICKDBD