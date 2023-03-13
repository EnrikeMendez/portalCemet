
/****** Object:  Table [dbo].[Solicitud_Evaluacion]    Script Date: 13/03/2023 12:42:13 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Solicitud_Evaluacion](
	[SEVAL_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[SOL_Id] [bigint] NOT NULL,
	[SEVAL_No_Evaluacion] [bigint] NOT NULL,
	[SEVAL_Cant_Hallazgos_Encntrds] [int] NOT NULL,
	[SEVAL_Sugerencias] [varchar](200) NULL,
	[SEVAL_Activo] [bit] NOT NULL,
	[SEVAL_FechaCreacion] [datetime] NOT NULL,
	[SEVAL_USU_Id_Creacion] [bigint] NOT NULL,
	[SEVAL_FechaModificacion] [datetime] NULL,
	[SEVAL_USU_Id_Modificacion] [bigint] NULL,
 CONSTRAINT [PK_Solicitud_Evaluacion] PRIMARY KEY CLUSTERED 
(
	[SEVAL_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Solicitud_Evaluacion]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Evaluacion_Solicitud_Servicio] FOREIGN KEY([SOL_Id])
REFERENCES [dbo].[Solicitud_Servicio] ([SOL_Id])
GO

ALTER TABLE [dbo].[Solicitud_Evaluacion] CHECK CONSTRAINT [FK_Solicitud_Evaluacion_Solicitud_Servicio]
GO




/****** Object:  Table [dbo].[Solicitud_Evaluacion_Lista]    Script Date: 13/03/2023 12:42:20 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Solicitud_Evaluacion_Lista](
	[SEVAL_Id] [bigint] NOT NULL,
	[VER_Id] [int] NOT NULL,
	[HAL_Id] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Solicitud_Evaluacion_Lista]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Evaluacion_Lista_CHallazgo] FOREIGN KEY([HAL_Id])
REFERENCES [dbo].[CHallazgo] ([HAL_Id])
GO

ALTER TABLE [dbo].[Solicitud_Evaluacion_Lista] CHECK CONSTRAINT [FK_Solicitud_Evaluacion_Lista_CHallazgo]
GO

ALTER TABLE [dbo].[Solicitud_Evaluacion_Lista]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Evaluacion_Lista_CVeredicto] FOREIGN KEY([VER_Id])
REFERENCES [dbo].[CVeredicto] ([VER_Id])
GO

ALTER TABLE [dbo].[Solicitud_Evaluacion_Lista] CHECK CONSTRAINT [FK_Solicitud_Evaluacion_Lista_CVeredicto]
GO

ALTER TABLE [dbo].[Solicitud_Evaluacion_Lista]  WITH CHECK ADD  CONSTRAINT [FK_Solicitud_Evaluacion_Lista_Solicitud_Evaluacion] FOREIGN KEY([SEVAL_Id])
REFERENCES [dbo].[Solicitud_Evaluacion] ([SEVAL_Id])
GO

ALTER TABLE [dbo].[Solicitud_Evaluacion_Lista] CHECK CONSTRAINT [FK_Solicitud_Evaluacion_Lista_Solicitud_Evaluacion]
GO


/****** Object:  UserDefinedTableType [dbo].[Hallazgos]    Script Date: 13/03/2023 12:43:02 a. m. ******/
CREATE TYPE [dbo].[Hallazgos] AS TABLE(
	[VER_Id] [int] NULL,
	[HAL_Id] [int] NULL
)
GO


/****** Object:  StoredProcedure [dbo].[SPC_AltaEvaluacionDePresolicitud]    Script Date: 13/03/2023 12:43:16 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SPC_AltaEvaluacionDePresolicitud] (
	-- Add the parameters for the stored procedure here
	@SOL_Id bigint    
	, @SEVAL_No_Evaluacion bigint
	, @SEVAL_Cant_Hallazgos_Encntrds int
	, @SEVAL_Sugerencias nvarchar(200) = NULL
	, @SEVAL_USU_Id_Creacion bigint
	, @Hallazgos dbo.Hallazgos READONLY
	, @SEVAL_Id bigint = null OUTPUT
)
AS
BEGIN
	DECLARE @error varchar(300), @Fecha_Actual datetime = GETDATE();
    -- Insert statements for procedure here
	BEGIN TRY    
		BEGIN TRAN
			--VALIDAR (TEXTO EXTRAÍDO DEL EXCEL DE SOLICITUD DE SERVICIOS)
			--Se pueden hacer N listas de evaluación de presolicitud en cada presolicitud.
			--La única, lista que queda activa, es la última que se haya generado.
			UPDATE
				T
			SET
				T.SEVAL_Activo = 0
				, T.SEVAL_USU_Id_Modificacion = @SEVAL_USU_Id_Creacion
				, T.SEVAL_FechaModificacion = @Fecha_Actual
			FROM
				[dbo].[Solicitud_Evaluacion] T
			WHERE
				T.SOL_Id = @SOL_Id
				AND T.SEVAL_Activo = 1;

			INSERT INTO [dbo].[Solicitud_Evaluacion]
				([SOL_Id]
				,[SEVAL_No_Evaluacion]
				,[SEVAL_Cant_Hallazgos_Encntrds]
				,[SEVAL_Sugerencias]
				,[SEVAL_Activo]
				,[SEVAL_FechaCreacion]
				,[SEVAL_USU_Id_Creacion])
			VALUES
				(@SOL_Id
				,@SEVAL_No_Evaluacion
				,@SEVAL_Cant_Hallazgos_Encntrds
				,@SEVAL_Sugerencias
				,1
				,@Fecha_Actual
				,@SEVAL_USU_Id_Creacion);

			SET @SEVAL_Id = @@IDENTITY;

			INSERT INTO [dbo].[Solicitud_Evaluacion_Lista]
				([SEVAL_Id]
				,[VER_Id]
				,[HAL_Id])
			SELECT
				@SEVAL_Id
				, H.VER_Id
				, H.HAL_Id
			FROM @Hallazgos H

		IF @@TRANCOUNT > 0    
			COMMIT TRAN    
	END TRY    
	BEGIN CATCH    
		IF @@TRANCOUNT > 0    
			ROLLBACK TRAN    
		SELECT @error = ERROR_MESSAGE()     
		RAISERROR(@error, 16, 1)    
	END CATCH   

END
GO

