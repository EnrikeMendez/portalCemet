
CREATE PROCEDURE [dbo].[SP_EliminaSolicitudesPorFolio](  
 
	@FOL_Folio bigint

)  
AS  
BEGIN  
	DECLARE   
		@error varchar(300)  
	DECLARE @SolicitudServicio TABLE (SOL_Id bigint)
	BEGIN TRY  
  
		BEGIN TRAN  
		
		INSERT INTO @SolicitudServicio (SOL_Id)
			SELECT
				SOL_Id
			FROM dbo.Solicitud_Servicio sol
			WHERE sol.SOL_Folio = @FOL_Folio
		
		DELETE eel
		from Solicitud_Especificaciones_Electricas eel
			INNER JOIN @SolicitudServicio sol ON eel.EEL_SOL_Id = sol.SOL_Id
		
		DELETE scot
		FROM Solicitud_Cotizacion scot
			INNER JOIN @SolicitudServicio sol ON scot.COT_SOL_Id = sol.SOL_Id

		DELETE doc
		FROM Solicitud_Documentos doc
			INNER JOIN @SolicitudServicio sol ON doc.DOC_SOL_Id = sol.SOL_Id
    
		DELETE nor
		FROM Solicitud_Norma nor
			INNER JOIN @SolicitudServicio sol ON nor.NOR_SOL_Id = sol.SOL_Id

		DELETE ser
		FROM RSolicitud_Servicio_Adicional ser
			INNER JOIN @SolicitudServicio sol ON ser.SOL_Id = sol.SOL_Id
		
		DELETE met
		FROM RSolicitud_Metodo_Prueba met
			INNER JOIN @SolicitudServicio sol ON met.SOL_Id = sol.SOL_Id

		DELETE sols
		FROM Solicitud_Servicio sols
			INNER JOIN @SolicitudServicio sol ON sols.SOL_Id = sol.SOL_Id

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
  