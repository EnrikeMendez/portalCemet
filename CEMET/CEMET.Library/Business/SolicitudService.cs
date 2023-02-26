using Cemetlib.Data;
using Cemetlib.Model;
using System.Collections.Generic;
using System.Data;
using System.Linq;

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
    }
}
