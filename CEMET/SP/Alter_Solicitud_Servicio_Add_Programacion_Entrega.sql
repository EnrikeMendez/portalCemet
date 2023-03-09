ALTER TABLE dbo.Solicitud_Servicio ADD  SOL_Programacion_Recoleccion int NULL 
	CONSTRAINT fk_Solicitud_Programacion_Entrega FOREIGN KEY(SOL_Programacion_Recoleccion) REFERENCES Programacion_Recoleccion (PROG_Id)

