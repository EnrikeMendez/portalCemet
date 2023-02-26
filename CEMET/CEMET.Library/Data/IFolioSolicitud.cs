using Cemetlib.Common;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cemetlib.Data
{
    public static class IFolioSolicitud
    {
        public static void EliminarSolicitudesPorFolio(FolioSolicitud folioSolicitud)
        {
            try
            {
                DB context = new DB();
                List<SqlParameter> parameters = new List<SqlParameter>();

                parameters.Add(DB.CrearParametroSql("@FOL_Folio", SqlDbType.Int, folioSolicitud.Folio));

                context.EjecutarSP("SP_EliminaSolicitudesPorFolio", parameters);

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
