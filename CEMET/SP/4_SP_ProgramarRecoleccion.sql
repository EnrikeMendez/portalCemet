USE [ph11756620532_]
GO

/****** Object:  StoredProcedure [dbo].[SPC_AltaSolicitud]    Script Date: 06/02/2023 06:24:59 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[SP_ProgramarRecoleccion](
	@PROG_NO_Programacion int,
	@PROG_Fecha_Recoleccion DATETIME,
	@PROG_Contacto varchar(35),
	@PROG_Telefono varchar(15),
	@PROG_Direccion varchar(95),
	@PROG_Cantidad_Bultos int,
	@PROG_Cantidad_Solicitudes int,
	@PROG_Referencias_Adicionales varchar(255),
	@Solicitudes dbo.ProgramacionDeRecoleccion READONLY
)
AS
BEGIN
	DECLARE 
		@PROG_Id bigint = 0, 
		@Fecha datetime = GETDATE(),
		--@SOL_Id bigint,
		@error varchar(300)
	BEGIN TRY

		BEGIN TRAN
			
		INSERT INTO dbo.Programacion_Recoleccion 
		(
			PROG_NO_Programacion,
			PROG_Fecha_Recoleccion,
			PROG_Contacto,
			PROG_Telefono,
			PROG_Direccion,
			PROG_Cantidad_Bultos,
			PROG_Cantidad_Solicitudes,
			PROG_Referencias_Adicionales
		)
		VALUES
		(
			@PROG_NO_Programacion,
			@PROG_Fecha_Recoleccion,
			@PROG_Contacto,
			@PROG_Telefono,
			@PROG_Direccion,
			@PROG_Cantidad_Bultos,
			@PROG_Cantidad_Solicitudes,
			@PROG_Referencias_Adicionales
		)

		SET @PROG_Id = @@IDENTITY

		UPDATE sol SET
			sol.SOL_Programacion_Recoleccion = @PROG_Id
		FROM dbo.Solicitud_Servicio sol
			INNER JOIN @Solicitudes progSol ON sol.SOL_Id = progSol.Sol_Id

		
		
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


