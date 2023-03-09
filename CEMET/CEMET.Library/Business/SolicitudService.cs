using Cemetlib.Data;
using Cemetlib.Model;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System;
namespace Cemetlib.Business
{
    public class SolicitudService
    {
        public IEnumerable<PruebasCompletas> GetSolicitudes(int folio)
        {
            var db = ISolicitud.ObtenerSolicitudes(folio: folio);
            var ppList = new List<PruebasCompletas>();

            if (db != null && db.Rows.Count > 0)
            {
                ppList = db.AsEnumerable().Select(row =>
                new PruebasCompletas
                {
                    Descripcion = row.Field<string>("SOL_Dsc_Producto"),
                    Marca = row.Field<string>("SOL_Marca"),
                    Modelo = row.Field<string>("SOL_Modelo"),
                    PaisOrigen = row.Field<string>("SOL_CPA_Id")
                }).ToList();
            }

            return ppList;
        }
        public void ProgramarRecoleccion(ProgramacionRecoleccion programacionRecolecciones)
        {
            if (programacionRecolecciones.Solicitudes.Count == 0)
            {
                throw new ArgumentException("No se ha seleccionado ninguna solicitud. Por favor seleccione al menos una para continuar.");
            }
            if (programacionRecolecciones.Solicitudes.Count != programacionRecolecciones.CantidadSolicitudes)
            {
                throw new ArgumentException("La cantidad de solicitudes ingresada no coincide con la cantidad de solicitudes seleccionadas.");
            }
            //Valida telefono
            
            ISolicitud.ProgramarRecoleccion(programacionRecolecciones);
        }
    }
}
