
ALTER TABLE Solicitud_Cotizacion DROP CONSTRAINT PK__Solicitu__544D6277BDE4D80E

ALTER TABLE Solicitud_Cotizacion DROP COLUMN COT_Id

ALTER TABLE Solicitud_Cotizacion ADD COT_Id bigint primary key IDENTITY(1,1)



EXEC sp_rename 'Solicitud_Cotizacion.NewColumn', 'OldColumnName', 'COLUMN'


SELECT
	*
FROM Solicitud_Documentos