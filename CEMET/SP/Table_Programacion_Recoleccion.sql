CREATE TABLE dbo.Programacion_Recoleccion(
	PROG_Id int PRIMARY KEY IDENTITY (1, 1),
	PROG_NO_Programacion int NOT NULL,
	PROG_Fecha_Recoleccion DATETIME NOT NULL,
	PROG_Contacto varchar(35) NOT NULL,
	PROG_Telefono varchar(15) NOT NULL,
	PROG_Direccion varchar(95) NOT NULL,
	PROG_Cantidad_Bultos int NOT NULL,
	PROG_Cantidad_Solicitudes int NOT NULL,
	PROG_Referencias_Adicionales varchar(255) NULL
)



