USE [ph11756620532_]
GO

/****** Object:  StoredProcedure [dbo].[SPC_AltaSolicitud]    Script Date: 19/02/2023 05:36:05 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



  
ALTER PROCEDURE [dbo].[SPC_AltaSolicitud](  
 @SOL_CTS_Id varchar(3),  
 @SOL_NOR_Id varchar(3) = null,  
 @SOL_CCA_Id varchar(3) = null,  
 @SOL_CPA_Id varchar(5) = null,  
 @SOL_CMR_Id varchar(3),  
 @SOL_CME_Id varchar(3),  
 @SOL_CDH_Id varchar(5),  
 @SOL_Referencia_Certificacion varchar(100) = null,  
 @SOL_Dsc_Producto varchar(100),  
 @SOL_Marca varchar(100),  
 @SOL_Modelo varchar(100),  
 @SOL_Calibre varchar(100) = null,  
 @SOL_Subtotal decimal(10, 5),  
 @SOL_Iva decimal(10, 5),  
 @SOL_Total decimal(10, 5),  
 @SOL_Observaciones varchar(1000),  
 @SOL_Activo bit,  
 @SOL_USU_Id_Creacion bigint,  
 @SOL_FechaModificacion datetime,  
 @SOL_USU_Id_Modificacion bigint,  
 @FOL_Folio bigint,  
 @Documentos dbo.Documentos READONLY,  
 @Cotizaciones dbo.Cotizaciones READONLY,  
 @EspecificacionesElectricas dbo.EspecificacionesElectricas READONLY,  
 @Normas dbo.Normas READONLY,  
 @ServiciosAdicionales dbo.ServiciosAdicionales READONLY, 
 @MetodosDePrueba dbo.MetodosDePrueba READONLY, 
 @SOL_Id bigint = null OUTPUT  
)  
AS  
BEGIN  
 DECLARE   
  @FOL_Folio_Final bigint = @FOL_Folio,  
  @Fecha datetime = GETDATE(),  
  --@SOL_Id bigint,  
  @error varchar(300)
  --, @pathPatter varchar(15) = '{NoSolicitud}'
 BEGIN TRY  
  
  BEGIN TRAN  
   IF @FOL_Folio IS NULL  
   BEGIN  
  
    INSERT INTO dbo.Folio_Solicitud   
    (  
     FOL_Activo  
     , FOL_FechaCarga  
     , FOL_USU_Id_Carga  
     , FOL_FechaModificacion  
     , FOL_USU_Id_Modificacion  
    )  
    VALUES  
    (  
      1  
     , @Fecha  
     , @SOL_USU_Id_Creacion  
     , null  
     , null  
    )  
  
    SET @FOL_Folio_Final = @@IDENTITY  
   END  
  
   INSERT INTO dbo.[Solicitud_Servicio]  
   (  
    SOL_CTS_Id,  
    SOL_NOR_Id,  
    SOL_CCA_Id,  
    SOL_CPA_Id,  
    SOL_CMR_Id,  
    SOL_CME_Id,  
    SOL_CDH_Id,  
    SOL_Referencia_Certificacion,  
    SOL_Dsc_Producto,  
    SOL_Marca,  
    SOL_Modelo,  
    SOL_Calibre,  
    SOL_Subtotal,  
    SOL_Iva,  
    SOL_Total,  
    SOL_Observaciones,  
    SOL_Activo,  
    SOL_FechaCreacion,  
    SOL_USU_Id_Creacion,  
    SOL_FechaModificacion,  
    SOL_USU_Id_Modificacion,  
    SOL_Folio  
   )  
   VALUES  
   (  
    @SOL_CTS_Id,  
    @SOL_NOR_Id,  
    @SOL_CCA_Id,  
    @SOL_CPA_Id,  
    @SOL_CMR_Id,  
    @SOL_CME_Id,  
    @SOL_CDH_Id,  
    @SOL_Referencia_Certificacion,  
    @SOL_Dsc_Producto,  
    @SOL_Marca,  
    @SOL_Modelo,  
    @SOL_Calibre,  
    @SOL_Subtotal,  
    @SOL_Iva,  
    @SOL_Total,  
    @SOL_Observaciones,  
    @SOL_Activo,  
    @Fecha,  
    @SOL_USU_Id_Creacion,  
    @SOL_FechaModificacion,  
    @SOL_USU_Id_Modificacion,  
    @FOL_Folio_Final  
   )  
     
   SET @SOL_Id = @@IDENTITY  
     
   INSERT INTO Solicitud_Documentos   
   (  
    DOC_SOL_Id  
    , DOC_Ruta  
    , DOC_Nombre  
    , DOC_Tipo  
    , DOC_Activo  
    , DOC_FechaCarga  
    , DOC_USU_Id_Carga  
   )    
   SELECT    
    @SOL_Id  
    , DOC_Ruta -- REPLACE(DOC_Ruta, @pathPatter, CONVERT(VARCHAR(8000), @SOL_Id))  --( string_expression , string_pattern , string_replacement )  
    , DOC_Nombre  
    , DOC_Tipo  
    , 1  
    , @Fecha  
    , @SOL_USU_Id_Creacion   
   FROM @Documentos  
  
   INSERT INTO Solicitud_Cotizacion   
   (  
    COT_SOL_Id  
    , COT_CSS_Id  
    , COT_CTA_Id  
   )    
   SELECT    
    @SOL_Id  
    , COT_CSS_Id  
    , COT_CTA_Id  
   FROM @Cotizaciones  
  
  
  INSERT INTO Solicitud_Especificaciones_Electricas  
   ([EEL_Id]  
   ,[EEL_SOL_Id]  
   ,[EEL_CVO_Id]  
   ,[EEL_Corriente]  
   ,[EEL_Potencia])  
  SELECT  
   (select count(*) from Solicitud_Especificaciones_Electricas x) + row_number() OVER (ORDER BY EEL_CVO_Id, EEL_Corriente, EEL_Potencia) n--IT IS NOT AUTOINCREMENT  
   ,@SOL_Id  
   ,ee.EEL_CVO_Id  
   ,ee.EEL_Corriente  
   ,ee.EEL_Potencia  
  FROM @EspecificacionesElectricas ee  


	INSERT INTO [dbo].[Solicitud_Norma]
			   ([NOR_Id]
			   ,[NOR_SOL_Id]
			   ,[NOR_CNR_Id]
			   ,[NOR_CNP_Id])
	SELECT
		(select count(*) from [Solicitud_Norma] y) + row_number() OVER (ORDER BY [NOR_CNR_Id], [NOR_CNP_Id]) n,--IT IS NOT AUTOINCREMENT
		@SOL_Id,
		[NOR_CNR_Id],
		[NOR_CNP_Id]
	FROM @Normas nor


	INSERT INTO [dbo].[RSolicitud_Servicio_Adicional]
           ([SOL_Id]
           ,[CSA_Id])
	SELECT
		@SOL_Id,
		[CSA_Id]
	FROM @ServiciosAdicionales nor


	INSERT INTO [dbo].[RSolicitud_Metodo_Prueba]
		([SOL_Id]
		,[CMP_Id])
	SELECT
		@SOL_Id,
		mm.[CMP_Id]
	FROM
		@MetodosDePrueba mm

    
  IF @@TRANCOUNT > 0  
   COMMIT TRAN  
 END TRY  
 BEGIN CATCH  
  IF @@TRANCOUNT > 0  
   ROLLBACK TRAN  
  SELECT @error = ERROR_MESSAGE()   
  RAISERROR(@error, 16, 1)  
 END CATCH  
   
   
 return @FOL_Folio_Final  
END  
  
GO


