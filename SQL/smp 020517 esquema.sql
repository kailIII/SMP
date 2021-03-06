USE [DBSMP]
GO
/****** Object:  Table [dbo].[brecha]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brecha](
	[id_brecha] [int] IDENTITY(1,1) NOT NULL,
	[nombre_brecha] [varchar](50) NULL,
	[desc_brecha] [varchar](100) NULL,
 CONSTRAINT [pk_brecha] PRIMARY KEY CLUSTERED 
(
	[id_brecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[brecha_indicador]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[brecha_indicador](
	[id_indicador] [int] NULL,
	[id_brecha] [int] NULL,
	[fecha_indicador] [date] NULL,
	[valor_indicador] [varchar](100) NULL,
	[linea_base_indicador] [varchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cartera_inversion]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[division_funcional]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[division_funcional](
	[id_division_funcional] [int] IDENTITY(1,1) NOT NULL,
	[id_funcion] [int] NULL,
	[codigo_dfuncional] [varchar](50) NULL,
	[nombre_dFuncional] [varchar](200) NULL,
 CONSTRAINT [pk_division_funcional] PRIMARY KEY CLUSTERED 
(
	[id_division_funcional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[entidad]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[entidad](
	[id_entidad] [int] IDENTITY(1,1) NOT NULL,
	[id_sector] [int] NULL,
	[nombre_entidad] [varchar](100) NULL,
	[denominacion_entidad] [varchar](100) NULL,
 CONSTRAINT [pk_entidad] PRIMARY KEY CLUSTERED 
(
	[id_entidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[estado_ciclo_inversion]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado_ciclo_inversion](
	[idcicloinversion] [int] IDENTITY(1,1) NOT NULL,
	[nombrecicloinversion] [varchar](200) NULL,
	[descripcioncicloinversion] [varchar](200) NULL,
	[fl_eliminado] [bit] NULL,
	[uscreado] [int] NULL,
	[feccreado] [datetime] NULL,
	[usmodif] [int] NULL,
	[fecmodif] [datetime] NULL,
	[uselimin] [int] NULL,
	[fecelimin] [datetime] NULL,
 CONSTRAINT [pk_estado_ciclo_inversion] PRIMARY KEY CLUSTERED 
(
	[idcicloinversion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fuente_financiamiento]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fuente_financiamiento](
	[idffto] [int] IDENTITY(1,1) NOT NULL,
	[nombreffto] [varchar](100) NULL,
	[acronimoffto] [varchar](50) NULL,
	[descripcionffto] [varchar](150) NULL,
	[fl_eliminado] [bit] NULL,
	[uscreado] [varchar](50) NULL,
	[feccreado] [datetime] NULL,
	[usmodif] [int] NULL,
	[fecmodif] [datetime] NULL,
	[uselimin] [int] NULL,
	[fecelimin] [datetime] NULL,
 CONSTRAINT [pk_fuente_financiamiento] PRIMARY KEY CLUSTERED 
(
	[idffto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fuente_financiamiento_pi]    Script Date: 2/05/2017 08:48:58 ******/
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
/****** Object:  Table [dbo].[funcion]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[funcion](
	[id_funcion] [int] IDENTITY(1,1) NOT NULL,
	[codigo_funcion] [varchar](50) NULL,
	[nombre_funcion] [varchar](200) NULL,
 CONSTRAINT [pk_funcion] PRIMARY KEY CLUSTERED 
(
	[id_funcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[grupo_funcional]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[grupo_funcional](
	[id_grupo_funcional] [int] IDENTITY(1,1) NOT NULL,
	[id_division_funcional] [int] NULL,
	[id_sector] [int] NULL,
	[codigo_g_funcional] [varchar](50) NULL,
	[nombre_g_funcional] [varchar](200) NULL,
 CONSTRAINT [pk_grupo_funcional] PRIMARY KEY CLUSTERED 
(
	[id_grupo_funcional] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[indicador]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[modalidad_ejecucion]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[modalidad_ejecucion](
	[id_modalidad_ejec] [int] IDENTITY(1,1) NOT NULL,
	[nombre_modalidad_ejec] [varchar](100) NULL,
	[desc_modalidad_ejec] [varchar](100) NULL,
 CONSTRAINT [pk_modalidad_ejecucion] PRIMARY KEY CLUSTERED 
(
	[id_modalidad_ejec] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[modalidad_ejecucion_pi]    Script Date: 2/05/2017 08:48:58 ******/
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
/****** Object:  Table [dbo].[naturalesa_inversion]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[naturalesa_inversion](
	[idnaturaleza] [int] IDENTITY(1,1) NOT NULL,
	[nombrenaturaleza] [varchar](200) NULL,
	[descripcionnaturaleza] [varchar](100) NULL,
	[fl_eliminado] [bit] NULL,
	[uscreado] [int] NULL,
	[feccreado] [datetime] NULL,
	[usmodif] [int] NULL,
	[fecmodif] [datetime] NULL,
	[uselimin] [int] NULL,
	[fecelimin] [datetime] NULL,
 CONSTRAINT [pk_naturalesa_inversion] PRIMARY KEY CLUSTERED 
(
	[idnaturaleza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[nivel_gobierno]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[nivel_gobierno](
	[idnivelgob] [int] IDENTITY(1,1) NOT NULL,
	[nombrenivelgob] [varchar](50) NULL,
	[descripcionnivelgob] [varchar](150) NULL,
	[fl_eliminado] [bit] NULL,
	[uscreado] [int] NULL,
	[feccreado] [datetime] NULL,
	[usmodif] [int] NULL,
	[fecmodif] [datetime] NULL,
	[uselimin] [int] NULL,
	[fecelimin] [datetime] NULL,
 CONSTRAINT [pk_nivel_gobierno] PRIMARY KEY CLUSTERED 
(
	[idnivelgob] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[programacion]    Script Date: 2/05/2017 08:48:58 ******/
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
/****** Object:  Table [dbo].[proyecto_inversion]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[proyecto_ubigeo]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[proyecto_ubigeo](
	[id_ubigeo] [varchar](6) NULL,
	[id_proyecto_inversion] [int] NULL,
	[descripcion_pro_ubi] [varchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[rubro_ejecucion]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[rubro_ejecucion](
	[id_rubro_ejecucion] [int] IDENTITY(1,1) NOT NULL,
	[nombre_rubro_ejec] [varchar](50) NULL,
	[descripcion_rubro_ejec] [varchar](200) NULL,
 CONSTRAINT [pk_rubro_ejecucion] PRIMARY KEY CLUSTERED 
(
	[id_rubro_ejecucion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sector]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[serv_pub_asoc]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[tipo_inversion]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipo_inversion](
	[idtipoinversion] [int] IDENTITY(1,1) NOT NULL,
	[nombretipoinversion] [varchar](50) NULL,
	[descripciontipoinversion] [varchar](150) NULL,
	[fl_eliminado] [bit] NULL,
	[uscreado] [int] NULL,
	[feccreado] [datetime] NULL,
	[usmodif] [int] NULL,
	[fecmodif] [datetime] NULL,
	[uselimin] [int] NULL,
	[fecelimin] [datetime] NULL,
 CONSTRAINT [pk_tipo_inversion] PRIMARY KEY CLUSTERED 
(
	[idtipoinversion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tipologia_inversion]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tipologia_inversion](
	[idtipologiainversion] [int] IDENTITY(1,1) NOT NULL,
	[nombretipologia] [varchar](200) NULL,
	[descripciontipologia] [varchar](150) NULL,
	[fl_eliminado] [bit] NULL,
	[uscreado] [int] NULL,
	[feccreado] [datetime] NULL,
	[usmodif] [int] NULL,
	[fecmodif] [datetime] NULL,
	[uselimin] [int] NULL,
	[fecelimin] [datetime] NULL,
 CONSTRAINT [pk_tipologia_inversion] PRIMARY KEY CLUSTERED 
(
	[idtipologiainversion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ubigeo]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
/****** Object:  Table [dbo].[unidad_ejecutora]    Script Date: 2/05/2017 08:48:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
REFERENCES [dbo].[fuente_financiamiento] ([idffto])
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
REFERENCES [dbo].[estado_ciclo_inversion] ([idcicloinversion])
GO
ALTER TABLE [dbo].[proyecto_inversion] CHECK CONSTRAINT [fk_proyecto_reference_estado_c]
GO
ALTER TABLE [dbo].[proyecto_inversion]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_reference_grupo_fu] FOREIGN KEY([id_grupo_funcional])
REFERENCES [dbo].[grupo_funcional] ([id_grupo_funcional])
GO
ALTER TABLE [dbo].[proyecto_inversion] CHECK CONSTRAINT [fk_proyecto_reference_grupo_fu]
GO
ALTER TABLE [dbo].[proyecto_inversion]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_reference_naturale] FOREIGN KEY([id_naturalesa_inversion])
REFERENCES [dbo].[naturalesa_inversion] ([idnaturaleza])
GO
ALTER TABLE [dbo].[proyecto_inversion] CHECK CONSTRAINT [fk_proyecto_reference_naturale]
GO
ALTER TABLE [dbo].[proyecto_inversion]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_reference_nivel_go] FOREIGN KEY([id_nivel_gobierno])
REFERENCES [dbo].[nivel_gobierno] ([idnivelgob])
GO
ALTER TABLE [dbo].[proyecto_inversion] CHECK CONSTRAINT [fk_proyecto_reference_nivel_go]
GO
ALTER TABLE [dbo].[proyecto_inversion]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_reference_rubro_ej] FOREIGN KEY([id_rubro_ejecucion])
REFERENCES [dbo].[rubro_ejecucion] ([id_rubro_ejecucion])
GO
ALTER TABLE [dbo].[proyecto_inversion] CHECK CONSTRAINT [fk_proyecto_reference_rubro_ej]
GO
ALTER TABLE [dbo].[proyecto_inversion]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_reference_tipo_inv] FOREIGN KEY([id_tipo_inversion])
REFERENCES [dbo].[tipo_inversion] ([idtipoinversion])
GO
ALTER TABLE [dbo].[proyecto_inversion] CHECK CONSTRAINT [fk_proyecto_reference_tipo_inv]
GO
ALTER TABLE [dbo].[proyecto_inversion]  WITH CHECK ADD  CONSTRAINT [fk_proyecto_reference_tipologi] FOREIGN KEY([id_tipologia_inversion])
REFERENCES [dbo].[tipologia_inversion] ([idtipologiainversion])
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
