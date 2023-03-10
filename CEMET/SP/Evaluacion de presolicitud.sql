
/****** Object:  Table [dbo].[CEvaluacion]    Script Date: 12/03/2023 02:40:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CEvaluacion](
	[CEVAL_Id] [int] IDENTITY(1,1) NOT NULL,
	[CEVAL_Punto_Evaluado] [nvarchar](150) NOT NULL,
	[CEVAL_Activo] [bit] NOT NULL,
	[CEVAL_FechaCreacion] [datetime] NOT NULL,
	[CEVAL_USU_Id_Creacion] [bigint] NOT NULL,
	[CEVAL_FechaModificacion] [datetime] NULL,
	[CEVAL_USU_Id_Modificacion] [bigint] NULL,
 CONSTRAINT [PK_CCategoria_Hallazgo] PRIMARY KEY CLUSTERED 
(
	[CEVAL_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CHallazgo]    Script Date: 12/03/2023 02:40:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CHallazgo](
	[HAL_Id] [int] IDENTITY(1,1) NOT NULL,
	[HAL_CEVAL_Id] [int] NOT NULL,
	[HAL_Hallazgo] [nvarchar](150) NOT NULL,
	[HAL_Activo] [bit] NOT NULL,
	[HAL_FechaCreacion] [datetime] NOT NULL,
	[HAL_USU_Id_Creacion] [bigint] NOT NULL,
	[HAL_FechaModificacion] [datetime] NULL,
	[HAL_USU_Id_Modificacion] [bigint] NULL,
 CONSTRAINT [PK_CHallazgo] PRIMARY KEY CLUSTERED 
(
	[HAL_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CVeredicto]    Script Date: 12/03/2023 02:40:40 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CVeredicto](
	[VER_Id] [int] IDENTITY(1,1) NOT NULL,
	[VER_Descripcion] [nvarchar](20) NOT NULL,
	[VER_Activo] [bit] NOT NULL,
	[VER_FechaCreacion] [datetime] NOT NULL,
	[VER_USU_Id_Creacion] [bigint] NOT NULL,
	[VER_FechaModificacion] [datetime] NULL,
	[VER_USU_Id_Modificacion] [bigint] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[CEvaluacion] ON 

INSERT [dbo].[CEvaluacion] ([CEVAL_Id], [CEVAL_Punto_Evaluado], [CEVAL_Activo], [CEVAL_FechaCreacion], [CEVAL_USU_Id_Creacion], [CEVAL_FechaModificacion], [CEVAL_USU_Id_Modificacion]) VALUES (1, N'La norma solicitada aplica a la muestra', 1, CAST(N'2023-03-11T21:30:19.303' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CEvaluacion] ([CEVAL_Id], [CEVAL_Punto_Evaluado], [CEVAL_Activo], [CEVAL_FechaCreacion], [CEVAL_USU_Id_Creacion], [CEVAL_FechaModificacion], [CEVAL_USU_Id_Modificacion]) VALUES (2, N'El estado físico de la muestra', 1, CAST(N'2023-03-11T21:30:19.303' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CEvaluacion] ([CEVAL_Id], [CEVAL_Punto_Evaluado], [CEVAL_Activo], [CEVAL_FechaCreacion], [CEVAL_USU_Id_Creacion], [CEVAL_FechaModificacion], [CEVAL_USU_Id_Modificacion]) VALUES (3, N'La muestra contiene los componentes necesarios para realizar pruebas', 1, CAST(N'2023-03-11T21:30:19.303' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CEvaluacion] ([CEVAL_Id], [CEVAL_Punto_Evaluado], [CEVAL_Activo], [CEVAL_FechaCreacion], [CEVAL_USU_Id_Creacion], [CEVAL_FechaModificacion], [CEVAL_USU_Id_Modificacion]) VALUES (4, N'Información comercial (Que contega instructivo, marcado, certificado (Nom-064))', 1, CAST(N'2023-03-11T21:30:19.303' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CEvaluacion] ([CEVAL_Id], [CEVAL_Punto_Evaluado], [CEVAL_Activo], [CEVAL_FechaCreacion], [CEVAL_USU_Id_Creacion], [CEVAL_FechaModificacion], [CEVAL_USU_Id_Modificacion]) VALUES (5, N'Instructivo: leyendas, símbología, idioma', 1, CAST(N'2023-03-11T21:30:19.303' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CEvaluacion] ([CEVAL_Id], [CEVAL_Punto_Evaluado], [CEVAL_Activo], [CEVAL_FechaCreacion], [CEVAL_USU_Id_Creacion], [CEVAL_FechaModificacion], [CEVAL_USU_Id_Modificacion]) VALUES (6, N'Marcado: tensión, corriente, frecuencia, potencia, marca, modelo, país de orígen', 1, CAST(N'2023-03-11T21:30:19.303' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CEvaluacion] ([CEVAL_Id], [CEVAL_Punto_Evaluado], [CEVAL_Activo], [CEVAL_FechaCreacion], [CEVAL_USU_Id_Creacion], [CEVAL_FechaModificacion], [CEVAL_USU_Id_Modificacion]) VALUES (7, N'La muestra es funcional', 1, CAST(N'2023-03-11T21:30:19.303' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CEvaluacion] OFF
GO
SET IDENTITY_INSERT [dbo].[CHallazgo] ON 

INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (1, 1, N'El producto no entra dentro del campo de aplicación de la norma', 1, CAST(N'2023-03-11T21:10:27.607' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (2, 2, N'Presenta roturas', 1, CAST(N'2023-03-11T21:10:27.607' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (3, 2, N'Presenta rasgaduras', 1, CAST(N'2023-03-11T21:10:27.607' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (4, 2, N'Los seguros tienen señales de uso excesivo', 1, CAST(N'2023-03-11T21:10:27.607' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (5, 2, N'Producto estrellado', 1, CAST(N'2023-03-11T21:10:27.607' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (6, 2, N'Producto con astillas', 1, CAST(N'2023-03-11T21:10:27.607' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (7, 3, N'Cables', 1, CAST(N'2023-03-11T21:10:27.607' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (8, 3, N'Rieles', 1, CAST(N'2023-03-11T21:10:27.607' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (9, 3, N'Herrajes', 1, CAST(N'2023-03-11T21:10:27.607' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (10, 3, N'Focos', 1, CAST(N'2023-03-11T21:10:27.607' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (11, 3, N'Llantas', 1, CAST(N'2023-03-11T21:10:27.607' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (12, 3, N'Portavasos', 1, CAST(N'2023-03-11T21:10:27.607' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (13, 3, N'Chaloras', 1, CAST(N'2023-03-11T21:10:27.607' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (14, 3, N'Colchón', 1, CAST(N'2023-03-11T21:10:27.607' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (15, 3, N'Tornillos', 1, CAST(N'2023-03-11T21:10:27.607' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (16, 3, N'Base', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (17, 3, N'Control remoto', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (18, 3, N'Micrófono', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (19, 3, N'Driver', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (20, 3, N'Balastros', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (21, 3, N'Recipinete o contenedor', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (22, 3, N'Filtro', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (23, 3, N'Mangueras', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (24, 3, N'Bolsas', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (25, 3, N'Tinta', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (26, 3, N'Vaso de licuadora', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (27, 3, N'Tope extractores', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (28, 3, N'Brocas', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (29, 3, N'Llaves', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (30, 3, N'Navajas', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (31, 4, N'Instructivo', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (32, 4, N'Marcado', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (33, 4, N'Certificado (Nom-064)', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (34, 5, N'Leyendas (Español)', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (35, 5, N'Simbología (Español)', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (36, 5, N'Idioma (Español)', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (37, 6, N'Tensión', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (38, 6, N'Corriente', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (39, 6, N'Frecuencia', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (40, 6, N'Potencia', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (41, 6, N'Marca', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (42, 6, N'Modelo', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (43, 6, N'País de orígen', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (44, 7, N'La muestra no enciende', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CHallazgo] ([HAL_Id], [HAL_CEVAL_Id], [HAL_Hallazgo], [HAL_Activo], [HAL_FechaCreacion], [HAL_USU_Id_Creacion], [HAL_FechaModificacion], [HAL_USU_Id_Modificacion]) VALUES (45, 7, N'La muestra enciende de manera intermitente', 1, CAST(N'2023-03-11T21:10:27.610' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CHallazgo] OFF
GO
SET IDENTITY_INSERT [dbo].[CVeredicto] ON 

INSERT [dbo].[CVeredicto] ([VER_Id], [VER_Descripcion], [VER_Activo], [VER_FechaCreacion], [VER_USU_Id_Creacion], [VER_FechaModificacion], [VER_USU_Id_Modificacion]) VALUES (1, N'Cumple', 1, CAST(N'2023-03-11T20:38:09.070' AS DateTime), 1, NULL, NULL)
INSERT [dbo].[CVeredicto] ([VER_Id], [VER_Descripcion], [VER_Activo], [VER_FechaCreacion], [VER_USU_Id_Creacion], [VER_FechaModificacion], [VER_USU_Id_Modificacion]) VALUES (2, N'No cumple', 1, CAST(N'2023-03-11T20:38:09.140' AS DateTime), 1, NULL, NULL)
SET IDENTITY_INSERT [dbo].[CVeredicto] OFF
GO
ALTER TABLE [dbo].[CHallazgo]  WITH CHECK ADD  CONSTRAINT [FK_CHallazgo_CEvaluacion] FOREIGN KEY([HAL_CEVAL_Id])
REFERENCES [dbo].[CEvaluacion] ([CEVAL_Id])
GO
ALTER TABLE [dbo].[CHallazgo] CHECK CONSTRAINT [FK_CHallazgo_CEvaluacion]
GO
