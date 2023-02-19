USE [ph11756620532_]
GO

/****** Object:  UserDefinedTableType [dbo].[Normas]    Script Date: 19/02/2023 02:20:19 a. m. ******/
CREATE TYPE [dbo].[Normas] AS TABLE(
	[NOR_CNR_Id] [int] NULL,
	[NOR_CNP_Id] [int] NULL
)
GO


USE [ph11756620532_]
GO

/****** Object:  UserDefinedTableType [dbo].[ServiciosAdicionales]    Script Date: 19/02/2023 02:21:10 a. m. ******/
CREATE TYPE [dbo].[ServiciosAdicionales] AS TABLE(
	[CSA_Id] [varchar](3) NULL
)
GO

