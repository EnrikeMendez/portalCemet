CREATE PROCEDURE SPC_AltaSolicitud(
	@SOL_CTS_Id varchar(3),
	@SOL_NOR_Id varchar(3),
	@SOL_CCA_Id varchar(3),
	@SOL_CPA_Id varchar(5),
	@SOL_CMR_Id varchar(3),
	@SOL_CME_Id varchar(3),
	@SOL_CDH_Id varchar(5),
	@SOL_Referencia_Certificacion varchar(100),
	@SOL_Dsc_Producto varchar(100),
	@SOL_Marca varchar(100),
	@SOL_Modelo varchar(100),
	@SOL_Calibre varchar(100),
	@SOL_Subtotal decimal(10, 5),
	@SOL_Iva decimal(10, 5),
	@SOL_Total decimal(10, 5),
	@SOL_Observaciones varchar(1000),
	@SOL_Activo bit,
	@SOL_USU_Id_Creacion bigint,
	@SOL_FechaModificacion datetime,
	@SOL_USU_Id_Modificacion bigint
)
AS
BEGIN
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
		SOL_USU_Id_Modificacion
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
		GETDATE(),
		@SOL_USU_Id_Creacion,
		@SOL_FechaModificacion,
		@SOL_USU_Id_Modificacion
	)
END
GO