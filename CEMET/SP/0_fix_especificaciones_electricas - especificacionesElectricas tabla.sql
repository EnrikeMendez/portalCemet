USE [ph11756620532_]
GO

/****** Object:  UserDefinedTableType [dbo].[EspecificacionesElectricas]    Script Date: 06/02/2023 08:20:23 p. m. ******/
CREATE TYPE [dbo].[EspecificacionesElectricas] AS TABLE(
	[EEL_CVO_Id] [int] NULL,
	[EEL_Corriente] [varchar](100) NULL,
	[EEL_Potencia] [varchar](100) NULL
)
GO


