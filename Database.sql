USE [master]
GO
/****** Object:  Database [TheSystem]    Script Date: 01/12/2019 10:33:56 ******/
CREATE DATABASE [TheSystem]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TheSystem', FILENAME = N'C:\Users\Eduardo\Desktop\TheSystem.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TheSystem_log', FILENAME = N'C:\Users\Eduardo\Desktop\TheSystem_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TheSystem] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TheSystem].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TheSystem] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TheSystem] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TheSystem] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TheSystem] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TheSystem] SET ARITHABORT OFF 
GO
ALTER DATABASE [TheSystem] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [TheSystem] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TheSystem] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TheSystem] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TheSystem] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TheSystem] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TheSystem] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TheSystem] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TheSystem] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TheSystem] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TheSystem] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TheSystem] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TheSystem] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TheSystem] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TheSystem] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TheSystem] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TheSystem] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TheSystem] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TheSystem] SET  MULTI_USER 
GO
ALTER DATABASE [TheSystem] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TheSystem] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TheSystem] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TheSystem] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TheSystem] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TheSystem] SET QUERY_STORE = OFF
GO
USE [TheSystem]
GO
/****** Object:  Table [dbo].[alugados]    Script Date: 01/12/2019 10:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[alugados](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[codigo_carro] [int] NOT NULL,
	[Placa_Veiculo] [nvarchar](150) NOT NULL,
	[Codigo_funcionario] [int] NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
	[Km_Inicial] [nvarchar](150) NOT NULL,
	[Km_Entregue] [nvarchar](150) NULL,
	[status] [nvarchar](150) NOT NULL,
	[cnpj] [nvarchar](150) NOT NULL,
	[Alugado_em] [datetime] NOT NULL,
	[Devolvido_em] [datetime] NULL,
 CONSTRAINT [PK_alugados] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[empresas]    Script Date: 01/12/2019 10:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[empresas](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Razao] [nvarchar](150) NOT NULL,
	[Fantasia] [nvarchar](150) NOT NULL,
	[CNPJ] [nvarchar](150) NOT NULL,
	[Telefone1] [nvarchar](150) NOT NULL,
	[Telefone2] [nvarchar](150) NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Website] [nvarchar](150) NULL,
	[Filial] [nvarchar](150) NULL,
	[Filial_Numero] [nvarchar](150) NULL,
	[CNPJ_Sede] [nvarchar](150) NULL,
	[Rua] [nvarchar](150) NOT NULL,
	[Bairro] [nvarchar](150) NOT NULL,
	[Cidade] [nvarchar](150) NOT NULL,
	[Estado] [nvarchar](150) NOT NULL,
	[Numero] [nvarchar](150) NOT NULL,
	[CEP] [nvarchar](150) NOT NULL,
	[Adicionado_em] [datetime] NOT NULL,
 CONSTRAINT [PK_empresas] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CNPJ] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[funcionarios]    Script Date: 01/12/2019 10:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[funcionarios](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
	[Cargo] [nvarchar](150) NOT NULL,
	[CPF] [nvarchar](150) NOT NULL,
	[CHN] [nvarchar](150) NOT NULL,
	[Telefone] [nvarchar](150) NULL,
	[Rua] [nvarchar](150) NOT NULL,
	[Bairro] [nvarchar](150) NOT NULL,
	[Cidade] [nvarchar](150) NOT NULL,
	[Estado] [nvarchar](150) NOT NULL,
	[Numero_da_casa] [nvarchar](150) NOT NULL,
	[Numero_Cracha] [nvarchar](150) NOT NULL,
	[CNPJ_Empresa] [nvarchar](150) NOT NULL,
	[Adicionado_em] [datetime] NOT NULL,
 CONSTRAINT [PK_funcionarios] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[Numero_Cracha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CPF] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[CHN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[logins]    Script Date: 01/12/2019 10:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[logins](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[User] [nvarchar](150) NOT NULL,
	[Password] [nvarchar](150) NOT NULL,
	[AcessLevel] [int] NOT NULL,
 CONSTRAINT [PK_logins] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[manutencao]    Script Date: 01/12/2019 10:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[manutencao](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodigoCarro] [int] NOT NULL,
	[Modelo] [nvarchar](150) NOT NULL,
	[Marca] [nvarchar](150) NOT NULL,
	[Ano] [nvarchar](150) NOT NULL,
	[Placa_Veiculo] [nvarchar](150) NOT NULL,
	[Km_Atual] [nvarchar](150) NOT NULL,
	[empresa] [nvarchar](150) NOT NULL,
	[cnpj] [nvarchar](150) NOT NULL,
	[Status] [nvarchar](150) NOT NULL,
	[Custo] [float] NOT NULL,
	[Descricao] [nvarchar](300) NOT NULL,
	[Data_Manutencao] [datetime] NOT NULL,
	[Data_Devolvido] [datetime] NULL,
 CONSTRAINT [PK_manutencao] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recibos]    Script Date: 01/12/2019 10:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recibos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Cod_Funcionario] [int] NULL,
	[Nome_Funcionario] [nvarchar](150) NULL,
	[CNPJ] [nvarchar](150) NOT NULL,
	[Razao] [nvarchar](150) NOT NULL,
	[Descricao] [nvarchar](150) NOT NULL,
	[CodigoManutencao] [int] NULL,
	[Valor] [float] NOT NULL,
	[data] [datetime] NOT NULL,
 CONSTRAINT [PK_recibos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[veiculos]    Script Date: 01/12/2019 10:33:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[veiculos](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Modelo] [nvarchar](150) NOT NULL,
	[Marca] [nvarchar](150) NOT NULL,
	[Ano] [nvarchar](150) NOT NULL,
	[Placa_Veiculo] [nvarchar](150) NOT NULL,
	[Numero_chassi] [nvarchar](150) NOT NULL,
	[Km_Inicial] [nvarchar](150) NOT NULL,
	[Km_Atual] [nvarchar](150) NOT NULL,
	[empresa] [nvarchar](150) NOT NULL,
	[cnpj] [nvarchar](150) NOT NULL,
	[Status] [nvarchar](150) NOT NULL,
	[Adicionado_em] [datetime] NOT NULL,
 CONSTRAINT [PK_veiculos] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [TheSystem] SET  READ_WRITE 
GO
