USE [master]
GO
/****** Object:  Database [DBSMP]    Script Date: 25/04/2017 17:28:58 ******/
CREATE DATABASE [DBSMP]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DBSMP', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DBSMP.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DBSMP_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\DBSMP_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DBSMP].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DBSMP] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DBSMP] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DBSMP] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DBSMP] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DBSMP] SET ARITHABORT OFF 
GO
ALTER DATABASE [DBSMP] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DBSMP] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DBSMP] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DBSMP] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DBSMP] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DBSMP] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DBSMP] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DBSMP] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DBSMP] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DBSMP] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DBSMP] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DBSMP] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DBSMP] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DBSMP] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DBSMP] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DBSMP] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DBSMP] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DBSMP] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DBSMP] SET RECOVERY FULL 
GO
ALTER DATABASE [DBSMP] SET  MULTI_USER 
GO
ALTER DATABASE [DBSMP] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DBSMP] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DBSMP] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DBSMP] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'DBSMP', N'ON'
GO
USE [DBSMP]
GO
/****** Object:  StoredProcedure [dbo].[sp_ListaDepartamento]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOhan
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ListaDepartamento]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT distinct departamento from ubigeo
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ListaDistrito]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOhan
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ListaDistrito]
@provincia varchar(70)
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select distrito from ubigeo where provincia=@provincia and distrito is not null
END

GO
/****** Object:  StoredProcedure [dbo].[sp_ListaProvincia]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		JOhan
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[sp_ListaProvincia]
@departamento varchar(70)
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	select provincia from ubigeo where departamento=@departamento and provincia is not null
END

GO
/****** Object:  Table [dbo].[brecha]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[brecha](
	[id_brecha] [int] NOT NULL,
	[desc_brecha] [varchar](100) NULL,
	[nombre_brecha] [varchar](50) NULL,
 CONSTRAINT [pk_brecha] PRIMARY KEY CLUSTERED 
(
	[id_brecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[brecha_indicador]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[brecha_indicador](
	[id_indicador] [int] NULL,
	[id_serv_pub_asoc] [int] NULL,
	[id_brecha] [int] NULL,
	[fecha_indicador] [date] NULL,
	[valor_indicador] [varchar](100) NULL,
	[linea_base_indicador] [varchar](10) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cartera_inversion]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cartera_inversion](
	[id_cartera] [int] IDENTITY(1,1) NOT NULL,
	[codigo_inversion] [varchar](50) NULL,
	[ano_apertura] [date] NULL,
 CONSTRAINT [pk_cartera_inversion] PRIMARY KEY CLUSTERED 
(
	[id_cartera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[division_funcional]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[division_funcional](
	[id_division_funcional] [int] IDENTITY(1,1) NOT NULL,
	[id_division_funcion_desc][varchar](50) NULL,
	[id_funcion] [int] NULL,
	[descripcion] [varchar](200) NULL,
 CONSTRAINT [pk_division_funcional] PRIMARY KEY CLUSTERED 
(
	[id_division_funcional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[entidad]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[entidad](
	[id_entidad] [int] IDENTITY(1,1) NOT NULL,
	[id_sector] [int] NULL,
	[denominacion_entidad] [varchar](100) NULL,
	[nombre_entidad] [varchar](100) NULL,
 CONSTRAINT [pk_entidad] PRIMARY KEY CLUSTERED 
(
	[id_entidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estado_ciclo_inversion]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[estado_ciclo_inversion](
	[id_estado_ciclo] [int] IDENTITY(1,1) NOT NULL,
	[nombre_estado] [varchar](200) NULL,
	[descripcion_estado] [varchar](200) NULL,
 CONSTRAINT [pk_estado_ciclo_inversion] PRIMARY KEY CLUSTERED 
(
	[id_estado_ciclo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[fuente_financiamiento]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[fuente_financiamiento](
	[id_fuente_financiamiento] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_fuente_finan] [varchar](100) NULL,
 CONSTRAINT [pk_fuente_financiamiento] PRIMARY KEY CLUSTERED 
(
	[id_fuente_financiamiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[fuente_financiamiento_pi]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fuente_financiamiento_pi](
	[id_fuente_financiamiento_pi] [int] IDENTITY(1,1) NOT NULL,
	[id_fuente_financiamiento] [int] NULL,
	[id_proyecto_inversion] [int] NULL,
	[fecha_fuente_financiamiento] [date] NULL,
 CONSTRAINT [pk_fuente_financiamiento_pi] PRIMARY KEY CLUSTERED 
(
	[id_fuente_financiamiento_pi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[funcion]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[funcion](
	[id_funcion] [int] IDENTITY(1,1) NOT NULL,
	[id_funcion_desc][varchar](50) NULL,
	[descripcion_funcion] [varchar](200) NULL,
 CONSTRAINT [pk_funcion] PRIMARY KEY CLUSTERED 
(
	[id_funcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[grupo_funcional]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[grupo_funcional](
	[id_grupo_funcional] [int] IDENTITY(1,1) NOT NULL,
	[id_division_funcional] [int] NULL,
	[id_grupo_funcion_desc][varchar](50) NULL,
	[id_sector] [int] NULL,
	[descripcion] [varchar](200) NULL,
 CONSTRAINT [pk_grupo_funcional] PRIMARY KEY CLUSTERED 
(
	[id_grupo_funcional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[indicador]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[indicador](
	[id_indicador] [int] IDENTITY(1,1) NOT NULL,
	[nombre_indicador] [varchar](100) NULL,
	[definicion_indicador] [varchar](100) NULL,
	[unidad_medida_indicador] [varchar](50) NULL,
 CONSTRAINT [pk_indicador] PRIMARY KEY CLUSTERED 
(
	[id_indicador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[modalidad_ejecucion]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[modalidad_ejecucion](
	[id_modalidad_ejec] [int] IDENTITY(1,1) NOT NULL,
	[desc_modalidad_ejec] [varchar](100) NULL,
 CONSTRAINT [pk_modalidad_ejecucion] PRIMARY KEY CLUSTERED 
(
	[id_modalidad_ejec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[modalidad_ejecucion_pi]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modalidad_ejecucion_pi](
	[id_modalidad_ejec_pi] [int] IDENTITY(1,1) NOT NULL,
	[id_modalidad_ejec] [int] NULL,
	[id_proyecto_inversion] [int] NULL,
	[fecha_modalidad_ejec_pi] [date] NULL,
 CONSTRAINT [pk_modalidad_ejecucion_pi] PRIMARY KEY CLUSTERED 
(
	[id_modalidad_ejec_pi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[naturalesa_inversion]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[naturalesa_inversion](
	[id_naturalesa_inversion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_naturalesa] [varchar](200) NULL,
 CONSTRAINT [pk_naturalesa_inversion] PRIMARY KEY CLUSTERED 
(
	[id_naturalesa_inversion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[nivel_gobierno]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nivel_gobierno](
	[id_nivel_gobierno] [int] IDENTITY(1,1) NOT NULL,
	[desc_nivel_gob] [varchar](100) NULL,
 CONSTRAINT [pk_nivel_gobierno] PRIMARY KEY CLUSTERED 
(
	[id_nivel_gobierno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[programacion]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[programacion](
	[id_cartera] [int] NULL,
	[id_proyecto_inversion] [int] NULL,
	[id_brecha] [int] NULL,
	[monto_programado] [decimal](16, 2) NULL,
	[ano_programado] [date] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[proyecto_inversion]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[proyecto_inversion](
	[id_proyecto_inversion] [int] IDENTITY(1,1) NOT NULL,
	[id_rubro_ejecucion] [int] NULL,
	[id_ue] [int] NULL,
	[id_naturalesa_inversion] [int] NULL,
	[id_tipologia_inversion] [int] NULL,
	[id_estado_ciclo] [int] NULL,
	[id_tipo_inversion] [int] NULL,
	[id_grupo_funcional] [int] NULL,
	[id_nivel_gobierno] [int] NULL,
	[codigo_unico_pi] [varchar](50) NULL,
	[estado_tipo_pi] [varchar](50) NULL,
	[nombre_pi] [varchar](50) NULL,
	[costo_pi] [decimal](16, 2) NULL,
	[devengado_ac_pi] [decimal](16, 2) NULL,
	[fecha_inicio_for_eva] [date] NULL,
	[fecha_fin_for_ev] [date] NULL,
	[fecha_inicio_ejec] [date] NULL,
	[fecha_fin_ejec] [date] NULL,
 CONSTRAINT [pk_proyecto_inversion] PRIMARY KEY CLUSTERED 
(
	[id_proyecto_inversion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[proyecto_ubigeo]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[proyecto_ubigeo](
	[id_ubigeo] [varchar](6) NULL,
	[id_proyecto_inversion] [int] NULL,
	[descripcion_pro_ubi] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[rubro_ejecucion]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[rubro_ejecucion](
	[id_rubro_ejecucion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_rubro] [varchar](200) NULL,
 CONSTRAINT [pk_rubro_ejecucion] PRIMARY KEY CLUSTERED 
(
	[id_rubro_ejecucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sector]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[sector](
	[id_sector] [int] IDENTITY(1,1) NOT NULL,
	[nombre_sector] [varchar](100) NULL,
 CONSTRAINT [pk_sector] PRIMARY KEY CLUSTERED 
(
	[id_sector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[serv_pub_asoc]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[serv_pub_asoc](
	[id_serv_pub_asoc] [int] IDENTITY(1,1) NOT NULL,
	[nombre_serv_pub_asoc] [varchar](50) NULL,
 CONSTRAINT [pk_serv_pub_asoc] PRIMARY KEY CLUSTERED 
(
	[id_serv_pub_asoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipo_inversion]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipo_inversion](
	[id_tipo_inversion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_tipo_inversion] [varchar](200) NULL,
 CONSTRAINT [pk_tipo_inversion] PRIMARY KEY CLUSTERED 
(
	[id_tipo_inversion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tipologia_inversion]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tipologia_inversion](
	[id_tipologia_inversion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion_tipologia] [varchar](200) NULL,
 CONSTRAINT [pk_tipologia_inversion] PRIMARY KEY CLUSTERED 
(
	[id_tipologia_inversion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ubigeo]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ubigeo](
	[id_ubigeo] [varchar](6) NOT NULL,
	[departamento] [varchar](70) NULL,
	[provincia] [varchar](70) NULL,
	[distrito] [varchar](70) NULL,
 CONSTRAINT [pk_ubigeo] PRIMARY KEY CLUSTERED 
(
	[id_ubigeo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[unidad_ejecutora]    Script Date: 25/04/2017 17:28:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[unidad_ejecutora](
	[id_ue] [int] IDENTITY(1,1) NOT NULL,
	[nombre_ue] [varchar](200) NULL,
 CONSTRAINT [pk_unidad_ejecutora] PRIMARY KEY CLUSTERED 
(
	[id_ue] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010000', N'Amazonas', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010100', N'Amazonas', N'Chachapoyas', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010101', N'Amazonas', N'Chachapoyas', N'Chachapoyas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010102', N'Amazonas', N'Chachapoyas', N'Asunción')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010103', N'Amazonas', N'Chachapoyas', N'Balsas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010104', N'Amazonas', N'Chachapoyas', N'Cheto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010105', N'Amazonas', N'Chachapoyas', N'Chiliquin')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010106', N'Amazonas', N'Chachapoyas', N'Chuquibamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010107', N'Amazonas', N'Chachapoyas', N'Granada')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010108', N'Amazonas', N'Chachapoyas', N'Huancas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010109', N'Amazonas', N'Chachapoyas', N'La Jalca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010110', N'Amazonas', N'Chachapoyas', N'Leimebamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010111', N'Amazonas', N'Chachapoyas', N'Levanto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010112', N'Amazonas', N'Chachapoyas', N'Magdalena')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010113', N'Amazonas', N'Chachapoyas', N'Mariscal Castilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010114', N'Amazonas', N'Chachapoyas', N'Molinopampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010115', N'Amazonas', N'Chachapoyas', N'Montevideo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010116', N'Amazonas', N'Chachapoyas', N'Olleros')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010117', N'Amazonas', N'Chachapoyas', N'Quinjalca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010118', N'Amazonas', N'Chachapoyas', N'San Francisco de Daguas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010119', N'Amazonas', N'Chachapoyas', N'San Isidro de Maino')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010120', N'Amazonas', N'Chachapoyas', N'Soloco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010121', N'Amazonas', N'Chachapoyas', N'Sonche')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010200', N'Amazonas', N'Bagua', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010201', N'Amazonas', N'Bagua', N'Bagua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010202', N'Amazonas', N'Bagua', N'Aramango')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010203', N'Amazonas', N'Bagua', N'Copallin')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010204', N'Amazonas', N'Bagua', N'El Parco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010205', N'Amazonas', N'Bagua', N'Imaza')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010206', N'Amazonas', N'Bagua', N'La Peca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010300', N'Amazonas', N'Bongará', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010301', N'Amazonas', N'Bongará', N'Jumbilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010302', N'Amazonas', N'Bongará', N'Chisquilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010303', N'Amazonas', N'Bongará', N'Churuja')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010304', N'Amazonas', N'Bongará', N'Corosha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010305', N'Amazonas', N'Bongará', N'Cuispes')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010306', N'Amazonas', N'Bongará', N'Florida')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010307', N'Amazonas', N'Bongará', N'Jazan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010308', N'Amazonas', N'Bongará', N'Recta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010309', N'Amazonas', N'Bongará', N'San Carlos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010310', N'Amazonas', N'Bongará', N'Shipasbamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010311', N'Amazonas', N'Bongará', N'Valera')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010312', N'Amazonas', N'Bongará', N'Yambrasbamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010400', N'Amazonas', N'Condorcanqui', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010401', N'Amazonas', N'Condorcanqui', N'Nieva')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010402', N'Amazonas', N'Condorcanqui', N'El Cenepa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010403', N'Amazonas', N'Condorcanqui', N'Río Santiago')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010500', N'Amazonas', N'Luya', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010501', N'Amazonas', N'Luya', N'Lamud')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010502', N'Amazonas', N'Luya', N'Camporredondo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010503', N'Amazonas', N'Luya', N'Cocabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010504', N'Amazonas', N'Luya', N'Colcamar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010505', N'Amazonas', N'Luya', N'Conila')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010506', N'Amazonas', N'Luya', N'Inguilpata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010507', N'Amazonas', N'Luya', N'Longuita')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010508', N'Amazonas', N'Luya', N'Lonya Chico')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010509', N'Amazonas', N'Luya', N'Luya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010510', N'Amazonas', N'Luya', N'Luya Viejo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010511', N'Amazonas', N'Luya', N'María')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010512', N'Amazonas', N'Luya', N'Ocalli')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010513', N'Amazonas', N'Luya', N'Ocumal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010514', N'Amazonas', N'Luya', N'Pisuquia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010515', N'Amazonas', N'Luya', N'Providencia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010516', N'Amazonas', N'Luya', N'San Cristóbal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010517', N'Amazonas', N'Luya', N'San Francisco de Yeso')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010518', N'Amazonas', N'Luya', N'San Jerónimo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010519', N'Amazonas', N'Luya', N'San Juan de Lopecancha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010520', N'Amazonas', N'Luya', N'Santa Catalina')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010521', N'Amazonas', N'Luya', N'Santo Tomas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010522', N'Amazonas', N'Luya', N'Tingo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010523', N'Amazonas', N'Luya', N'Trita')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010600', N'Amazonas', N'Rodríguez de Mendoza', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010601', N'Amazonas', N'Rodríguez de Mendoza', N'San Nicolás')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010602', N'Amazonas', N'Rodríguez de Mendoza', N'Chirimoto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010603', N'Amazonas', N'Rodríguez de Mendoza', N'Cochamal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010604', N'Amazonas', N'Rodríguez de Mendoza', N'Huambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010605', N'Amazonas', N'Rodríguez de Mendoza', N'Limabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010606', N'Amazonas', N'Rodríguez de Mendoza', N'Longar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010607', N'Amazonas', N'Rodríguez de Mendoza', N'Mariscal Benavides')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010608', N'Amazonas', N'Rodríguez de Mendoza', N'Milpuc')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010609', N'Amazonas', N'Rodríguez de Mendoza', N'Omia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010610', N'Amazonas', N'Rodríguez de Mendoza', N'Santa Rosa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010611', N'Amazonas', N'Rodríguez de Mendoza', N'Totora')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010612', N'Amazonas', N'Rodríguez de Mendoza', N'Vista Alegre')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010700', N'Amazonas', N'Utcubamba', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010701', N'Amazonas', N'Utcubamba', N'Bagua Grande')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010702', N'Amazonas', N'Utcubamba', N'Cajaruro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010703', N'Amazonas', N'Utcubamba', N'Cumba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010704', N'Amazonas', N'Utcubamba', N'El Milagro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010705', N'Amazonas', N'Utcubamba', N'Jamalca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010706', N'Amazonas', N'Utcubamba', N'Lonya Grande')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'010707', N'Amazonas', N'Utcubamba', N'Yamon')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020000', N'Áncash', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020100', N'Áncash', N'Huaraz', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020101', N'Áncash', N'Huaraz', N'Huaraz')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020102', N'Áncash', N'Huaraz', N'Cochabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020103', N'Áncash', N'Huaraz', N'Colcabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020104', N'Áncash', N'Huaraz', N'Huanchay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020105', N'Áncash', N'Huaraz', N'Independencia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020106', N'Áncash', N'Huaraz', N'Jangas')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020107', N'Áncash', N'Huaraz', N'La Libertad')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020108', N'Áncash', N'Huaraz', N'Olleros')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020109', N'Áncash', N'Huaraz', N'Pampas Grande')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020110', N'Áncash', N'Huaraz', N'Pariacoto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020111', N'Áncash', N'Huaraz', N'Pira')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020112', N'Áncash', N'Huaraz', N'Tarica')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020200', N'Áncash', N'Aija', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020201', N'Áncash', N'Aija', N'Aija')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020202', N'Áncash', N'Aija', N'Coris')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020203', N'Áncash', N'Aija', N'Huacllan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020204', N'Áncash', N'Aija', N'La Merced')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020205', N'Áncash', N'Aija', N'Succha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020300', N'Áncash', N'Antonio Raymondi', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020301', N'Áncash', N'Antonio Raymondi', N'Llamellin')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020302', N'Áncash', N'Antonio Raymondi', N'Aczo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020303', N'Áncash', N'Antonio Raymondi', N'Chaccho')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020304', N'Áncash', N'Antonio Raymondi', N'Chingas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020305', N'Áncash', N'Antonio Raymondi', N'Mirgas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020306', N'Áncash', N'Antonio Raymondi', N'San Juan de Rontoy')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020400', N'Áncash', N'Asunción', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020401', N'Áncash', N'Asunción', N'Chacas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020402', N'Áncash', N'Asunción', N'Acochaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020500', N'Áncash', N'Bolognesi', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020501', N'Áncash', N'Bolognesi', N'Chiquian')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020502', N'Áncash', N'Bolognesi', N'Abelardo Pardo Lezameta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020503', N'Áncash', N'Bolognesi', N'Antonio Raymondi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020504', N'Áncash', N'Bolognesi', N'Aquia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020505', N'Áncash', N'Bolognesi', N'Cajacay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020506', N'Áncash', N'Bolognesi', N'Canis')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020507', N'Áncash', N'Bolognesi', N'Colquioc')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020508', N'Áncash', N'Bolognesi', N'Huallanca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020509', N'Áncash', N'Bolognesi', N'Huasta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020510', N'Áncash', N'Bolognesi', N'Huayllacayan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020511', N'Áncash', N'Bolognesi', N'La Primavera')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020512', N'Áncash', N'Bolognesi', N'Mangas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020513', N'Áncash', N'Bolognesi', N'Pacllon')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020514', N'Áncash', N'Bolognesi', N'San Miguel de Corpanqui')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020515', N'Áncash', N'Bolognesi', N'Ticllos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020600', N'Áncash', N'Carhuaz', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020601', N'Áncash', N'Carhuaz', N'Carhuaz')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020602', N'Áncash', N'Carhuaz', N'Acopampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020603', N'Áncash', N'Carhuaz', N'Amashca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020604', N'Áncash', N'Carhuaz', N'Anta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020605', N'Áncash', N'Carhuaz', N'Ataquero')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020606', N'Áncash', N'Carhuaz', N'Marcara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020607', N'Áncash', N'Carhuaz', N'Pariahuanca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020608', N'Áncash', N'Carhuaz', N'San Miguel de Aco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020609', N'Áncash', N'Carhuaz', N'Shilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020610', N'Áncash', N'Carhuaz', N'Tinco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020611', N'Áncash', N'Carhuaz', N'Yungar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020700', N'Áncash', N'Carlos Fermín Fitzcarrald', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020701', N'Áncash', N'Carlos Fermín Fitzcarrald', N'San Luis')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020702', N'Áncash', N'Carlos Fermín Fitzcarrald', N'San Nicolás')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020703', N'Áncash', N'Carlos Fermín Fitzcarrald', N'Yauya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020800', N'Áncash', N'Casma', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020801', N'Áncash', N'Casma', N'Casma')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020802', N'Áncash', N'Casma', N'Buena Vista Alta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020803', N'Áncash', N'Casma', N'Comandante Noel')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020804', N'Áncash', N'Casma', N'Yautan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020900', N'Áncash', N'Corongo', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020901', N'Áncash', N'Corongo', N'Corongo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020902', N'Áncash', N'Corongo', N'Aco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020903', N'Áncash', N'Corongo', N'Bambas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020904', N'Áncash', N'Corongo', N'Cusca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020905', N'Áncash', N'Corongo', N'La Pampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020906', N'Áncash', N'Corongo', N'Yanac')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'020907', N'Áncash', N'Corongo', N'Yupan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021000', N'Áncash', N'Huari', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021001', N'Áncash', N'Huari', N'Huari')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021002', N'Áncash', N'Huari', N'Anra')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021003', N'Áncash', N'Huari', N'Cajay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021004', N'Áncash', N'Huari', N'Chavin de Huantar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021005', N'Áncash', N'Huari', N'Huacachi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021006', N'Áncash', N'Huari', N'Huacchis')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021007', N'Áncash', N'Huari', N'Huachis')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021008', N'Áncash', N'Huari', N'Huantar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021009', N'Áncash', N'Huari', N'Masin')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021010', N'Áncash', N'Huari', N'Paucas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021011', N'Áncash', N'Huari', N'Ponto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021012', N'Áncash', N'Huari', N'Rahuapampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021013', N'Áncash', N'Huari', N'Rapayan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021014', N'Áncash', N'Huari', N'San Marcos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021015', N'Áncash', N'Huari', N'San Pedro de Chana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021016', N'Áncash', N'Huari', N'Uco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021100', N'Áncash', N'Huarmey', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021101', N'Áncash', N'Huarmey', N'Huarmey')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021102', N'Áncash', N'Huarmey', N'Cochapeti')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021103', N'Áncash', N'Huarmey', N'Culebras')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021104', N'Áncash', N'Huarmey', N'Huayan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021105', N'Áncash', N'Huarmey', N'Malvas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021200', N'Áncash', N'Huaylas', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021201', N'Áncash', N'Huaylas', N'Caraz')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021202', N'Áncash', N'Huaylas', N'Huallanca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021203', N'Áncash', N'Huaylas', N'Huata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021204', N'Áncash', N'Huaylas', N'Huaylas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021205', N'Áncash', N'Huaylas', N'Mato')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021206', N'Áncash', N'Huaylas', N'Pamparomas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021207', N'Áncash', N'Huaylas', N'Pueblo Libre')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021208', N'Áncash', N'Huaylas', N'Santa Cruz')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021209', N'Áncash', N'Huaylas', N'Santo Toribio')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021210', N'Áncash', N'Huaylas', N'Yuracmarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021300', N'Áncash', N'Mariscal Luzuriaga', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021301', N'Áncash', N'Mariscal Luzuriaga', N'Piscobamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021302', N'Áncash', N'Mariscal Luzuriaga', N'Casca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021303', N'Áncash', N'Mariscal Luzuriaga', N'Eleazar Guzmán Barron')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021304', N'Áncash', N'Mariscal Luzuriaga', N'Fidel Olivas Escudero')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021305', N'Áncash', N'Mariscal Luzuriaga', N'Llama')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021306', N'Áncash', N'Mariscal Luzuriaga', N'Llumpa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021307', N'Áncash', N'Mariscal Luzuriaga', N'Lucma')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021308', N'Áncash', N'Mariscal Luzuriaga', N'Musga')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021400', N'Áncash', N'Ocros', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021401', N'Áncash', N'Ocros', N'Ocros')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021402', N'Áncash', N'Ocros', N'Acas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021403', N'Áncash', N'Ocros', N'Cajamarquilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021404', N'Áncash', N'Ocros', N'Carhuapampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021405', N'Áncash', N'Ocros', N'Cochas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021406', N'Áncash', N'Ocros', N'Congas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021407', N'Áncash', N'Ocros', N'Llipa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021408', N'Áncash', N'Ocros', N'San Cristóbal de Rajan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021409', N'Áncash', N'Ocros', N'San Pedro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021410', N'Áncash', N'Ocros', N'Santiago de Chilcas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021500', N'Áncash', N'Pallasca', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021501', N'Áncash', N'Pallasca', N'Cabana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021502', N'Áncash', N'Pallasca', N'Bolognesi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021503', N'Áncash', N'Pallasca', N'Conchucos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021504', N'Áncash', N'Pallasca', N'Huacaschuque')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021505', N'Áncash', N'Pallasca', N'Huandoval')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021506', N'Áncash', N'Pallasca', N'Lacabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021507', N'Áncash', N'Pallasca', N'Llapo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021508', N'Áncash', N'Pallasca', N'Pallasca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021509', N'Áncash', N'Pallasca', N'Pampas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021510', N'Áncash', N'Pallasca', N'Santa Rosa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021511', N'Áncash', N'Pallasca', N'Tauca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021600', N'Áncash', N'Pomabamba', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021601', N'Áncash', N'Pomabamba', N'Pomabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021602', N'Áncash', N'Pomabamba', N'Huayllan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021603', N'Áncash', N'Pomabamba', N'Parobamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021604', N'Áncash', N'Pomabamba', N'Quinuabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021700', N'Áncash', N'Recuay', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021701', N'Áncash', N'Recuay', N'Recuay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021702', N'Áncash', N'Recuay', N'Catac')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021703', N'Áncash', N'Recuay', N'Cotaparaco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021704', N'Áncash', N'Recuay', N'Huayllapampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021705', N'Áncash', N'Recuay', N'Llacllin')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021706', N'Áncash', N'Recuay', N'Marca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021707', N'Áncash', N'Recuay', N'Pampas Chico')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021708', N'Áncash', N'Recuay', N'Pararin')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021709', N'Áncash', N'Recuay', N'Tapacocha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021710', N'Áncash', N'Recuay', N'Ticapampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021800', N'Áncash', N'Santa', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021801', N'Áncash', N'Santa', N'Chimbote')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021802', N'Áncash', N'Santa', N'Cáceres del Perú')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021803', N'Áncash', N'Santa', N'Coishco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021804', N'Áncash', N'Santa', N'Macate')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021805', N'Áncash', N'Santa', N'Moro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021806', N'Áncash', N'Santa', N'Nepeña')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021807', N'Áncash', N'Santa', N'Samanco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021808', N'Áncash', N'Santa', N'Santa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021809', N'Áncash', N'Santa', N'Nuevo Chimbote')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021900', N'Áncash', N'Sihuas', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021901', N'Áncash', N'Sihuas', N'Sihuas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021902', N'Áncash', N'Sihuas', N'Acobamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021903', N'Áncash', N'Sihuas', N'Alfonso Ugarte')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021904', N'Áncash', N'Sihuas', N'Cashapampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021905', N'Áncash', N'Sihuas', N'Chingalpo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021906', N'Áncash', N'Sihuas', N'Huayllabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021907', N'Áncash', N'Sihuas', N'Quiches')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021908', N'Áncash', N'Sihuas', N'Ragash')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021909', N'Áncash', N'Sihuas', N'San Juan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'021910', N'Áncash', N'Sihuas', N'Sicsibamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'022000', N'Áncash', N'Yungay', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'022001', N'Áncash', N'Yungay', N'Yungay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'022002', N'Áncash', N'Yungay', N'Cascapara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'022003', N'Áncash', N'Yungay', N'Mancos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'022004', N'Áncash', N'Yungay', N'Matacoto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'022005', N'Áncash', N'Yungay', N'Quillo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'022006', N'Áncash', N'Yungay', N'Ranrahirca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'022007', N'Áncash', N'Yungay', N'Shupluy')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'022008', N'Áncash', N'Yungay', N'Yanama')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030000', N'Apurímac', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030100', N'Apurímac', N'Abancay', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030101', N'Apurímac', N'Abancay', N'Abancay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030102', N'Apurímac', N'Abancay', N'Chacoche')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030103', N'Apurímac', N'Abancay', N'Circa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030104', N'Apurímac', N'Abancay', N'Curahuasi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030105', N'Apurímac', N'Abancay', N'Huanipaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030106', N'Apurímac', N'Abancay', N'Lambrama')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030107', N'Apurímac', N'Abancay', N'Pichirhua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030108', N'Apurímac', N'Abancay', N'San Pedro de Cachora')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030109', N'Apurímac', N'Abancay', N'Tamburco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030200', N'Apurímac', N'Andahuaylas', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030201', N'Apurímac', N'Andahuaylas', N'Andahuaylas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030202', N'Apurímac', N'Andahuaylas', N'Andarapa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030203', N'Apurímac', N'Andahuaylas', N'Chiara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030204', N'Apurímac', N'Andahuaylas', N'Huancarama')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030205', N'Apurímac', N'Andahuaylas', N'Huancaray')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030206', N'Apurímac', N'Andahuaylas', N'Huayana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030207', N'Apurímac', N'Andahuaylas', N'Kishuara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030208', N'Apurímac', N'Andahuaylas', N'Pacobamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030209', N'Apurímac', N'Andahuaylas', N'Pacucha')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030210', N'Apurímac', N'Andahuaylas', N'Pampachiri')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030211', N'Apurímac', N'Andahuaylas', N'Pomacocha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030212', N'Apurímac', N'Andahuaylas', N'San Antonio de Cachi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030213', N'Apurímac', N'Andahuaylas', N'San Jerónimo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030214', N'Apurímac', N'Andahuaylas', N'San Miguel de Chaccrampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030215', N'Apurímac', N'Andahuaylas', N'Santa María de Chicmo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030216', N'Apurímac', N'Andahuaylas', N'Talavera')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030217', N'Apurímac', N'Andahuaylas', N'Tumay Huaraca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030218', N'Apurímac', N'Andahuaylas', N'Turpo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030219', N'Apurímac', N'Andahuaylas', N'Kaquiabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030220', N'Apurímac', N'Andahuaylas', N'José María Arguedas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030300', N'Apurímac', N'Antabamba', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030301', N'Apurímac', N'Antabamba', N'Antabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030302', N'Apurímac', N'Antabamba', N'El Oro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030303', N'Apurímac', N'Antabamba', N'Huaquirca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030304', N'Apurímac', N'Antabamba', N'Juan Espinoza Medrano')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030305', N'Apurímac', N'Antabamba', N'Oropesa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030306', N'Apurímac', N'Antabamba', N'Pachaconas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030307', N'Apurímac', N'Antabamba', N'Sabaino')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030400', N'Apurímac', N'Aymaraes', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030401', N'Apurímac', N'Aymaraes', N'Chalhuanca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030402', N'Apurímac', N'Aymaraes', N'Capaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030403', N'Apurímac', N'Aymaraes', N'Caraybamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030404', N'Apurímac', N'Aymaraes', N'Chapimarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030405', N'Apurímac', N'Aymaraes', N'Colcabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030406', N'Apurímac', N'Aymaraes', N'Cotaruse')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030407', N'Apurímac', N'Aymaraes', N'Huayllo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030408', N'Apurímac', N'Aymaraes', N'Justo Apu Sahuaraura')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030409', N'Apurímac', N'Aymaraes', N'Lucre')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030410', N'Apurímac', N'Aymaraes', N'Pocohuanca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030411', N'Apurímac', N'Aymaraes', N'San Juan de Chacña')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030412', N'Apurímac', N'Aymaraes', N'Sañayca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030413', N'Apurímac', N'Aymaraes', N'Soraya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030414', N'Apurímac', N'Aymaraes', N'Tapairihua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030415', N'Apurímac', N'Aymaraes', N'Tintay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030416', N'Apurímac', N'Aymaraes', N'Toraya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030417', N'Apurímac', N'Aymaraes', N'Yanaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030500', N'Apurímac', N'Cotabambas', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030501', N'Apurímac', N'Cotabambas', N'Tambobamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030502', N'Apurímac', N'Cotabambas', N'Cotabambas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030503', N'Apurímac', N'Cotabambas', N'Coyllurqui')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030504', N'Apurímac', N'Cotabambas', N'Haquira')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030505', N'Apurímac', N'Cotabambas', N'Mara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030506', N'Apurímac', N'Cotabambas', N'Challhuahuacho')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030600', N'Apurímac', N'Chincheros', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030601', N'Apurímac', N'Chincheros', N'Chincheros')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030602', N'Apurímac', N'Chincheros', N'Anco_Huallo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030603', N'Apurímac', N'Chincheros', N'Cocharcas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030604', N'Apurímac', N'Chincheros', N'Huaccana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030605', N'Apurímac', N'Chincheros', N'Ocobamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030606', N'Apurímac', N'Chincheros', N'Ongoy')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030607', N'Apurímac', N'Chincheros', N'Uranmarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030608', N'Apurímac', N'Chincheros', N'Ranracancha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030700', N'Apurímac', N'Grau', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030701', N'Apurímac', N'Grau', N'Chuquibambilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030702', N'Apurímac', N'Grau', N'Curpahuasi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030703', N'Apurímac', N'Grau', N'Gamarra')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030704', N'Apurímac', N'Grau', N'Huayllati')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030705', N'Apurímac', N'Grau', N'Mamara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030706', N'Apurímac', N'Grau', N'Micaela Bastidas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030707', N'Apurímac', N'Grau', N'Pataypampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030708', N'Apurímac', N'Grau', N'Progreso')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030709', N'Apurímac', N'Grau', N'San Antonio')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030710', N'Apurímac', N'Grau', N'Santa Rosa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030711', N'Apurímac', N'Grau', N'Turpay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030712', N'Apurímac', N'Grau', N'Vilcabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030713', N'Apurímac', N'Grau', N'Virundo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'030714', N'Apurímac', N'Grau', N'Curasco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040000', N'Arequipa', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040100', N'Arequipa', N'Arequipa', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040101', N'Arequipa', N'Arequipa', N'Arequipa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040102', N'Arequipa', N'Arequipa', N'Alto Selva Alegre')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040103', N'Arequipa', N'Arequipa', N'Cayma')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040104', N'Arequipa', N'Arequipa', N'Cerro Colorado')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040105', N'Arequipa', N'Arequipa', N'Characato')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040106', N'Arequipa', N'Arequipa', N'Chiguata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040107', N'Arequipa', N'Arequipa', N'Jacobo Hunter')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040108', N'Arequipa', N'Arequipa', N'La Joya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040109', N'Arequipa', N'Arequipa', N'Mariano Melgar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040110', N'Arequipa', N'Arequipa', N'Miraflores')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040111', N'Arequipa', N'Arequipa', N'Mollebaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040112', N'Arequipa', N'Arequipa', N'Paucarpata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040113', N'Arequipa', N'Arequipa', N'Pocsi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040114', N'Arequipa', N'Arequipa', N'Polobaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040115', N'Arequipa', N'Arequipa', N'Quequeña')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040116', N'Arequipa', N'Arequipa', N'Sabandia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040117', N'Arequipa', N'Arequipa', N'Sachaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040118', N'Arequipa', N'Arequipa', N'San Juan de Siguas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040119', N'Arequipa', N'Arequipa', N'San Juan de Tarucani')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040120', N'Arequipa', N'Arequipa', N'Santa Isabel de Siguas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040121', N'Arequipa', N'Arequipa', N'Santa Rita de Siguas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040122', N'Arequipa', N'Arequipa', N'Socabaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040123', N'Arequipa', N'Arequipa', N'Tiabaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040124', N'Arequipa', N'Arequipa', N'Uchumayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040125', N'Arequipa', N'Arequipa', N'Vitor')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040126', N'Arequipa', N'Arequipa', N'Yanahuara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040127', N'Arequipa', N'Arequipa', N'Yarabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040128', N'Arequipa', N'Arequipa', N'Yura')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040129', N'Arequipa', N'Arequipa', N'José Luis Bustamante Y Rivero')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040200', N'Arequipa', N'Camaná', NULL)
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040201', N'Arequipa', N'Camaná', N'Camaná')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040202', N'Arequipa', N'Camaná', N'José María Quimper')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040203', N'Arequipa', N'Camaná', N'Mariano Nicolás Valcárcel')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040204', N'Arequipa', N'Camaná', N'Mariscal Cáceres')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040205', N'Arequipa', N'Camaná', N'Nicolás de Pierola')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040206', N'Arequipa', N'Camaná', N'Ocoña')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040207', N'Arequipa', N'Camaná', N'Quilca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040208', N'Arequipa', N'Camaná', N'Samuel Pastor')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040300', N'Arequipa', N'Caravelí', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040301', N'Arequipa', N'Caravelí', N'Caravelí')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040302', N'Arequipa', N'Caravelí', N'Acarí')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040303', N'Arequipa', N'Caravelí', N'Atico')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040304', N'Arequipa', N'Caravelí', N'Atiquipa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040305', N'Arequipa', N'Caravelí', N'Bella Unión')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040306', N'Arequipa', N'Caravelí', N'Cahuacho')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040307', N'Arequipa', N'Caravelí', N'Chala')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040308', N'Arequipa', N'Caravelí', N'Chaparra')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040309', N'Arequipa', N'Caravelí', N'Huanuhuanu')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040310', N'Arequipa', N'Caravelí', N'Jaqui')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040311', N'Arequipa', N'Caravelí', N'Lomas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040312', N'Arequipa', N'Caravelí', N'Quicacha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040313', N'Arequipa', N'Caravelí', N'Yauca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040400', N'Arequipa', N'Castilla', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040401', N'Arequipa', N'Castilla', N'Aplao')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040402', N'Arequipa', N'Castilla', N'Andagua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040403', N'Arequipa', N'Castilla', N'Ayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040404', N'Arequipa', N'Castilla', N'Chachas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040405', N'Arequipa', N'Castilla', N'Chilcaymarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040406', N'Arequipa', N'Castilla', N'Choco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040407', N'Arequipa', N'Castilla', N'Huancarqui')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040408', N'Arequipa', N'Castilla', N'Machaguay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040409', N'Arequipa', N'Castilla', N'Orcopampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040410', N'Arequipa', N'Castilla', N'Pampacolca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040411', N'Arequipa', N'Castilla', N'Tipan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040412', N'Arequipa', N'Castilla', N'Uñon')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040413', N'Arequipa', N'Castilla', N'Uraca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040414', N'Arequipa', N'Castilla', N'Viraco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040500', N'Arequipa', N'Caylloma', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040501', N'Arequipa', N'Caylloma', N'Chivay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040502', N'Arequipa', N'Caylloma', N'Achoma')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040503', N'Arequipa', N'Caylloma', N'Cabanaconde')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040504', N'Arequipa', N'Caylloma', N'Callalli')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040505', N'Arequipa', N'Caylloma', N'Caylloma')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040506', N'Arequipa', N'Caylloma', N'Coporaque')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040507', N'Arequipa', N'Caylloma', N'Huambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040508', N'Arequipa', N'Caylloma', N'Huanca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040509', N'Arequipa', N'Caylloma', N'Ichupampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040510', N'Arequipa', N'Caylloma', N'Lari')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040511', N'Arequipa', N'Caylloma', N'Lluta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040512', N'Arequipa', N'Caylloma', N'Maca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040513', N'Arequipa', N'Caylloma', N'Madrigal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040514', N'Arequipa', N'Caylloma', N'San Antonio de Chuca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040515', N'Arequipa', N'Caylloma', N'Sibayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040516', N'Arequipa', N'Caylloma', N'Tapay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040517', N'Arequipa', N'Caylloma', N'Tisco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040518', N'Arequipa', N'Caylloma', N'Tuti')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040519', N'Arequipa', N'Caylloma', N'Yanque')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040520', N'Arequipa', N'Caylloma', N'Majes')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040600', N'Arequipa', N'Condesuyos', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040601', N'Arequipa', N'Condesuyos', N'Chuquibamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040602', N'Arequipa', N'Condesuyos', N'Andaray')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040603', N'Arequipa', N'Condesuyos', N'Cayarani')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040604', N'Arequipa', N'Condesuyos', N'Chichas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040605', N'Arequipa', N'Condesuyos', N'Iray')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040606', N'Arequipa', N'Condesuyos', N'Río Grande')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040607', N'Arequipa', N'Condesuyos', N'Salamanca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040608', N'Arequipa', N'Condesuyos', N'Yanaquihua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040700', N'Arequipa', N'Islay', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040701', N'Arequipa', N'Islay', N'Mollendo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040702', N'Arequipa', N'Islay', N'Cocachacra')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040703', N'Arequipa', N'Islay', N'Dean Valdivia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040704', N'Arequipa', N'Islay', N'Islay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040705', N'Arequipa', N'Islay', N'Mejia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040706', N'Arequipa', N'Islay', N'Punta de Bombón')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040800', N'Arequipa', N'La Uniòn', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040801', N'Arequipa', N'La Uniòn', N'Cotahuasi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040802', N'Arequipa', N'La Uniòn', N'Alca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040803', N'Arequipa', N'La Uniòn', N'Charcana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040804', N'Arequipa', N'La Uniòn', N'Huaynacotas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040805', N'Arequipa', N'La Uniòn', N'Pampamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040806', N'Arequipa', N'La Uniòn', N'Puyca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040807', N'Arequipa', N'La Uniòn', N'Quechualla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040808', N'Arequipa', N'La Uniòn', N'Sayla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040809', N'Arequipa', N'La Uniòn', N'Tauria')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040810', N'Arequipa', N'La Uniòn', N'Tomepampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'040811', N'Arequipa', N'La Uniòn', N'Toro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050000', N'Ayacucho', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050100', N'Ayacucho', N'Huamanga', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050101', N'Ayacucho', N'Huamanga', N'Ayacucho')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050102', N'Ayacucho', N'Huamanga', N'Acocro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050103', N'Ayacucho', N'Huamanga', N'Acos Vinchos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050104', N'Ayacucho', N'Huamanga', N'Carmen Alto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050105', N'Ayacucho', N'Huamanga', N'Chiara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050106', N'Ayacucho', N'Huamanga', N'Ocros')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050107', N'Ayacucho', N'Huamanga', N'Pacaycasa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050108', N'Ayacucho', N'Huamanga', N'Quinua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050109', N'Ayacucho', N'Huamanga', N'San José de Ticllas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050110', N'Ayacucho', N'Huamanga', N'San Juan Bautista')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050111', N'Ayacucho', N'Huamanga', N'Santiago de Pischa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050112', N'Ayacucho', N'Huamanga', N'Socos')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050113', N'Ayacucho', N'Huamanga', N'Tambillo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050114', N'Ayacucho', N'Huamanga', N'Vinchos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050115', N'Ayacucho', N'Huamanga', N'Jesús Nazareno')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050116', N'Ayacucho', N'Huamanga', N'Andrés Avelino Cáceres Dorregaray')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050200', N'Ayacucho', N'Cangallo', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050201', N'Ayacucho', N'Cangallo', N'Cangallo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050202', N'Ayacucho', N'Cangallo', N'Chuschi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050203', N'Ayacucho', N'Cangallo', N'Los Morochucos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050204', N'Ayacucho', N'Cangallo', N'María Parado de Bellido')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050205', N'Ayacucho', N'Cangallo', N'Paras')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050206', N'Ayacucho', N'Cangallo', N'Totos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050300', N'Ayacucho', N'Huanca Sancos', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050301', N'Ayacucho', N'Huanca Sancos', N'Sancos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050302', N'Ayacucho', N'Huanca Sancos', N'Carapo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050303', N'Ayacucho', N'Huanca Sancos', N'Sacsamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050304', N'Ayacucho', N'Huanca Sancos', N'Santiago de Lucanamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050400', N'Ayacucho', N'Huanta', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050401', N'Ayacucho', N'Huanta', N'Huanta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050402', N'Ayacucho', N'Huanta', N'Ayahuanco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050403', N'Ayacucho', N'Huanta', N'Huamanguilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050404', N'Ayacucho', N'Huanta', N'Iguain')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050405', N'Ayacucho', N'Huanta', N'Luricocha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050406', N'Ayacucho', N'Huanta', N'Santillana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050407', N'Ayacucho', N'Huanta', N'Sivia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050408', N'Ayacucho', N'Huanta', N'Llochegua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050409', N'Ayacucho', N'Huanta', N'Canayre')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050410', N'Ayacucho', N'Huanta', N'Uchuraccay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050411', N'Ayacucho', N'Huanta', N'Pucacolpa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050500', N'Ayacucho', N'La Mar', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050501', N'Ayacucho', N'La Mar', N'San Miguel')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050502', N'Ayacucho', N'La Mar', N'Anco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050503', N'Ayacucho', N'La Mar', N'Ayna')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050504', N'Ayacucho', N'La Mar', N'Chilcas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050505', N'Ayacucho', N'La Mar', N'Chungui')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050506', N'Ayacucho', N'La Mar', N'Luis Carranza')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050507', N'Ayacucho', N'La Mar', N'Santa Rosa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050508', N'Ayacucho', N'La Mar', N'Tambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050509', N'Ayacucho', N'La Mar', N'Samugari')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050510', N'Ayacucho', N'La Mar', N'Anchihuay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050600', N'Ayacucho', N'Lucanas', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050601', N'Ayacucho', N'Lucanas', N'Puquio')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050602', N'Ayacucho', N'Lucanas', N'Aucara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050603', N'Ayacucho', N'Lucanas', N'Cabana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050604', N'Ayacucho', N'Lucanas', N'Carmen Salcedo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050605', N'Ayacucho', N'Lucanas', N'Chaviña')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050606', N'Ayacucho', N'Lucanas', N'Chipao')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050607', N'Ayacucho', N'Lucanas', N'Huac-Huas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050608', N'Ayacucho', N'Lucanas', N'Laramate')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050609', N'Ayacucho', N'Lucanas', N'Leoncio Prado')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050610', N'Ayacucho', N'Lucanas', N'Llauta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050611', N'Ayacucho', N'Lucanas', N'Lucanas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050612', N'Ayacucho', N'Lucanas', N'Ocaña')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050613', N'Ayacucho', N'Lucanas', N'Otoca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050614', N'Ayacucho', N'Lucanas', N'Saisa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050615', N'Ayacucho', N'Lucanas', N'San Cristóbal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050616', N'Ayacucho', N'Lucanas', N'San Juan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050617', N'Ayacucho', N'Lucanas', N'San Pedro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050618', N'Ayacucho', N'Lucanas', N'San Pedro de Palco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050619', N'Ayacucho', N'Lucanas', N'Sancos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050620', N'Ayacucho', N'Lucanas', N'Santa Ana de Huaycahuacho')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050621', N'Ayacucho', N'Lucanas', N'Santa Lucia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050700', N'Ayacucho', N'Parinacochas', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050701', N'Ayacucho', N'Parinacochas', N'Coracora')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050702', N'Ayacucho', N'Parinacochas', N'Chumpi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050703', N'Ayacucho', N'Parinacochas', N'Coronel Castañeda')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050704', N'Ayacucho', N'Parinacochas', N'Pacapausa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050705', N'Ayacucho', N'Parinacochas', N'Pullo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050706', N'Ayacucho', N'Parinacochas', N'Puyusca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050707', N'Ayacucho', N'Parinacochas', N'San Francisco de Ravacayco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050708', N'Ayacucho', N'Parinacochas', N'Upahuacho')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050800', N'Ayacucho', N'Pàucar del Sara Sara', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050801', N'Ayacucho', N'Pàucar del Sara Sara', N'Pausa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050802', N'Ayacucho', N'Pàucar del Sara Sara', N'Colta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050803', N'Ayacucho', N'Pàucar del Sara Sara', N'Corculla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050804', N'Ayacucho', N'Pàucar del Sara Sara', N'Lampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050805', N'Ayacucho', N'Pàucar del Sara Sara', N'Marcabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050806', N'Ayacucho', N'Pàucar del Sara Sara', N'Oyolo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050807', N'Ayacucho', N'Pàucar del Sara Sara', N'Pararca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050808', N'Ayacucho', N'Pàucar del Sara Sara', N'San Javier de Alpabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050809', N'Ayacucho', N'Pàucar del Sara Sara', N'San José de Ushua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050810', N'Ayacucho', N'Pàucar del Sara Sara', N'Sara Sara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050900', N'Ayacucho', N'Sucre', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050901', N'Ayacucho', N'Sucre', N'Querobamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050902', N'Ayacucho', N'Sucre', N'Belén')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050903', N'Ayacucho', N'Sucre', N'Chalcos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050904', N'Ayacucho', N'Sucre', N'Chilcayoc')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050905', N'Ayacucho', N'Sucre', N'Huacaña')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050906', N'Ayacucho', N'Sucre', N'Morcolla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050907', N'Ayacucho', N'Sucre', N'Paico')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050908', N'Ayacucho', N'Sucre', N'San Pedro de Larcay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050909', N'Ayacucho', N'Sucre', N'San Salvador de Quije')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050910', N'Ayacucho', N'Sucre', N'Santiago de Paucaray')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'050911', N'Ayacucho', N'Sucre', N'Soras')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051000', N'Ayacucho', N'Víctor Fajardo', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051001', N'Ayacucho', N'Víctor Fajardo', N'Huancapi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051002', N'Ayacucho', N'Víctor Fajardo', N'Alcamenca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051003', N'Ayacucho', N'Víctor Fajardo', N'Apongo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051004', N'Ayacucho', N'Víctor Fajardo', N'Asquipata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051005', N'Ayacucho', N'Víctor Fajardo', N'Canaria')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051006', N'Ayacucho', N'Víctor Fajardo', N'Cayara')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051007', N'Ayacucho', N'Víctor Fajardo', N'Colca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051008', N'Ayacucho', N'Víctor Fajardo', N'Huamanquiquia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051009', N'Ayacucho', N'Víctor Fajardo', N'Huancaraylla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051010', N'Ayacucho', N'Víctor Fajardo', N'Huaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051011', N'Ayacucho', N'Víctor Fajardo', N'Sarhua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051012', N'Ayacucho', N'Víctor Fajardo', N'Vilcanchos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051100', N'Ayacucho', N'Vilcas Huamán', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051101', N'Ayacucho', N'Vilcas Huamán', N'Vilcas Huaman')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051102', N'Ayacucho', N'Vilcas Huamán', N'Accomarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051103', N'Ayacucho', N'Vilcas Huamán', N'Carhuanca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051104', N'Ayacucho', N'Vilcas Huamán', N'Concepción')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051105', N'Ayacucho', N'Vilcas Huamán', N'Huambalpa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051106', N'Ayacucho', N'Vilcas Huamán', N'Independencia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051107', N'Ayacucho', N'Vilcas Huamán', N'Saurama')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'051108', N'Ayacucho', N'Vilcas Huamán', N'Vischongo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060000', N'Cajamarca', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060100', N'Cajamarca', N'Cajamarca', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060101', N'Cajamarca', N'Cajamarca', N'Cajamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060102', N'Cajamarca', N'Cajamarca', N'Asunción')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060103', N'Cajamarca', N'Cajamarca', N'Chetilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060104', N'Cajamarca', N'Cajamarca', N'Cospan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060105', N'Cajamarca', N'Cajamarca', N'Encañada')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060106', N'Cajamarca', N'Cajamarca', N'Jesús')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060107', N'Cajamarca', N'Cajamarca', N'Llacanora')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060108', N'Cajamarca', N'Cajamarca', N'Los Baños del Inca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060109', N'Cajamarca', N'Cajamarca', N'Magdalena')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060110', N'Cajamarca', N'Cajamarca', N'Matara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060111', N'Cajamarca', N'Cajamarca', N'Namora')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060112', N'Cajamarca', N'Cajamarca', N'San Juan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060200', N'Cajamarca', N'Cajabamba', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060201', N'Cajamarca', N'Cajabamba', N'Cajabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060202', N'Cajamarca', N'Cajabamba', N'Cachachi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060203', N'Cajamarca', N'Cajabamba', N'Condebamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060204', N'Cajamarca', N'Cajabamba', N'Sitacocha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060300', N'Cajamarca', N'Celendín', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060301', N'Cajamarca', N'Celendín', N'Celendín')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060302', N'Cajamarca', N'Celendín', N'Chumuch')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060303', N'Cajamarca', N'Celendín', N'Cortegana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060304', N'Cajamarca', N'Celendín', N'Huasmin')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060305', N'Cajamarca', N'Celendín', N'Jorge Chávez')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060306', N'Cajamarca', N'Celendín', N'José Gálvez')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060307', N'Cajamarca', N'Celendín', N'Miguel Iglesias')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060308', N'Cajamarca', N'Celendín', N'Oxamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060309', N'Cajamarca', N'Celendín', N'Sorochuco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060310', N'Cajamarca', N'Celendín', N'Sucre')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060311', N'Cajamarca', N'Celendín', N'Utco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060312', N'Cajamarca', N'Celendín', N'La Libertad de Pallan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060400', N'Cajamarca', N'Chota', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060401', N'Cajamarca', N'Chota', N'Chota')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060402', N'Cajamarca', N'Chota', N'Anguia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060403', N'Cajamarca', N'Chota', N'Chadin')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060404', N'Cajamarca', N'Chota', N'Chiguirip')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060405', N'Cajamarca', N'Chota', N'Chimban')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060406', N'Cajamarca', N'Chota', N'Choropampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060407', N'Cajamarca', N'Chota', N'Cochabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060408', N'Cajamarca', N'Chota', N'Conchan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060409', N'Cajamarca', N'Chota', N'Huambos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060410', N'Cajamarca', N'Chota', N'Lajas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060411', N'Cajamarca', N'Chota', N'Llama')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060412', N'Cajamarca', N'Chota', N'Miracosta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060413', N'Cajamarca', N'Chota', N'Paccha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060414', N'Cajamarca', N'Chota', N'Pion')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060415', N'Cajamarca', N'Chota', N'Querocoto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060416', N'Cajamarca', N'Chota', N'San Juan de Licupis')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060417', N'Cajamarca', N'Chota', N'Tacabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060418', N'Cajamarca', N'Chota', N'Tocmoche')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060419', N'Cajamarca', N'Chota', N'Chalamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060500', N'Cajamarca', N'Contumazá', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060501', N'Cajamarca', N'Contumazá', N'Contumaza')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060502', N'Cajamarca', N'Contumazá', N'Chilete')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060503', N'Cajamarca', N'Contumazá', N'Cupisnique')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060504', N'Cajamarca', N'Contumazá', N'Guzmango')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060505', N'Cajamarca', N'Contumazá', N'San Benito')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060506', N'Cajamarca', N'Contumazá', N'Santa Cruz de Toledo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060507', N'Cajamarca', N'Contumazá', N'Tantarica')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060508', N'Cajamarca', N'Contumazá', N'Yonan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060600', N'Cajamarca', N'Cutervo', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060601', N'Cajamarca', N'Cutervo', N'Cutervo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060602', N'Cajamarca', N'Cutervo', N'Callayuc')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060603', N'Cajamarca', N'Cutervo', N'Choros')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060604', N'Cajamarca', N'Cutervo', N'Cujillo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060605', N'Cajamarca', N'Cutervo', N'La Ramada')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060606', N'Cajamarca', N'Cutervo', N'Pimpingos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060607', N'Cajamarca', N'Cutervo', N'Querocotillo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060608', N'Cajamarca', N'Cutervo', N'San Andrés de Cutervo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060609', N'Cajamarca', N'Cutervo', N'San Juan de Cutervo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060610', N'Cajamarca', N'Cutervo', N'San Luis de Lucma')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060611', N'Cajamarca', N'Cutervo', N'Santa Cruz')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060612', N'Cajamarca', N'Cutervo', N'Santo Domingo de la Capilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060613', N'Cajamarca', N'Cutervo', N'Santo Tomas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060614', N'Cajamarca', N'Cutervo', N'Socota')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060615', N'Cajamarca', N'Cutervo', N'Toribio Casanova')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060700', N'Cajamarca', N'Hualgayoc', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060701', N'Cajamarca', N'Hualgayoc', N'Bambamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060702', N'Cajamarca', N'Hualgayoc', N'Chugur')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060703', N'Cajamarca', N'Hualgayoc', N'Hualgayoc')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060800', N'Cajamarca', N'Jaén', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060801', N'Cajamarca', N'Jaén', N'Jaén')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060802', N'Cajamarca', N'Jaén', N'Bellavista')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060803', N'Cajamarca', N'Jaén', N'Chontali')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060804', N'Cajamarca', N'Jaén', N'Colasay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060805', N'Cajamarca', N'Jaén', N'Huabal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060806', N'Cajamarca', N'Jaén', N'Las Pirias')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060807', N'Cajamarca', N'Jaén', N'Pomahuaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060808', N'Cajamarca', N'Jaén', N'Pucara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060809', N'Cajamarca', N'Jaén', N'Sallique')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060810', N'Cajamarca', N'Jaén', N'San Felipe')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060811', N'Cajamarca', N'Jaén', N'San José del Alto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060812', N'Cajamarca', N'Jaén', N'Santa Rosa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060900', N'Cajamarca', N'San Ignacio', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060901', N'Cajamarca', N'San Ignacio', N'San Ignacio')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060902', N'Cajamarca', N'San Ignacio', N'Chirinos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060903', N'Cajamarca', N'San Ignacio', N'Huarango')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060904', N'Cajamarca', N'San Ignacio', N'La Coipa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060905', N'Cajamarca', N'San Ignacio', N'Namballe')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060906', N'Cajamarca', N'San Ignacio', N'San José de Lourdes')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'060907', N'Cajamarca', N'San Ignacio', N'Tabaconas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061000', N'Cajamarca', N'San Marcos', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061001', N'Cajamarca', N'San Marcos', N'Pedro Gálvez')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061002', N'Cajamarca', N'San Marcos', N'Chancay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061003', N'Cajamarca', N'San Marcos', N'Eduardo Villanueva')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061004', N'Cajamarca', N'San Marcos', N'Gregorio Pita')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061005', N'Cajamarca', N'San Marcos', N'Ichocan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061006', N'Cajamarca', N'San Marcos', N'José Manuel Quiroz')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061007', N'Cajamarca', N'San Marcos', N'José Sabogal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061100', N'Cajamarca', N'San Miguel', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061101', N'Cajamarca', N'San Miguel', N'San Miguel')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061102', N'Cajamarca', N'San Miguel', N'Bolívar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061103', N'Cajamarca', N'San Miguel', N'Calquis')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061104', N'Cajamarca', N'San Miguel', N'Catilluc')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061105', N'Cajamarca', N'San Miguel', N'El Prado')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061106', N'Cajamarca', N'San Miguel', N'La Florida')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061107', N'Cajamarca', N'San Miguel', N'Llapa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061108', N'Cajamarca', N'San Miguel', N'Nanchoc')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061109', N'Cajamarca', N'San Miguel', N'Niepos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061110', N'Cajamarca', N'San Miguel', N'San Gregorio')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061111', N'Cajamarca', N'San Miguel', N'San Silvestre de Cochan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061112', N'Cajamarca', N'San Miguel', N'Tongod')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061113', N'Cajamarca', N'San Miguel', N'Unión Agua Blanca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061200', N'Cajamarca', N'San Pablo', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061201', N'Cajamarca', N'San Pablo', N'San Pablo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061202', N'Cajamarca', N'San Pablo', N'San Bernardino')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061203', N'Cajamarca', N'San Pablo', N'San Luis')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061204', N'Cajamarca', N'San Pablo', N'Tumbaden')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061300', N'Cajamarca', N'Santa Cruz', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061301', N'Cajamarca', N'Santa Cruz', N'Santa Cruz')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061302', N'Cajamarca', N'Santa Cruz', N'Andabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061303', N'Cajamarca', N'Santa Cruz', N'Catache')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061304', N'Cajamarca', N'Santa Cruz', N'Chancaybaños')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061305', N'Cajamarca', N'Santa Cruz', N'La Esperanza')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061306', N'Cajamarca', N'Santa Cruz', N'Ninabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061307', N'Cajamarca', N'Santa Cruz', N'Pulan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061308', N'Cajamarca', N'Santa Cruz', N'Saucepampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061309', N'Cajamarca', N'Santa Cruz', N'Sexi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061310', N'Cajamarca', N'Santa Cruz', N'Uticyacu')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'061311', N'Cajamarca', N'Santa Cruz', N'Yauyucan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'070000', N'Callao', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'070100', N'Callao', N'Prov. Const. del Callao', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'070101', N'Callao', N'Prov. Const. del Callao', N'Callao')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'070102', N'Callao', N'Prov. Const. del Callao', N'Bellavista')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'070103', N'Callao', N'Prov. Const. del Callao', N'Carmen de la Legua Reynoso')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'070104', N'Callao', N'Prov. Const. del Callao', N'La Perla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'070105', N'Callao', N'Prov. Const. del Callao', N'La Punta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'070106', N'Callao', N'Prov. Const. del Callao', N'Ventanilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'070107', N'Callao', N'Prov. Const. del Callao', N'Mi Perú')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080000', N'Cusco', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080100', N'Cusco', N'Cusco', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080101', N'Cusco', N'Cusco', N'Cusco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080102', N'Cusco', N'Cusco', N'Ccorca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080103', N'Cusco', N'Cusco', N'Poroy')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080104', N'Cusco', N'Cusco', N'San Jerónimo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080105', N'Cusco', N'Cusco', N'San Sebastian')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080106', N'Cusco', N'Cusco', N'Santiago')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080107', N'Cusco', N'Cusco', N'Saylla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080108', N'Cusco', N'Cusco', N'Wanchaq')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080200', N'Cusco', N'Acomayo', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080201', N'Cusco', N'Acomayo', N'Acomayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080202', N'Cusco', N'Acomayo', N'Acopia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080203', N'Cusco', N'Acomayo', N'Acos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080204', N'Cusco', N'Acomayo', N'Mosoc Llacta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080205', N'Cusco', N'Acomayo', N'Pomacanchi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080206', N'Cusco', N'Acomayo', N'Rondocan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080207', N'Cusco', N'Acomayo', N'Sangarara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080300', N'Cusco', N'Anta', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080301', N'Cusco', N'Anta', N'Anta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080302', N'Cusco', N'Anta', N'Ancahuasi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080303', N'Cusco', N'Anta', N'Cachimayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080304', N'Cusco', N'Anta', N'Chinchaypujio')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080305', N'Cusco', N'Anta', N'Huarocondo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080306', N'Cusco', N'Anta', N'Limatambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080307', N'Cusco', N'Anta', N'Mollepata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080308', N'Cusco', N'Anta', N'Pucyura')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080309', N'Cusco', N'Anta', N'Zurite')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080400', N'Cusco', N'Calca', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080401', N'Cusco', N'Calca', N'Calca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080402', N'Cusco', N'Calca', N'Coya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080403', N'Cusco', N'Calca', N'Lamay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080404', N'Cusco', N'Calca', N'Lares')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080405', N'Cusco', N'Calca', N'Pisac')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080406', N'Cusco', N'Calca', N'San Salvador')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080407', N'Cusco', N'Calca', N'Taray')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080408', N'Cusco', N'Calca', N'Yanatile')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080500', N'Cusco', N'Canas', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080501', N'Cusco', N'Canas', N'Yanaoca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080502', N'Cusco', N'Canas', N'Checca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080503', N'Cusco', N'Canas', N'Kunturkanki')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080504', N'Cusco', N'Canas', N'Langui')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080505', N'Cusco', N'Canas', N'Layo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080506', N'Cusco', N'Canas', N'Pampamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080507', N'Cusco', N'Canas', N'Quehue')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080508', N'Cusco', N'Canas', N'Tupac Amaru')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080600', N'Cusco', N'Canchis', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080601', N'Cusco', N'Canchis', N'Sicuani')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080602', N'Cusco', N'Canchis', N'Checacupe')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080603', N'Cusco', N'Canchis', N'Combapata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080604', N'Cusco', N'Canchis', N'Marangani')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080605', N'Cusco', N'Canchis', N'Pitumarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080606', N'Cusco', N'Canchis', N'San Pablo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080607', N'Cusco', N'Canchis', N'San Pedro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080608', N'Cusco', N'Canchis', N'Tinta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080700', N'Cusco', N'Chumbivilcas', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080701', N'Cusco', N'Chumbivilcas', N'Santo Tomas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080702', N'Cusco', N'Chumbivilcas', N'Capacmarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080703', N'Cusco', N'Chumbivilcas', N'Chamaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080704', N'Cusco', N'Chumbivilcas', N'Colquemarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080705', N'Cusco', N'Chumbivilcas', N'Livitaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080706', N'Cusco', N'Chumbivilcas', N'Llusco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080707', N'Cusco', N'Chumbivilcas', N'Quiñota')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080708', N'Cusco', N'Chumbivilcas', N'Velille')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080800', N'Cusco', N'Espinar', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080801', N'Cusco', N'Espinar', N'Espinar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080802', N'Cusco', N'Espinar', N'Condoroma')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080803', N'Cusco', N'Espinar', N'Coporaque')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080804', N'Cusco', N'Espinar', N'Ocoruro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080805', N'Cusco', N'Espinar', N'Pallpata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080806', N'Cusco', N'Espinar', N'Pichigua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080807', N'Cusco', N'Espinar', N'Suyckutambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080808', N'Cusco', N'Espinar', N'Alto Pichigua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080900', N'Cusco', N'La Convención', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080901', N'Cusco', N'La Convención', N'Santa Ana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080902', N'Cusco', N'La Convención', N'Echarate')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080903', N'Cusco', N'La Convención', N'Huayopata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080904', N'Cusco', N'La Convención', N'Maranura')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080905', N'Cusco', N'La Convención', N'Ocobamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080906', N'Cusco', N'La Convención', N'Quellouno')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080907', N'Cusco', N'La Convención', N'Kimbiri')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080908', N'Cusco', N'La Convención', N'Santa Teresa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080909', N'Cusco', N'La Convención', N'Vilcabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080910', N'Cusco', N'La Convención', N'Pichari')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080911', N'Cusco', N'La Convención', N'Inkawasi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080912', N'Cusco', N'La Convención', N'Villa Virgen')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'080913', N'Cusco', N'La Convención', N'Villa Kintiarina')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081000', N'Cusco', N'Paruro', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081001', N'Cusco', N'Paruro', N'Paruro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081002', N'Cusco', N'Paruro', N'Accha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081003', N'Cusco', N'Paruro', N'Ccapi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081004', N'Cusco', N'Paruro', N'Colcha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081005', N'Cusco', N'Paruro', N'Huanoquite')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081006', N'Cusco', N'Paruro', N'Omacha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081007', N'Cusco', N'Paruro', N'Paccaritambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081008', N'Cusco', N'Paruro', N'Pillpinto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081009', N'Cusco', N'Paruro', N'Yaurisque')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081100', N'Cusco', N'Paucartambo', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081101', N'Cusco', N'Paucartambo', N'Paucartambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081102', N'Cusco', N'Paucartambo', N'Caicay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081103', N'Cusco', N'Paucartambo', N'Challabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081104', N'Cusco', N'Paucartambo', N'Colquepata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081105', N'Cusco', N'Paucartambo', N'Huancarani')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081106', N'Cusco', N'Paucartambo', N'Kosñipata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081200', N'Cusco', N'Quispicanchi', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081201', N'Cusco', N'Quispicanchi', N'Urcos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081202', N'Cusco', N'Quispicanchi', N'Andahuaylillas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081203', N'Cusco', N'Quispicanchi', N'Camanti')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081204', N'Cusco', N'Quispicanchi', N'Ccarhuayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081205', N'Cusco', N'Quispicanchi', N'Ccatca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081206', N'Cusco', N'Quispicanchi', N'Cusipata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081207', N'Cusco', N'Quispicanchi', N'Huaro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081208', N'Cusco', N'Quispicanchi', N'Lucre')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081209', N'Cusco', N'Quispicanchi', N'Marcapata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081210', N'Cusco', N'Quispicanchi', N'Ocongate')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081211', N'Cusco', N'Quispicanchi', N'Oropesa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081212', N'Cusco', N'Quispicanchi', N'Quiquijana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081300', N'Cusco', N'Urubamba', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081301', N'Cusco', N'Urubamba', N'Urubamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081302', N'Cusco', N'Urubamba', N'Chinchero')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081303', N'Cusco', N'Urubamba', N'Huayllabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081304', N'Cusco', N'Urubamba', N'Machupicchu')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081305', N'Cusco', N'Urubamba', N'Maras')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081306', N'Cusco', N'Urubamba', N'Ollantaytambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'081307', N'Cusco', N'Urubamba', N'Yucay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090000', N'Huancavelica', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090100', N'Huancavelica', N'Huancavelica', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090101', N'Huancavelica', N'Huancavelica', N'Huancavelica')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090102', N'Huancavelica', N'Huancavelica', N'Acobambilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090103', N'Huancavelica', N'Huancavelica', N'Acoria')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090104', N'Huancavelica', N'Huancavelica', N'Conayca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090105', N'Huancavelica', N'Huancavelica', N'Cuenca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090106', N'Huancavelica', N'Huancavelica', N'Huachocolpa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090107', N'Huancavelica', N'Huancavelica', N'Huayllahuara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090108', N'Huancavelica', N'Huancavelica', N'Izcuchaca')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090109', N'Huancavelica', N'Huancavelica', N'Laria')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090110', N'Huancavelica', N'Huancavelica', N'Manta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090111', N'Huancavelica', N'Huancavelica', N'Mariscal Cáceres')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090112', N'Huancavelica', N'Huancavelica', N'Moya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090113', N'Huancavelica', N'Huancavelica', N'Nuevo Occoro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090114', N'Huancavelica', N'Huancavelica', N'Palca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090115', N'Huancavelica', N'Huancavelica', N'Pilchaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090116', N'Huancavelica', N'Huancavelica', N'Vilca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090117', N'Huancavelica', N'Huancavelica', N'Yauli')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090118', N'Huancavelica', N'Huancavelica', N'Ascensión')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090119', N'Huancavelica', N'Huancavelica', N'Huando')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090200', N'Huancavelica', N'Acobamba', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090201', N'Huancavelica', N'Acobamba', N'Acobamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090202', N'Huancavelica', N'Acobamba', N'Andabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090203', N'Huancavelica', N'Acobamba', N'Anta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090204', N'Huancavelica', N'Acobamba', N'Caja')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090205', N'Huancavelica', N'Acobamba', N'Marcas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090206', N'Huancavelica', N'Acobamba', N'Paucara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090207', N'Huancavelica', N'Acobamba', N'Pomacocha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090208', N'Huancavelica', N'Acobamba', N'Rosario')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090300', N'Huancavelica', N'Angaraes', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090301', N'Huancavelica', N'Angaraes', N'Lircay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090302', N'Huancavelica', N'Angaraes', N'Anchonga')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090303', N'Huancavelica', N'Angaraes', N'Callanmarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090304', N'Huancavelica', N'Angaraes', N'Ccochaccasa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090305', N'Huancavelica', N'Angaraes', N'Chincho')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090306', N'Huancavelica', N'Angaraes', N'Congalla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090307', N'Huancavelica', N'Angaraes', N'Huanca-Huanca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090308', N'Huancavelica', N'Angaraes', N'Huayllay Grande')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090309', N'Huancavelica', N'Angaraes', N'Julcamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090310', N'Huancavelica', N'Angaraes', N'San Antonio de Antaparco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090311', N'Huancavelica', N'Angaraes', N'Santo Tomas de Pata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090312', N'Huancavelica', N'Angaraes', N'Secclla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090400', N'Huancavelica', N'Castrovirreyna', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090401', N'Huancavelica', N'Castrovirreyna', N'Castrovirreyna')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090402', N'Huancavelica', N'Castrovirreyna', N'Arma')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090403', N'Huancavelica', N'Castrovirreyna', N'Aurahua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090404', N'Huancavelica', N'Castrovirreyna', N'Capillas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090405', N'Huancavelica', N'Castrovirreyna', N'Chupamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090406', N'Huancavelica', N'Castrovirreyna', N'Cocas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090407', N'Huancavelica', N'Castrovirreyna', N'Huachos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090408', N'Huancavelica', N'Castrovirreyna', N'Huamatambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090409', N'Huancavelica', N'Castrovirreyna', N'Mollepampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090410', N'Huancavelica', N'Castrovirreyna', N'San Juan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090411', N'Huancavelica', N'Castrovirreyna', N'Santa Ana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090412', N'Huancavelica', N'Castrovirreyna', N'Tantara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090413', N'Huancavelica', N'Castrovirreyna', N'Ticrapo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090500', N'Huancavelica', N'Churcampa', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090501', N'Huancavelica', N'Churcampa', N'Churcampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090502', N'Huancavelica', N'Churcampa', N'Anco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090503', N'Huancavelica', N'Churcampa', N'Chinchihuasi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090504', N'Huancavelica', N'Churcampa', N'El Carmen')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090505', N'Huancavelica', N'Churcampa', N'La Merced')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090506', N'Huancavelica', N'Churcampa', N'Locroja')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090507', N'Huancavelica', N'Churcampa', N'Paucarbamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090508', N'Huancavelica', N'Churcampa', N'San Miguel de Mayocc')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090509', N'Huancavelica', N'Churcampa', N'San Pedro de Coris')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090510', N'Huancavelica', N'Churcampa', N'Pachamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090511', N'Huancavelica', N'Churcampa', N'Cosme')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090600', N'Huancavelica', N'Huaytará', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090601', N'Huancavelica', N'Huaytará', N'Huaytara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090602', N'Huancavelica', N'Huaytará', N'Ayavi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090603', N'Huancavelica', N'Huaytará', N'Córdova')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090604', N'Huancavelica', N'Huaytará', N'Huayacundo Arma')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090605', N'Huancavelica', N'Huaytará', N'Laramarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090606', N'Huancavelica', N'Huaytará', N'Ocoyo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090607', N'Huancavelica', N'Huaytará', N'Pilpichaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090608', N'Huancavelica', N'Huaytará', N'Querco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090609', N'Huancavelica', N'Huaytará', N'Quito-Arma')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090610', N'Huancavelica', N'Huaytará', N'San Antonio de Cusicancha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090611', N'Huancavelica', N'Huaytará', N'San Francisco de Sangayaico')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090612', N'Huancavelica', N'Huaytará', N'San Isidro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090613', N'Huancavelica', N'Huaytará', N'Santiago de Chocorvos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090614', N'Huancavelica', N'Huaytará', N'Santiago de Quirahuara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090615', N'Huancavelica', N'Huaytará', N'Santo Domingo de Capillas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090616', N'Huancavelica', N'Huaytará', N'Tambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090700', N'Huancavelica', N'Tayacaja', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090701', N'Huancavelica', N'Tayacaja', N'Pampas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090702', N'Huancavelica', N'Tayacaja', N'Acostambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090703', N'Huancavelica', N'Tayacaja', N'Acraquia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090704', N'Huancavelica', N'Tayacaja', N'Ahuaycha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090705', N'Huancavelica', N'Tayacaja', N'Colcabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090706', N'Huancavelica', N'Tayacaja', N'Daniel Hernández')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090707', N'Huancavelica', N'Tayacaja', N'Huachocolpa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090709', N'Huancavelica', N'Tayacaja', N'Huaribamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090710', N'Huancavelica', N'Tayacaja', N'Ñahuimpuquio')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090711', N'Huancavelica', N'Tayacaja', N'Pazos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090713', N'Huancavelica', N'Tayacaja', N'Quishuar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090714', N'Huancavelica', N'Tayacaja', N'Salcabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090715', N'Huancavelica', N'Tayacaja', N'Salcahuasi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090716', N'Huancavelica', N'Tayacaja', N'San Marcos de Rocchac')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090717', N'Huancavelica', N'Tayacaja', N'Surcubamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090718', N'Huancavelica', N'Tayacaja', N'Tintay Puncu')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090719', N'Huancavelica', N'Tayacaja', N'Quichuas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'090720', N'Huancavelica', N'Tayacaja', N'Andaymarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100000', N'Huánuco', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100100', N'Huánuco', N'Huánuco', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100101', N'Huánuco', N'Huánuco', N'Huanuco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100102', N'Huánuco', N'Huánuco', N'Amarilis')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100103', N'Huánuco', N'Huánuco', N'Chinchao')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100104', N'Huánuco', N'Huánuco', N'Churubamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100105', N'Huánuco', N'Huánuco', N'Margos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100106', N'Huánuco', N'Huánuco', N'Quisqui (Kichki)')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100107', N'Huánuco', N'Huánuco', N'San Francisco de Cayran')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100108', N'Huánuco', N'Huánuco', N'San Pedro de Chaulan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100109', N'Huánuco', N'Huánuco', N'Santa María del Valle')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100110', N'Huánuco', N'Huánuco', N'Yarumayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100111', N'Huánuco', N'Huánuco', N'Pillco Marca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100112', N'Huánuco', N'Huánuco', N'Yacus')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100200', N'Huánuco', N'Ambo', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100201', N'Huánuco', N'Ambo', N'Ambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100202', N'Huánuco', N'Ambo', N'Cayna')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100203', N'Huánuco', N'Ambo', N'Colpas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100204', N'Huánuco', N'Ambo', N'Conchamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100205', N'Huánuco', N'Ambo', N'Huacar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100206', N'Huánuco', N'Ambo', N'San Francisco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100207', N'Huánuco', N'Ambo', N'San Rafael')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100208', N'Huánuco', N'Ambo', N'Tomay Kichwa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100300', N'Huánuco', N'Dos de Mayo', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100301', N'Huánuco', N'Dos de Mayo', N'La Unión')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100307', N'Huánuco', N'Dos de Mayo', N'Chuquis')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100311', N'Huánuco', N'Dos de Mayo', N'Marías')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100313', N'Huánuco', N'Dos de Mayo', N'Pachas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100316', N'Huánuco', N'Dos de Mayo', N'Quivilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100317', N'Huánuco', N'Dos de Mayo', N'Ripan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100321', N'Huánuco', N'Dos de Mayo', N'Shunqui')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100322', N'Huánuco', N'Dos de Mayo', N'Sillapata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100323', N'Huánuco', N'Dos de Mayo', N'Yanas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100400', N'Huánuco', N'Huacaybamba', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100401', N'Huánuco', N'Huacaybamba', N'Huacaybamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100402', N'Huánuco', N'Huacaybamba', N'Canchabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100403', N'Huánuco', N'Huacaybamba', N'Cochabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100404', N'Huánuco', N'Huacaybamba', N'Pinra')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100500', N'Huánuco', N'Huamalíes', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100501', N'Huánuco', N'Huamalíes', N'Llata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100502', N'Huánuco', N'Huamalíes', N'Arancay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100503', N'Huánuco', N'Huamalíes', N'Chavín de Pariarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100504', N'Huánuco', N'Huamalíes', N'Jacas Grande')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100505', N'Huánuco', N'Huamalíes', N'Jircan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100506', N'Huánuco', N'Huamalíes', N'Miraflores')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100507', N'Huánuco', N'Huamalíes', N'Monzón')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100508', N'Huánuco', N'Huamalíes', N'Punchao')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100509', N'Huánuco', N'Huamalíes', N'Puños')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100510', N'Huánuco', N'Huamalíes', N'Singa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100511', N'Huánuco', N'Huamalíes', N'Tantamayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100600', N'Huánuco', N'Leoncio Prado', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100601', N'Huánuco', N'Leoncio Prado', N'Rupa-Rupa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100602', N'Huánuco', N'Leoncio Prado', N'Daniel Alomía Robles')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100603', N'Huánuco', N'Leoncio Prado', N'Hermílio Valdizan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100604', N'Huánuco', N'Leoncio Prado', N'José Crespo y Castillo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100605', N'Huánuco', N'Leoncio Prado', N'Luyando')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100606', N'Huánuco', N'Leoncio Prado', N'Mariano Damaso Beraun')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100700', N'Huánuco', N'Marañón', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100701', N'Huánuco', N'Marañón', N'Huacrachuco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100702', N'Huánuco', N'Marañón', N'Cholon')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100703', N'Huánuco', N'Marañón', N'San Buenaventura')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100800', N'Huánuco', N'Pachitea', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100801', N'Huánuco', N'Pachitea', N'Panao')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100802', N'Huánuco', N'Pachitea', N'Chaglla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100803', N'Huánuco', N'Pachitea', N'Molino')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100804', N'Huánuco', N'Pachitea', N'Umari')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100900', N'Huánuco', N'Puerto Inca', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100901', N'Huánuco', N'Puerto Inca', N'Puerto Inca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100902', N'Huánuco', N'Puerto Inca', N'Codo del Pozuzo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100903', N'Huánuco', N'Puerto Inca', N'Honoria')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100904', N'Huánuco', N'Puerto Inca', N'Tournavista')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'100905', N'Huánuco', N'Puerto Inca', N'Yuyapichis')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101000', N'Huánuco', N'Lauricocha ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101001', N'Huánuco', N'Lauricocha ', N'Jesús')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101002', N'Huánuco', N'Lauricocha ', N'Baños')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101003', N'Huánuco', N'Lauricocha ', N'Jivia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101004', N'Huánuco', N'Lauricocha ', N'Queropalca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101005', N'Huánuco', N'Lauricocha ', N'Rondos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101006', N'Huánuco', N'Lauricocha ', N'San Francisco de Asís')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101007', N'Huánuco', N'Lauricocha ', N'San Miguel de Cauri')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101100', N'Huánuco', N'Yarowilca ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101101', N'Huánuco', N'Yarowilca ', N'Chavinillo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101102', N'Huánuco', N'Yarowilca ', N'Cahuac')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101103', N'Huánuco', N'Yarowilca ', N'Chacabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101104', N'Huánuco', N'Yarowilca ', N'Aparicio Pomares')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101105', N'Huánuco', N'Yarowilca ', N'Jacas Chico')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101106', N'Huánuco', N'Yarowilca ', N'Obas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101107', N'Huánuco', N'Yarowilca ', N'Pampamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'101108', N'Huánuco', N'Yarowilca ', N'Choras')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110000', N'Ica', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110100', N'Ica', N'Ica ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110101', N'Ica', N'Ica ', N'Ica')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110102', N'Ica', N'Ica ', N'La Tinguiña')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110103', N'Ica', N'Ica ', N'Los Aquijes')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110104', N'Ica', N'Ica ', N'Ocucaje')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110105', N'Ica', N'Ica ', N'Pachacutec')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110106', N'Ica', N'Ica ', N'Parcona')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110107', N'Ica', N'Ica ', N'Pueblo Nuevo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110108', N'Ica', N'Ica ', N'Salas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110109', N'Ica', N'Ica ', N'San José de Los Molinos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110110', N'Ica', N'Ica ', N'San Juan Bautista')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110111', N'Ica', N'Ica ', N'Santiago')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110112', N'Ica', N'Ica ', N'Subtanjalla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110113', N'Ica', N'Ica ', N'Tate')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110114', N'Ica', N'Ica ', N'Yauca del Rosario')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110200', N'Ica', N'Chincha ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110201', N'Ica', N'Chincha ', N'Chincha Alta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110202', N'Ica', N'Chincha ', N'Alto Laran')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110203', N'Ica', N'Chincha ', N'Chavin')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110204', N'Ica', N'Chincha ', N'Chincha Baja')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110205', N'Ica', N'Chincha ', N'El Carmen')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110206', N'Ica', N'Chincha ', N'Grocio Prado')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110207', N'Ica', N'Chincha ', N'Pueblo Nuevo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110208', N'Ica', N'Chincha ', N'San Juan de Yanac')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110209', N'Ica', N'Chincha ', N'San Pedro de Huacarpana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110210', N'Ica', N'Chincha ', N'Sunampe')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110211', N'Ica', N'Chincha ', N'Tambo de Mora')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110300', N'Ica', N'Nazca ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110301', N'Ica', N'Nazca ', N'Nasca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110302', N'Ica', N'Nazca ', N'Changuillo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110303', N'Ica', N'Nazca ', N'El Ingenio')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110304', N'Ica', N'Nazca ', N'Marcona')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110305', N'Ica', N'Nazca ', N'Vista Alegre')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110400', N'Ica', N'Palpa ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110401', N'Ica', N'Palpa ', N'Palpa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110402', N'Ica', N'Palpa ', N'Llipata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110403', N'Ica', N'Palpa ', N'Río Grande')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110404', N'Ica', N'Palpa ', N'Santa Cruz')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110405', N'Ica', N'Palpa ', N'Tibillo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110500', N'Ica', N'Pisco ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110501', N'Ica', N'Pisco ', N'Pisco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110502', N'Ica', N'Pisco ', N'Huancano')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110503', N'Ica', N'Pisco ', N'Humay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110504', N'Ica', N'Pisco ', N'Independencia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110505', N'Ica', N'Pisco ', N'Paracas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110506', N'Ica', N'Pisco ', N'San Andrés')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110507', N'Ica', N'Pisco ', N'San Clemente')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'110508', N'Ica', N'Pisco ', N'Tupac Amaru Inca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120000', N'Junín', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120100', N'Junín', N'Huancayo ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120101', N'Junín', N'Huancayo ', N'Huancayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120104', N'Junín', N'Huancayo ', N'Carhuacallanga')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120105', N'Junín', N'Huancayo ', N'Chacapampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120106', N'Junín', N'Huancayo ', N'Chicche')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120107', N'Junín', N'Huancayo ', N'Chilca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120108', N'Junín', N'Huancayo ', N'Chongos Alto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120111', N'Junín', N'Huancayo ', N'Chupuro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120112', N'Junín', N'Huancayo ', N'Colca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120113', N'Junín', N'Huancayo ', N'Cullhuas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120114', N'Junín', N'Huancayo ', N'El Tambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120116', N'Junín', N'Huancayo ', N'Huacrapuquio')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120117', N'Junín', N'Huancayo ', N'Hualhuas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120119', N'Junín', N'Huancayo ', N'Huancan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120120', N'Junín', N'Huancayo ', N'Huasicancha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120121', N'Junín', N'Huancayo ', N'Huayucachi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120122', N'Junín', N'Huancayo ', N'Ingenio')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120124', N'Junín', N'Huancayo ', N'Pariahuanca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120125', N'Junín', N'Huancayo ', N'Pilcomayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120126', N'Junín', N'Huancayo ', N'Pucara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120127', N'Junín', N'Huancayo ', N'Quichuay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120128', N'Junín', N'Huancayo ', N'Quilcas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120129', N'Junín', N'Huancayo ', N'San Agustín')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120130', N'Junín', N'Huancayo ', N'San Jerónimo de Tunan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120132', N'Junín', N'Huancayo ', N'Saño')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120133', N'Junín', N'Huancayo ', N'Sapallanga')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120134', N'Junín', N'Huancayo ', N'Sicaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120135', N'Junín', N'Huancayo ', N'Santo Domingo de Acobamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120136', N'Junín', N'Huancayo ', N'Viques')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120200', N'Junín', N'Concepción ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120201', N'Junín', N'Concepción ', N'Concepción')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120202', N'Junín', N'Concepción ', N'Aco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120203', N'Junín', N'Concepción ', N'Andamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120204', N'Junín', N'Concepción ', N'Chambara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120205', N'Junín', N'Concepción ', N'Cochas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120206', N'Junín', N'Concepción ', N'Comas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120207', N'Junín', N'Concepción ', N'Heroínas Toledo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120208', N'Junín', N'Concepción ', N'Manzanares')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120209', N'Junín', N'Concepción ', N'Mariscal Castilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120210', N'Junín', N'Concepción ', N'Matahuasi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120211', N'Junín', N'Concepción ', N'Mito')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120212', N'Junín', N'Concepción ', N'Nueve de Julio')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120213', N'Junín', N'Concepción ', N'Orcotuna')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120214', N'Junín', N'Concepción ', N'San José de Quero')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120215', N'Junín', N'Concepción ', N'Santa Rosa de Ocopa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120300', N'Junín', N'Chanchamayo ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120301', N'Junín', N'Chanchamayo ', N'Chanchamayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120302', N'Junín', N'Chanchamayo ', N'Perene')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120303', N'Junín', N'Chanchamayo ', N'Pichanaqui')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120304', N'Junín', N'Chanchamayo ', N'San Luis de Shuaro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120305', N'Junín', N'Chanchamayo ', N'San Ramón')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120306', N'Junín', N'Chanchamayo ', N'Vitoc')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120400', N'Junín', N'Jauja ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120401', N'Junín', N'Jauja ', N'Jauja')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120402', N'Junín', N'Jauja ', N'Acolla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120403', N'Junín', N'Jauja ', N'Apata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120404', N'Junín', N'Jauja ', N'Ataura')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120405', N'Junín', N'Jauja ', N'Canchayllo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120406', N'Junín', N'Jauja ', N'Curicaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120407', N'Junín', N'Jauja ', N'El Mantaro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120408', N'Junín', N'Jauja ', N'Huamali')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120409', N'Junín', N'Jauja ', N'Huaripampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120410', N'Junín', N'Jauja ', N'Huertas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120411', N'Junín', N'Jauja ', N'Janjaillo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120412', N'Junín', N'Jauja ', N'Julcán')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120413', N'Junín', N'Jauja ', N'Leonor Ordóñez')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120414', N'Junín', N'Jauja ', N'Llocllapampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120415', N'Junín', N'Jauja ', N'Marco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120416', N'Junín', N'Jauja ', N'Masma')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120417', N'Junín', N'Jauja ', N'Masma Chicche')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120418', N'Junín', N'Jauja ', N'Molinos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120419', N'Junín', N'Jauja ', N'Monobamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120420', N'Junín', N'Jauja ', N'Muqui')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120421', N'Junín', N'Jauja ', N'Muquiyauyo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120422', N'Junín', N'Jauja ', N'Paca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120423', N'Junín', N'Jauja ', N'Paccha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120424', N'Junín', N'Jauja ', N'Pancan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120425', N'Junín', N'Jauja ', N'Parco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120426', N'Junín', N'Jauja ', N'Pomacancha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120427', N'Junín', N'Jauja ', N'Ricran')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120428', N'Junín', N'Jauja ', N'San Lorenzo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120429', N'Junín', N'Jauja ', N'San Pedro de Chunan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120430', N'Junín', N'Jauja ', N'Sausa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120431', N'Junín', N'Jauja ', N'Sincos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120432', N'Junín', N'Jauja ', N'Tunan Marca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120433', N'Junín', N'Jauja ', N'Yauli')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120434', N'Junín', N'Jauja ', N'Yauyos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120500', N'Junín', N'Junín ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120501', N'Junín', N'Junín ', N'Junin')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120502', N'Junín', N'Junín ', N'Carhuamayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120503', N'Junín', N'Junín ', N'Ondores')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120504', N'Junín', N'Junín ', N'Ulcumayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120600', N'Junín', N'Satipo ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120601', N'Junín', N'Satipo ', N'Satipo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120602', N'Junín', N'Satipo ', N'Coviriali')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120603', N'Junín', N'Satipo ', N'Llaylla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120604', N'Junín', N'Satipo ', N'Mazamari')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120605', N'Junín', N'Satipo ', N'Pampa Hermosa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120606', N'Junín', N'Satipo ', N'Pangoa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120607', N'Junín', N'Satipo ', N'Río Negro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120608', N'Junín', N'Satipo ', N'Río Tambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120609', N'Junín', N'Satipo ', N'Vizcatan del Ene')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120700', N'Junín', N'Tarma ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120701', N'Junín', N'Tarma ', N'Tarma')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120702', N'Junín', N'Tarma ', N'Acobamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120703', N'Junín', N'Tarma ', N'Huaricolca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120704', N'Junín', N'Tarma ', N'Huasahuasi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120705', N'Junín', N'Tarma ', N'La Unión')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120706', N'Junín', N'Tarma ', N'Palca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120707', N'Junín', N'Tarma ', N'Palcamayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120708', N'Junín', N'Tarma ', N'San Pedro de Cajas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120709', N'Junín', N'Tarma ', N'Tapo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120800', N'Junín', N'Yauli ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120801', N'Junín', N'Yauli ', N'La Oroya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120802', N'Junín', N'Yauli ', N'Chacapalpa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120803', N'Junín', N'Yauli ', N'Huay-Huay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120804', N'Junín', N'Yauli ', N'Marcapomacocha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120805', N'Junín', N'Yauli ', N'Morococha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120806', N'Junín', N'Yauli ', N'Paccha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120807', N'Junín', N'Yauli ', N'Santa Bárbara de Carhuacayan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120808', N'Junín', N'Yauli ', N'Santa Rosa de Sacco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120809', N'Junín', N'Yauli ', N'Suitucancha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120810', N'Junín', N'Yauli ', N'Yauli')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120900', N'Junín', N'Chupaca ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120901', N'Junín', N'Chupaca ', N'Chupaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120902', N'Junín', N'Chupaca ', N'Ahuac')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120903', N'Junín', N'Chupaca ', N'Chongos Bajo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120904', N'Junín', N'Chupaca ', N'Huachac')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120905', N'Junín', N'Chupaca ', N'Huamancaca Chico')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120906', N'Junín', N'Chupaca ', N'San Juan de Iscos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120907', N'Junín', N'Chupaca ', N'San Juan de Jarpa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120908', N'Junín', N'Chupaca ', N'Tres de Diciembre')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'120909', N'Junín', N'Chupaca ', N'Yanacancha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130000', N'La Libertad', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130100', N'La Libertad', N'Trujillo ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130101', N'La Libertad', N'Trujillo ', N'Trujillo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130102', N'La Libertad', N'Trujillo ', N'El Porvenir')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130103', N'La Libertad', N'Trujillo ', N'Florencia de Mora')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130104', N'La Libertad', N'Trujillo ', N'Huanchaco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130105', N'La Libertad', N'Trujillo ', N'La Esperanza')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130106', N'La Libertad', N'Trujillo ', N'Laredo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130107', N'La Libertad', N'Trujillo ', N'Moche')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130108', N'La Libertad', N'Trujillo ', N'Poroto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130109', N'La Libertad', N'Trujillo ', N'Salaverry')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130110', N'La Libertad', N'Trujillo ', N'Simbal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130111', N'La Libertad', N'Trujillo ', N'Victor Larco Herrera')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130200', N'La Libertad', N'Ascope ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130201', N'La Libertad', N'Ascope ', N'Ascope')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130202', N'La Libertad', N'Ascope ', N'Chicama')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130203', N'La Libertad', N'Ascope ', N'Chocope')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130204', N'La Libertad', N'Ascope ', N'Magdalena de Cao')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130205', N'La Libertad', N'Ascope ', N'Paijan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130206', N'La Libertad', N'Ascope ', N'Rázuri')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130207', N'La Libertad', N'Ascope ', N'Santiago de Cao')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130208', N'La Libertad', N'Ascope ', N'Casa Grande')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130300', N'La Libertad', N'Bolívar ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130301', N'La Libertad', N'Bolívar ', N'Bolívar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130302', N'La Libertad', N'Bolívar ', N'Bambamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130303', N'La Libertad', N'Bolívar ', N'Condormarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130304', N'La Libertad', N'Bolívar ', N'Longotea')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130305', N'La Libertad', N'Bolívar ', N'Uchumarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130306', N'La Libertad', N'Bolívar ', N'Ucuncha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130400', N'La Libertad', N'Chepén ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130401', N'La Libertad', N'Chepén ', N'Chepen')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130402', N'La Libertad', N'Chepén ', N'Pacanga')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130403', N'La Libertad', N'Chepén ', N'Pueblo Nuevo')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130500', N'La Libertad', N'Julcán ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130501', N'La Libertad', N'Julcán ', N'Julcan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130502', N'La Libertad', N'Julcán ', N'Calamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130503', N'La Libertad', N'Julcán ', N'Carabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130504', N'La Libertad', N'Julcán ', N'Huaso')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130600', N'La Libertad', N'Otuzco ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130601', N'La Libertad', N'Otuzco ', N'Otuzco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130602', N'La Libertad', N'Otuzco ', N'Agallpampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130604', N'La Libertad', N'Otuzco ', N'Charat')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130605', N'La Libertad', N'Otuzco ', N'Huaranchal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130606', N'La Libertad', N'Otuzco ', N'La Cuesta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130608', N'La Libertad', N'Otuzco ', N'Mache')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130610', N'La Libertad', N'Otuzco ', N'Paranday')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130611', N'La Libertad', N'Otuzco ', N'Salpo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130613', N'La Libertad', N'Otuzco ', N'Sinsicap')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130614', N'La Libertad', N'Otuzco ', N'Usquil')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130700', N'La Libertad', N'Pacasmayo ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130701', N'La Libertad', N'Pacasmayo ', N'San Pedro de Lloc')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130702', N'La Libertad', N'Pacasmayo ', N'Guadalupe')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130703', N'La Libertad', N'Pacasmayo ', N'Jequetepeque')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130704', N'La Libertad', N'Pacasmayo ', N'Pacasmayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130705', N'La Libertad', N'Pacasmayo ', N'San José')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130800', N'La Libertad', N'Pataz ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130801', N'La Libertad', N'Pataz ', N'Tayabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130802', N'La Libertad', N'Pataz ', N'Buldibuyo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130803', N'La Libertad', N'Pataz ', N'Chillia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130804', N'La Libertad', N'Pataz ', N'Huancaspata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130805', N'La Libertad', N'Pataz ', N'Huaylillas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130806', N'La Libertad', N'Pataz ', N'Huayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130807', N'La Libertad', N'Pataz ', N'Ongon')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130808', N'La Libertad', N'Pataz ', N'Parcoy')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130809', N'La Libertad', N'Pataz ', N'Pataz')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130810', N'La Libertad', N'Pataz ', N'Pias')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130811', N'La Libertad', N'Pataz ', N'Santiago de Challas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130812', N'La Libertad', N'Pataz ', N'Taurija')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130813', N'La Libertad', N'Pataz ', N'Urpay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130900', N'La Libertad', N'Sánchez Carrión ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130901', N'La Libertad', N'Sánchez Carrión ', N'Huamachuco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130902', N'La Libertad', N'Sánchez Carrión ', N'Chugay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130903', N'La Libertad', N'Sánchez Carrión ', N'Cochorco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130904', N'La Libertad', N'Sánchez Carrión ', N'Curgos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130905', N'La Libertad', N'Sánchez Carrión ', N'Marcabal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130906', N'La Libertad', N'Sánchez Carrión ', N'Sanagoran')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130907', N'La Libertad', N'Sánchez Carrión ', N'Sarin')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'130908', N'La Libertad', N'Sánchez Carrión ', N'Sartimbamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131000', N'La Libertad', N'Santiago de Chuco ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131001', N'La Libertad', N'Santiago de Chuco ', N'Santiago de Chuco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131002', N'La Libertad', N'Santiago de Chuco ', N'Angasmarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131003', N'La Libertad', N'Santiago de Chuco ', N'Cachicadan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131004', N'La Libertad', N'Santiago de Chuco ', N'Mollebamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131005', N'La Libertad', N'Santiago de Chuco ', N'Mollepata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131006', N'La Libertad', N'Santiago de Chuco ', N'Quiruvilca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131007', N'La Libertad', N'Santiago de Chuco ', N'Santa Cruz de Chuca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131008', N'La Libertad', N'Santiago de Chuco ', N'Sitabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131100', N'La Libertad', N'Gran Chimú ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131101', N'La Libertad', N'Gran Chimú ', N'Cascas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131102', N'La Libertad', N'Gran Chimú ', N'Lucma')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131103', N'La Libertad', N'Gran Chimú ', N'Marmot')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131104', N'La Libertad', N'Gran Chimú ', N'Sayapullo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131200', N'La Libertad', N'Virú ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131201', N'La Libertad', N'Virú ', N'Viru')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131202', N'La Libertad', N'Virú ', N'Chao')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'131203', N'La Libertad', N'Virú ', N'Guadalupito')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140000', N'Lambayeque', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140100', N'Lambayeque', N'Chiclayo ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140101', N'Lambayeque', N'Chiclayo ', N'Chiclayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140102', N'Lambayeque', N'Chiclayo ', N'Chongoyape')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140103', N'Lambayeque', N'Chiclayo ', N'Eten')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140104', N'Lambayeque', N'Chiclayo ', N'Eten Puerto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140105', N'Lambayeque', N'Chiclayo ', N'José Leonardo Ortiz')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140106', N'Lambayeque', N'Chiclayo ', N'La Victoria')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140107', N'Lambayeque', N'Chiclayo ', N'Lagunas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140108', N'Lambayeque', N'Chiclayo ', N'Monsefu')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140109', N'Lambayeque', N'Chiclayo ', N'Nueva Arica')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140110', N'Lambayeque', N'Chiclayo ', N'Oyotun')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140111', N'Lambayeque', N'Chiclayo ', N'Picsi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140112', N'Lambayeque', N'Chiclayo ', N'Pimentel')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140113', N'Lambayeque', N'Chiclayo ', N'Reque')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140114', N'Lambayeque', N'Chiclayo ', N'Santa Rosa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140115', N'Lambayeque', N'Chiclayo ', N'Saña')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140116', N'Lambayeque', N'Chiclayo ', N'Cayalti')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140117', N'Lambayeque', N'Chiclayo ', N'Patapo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140118', N'Lambayeque', N'Chiclayo ', N'Pomalca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140119', N'Lambayeque', N'Chiclayo ', N'Pucala')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140120', N'Lambayeque', N'Chiclayo ', N'Tuman')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140200', N'Lambayeque', N'Ferreñafe ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140201', N'Lambayeque', N'Ferreñafe ', N'Ferreñafe')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140202', N'Lambayeque', N'Ferreñafe ', N'Cañaris')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140203', N'Lambayeque', N'Ferreñafe ', N'Incahuasi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140204', N'Lambayeque', N'Ferreñafe ', N'Manuel Antonio Mesones Muro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140205', N'Lambayeque', N'Ferreñafe ', N'Pitipo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140206', N'Lambayeque', N'Ferreñafe ', N'Pueblo Nuevo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140300', N'Lambayeque', N'Lambayeque ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140301', N'Lambayeque', N'Lambayeque ', N'Lambayeque')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140302', N'Lambayeque', N'Lambayeque ', N'Chochope')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140303', N'Lambayeque', N'Lambayeque ', N'Illimo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140304', N'Lambayeque', N'Lambayeque ', N'Jayanca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140305', N'Lambayeque', N'Lambayeque ', N'Mochumi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140306', N'Lambayeque', N'Lambayeque ', N'Morrope')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140307', N'Lambayeque', N'Lambayeque ', N'Motupe')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140308', N'Lambayeque', N'Lambayeque ', N'Olmos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140309', N'Lambayeque', N'Lambayeque ', N'Pacora')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140310', N'Lambayeque', N'Lambayeque ', N'Salas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140311', N'Lambayeque', N'Lambayeque ', N'San José')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'140312', N'Lambayeque', N'Lambayeque ', N'Tucume')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150000', N'Lima', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150100', N'Lima', N'Lima ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150101', N'Lima', N'Lima ', N'Lima')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150102', N'Lima', N'Lima ', N'Ancón')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150103', N'Lima', N'Lima ', N'Ate')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150104', N'Lima', N'Lima ', N'Barranco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150105', N'Lima', N'Lima ', N'Breña')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150106', N'Lima', N'Lima ', N'Carabayllo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150107', N'Lima', N'Lima ', N'Chaclacayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150108', N'Lima', N'Lima ', N'Chorrillos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150109', N'Lima', N'Lima ', N'Cieneguilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150110', N'Lima', N'Lima ', N'Comas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150111', N'Lima', N'Lima ', N'El Agustino')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150112', N'Lima', N'Lima ', N'Independencia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150113', N'Lima', N'Lima ', N'Jesús María')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150114', N'Lima', N'Lima ', N'La Molina')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150115', N'Lima', N'Lima ', N'La Victoria')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150116', N'Lima', N'Lima ', N'Lince')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150117', N'Lima', N'Lima ', N'Los Olivos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150118', N'Lima', N'Lima ', N'Lurigancho')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150119', N'Lima', N'Lima ', N'Lurin')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150120', N'Lima', N'Lima ', N'Magdalena del Mar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150121', N'Lima', N'Lima ', N'Pueblo Libre')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150122', N'Lima', N'Lima ', N'Miraflores')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150123', N'Lima', N'Lima ', N'Pachacamac')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150124', N'Lima', N'Lima ', N'Pucusana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150125', N'Lima', N'Lima ', N'Puente Piedra')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150126', N'Lima', N'Lima ', N'Punta Hermosa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150127', N'Lima', N'Lima ', N'Punta Negra')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150128', N'Lima', N'Lima ', N'Rímac')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150129', N'Lima', N'Lima ', N'San Bartolo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150130', N'Lima', N'Lima ', N'San Borja')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150131', N'Lima', N'Lima ', N'San Isidro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150132', N'Lima', N'Lima ', N'San Juan de Lurigancho')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150133', N'Lima', N'Lima ', N'San Juan de Miraflores')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150134', N'Lima', N'Lima ', N'San Luis')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150135', N'Lima', N'Lima ', N'San Martín de Porres')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150136', N'Lima', N'Lima ', N'San Miguel')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150137', N'Lima', N'Lima ', N'Santa Anita')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150138', N'Lima', N'Lima ', N'Santa María del Mar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150139', N'Lima', N'Lima ', N'Santa Rosa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150140', N'Lima', N'Lima ', N'Santiago de Surco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150141', N'Lima', N'Lima ', N'Surquillo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150142', N'Lima', N'Lima ', N'Villa El Salvador')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150143', N'Lima', N'Lima ', N'Villa María del Triunfo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150200', N'Lima', N'Barranca ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150201', N'Lima', N'Barranca ', N'Barranca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150202', N'Lima', N'Barranca ', N'Paramonga')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150203', N'Lima', N'Barranca ', N'Pativilca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150204', N'Lima', N'Barranca ', N'Supe')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150205', N'Lima', N'Barranca ', N'Supe Puerto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150300', N'Lima', N'Cajatambo ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150301', N'Lima', N'Cajatambo ', N'Cajatambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150302', N'Lima', N'Cajatambo ', N'Copa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150303', N'Lima', N'Cajatambo ', N'Gorgor')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150304', N'Lima', N'Cajatambo ', N'Huancapon')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150305', N'Lima', N'Cajatambo ', N'Manas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150400', N'Lima', N'Canta ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150401', N'Lima', N'Canta ', N'Canta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150402', N'Lima', N'Canta ', N'Arahuay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150403', N'Lima', N'Canta ', N'Huamantanga')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150404', N'Lima', N'Canta ', N'Huaros')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150405', N'Lima', N'Canta ', N'Lachaqui')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150406', N'Lima', N'Canta ', N'San Buenaventura')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150407', N'Lima', N'Canta ', N'Santa Rosa de Quives')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150500', N'Lima', N'Cañete ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150501', N'Lima', N'Cañete ', N'San Vicente de Cañete')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150502', N'Lima', N'Cañete ', N'Asia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150503', N'Lima', N'Cañete ', N'Calango')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150504', N'Lima', N'Cañete ', N'Cerro Azul')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150505', N'Lima', N'Cañete ', N'Chilca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150506', N'Lima', N'Cañete ', N'Coayllo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150507', N'Lima', N'Cañete ', N'Imperial')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150508', N'Lima', N'Cañete ', N'Lunahuana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150509', N'Lima', N'Cañete ', N'Mala')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150510', N'Lima', N'Cañete ', N'Nuevo Imperial')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150511', N'Lima', N'Cañete ', N'Pacaran')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150512', N'Lima', N'Cañete ', N'Quilmana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150513', N'Lima', N'Cañete ', N'San Antonio')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150514', N'Lima', N'Cañete ', N'San Luis')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150515', N'Lima', N'Cañete ', N'Santa Cruz de Flores')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150516', N'Lima', N'Cañete ', N'Zúñiga')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150600', N'Lima', N'Huaral ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150601', N'Lima', N'Huaral ', N'Huaral')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150602', N'Lima', N'Huaral ', N'Atavillos Alto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150603', N'Lima', N'Huaral ', N'Atavillos Bajo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150604', N'Lima', N'Huaral ', N'Aucallama')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150605', N'Lima', N'Huaral ', N'Chancay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150606', N'Lima', N'Huaral ', N'Ihuari')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150607', N'Lima', N'Huaral ', N'Lampian')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150608', N'Lima', N'Huaral ', N'Pacaraos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150609', N'Lima', N'Huaral ', N'San Miguel de Acos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150610', N'Lima', N'Huaral ', N'Santa Cruz de Andamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150611', N'Lima', N'Huaral ', N'Sumbilca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150612', N'Lima', N'Huaral ', N'Veintisiete de Noviembre')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150700', N'Lima', N'Huarochirí ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150701', N'Lima', N'Huarochirí ', N'Matucana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150702', N'Lima', N'Huarochirí ', N'Antioquia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150703', N'Lima', N'Huarochirí ', N'Callahuanca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150704', N'Lima', N'Huarochirí ', N'Carampoma')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150705', N'Lima', N'Huarochirí ', N'Chicla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150706', N'Lima', N'Huarochirí ', N'Cuenca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150707', N'Lima', N'Huarochirí ', N'Huachupampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150708', N'Lima', N'Huarochirí ', N'Huanza')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150709', N'Lima', N'Huarochirí ', N'Huarochiri')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150710', N'Lima', N'Huarochirí ', N'Lahuaytambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150711', N'Lima', N'Huarochirí ', N'Langa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150712', N'Lima', N'Huarochirí ', N'Laraos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150713', N'Lima', N'Huarochirí ', N'Mariatana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150714', N'Lima', N'Huarochirí ', N'Ricardo Palma')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150715', N'Lima', N'Huarochirí ', N'San Andrés de Tupicocha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150716', N'Lima', N'Huarochirí ', N'San Antonio')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150717', N'Lima', N'Huarochirí ', N'San Bartolomé')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150718', N'Lima', N'Huarochirí ', N'San Damian')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150719', N'Lima', N'Huarochirí ', N'San Juan de Iris')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150720', N'Lima', N'Huarochirí ', N'San Juan de Tantaranche')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150721', N'Lima', N'Huarochirí ', N'San Lorenzo de Quinti')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150722', N'Lima', N'Huarochirí ', N'San Mateo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150723', N'Lima', N'Huarochirí ', N'San Mateo de Otao')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150724', N'Lima', N'Huarochirí ', N'San Pedro de Casta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150725', N'Lima', N'Huarochirí ', N'San Pedro de Huancayre')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150726', N'Lima', N'Huarochirí ', N'Sangallaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150727', N'Lima', N'Huarochirí ', N'Santa Cruz de Cocachacra')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150728', N'Lima', N'Huarochirí ', N'Santa Eulalia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150729', N'Lima', N'Huarochirí ', N'Santiago de Anchucaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150730', N'Lima', N'Huarochirí ', N'Santiago de Tuna')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150731', N'Lima', N'Huarochirí ', N'Santo Domingo de Los Olleros')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150732', N'Lima', N'Huarochirí ', N'Surco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150800', N'Lima', N'Huaura ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150801', N'Lima', N'Huaura ', N'Huacho')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150802', N'Lima', N'Huaura ', N'Ambar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150803', N'Lima', N'Huaura ', N'Caleta de Carquin')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150804', N'Lima', N'Huaura ', N'Checras')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150805', N'Lima', N'Huaura ', N'Hualmay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150806', N'Lima', N'Huaura ', N'Huaura')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150807', N'Lima', N'Huaura ', N'Leoncio Prado')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150808', N'Lima', N'Huaura ', N'Paccho')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150809', N'Lima', N'Huaura ', N'Santa Leonor')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150810', N'Lima', N'Huaura ', N'Santa María')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150811', N'Lima', N'Huaura ', N'Sayan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150812', N'Lima', N'Huaura ', N'Vegueta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150900', N'Lima', N'Oyón ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150901', N'Lima', N'Oyón ', N'Oyon')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150902', N'Lima', N'Oyón ', N'Andajes')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150903', N'Lima', N'Oyón ', N'Caujul')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150904', N'Lima', N'Oyón ', N'Cochamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150905', N'Lima', N'Oyón ', N'Navan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'150906', N'Lima', N'Oyón ', N'Pachangara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151000', N'Lima', N'Yauyos ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151001', N'Lima', N'Yauyos ', N'Yauyos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151002', N'Lima', N'Yauyos ', N'Alis')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151003', N'Lima', N'Yauyos ', N'Allauca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151004', N'Lima', N'Yauyos ', N'Ayaviri')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151005', N'Lima', N'Yauyos ', N'Azángaro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151006', N'Lima', N'Yauyos ', N'Cacra')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151007', N'Lima', N'Yauyos ', N'Carania')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151008', N'Lima', N'Yauyos ', N'Catahuasi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151009', N'Lima', N'Yauyos ', N'Chocos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151010', N'Lima', N'Yauyos ', N'Cochas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151011', N'Lima', N'Yauyos ', N'Colonia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151012', N'Lima', N'Yauyos ', N'Hongos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151013', N'Lima', N'Yauyos ', N'Huampara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151014', N'Lima', N'Yauyos ', N'Huancaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151015', N'Lima', N'Yauyos ', N'Huangascar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151016', N'Lima', N'Yauyos ', N'Huantan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151017', N'Lima', N'Yauyos ', N'Huañec')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151018', N'Lima', N'Yauyos ', N'Laraos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151019', N'Lima', N'Yauyos ', N'Lincha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151020', N'Lima', N'Yauyos ', N'Madean')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151021', N'Lima', N'Yauyos ', N'Miraflores')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151022', N'Lima', N'Yauyos ', N'Omas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151023', N'Lima', N'Yauyos ', N'Putinza')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151024', N'Lima', N'Yauyos ', N'Quinches')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151025', N'Lima', N'Yauyos ', N'Quinocay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151026', N'Lima', N'Yauyos ', N'San Joaquín')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151027', N'Lima', N'Yauyos ', N'San Pedro de Pilas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151028', N'Lima', N'Yauyos ', N'Tanta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151029', N'Lima', N'Yauyos ', N'Tauripampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151030', N'Lima', N'Yauyos ', N'Tomas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151031', N'Lima', N'Yauyos ', N'Tupe')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151032', N'Lima', N'Yauyos ', N'Viñac')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'151033', N'Lima', N'Yauyos ', N'Vitis')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160000', N'Loreto', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160100', N'Loreto', N'Maynas ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160101', N'Loreto', N'Maynas ', N'Iquitos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160102', N'Loreto', N'Maynas ', N'Alto Nanay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160103', N'Loreto', N'Maynas ', N'Fernando Lores')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160104', N'Loreto', N'Maynas ', N'Indiana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160105', N'Loreto', N'Maynas ', N'Las Amazonas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160106', N'Loreto', N'Maynas ', N'Mazan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160107', N'Loreto', N'Maynas ', N'Napo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160108', N'Loreto', N'Maynas ', N'Punchana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160110', N'Loreto', N'Maynas ', N'Torres Causana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160112', N'Loreto', N'Maynas ', N'Belén')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160113', N'Loreto', N'Maynas ', N'San Juan Bautista')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160200', N'Loreto', N'Alto Amazonas ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160201', N'Loreto', N'Alto Amazonas ', N'Yurimaguas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160202', N'Loreto', N'Alto Amazonas ', N'Balsapuerto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160205', N'Loreto', N'Alto Amazonas ', N'Jeberos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160206', N'Loreto', N'Alto Amazonas ', N'Lagunas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160210', N'Loreto', N'Alto Amazonas ', N'Santa Cruz')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160211', N'Loreto', N'Alto Amazonas ', N'Teniente Cesar López Rojas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160300', N'Loreto', N'Loreto ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160301', N'Loreto', N'Loreto ', N'Nauta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160302', N'Loreto', N'Loreto ', N'Parinari')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160303', N'Loreto', N'Loreto ', N'Tigre')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160304', N'Loreto', N'Loreto ', N'Trompeteros')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160305', N'Loreto', N'Loreto ', N'Urarinas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160400', N'Loreto', N'Mariscal Ramón Castilla ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160401', N'Loreto', N'Mariscal Ramón Castilla ', N'Ramón Castilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160402', N'Loreto', N'Mariscal Ramón Castilla ', N'Pebas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160403', N'Loreto', N'Mariscal Ramón Castilla ', N'Yavari')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160404', N'Loreto', N'Mariscal Ramón Castilla ', N'San Pablo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160500', N'Loreto', N'Requena ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160501', N'Loreto', N'Requena ', N'Requena')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160502', N'Loreto', N'Requena ', N'Alto Tapiche')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160503', N'Loreto', N'Requena ', N'Capelo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160504', N'Loreto', N'Requena ', N'Emilio San Martín')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160505', N'Loreto', N'Requena ', N'Maquia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160506', N'Loreto', N'Requena ', N'Puinahua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160507', N'Loreto', N'Requena ', N'Saquena')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160508', N'Loreto', N'Requena ', N'Soplin')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160509', N'Loreto', N'Requena ', N'Tapiche')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160510', N'Loreto', N'Requena ', N'Jenaro Herrera')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160511', N'Loreto', N'Requena ', N'Yaquerana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160600', N'Loreto', N'Ucayali ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160601', N'Loreto', N'Ucayali ', N'Contamana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160602', N'Loreto', N'Ucayali ', N'Inahuaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160603', N'Loreto', N'Ucayali ', N'Padre Márquez')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160604', N'Loreto', N'Ucayali ', N'Pampa Hermosa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160605', N'Loreto', N'Ucayali ', N'Sarayacu')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160606', N'Loreto', N'Ucayali ', N'Vargas Guerra')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160700', N'Loreto', N'Datem del Marañón ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160701', N'Loreto', N'Datem del Marañón ', N'Barranca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160702', N'Loreto', N'Datem del Marañón ', N'Cahuapanas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160703', N'Loreto', N'Datem del Marañón ', N'Manseriche')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160704', N'Loreto', N'Datem del Marañón ', N'Morona')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160705', N'Loreto', N'Datem del Marañón ', N'Pastaza')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160706', N'Loreto', N'Datem del Marañón ', N'Andoas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160800', N'Loreto', N'Putumayo', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160801', N'Loreto', N'Putumayo', N'Putumayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160802', N'Loreto', N'Putumayo', N'Rosa Panduro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160803', N'Loreto', N'Putumayo', N'Teniente Manuel Clavero')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'160804', N'Loreto', N'Putumayo', N'Yaguas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'170000', N'Madre de Dios', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'170100', N'Madre de Dios', N'Tambopata ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'170101', N'Madre de Dios', N'Tambopata ', N'Tambopata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'170102', N'Madre de Dios', N'Tambopata ', N'Inambari')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'170103', N'Madre de Dios', N'Tambopata ', N'Las Piedras')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'170104', N'Madre de Dios', N'Tambopata ', N'Laberinto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'170200', N'Madre de Dios', N'Manu ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'170201', N'Madre de Dios', N'Manu ', N'Manu')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'170202', N'Madre de Dios', N'Manu ', N'Fitzcarrald')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'170203', N'Madre de Dios', N'Manu ', N'Madre de Dios')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'170204', N'Madre de Dios', N'Manu ', N'Huepetuhe')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'170300', N'Madre de Dios', N'Tahuamanu ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'170301', N'Madre de Dios', N'Tahuamanu ', N'Iñapari')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'170302', N'Madre de Dios', N'Tahuamanu ', N'Iberia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'170303', N'Madre de Dios', N'Tahuamanu ', N'Tahuamanu')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180000', N'Moquegua', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180100', N'Moquegua', N'Mariscal Nieto ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180101', N'Moquegua', N'Mariscal Nieto ', N'Moquegua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180102', N'Moquegua', N'Mariscal Nieto ', N'Carumas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180103', N'Moquegua', N'Mariscal Nieto ', N'Cuchumbaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180104', N'Moquegua', N'Mariscal Nieto ', N'Samegua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180105', N'Moquegua', N'Mariscal Nieto ', N'San Cristóbal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180106', N'Moquegua', N'Mariscal Nieto ', N'Torata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180200', N'Moquegua', N'General Sánchez Cerro ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180201', N'Moquegua', N'General Sánchez Cerro ', N'Omate')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180202', N'Moquegua', N'General Sánchez Cerro ', N'Chojata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180203', N'Moquegua', N'General Sánchez Cerro ', N'Coalaque')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180204', N'Moquegua', N'General Sánchez Cerro ', N'Ichuña')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180205', N'Moquegua', N'General Sánchez Cerro ', N'La Capilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180206', N'Moquegua', N'General Sánchez Cerro ', N'Lloque')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180207', N'Moquegua', N'General Sánchez Cerro ', N'Matalaque')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180208', N'Moquegua', N'General Sánchez Cerro ', N'Puquina')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180209', N'Moquegua', N'General Sánchez Cerro ', N'Quinistaquillas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180210', N'Moquegua', N'General Sánchez Cerro ', N'Ubinas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180211', N'Moquegua', N'General Sánchez Cerro ', N'Yunga')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180300', N'Moquegua', N'Ilo ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180301', N'Moquegua', N'Ilo ', N'Ilo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180302', N'Moquegua', N'Ilo ', N'El Algarrobal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'180303', N'Moquegua', N'Ilo ', N'Pacocha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190000', N'Pasco', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190100', N'Pasco', N'Pasco ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190101', N'Pasco', N'Pasco ', N'Chaupimarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190102', N'Pasco', N'Pasco ', N'Huachon')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190103', N'Pasco', N'Pasco ', N'Huariaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190104', N'Pasco', N'Pasco ', N'Huayllay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190105', N'Pasco', N'Pasco ', N'Ninacaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190106', N'Pasco', N'Pasco ', N'Pallanchacra')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190107', N'Pasco', N'Pasco ', N'Paucartambo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190108', N'Pasco', N'Pasco ', N'San Francisco de Asís de Yarusyacan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190109', N'Pasco', N'Pasco ', N'Simon Bolívar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190110', N'Pasco', N'Pasco ', N'Ticlacayan')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190111', N'Pasco', N'Pasco ', N'Tinyahuarco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190112', N'Pasco', N'Pasco ', N'Vicco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190113', N'Pasco', N'Pasco ', N'Yanacancha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190200', N'Pasco', N'Daniel Alcides Carrión ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190201', N'Pasco', N'Daniel Alcides Carrión ', N'Yanahuanca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190202', N'Pasco', N'Daniel Alcides Carrión ', N'Chacayan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190203', N'Pasco', N'Daniel Alcides Carrión ', N'Goyllarisquizga')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190204', N'Pasco', N'Daniel Alcides Carrión ', N'Paucar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190205', N'Pasco', N'Daniel Alcides Carrión ', N'San Pedro de Pillao')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190206', N'Pasco', N'Daniel Alcides Carrión ', N'Santa Ana de Tusi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190207', N'Pasco', N'Daniel Alcides Carrión ', N'Tapuc')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190208', N'Pasco', N'Daniel Alcides Carrión ', N'Vilcabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190300', N'Pasco', N'Oxapampa ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190301', N'Pasco', N'Oxapampa ', N'Oxapampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190302', N'Pasco', N'Oxapampa ', N'Chontabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190303', N'Pasco', N'Oxapampa ', N'Huancabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190304', N'Pasco', N'Oxapampa ', N'Palcazu')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190305', N'Pasco', N'Oxapampa ', N'Pozuzo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190306', N'Pasco', N'Oxapampa ', N'Puerto Bermúdez')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190307', N'Pasco', N'Oxapampa ', N'Villa Rica')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'190308', N'Pasco', N'Oxapampa ', N'Constitución')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200000', N'Piura', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200100', N'Piura', N'Piura ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200101', N'Piura', N'Piura ', N'Piura')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200104', N'Piura', N'Piura ', N'Castilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200105', N'Piura', N'Piura ', N'Atacaos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200107', N'Piura', N'Piura ', N'Cura Mori')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200108', N'Piura', N'Piura ', N'El Tallan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200109', N'Piura', N'Piura ', N'La Arena')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200110', N'Piura', N'Piura ', N'La Unión')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200111', N'Piura', N'Piura ', N'Las Lomas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200114', N'Piura', N'Piura ', N'Tambo Grande')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200115', N'Piura', N'Piura ', N'Veintiseis de Octubre')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200200', N'Piura', N'Ayabaca ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200201', N'Piura', N'Ayabaca ', N'Ayabaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200202', N'Piura', N'Ayabaca ', N'Frias')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200203', N'Piura', N'Ayabaca ', N'Jilili')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200204', N'Piura', N'Ayabaca ', N'Lagunas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200205', N'Piura', N'Ayabaca ', N'Montero')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200206', N'Piura', N'Ayabaca ', N'Pacaipampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200207', N'Piura', N'Ayabaca ', N'Paimas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200208', N'Piura', N'Ayabaca ', N'Sapillica')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200209', N'Piura', N'Ayabaca ', N'Sicchez')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200210', N'Piura', N'Ayabaca ', N'Suyo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200300', N'Piura', N'Huancabamba ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200301', N'Piura', N'Huancabamba ', N'Huancabamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200302', N'Piura', N'Huancabamba ', N'Canchaque')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200303', N'Piura', N'Huancabamba ', N'El Carmen de la Frontera')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200304', N'Piura', N'Huancabamba ', N'Huarmaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200305', N'Piura', N'Huancabamba ', N'Lalaquiz')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200306', N'Piura', N'Huancabamba ', N'San Miguel de El Faique')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200307', N'Piura', N'Huancabamba ', N'Sondor')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200308', N'Piura', N'Huancabamba ', N'Sondorillo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200400', N'Piura', N'Morropón ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200401', N'Piura', N'Morropón ', N'Chulucanas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200402', N'Piura', N'Morropón ', N'Buenos Aires')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200403', N'Piura', N'Morropón ', N'Chalaco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200404', N'Piura', N'Morropón ', N'La Matanza')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200405', N'Piura', N'Morropón ', N'Morropon')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200406', N'Piura', N'Morropón ', N'Salitral')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200407', N'Piura', N'Morropón ', N'San Juan de Bigote')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200408', N'Piura', N'Morropón ', N'Santa Catalina de Mossa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200409', N'Piura', N'Morropón ', N'Santo Domingo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200410', N'Piura', N'Morropón ', N'Yamango')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200500', N'Piura', N'Paita ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200501', N'Piura', N'Paita ', N'Paita')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200502', N'Piura', N'Paita ', N'Amotape')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200503', N'Piura', N'Paita ', N'Arenal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200504', N'Piura', N'Paita ', N'Colan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200505', N'Piura', N'Paita ', N'La Huaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200506', N'Piura', N'Paita ', N'Tamarindo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200507', N'Piura', N'Paita ', N'Vichayal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200600', N'Piura', N'Sullana ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200601', N'Piura', N'Sullana ', N'Sullana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200602', N'Piura', N'Sullana ', N'Bellavista')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200603', N'Piura', N'Sullana ', N'Ignacio Escudero')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200604', N'Piura', N'Sullana ', N'Lancones')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200605', N'Piura', N'Sullana ', N'Marcavelica')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200606', N'Piura', N'Sullana ', N'Miguel Checa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200607', N'Piura', N'Sullana ', N'Querecotillo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200608', N'Piura', N'Sullana ', N'Salitral')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200700', N'Piura', N'Talara ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200701', N'Piura', N'Talara ', N'Pariñas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200702', N'Piura', N'Talara ', N'El Alto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200703', N'Piura', N'Talara ', N'La Brea')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200704', N'Piura', N'Talara ', N'Lobitos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200705', N'Piura', N'Talara ', N'Los Organos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200706', N'Piura', N'Talara ', N'Mancora')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200800', N'Piura', N'Sechura ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200801', N'Piura', N'Sechura ', N'Sechura')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200802', N'Piura', N'Sechura ', N'Bellavista de la Unión')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200803', N'Piura', N'Sechura ', N'Bernal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200804', N'Piura', N'Sechura ', N'Cristo Nos Valga')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200805', N'Piura', N'Sechura ', N'Vice')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'200806', N'Piura', N'Sechura ', N'Rinconada Llicuar')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210000', N'Puno', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210100', N'Puno', N'Puno ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210101', N'Puno', N'Puno ', N'Puno')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210102', N'Puno', N'Puno ', N'Acora')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210103', N'Puno', N'Puno ', N'Amantani')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210104', N'Puno', N'Puno ', N'Atuncolla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210105', N'Puno', N'Puno ', N'Capachica')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210106', N'Puno', N'Puno ', N'Chucuito')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210107', N'Puno', N'Puno ', N'Coata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210108', N'Puno', N'Puno ', N'Huata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210109', N'Puno', N'Puno ', N'Mañazo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210110', N'Puno', N'Puno ', N'Paucarcolla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210111', N'Puno', N'Puno ', N'Pichacani')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210112', N'Puno', N'Puno ', N'Plateria')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210113', N'Puno', N'Puno ', N'San Antonio')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210114', N'Puno', N'Puno ', N'Tiquillaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210115', N'Puno', N'Puno ', N'Vilque')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210200', N'Puno', N'Azángaro ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210201', N'Puno', N'Azángaro ', N'Azángaro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210202', N'Puno', N'Azángaro ', N'Achaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210203', N'Puno', N'Azángaro ', N'Arapa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210204', N'Puno', N'Azángaro ', N'Asillo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210205', N'Puno', N'Azángaro ', N'Caminaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210206', N'Puno', N'Azángaro ', N'Chupa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210207', N'Puno', N'Azángaro ', N'José Domingo Choquehuanca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210208', N'Puno', N'Azángaro ', N'Muñani')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210209', N'Puno', N'Azángaro ', N'Potoni')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210210', N'Puno', N'Azángaro ', N'Saman')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210211', N'Puno', N'Azángaro ', N'San Anton')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210212', N'Puno', N'Azángaro ', N'San José')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210213', N'Puno', N'Azángaro ', N'San Juan de Salinas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210214', N'Puno', N'Azángaro ', N'Santiago de Pupuja')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210215', N'Puno', N'Azángaro ', N'Tirapata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210300', N'Puno', N'Carabaya ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210301', N'Puno', N'Carabaya ', N'Macusani')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210302', N'Puno', N'Carabaya ', N'Ajoyani')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210303', N'Puno', N'Carabaya ', N'Ayapata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210304', N'Puno', N'Carabaya ', N'Coasa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210305', N'Puno', N'Carabaya ', N'Corani')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210306', N'Puno', N'Carabaya ', N'Crucero')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210307', N'Puno', N'Carabaya ', N'Ituata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210308', N'Puno', N'Carabaya ', N'Ollachea')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210309', N'Puno', N'Carabaya ', N'San Gaban')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210310', N'Puno', N'Carabaya ', N'Usicayos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210400', N'Puno', N'Chucuito ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210401', N'Puno', N'Chucuito ', N'Juli')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210402', N'Puno', N'Chucuito ', N'Desaguadero')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210403', N'Puno', N'Chucuito ', N'Huacullani')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210404', N'Puno', N'Chucuito ', N'Kelluyo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210405', N'Puno', N'Chucuito ', N'Pisacoma')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210406', N'Puno', N'Chucuito ', N'Pomata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210407', N'Puno', N'Chucuito ', N'Zepita')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210500', N'Puno', N'El Collao ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210501', N'Puno', N'El Collao ', N'Ilave')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210502', N'Puno', N'El Collao ', N'Capazo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210503', N'Puno', N'El Collao ', N'Pilcuyo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210504', N'Puno', N'El Collao ', N'Santa Rosa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210505', N'Puno', N'El Collao ', N'Conduriri')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210600', N'Puno', N'Huancané ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210601', N'Puno', N'Huancané ', N'Huancane')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210602', N'Puno', N'Huancané ', N'Cojata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210603', N'Puno', N'Huancané ', N'Huatasani')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210604', N'Puno', N'Huancané ', N'Inchupalla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210605', N'Puno', N'Huancané ', N'Pusi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210606', N'Puno', N'Huancané ', N'Rosaspata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210607', N'Puno', N'Huancané ', N'Taraco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210608', N'Puno', N'Huancané ', N'Vilque Chico')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210700', N'Puno', N'Lampa ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210701', N'Puno', N'Lampa ', N'Lampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210702', N'Puno', N'Lampa ', N'Cabanilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210703', N'Puno', N'Lampa ', N'Calapuja')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210704', N'Puno', N'Lampa ', N'Nicasio')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210705', N'Puno', N'Lampa ', N'Ocuviri')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210706', N'Puno', N'Lampa ', N'Palca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210707', N'Puno', N'Lampa ', N'Paratia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210708', N'Puno', N'Lampa ', N'Pucara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210709', N'Puno', N'Lampa ', N'Santa Lucia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210710', N'Puno', N'Lampa ', N'Vilavila')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210800', N'Puno', N'Melgar ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210801', N'Puno', N'Melgar ', N'Ayaviri')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210802', N'Puno', N'Melgar ', N'Antauta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210803', N'Puno', N'Melgar ', N'Cupi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210804', N'Puno', N'Melgar ', N'Llalli')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210805', N'Puno', N'Melgar ', N'Macari')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210806', N'Puno', N'Melgar ', N'Nuñoa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210807', N'Puno', N'Melgar ', N'Orurillo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210808', N'Puno', N'Melgar ', N'Santa Rosa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210809', N'Puno', N'Melgar ', N'Umachiri')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210900', N'Puno', N'Moho ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210901', N'Puno', N'Moho ', N'Moho')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210902', N'Puno', N'Moho ', N'Conima')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210903', N'Puno', N'Moho ', N'Huayrapata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'210904', N'Puno', N'Moho ', N'Tilali')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211000', N'Puno', N'San Antonio de Putina ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211001', N'Puno', N'San Antonio de Putina ', N'Putina')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211002', N'Puno', N'San Antonio de Putina ', N'Ananea')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211003', N'Puno', N'San Antonio de Putina ', N'Pedro Vilca Apaza')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211004', N'Puno', N'San Antonio de Putina ', N'Quilcapuncu')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211005', N'Puno', N'San Antonio de Putina ', N'Sina')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211100', N'Puno', N'San Román ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211101', N'Puno', N'San Román ', N'Juliaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211102', N'Puno', N'San Román ', N'Cabana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211103', N'Puno', N'San Román ', N'Cabanillas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211104', N'Puno', N'San Román ', N'Caracoto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211200', N'Puno', N'Sandia ', NULL)
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211201', N'Puno', N'Sandia ', N'Sandia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211202', N'Puno', N'Sandia ', N'Cuyocuyo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211203', N'Puno', N'Sandia ', N'Limbani')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211204', N'Puno', N'Sandia ', N'Patambuco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211205', N'Puno', N'Sandia ', N'Phara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211206', N'Puno', N'Sandia ', N'Quiaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211207', N'Puno', N'Sandia ', N'San Juan del Oro')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211208', N'Puno', N'Sandia ', N'Yanahuaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211209', N'Puno', N'Sandia ', N'Alto Inambari')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211210', N'Puno', N'Sandia ', N'San Pedro de Putina Punco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211300', N'Puno', N'Yunguyo ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211301', N'Puno', N'Yunguyo ', N'Yunguyo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211302', N'Puno', N'Yunguyo ', N'Anapia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211303', N'Puno', N'Yunguyo ', N'Copani')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211304', N'Puno', N'Yunguyo ', N'Cuturapi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211305', N'Puno', N'Yunguyo ', N'Ollaraya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211306', N'Puno', N'Yunguyo ', N'Tinicachi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'211307', N'Puno', N'Yunguyo ', N'Unicachi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220000', N'San Martín', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220100', N'San Martín', N'Moyobamba ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220101', N'San Martín', N'Moyobamba ', N'Moyobamba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220102', N'San Martín', N'Moyobamba ', N'Calzada')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220103', N'San Martín', N'Moyobamba ', N'Habana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220104', N'San Martín', N'Moyobamba ', N'Jepelacio')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220105', N'San Martín', N'Moyobamba ', N'Soritor')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220106', N'San Martín', N'Moyobamba ', N'Yantalo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220200', N'San Martín', N'Bellavista ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220201', N'San Martín', N'Bellavista ', N'Bellavista')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220202', N'San Martín', N'Bellavista ', N'Alto Biavo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220203', N'San Martín', N'Bellavista ', N'Bajo Biavo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220204', N'San Martín', N'Bellavista ', N'Huallaga')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220205', N'San Martín', N'Bellavista ', N'San Pablo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220206', N'San Martín', N'Bellavista ', N'San Rafael')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220300', N'San Martín', N'El Dorado ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220301', N'San Martín', N'El Dorado ', N'San José de Sisa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220302', N'San Martín', N'El Dorado ', N'Agua Blanca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220303', N'San Martín', N'El Dorado ', N'San Martín')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220304', N'San Martín', N'El Dorado ', N'Santa Rosa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220305', N'San Martín', N'El Dorado ', N'Shatoja')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220400', N'San Martín', N'Huallaga ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220401', N'San Martín', N'Huallaga ', N'Saposoa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220402', N'San Martín', N'Huallaga ', N'Alto Saposoa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220403', N'San Martín', N'Huallaga ', N'El Eslabón')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220404', N'San Martín', N'Huallaga ', N'Piscoyacu')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220405', N'San Martín', N'Huallaga ', N'Sacanche')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220406', N'San Martín', N'Huallaga ', N'Tingo de Saposoa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220500', N'San Martín', N'Lamas ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220501', N'San Martín', N'Lamas ', N'Lamas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220502', N'San Martín', N'Lamas ', N'Alonso de Alvarado')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220503', N'San Martín', N'Lamas ', N'Barranquita')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220504', N'San Martín', N'Lamas ', N'Caynarachi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220505', N'San Martín', N'Lamas ', N'Cuñumbuqui')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220506', N'San Martín', N'Lamas ', N'Pinto Recodo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220507', N'San Martín', N'Lamas ', N'Rumisapa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220508', N'San Martín', N'Lamas ', N'San Roque de Cumbaza')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220509', N'San Martín', N'Lamas ', N'Shanao')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220510', N'San Martín', N'Lamas ', N'Tabalosos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220511', N'San Martín', N'Lamas ', N'Zapatero')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220600', N'San Martín', N'Mariscal Cáceres ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220601', N'San Martín', N'Mariscal Cáceres ', N'Juanjuí')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220602', N'San Martín', N'Mariscal Cáceres ', N'Campanilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220603', N'San Martín', N'Mariscal Cáceres ', N'Huicungo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220604', N'San Martín', N'Mariscal Cáceres ', N'Pachiza')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220605', N'San Martín', N'Mariscal Cáceres ', N'Pajarillo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220700', N'San Martín', N'Picota ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220701', N'San Martín', N'Picota ', N'Picota')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220702', N'San Martín', N'Picota ', N'Buenos Aires')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220703', N'San Martín', N'Picota ', N'Caspisapa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220704', N'San Martín', N'Picota ', N'Pilluana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220705', N'San Martín', N'Picota ', N'Pucacaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220706', N'San Martín', N'Picota ', N'San Cristóbal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220707', N'San Martín', N'Picota ', N'San Hilarión')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220708', N'San Martín', N'Picota ', N'Shamboyacu')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220709', N'San Martín', N'Picota ', N'Tingo de Ponasa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220710', N'San Martín', N'Picota ', N'Tres Unidos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220800', N'San Martín', N'Rioja ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220801', N'San Martín', N'Rioja ', N'Rioja')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220802', N'San Martín', N'Rioja ', N'Awajun')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220803', N'San Martín', N'Rioja ', N'Elías Soplin Vargas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220804', N'San Martín', N'Rioja ', N'Nueva Cajamarca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220805', N'San Martín', N'Rioja ', N'Pardo Miguel')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220806', N'San Martín', N'Rioja ', N'Posic')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220807', N'San Martín', N'Rioja ', N'San Fernando')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220808', N'San Martín', N'Rioja ', N'Yorongos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220809', N'San Martín', N'Rioja ', N'Yuracyacu')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220900', N'San Martín', N'San Martín ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220901', N'San Martín', N'San Martín ', N'Tarapoto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220902', N'San Martín', N'San Martín ', N'Alberto Leveau')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220903', N'San Martín', N'San Martín ', N'Cacatachi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220904', N'San Martín', N'San Martín ', N'Chazuta')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220905', N'San Martín', N'San Martín ', N'Chipurana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220906', N'San Martín', N'San Martín ', N'El Porvenir')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220907', N'San Martín', N'San Martín ', N'Huimbayoc')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220908', N'San Martín', N'San Martín ', N'Juan Guerra')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220909', N'San Martín', N'San Martín ', N'La Banda de Shilcayo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220910', N'San Martín', N'San Martín ', N'Morales')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220911', N'San Martín', N'San Martín ', N'Papaplaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220912', N'San Martín', N'San Martín ', N'San Antonio')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220913', N'San Martín', N'San Martín ', N'Sauce')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'220914', N'San Martín', N'San Martín ', N'Shapaja')
GO
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'221000', N'San Martín', N'Tocache ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'221001', N'San Martín', N'Tocache ', N'Tocache')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'221002', N'San Martín', N'Tocache ', N'Nuevo Progreso')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'221003', N'San Martín', N'Tocache ', N'Polvora')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'221004', N'San Martín', N'Tocache ', N'Shunte')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'221005', N'San Martín', N'Tocache ', N'Uchiza')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230000', N'Tacna', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230100', N'Tacna', N'Tacna ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230101', N'Tacna', N'Tacna ', N'Tacna')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230102', N'Tacna', N'Tacna ', N'Alto de la Alianza')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230103', N'Tacna', N'Tacna ', N'Calana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230104', N'Tacna', N'Tacna ', N'Ciudad Nueva')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230105', N'Tacna', N'Tacna ', N'Inclan')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230106', N'Tacna', N'Tacna ', N'Pachia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230107', N'Tacna', N'Tacna ', N'Palca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230108', N'Tacna', N'Tacna ', N'Pocollay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230109', N'Tacna', N'Tacna ', N'Sama')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230110', N'Tacna', N'Tacna ', N'Coronel Gregorio Albarracín Lanchipa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230200', N'Tacna', N'Candarave ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230201', N'Tacna', N'Candarave ', N'Candarave')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230202', N'Tacna', N'Candarave ', N'Cairani')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230203', N'Tacna', N'Candarave ', N'Camilaca')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230204', N'Tacna', N'Candarave ', N'Curibaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230205', N'Tacna', N'Candarave ', N'Huanuara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230206', N'Tacna', N'Candarave ', N'Quilahuani')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230300', N'Tacna', N'Jorge Basadre ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230301', N'Tacna', N'Jorge Basadre ', N'Locumba')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230302', N'Tacna', N'Jorge Basadre ', N'Ilabaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230303', N'Tacna', N'Jorge Basadre ', N'Ite')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230400', N'Tacna', N'Tarata ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230401', N'Tacna', N'Tarata ', N'Tarata')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230402', N'Tacna', N'Tarata ', N'Héroes Albarracín')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230403', N'Tacna', N'Tarata ', N'Estique')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230404', N'Tacna', N'Tarata ', N'Estique-Pampa')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230405', N'Tacna', N'Tarata ', N'Sitajara')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230406', N'Tacna', N'Tarata ', N'Susapaya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230407', N'Tacna', N'Tarata ', N'Tarucachi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'230408', N'Tacna', N'Tarata ', N'Ticaco')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240000', N'Tumbes', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240100', N'Tumbes', N'Tumbes ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240101', N'Tumbes', N'Tumbes ', N'Tumbes')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240102', N'Tumbes', N'Tumbes ', N'Corrales')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240103', N'Tumbes', N'Tumbes ', N'La Cruz')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240104', N'Tumbes', N'Tumbes ', N'Pampas de Hospital')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240105', N'Tumbes', N'Tumbes ', N'San Jacinto')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240106', N'Tumbes', N'Tumbes ', N'San Juan de la Virgen')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240200', N'Tumbes', N'Contralmirante Villar ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240201', N'Tumbes', N'Contralmirante Villar ', N'Zorritos')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240202', N'Tumbes', N'Contralmirante Villar ', N'Casitas')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240203', N'Tumbes', N'Contralmirante Villar ', N'Canoas de Punta Sal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240300', N'Tumbes', N'Zarumilla ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240301', N'Tumbes', N'Zarumilla ', N'Zarumilla')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240302', N'Tumbes', N'Zarumilla ', N'Aguas Verdes')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240303', N'Tumbes', N'Zarumilla ', N'Matapalo')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'240304', N'Tumbes', N'Zarumilla ', N'Papayal')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250000', N'Ucayali', NULL, NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250100', N'Ucayali', N'Coronel Portillo ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250101', N'Ucayali', N'Coronel Portillo ', N'Calleria')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250102', N'Ucayali', N'Coronel Portillo ', N'Campoverde')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250103', N'Ucayali', N'Coronel Portillo ', N'Iparia')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250104', N'Ucayali', N'Coronel Portillo ', N'Masisea')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250105', N'Ucayali', N'Coronel Portillo ', N'Yarinacocha')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250106', N'Ucayali', N'Coronel Portillo ', N'Nueva Requena')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250107', N'Ucayali', N'Coronel Portillo ', N'Manantay')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250200', N'Ucayali', N'Atalaya ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250201', N'Ucayali', N'Atalaya ', N'Raymondi')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250202', N'Ucayali', N'Atalaya ', N'Sepahua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250203', N'Ucayali', N'Atalaya ', N'Tahuania')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250204', N'Ucayali', N'Atalaya ', N'Yurua')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250300', N'Ucayali', N'Padre Abad ', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250301', N'Ucayali', N'Padre Abad ', N'Padre Abad')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250302', N'Ucayali', N'Padre Abad ', N'Irazola')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250303', N'Ucayali', N'Padre Abad ', N'Curimana')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250304', N'Ucayali', N'Padre Abad ', N'Neshuya')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250305', N'Ucayali', N'Padre Abad ', N'Alexander Von Humboldt')
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250400', N'Ucayali', N'Purús', NULL)
INSERT [dbo].[ubigeo] ([id_ubigeo], [departamento], [provincia], [distrito]) VALUES (N'250401', N'Ucayali', N'Purús', N'Purus')
ALTER TABLE [dbo].[brecha_indicador]  WITH CHECK ADD  CONSTRAINT [fk_brecha_i_reference_brecha] FOREIGN KEY([id_brecha])
REFERENCES [dbo].[brecha] ([id_brecha])
GO
ALTER TABLE [dbo].[brecha_indicador] CHECK CONSTRAINT [fk_brecha_i_reference_brecha]
GO
ALTER TABLE [dbo].[brecha_indicador]  WITH CHECK ADD  CONSTRAINT [fk_brecha_i_reference_indicado] FOREIGN KEY([id_indicador])
REFERENCES [dbo].[indicador] ([id_indicador])
GO
ALTER TABLE [dbo].[brecha_indicador] CHECK CONSTRAINT [fk_brecha_i_reference_indicado]
GO
ALTER TABLE [dbo].[brecha_indicador]  WITH CHECK ADD  CONSTRAINT [fk_brecha_i_reference_serv_pub] FOREIGN KEY([id_serv_pub_asoc])
REFERENCES [dbo].[serv_pub_asoc] ([id_serv_pub_asoc])
GO
ALTER TABLE [dbo].[brecha_indicador] CHECK CONSTRAINT [fk_brecha_i_reference_serv_pub]
GO
ALTER TABLE [dbo].[division_funcional]  WITH CHECK ADD  CONSTRAINT [fk_division_reference_funcion] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[funcion] ([id_funcion])
GO
ALTER TABLE [dbo].[division_funcional] CHECK CONSTRAINT [fk_division_reference_funcion]
GO
ALTER TABLE [dbo].[entidad]  WITH CHECK ADD  CONSTRAINT [fk_entidad_reference_sector] FOREIGN KEY([id_sector])
REFERENCES [dbo].[sector] ([id_sector])
GO
ALTER TABLE [dbo].[entidad] CHECK CONSTRAINT [fk_entidad_reference_sector]
GO
ALTER TABLE [dbo].[fuente_financiamiento_pi]  WITH CHECK ADD  CONSTRAINT [fk_fuente_f_reference_fuente_f] FOREIGN KEY([id_fuente_financiamiento])
REFERENCES [dbo].[fuente_financiamiento] ([id_fuente_financiamiento])
GO
ALTER TABLE [dbo].[fuente_financiamiento_pi] CHECK CONSTRAINT [fk_fuente_f_reference_fuente_f]
GO
ALTER TABLE [dbo].[fuente_financiamiento_pi]  WITH CHECK ADD  CONSTRAINT [fk_fuente_f_reference_proyecto] FOREIGN KEY([id_proyecto_inversion])
REFERENCES [dbo].[proyecto_inversion] ([id_proyecto_inversion])
GO
ALTER TABLE [dbo].[fuente_financiamiento_pi] CHECK CONSTRAINT [fk_fuente_f_reference_proyecto]
GO
ALTER TABLE [dbo].[grupo_funcional]  WITH CHECK ADD  CONSTRAINT [fk_grupo_fu_reference_division] FOREIGN KEY([id_division_funcional])
REFERENCES [dbo].[division_funcional] ([id_division_funcional])
GO
ALTER TABLE [dbo].[grupo_funcional] CHECK CONSTRAINT [fk_grupo_fu_reference_division]
GO
ALTER TABLE [dbo].[grupo_funcional]  WITH CHECK ADD  CONSTRAINT [fk_grupo_fu_reference_sector] FOREIGN KEY([id_sector])
REFERENCES [dbo].[sector] ([id_sector])
GO
ALTER TABLE [dbo].[grupo_funcional] CHECK CONSTRAINT [fk_grupo_fu_reference_sector]
GO
ALTER TABLE [dbo].[modalidad_ejecucion_pi]  WITH CHECK ADD  CONSTRAINT [fk_modalida_reference_modalida] FOREIGN KEY([id_modalidad_ejec])
REFERENCES [dbo].[modalidad_ejecucion] ([id_modalidad_ejec])
GO
ALTER TABLE [dbo].[modalidad_ejecucion_pi] CHECK CONSTRAINT [fk_modalida_reference_modalida]
GO
ALTER TABLE [dbo].[modalidad_ejecucion_pi]  WITH CHECK ADD  CONSTRAINT [fk_modalida_reference_proyecto] FOREIGN KEY([id_proyecto_inversion])
REFERENCES [dbo].[proyecto_inversion] ([id_proyecto_inversion])
GO
ALTER TABLE [dbo].[modalidad_ejecucion_pi] CHECK CONSTRAINT [fk_modalida_reference_proyecto]
GO
ALTER TABLE [dbo].[programacion]  WITH CHECK ADD  CONSTRAINT [fk_programa_reference_brecha] FOREIGN KEY([id_brecha])
REFERENCES [dbo].[brecha] ([id_brecha])
GO
ALTER TABLE [dbo].[programacion] CHECK CONSTRAINT [fk_programa_reference_brecha]
GO
ALTER TABLE [dbo].[programacion]  WITH CHECK ADD  CONSTRAINT [fk_programa_reference_cartera_] FOREIGN KEY([id_cartera])
REFERENCES [dbo].[cartera_inversion] ([id_cartera])
GO
ALTER TABLE [dbo].[programacion] CHECK CONSTRAINT [fk_programa_reference_cartera_]
GO
ALTER TABLE [dbo].[programacion]  WITH CHECK ADD  CONSTRAINT [fk_programa_reference_proyecto] FOREIGN KEY([id_proyecto_inversion])
REFERENCES [dbo].[proyecto_inversion] ([id_proyecto_inversion])
GO
ALTER TABLE [dbo].[programacion] CHECK CONSTRAINT [fk_programa_reference_proyecto]
GO
ALTER TABLE [dbo].[proyecto_inversion]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_reference_estado_c] FOREIGN KEY([id_estado_ciclo])
REFERENCES [dbo].[estado_ciclo_inversion] ([id_estado_ciclo])
GO
ALTER TABLE [dbo].[proyecto_inversion] CHECK CONSTRAINT [fk_proyecto_reference_estado_c]
GO
ALTER TABLE [dbo].[proyecto_inversion]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_reference_grupo_fu] FOREIGN KEY([id_grupo_funcional])
REFERENCES [dbo].[grupo_funcional] ([id_grupo_funcional])
GO
ALTER TABLE [dbo].[proyecto_inversion] CHECK CONSTRAINT [fk_proyecto_reference_grupo_fu]
GO
ALTER TABLE [dbo].[proyecto_inversion]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_reference_naturale] FOREIGN KEY([id_naturalesa_inversion])
REFERENCES [dbo].[naturalesa_inversion] ([id_naturalesa_inversion])
GO
ALTER TABLE [dbo].[proyecto_inversion] CHECK CONSTRAINT [fk_proyecto_reference_naturale]
GO
ALTER TABLE [dbo].[proyecto_inversion]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_reference_nivel_go] FOREIGN KEY([id_nivel_gobierno])
REFERENCES [dbo].[nivel_gobierno] ([id_nivel_gobierno])
GO
ALTER TABLE [dbo].[proyecto_inversion] CHECK CONSTRAINT [fk_proyecto_reference_nivel_go]
GO
ALTER TABLE [dbo].[proyecto_inversion]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_reference_rubro_ej] FOREIGN KEY([id_rubro_ejecucion])
REFERENCES [dbo].[rubro_ejecucion] ([id_rubro_ejecucion])
GO
ALTER TABLE [dbo].[proyecto_inversion] CHECK CONSTRAINT [fk_proyecto_reference_rubro_ej]
GO
ALTER TABLE [dbo].[proyecto_inversion]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_reference_tipo_inv] FOREIGN KEY([id_tipo_inversion])
REFERENCES [dbo].[tipo_inversion] ([id_tipo_inversion])
GO
ALTER TABLE [dbo].[proyecto_inversion] CHECK CONSTRAINT [fk_proyecto_reference_tipo_inv]
GO
ALTER TABLE [dbo].[proyecto_inversion]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_reference_tipologi] FOREIGN KEY([id_tipologia_inversion])
REFERENCES [dbo].[tipologia_inversion] ([id_tipologia_inversion])
GO
ALTER TABLE [dbo].[proyecto_inversion] CHECK CONSTRAINT [fk_proyecto_reference_tipologi]
GO
ALTER TABLE [dbo].[proyecto_inversion]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_reference_unidad_e] FOREIGN KEY([id_ue])
REFERENCES [dbo].[unidad_ejecutora] ([id_ue])
GO
ALTER TABLE [dbo].[proyecto_inversion] CHECK CONSTRAINT [fk_proyecto_reference_unidad_e]
GO
ALTER TABLE [dbo].[proyecto_ubigeo]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_reference_proyecto] FOREIGN KEY([id_proyecto_inversion])
REFERENCES [dbo].[proyecto_inversion] ([id_proyecto_inversion])
GO
ALTER TABLE [dbo].[proyecto_ubigeo] CHECK CONSTRAINT [fk_proyecto_reference_proyecto]
GO
ALTER TABLE [dbo].[proyecto_ubigeo]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_reference_ubigeo] FOREIGN KEY([id_ubigeo])
REFERENCES [dbo].[ubigeo] ([id_ubigeo])
GO
ALTER TABLE [dbo].[proyecto_ubigeo] CHECK CONSTRAINT [fk_proyecto_reference_ubigeo]
GO
USE [master]
GO
ALTER DATABASE [DBSMP] SET  READ_WRITE 
GO
