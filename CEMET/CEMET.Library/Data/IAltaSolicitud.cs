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
    public static class IAltaSolicitud
    {
        public static void GuardaSolicitudPruebaCompleta(PruebasCompletas solicitudPruebasCompletas)
        {
            try
            {
                DB context = new DB();
                List<SqlParameter> parameters = new List<SqlParameter>();
                parameters.Add(DB.CrearParametroSql("@SOL_CTS_Id", SqlDbType.VarChar, solicitudPruebasCompletas.TipoServicio));
                parameters.Add(DB.CrearParametroSql("@SOL_NOR_Id", SqlDbType.VarChar, solicitudPruebasCompletas.Norma));
                parameters.Add(DB.CrearParametroSql("@SOL_CCA_Id", SqlDbType.VarChar, solicitudPruebasCompletas.Categoria));
                parameters.Add(DB.CrearParametroSql("@SOL_CPA_Id", SqlDbType.VarChar, solicitudPruebasCompletas.PaisOrigen));
                parameters.Add(DB.CrearParametroSql("@SOL_CMR_Id", SqlDbType.VarChar, solicitudPruebasCompletas.ModalidadRecoleccion));
                parameters.Add(DB.CrearParametroSql("@SOL_CME_Id", SqlDbType.VarChar, solicitudPruebasCompletas.ModalidadEntrega));
                parameters.Add(DB.CrearParametroSql("@SOL_CDH_Id", SqlDbType.VarChar, solicitudPruebasCompletas.DiasHabiles));
                parameters.Add(DB.CrearParametroSql("@SOL_Referencia_Certificacion", SqlDbType.VarChar, solicitudPruebasCompletas.ReferenciaCertificacion));
                parameters.Add(DB.CrearParametroSql("@SOL_Dsc_Producto", SqlDbType.VarChar, solicitudPruebasCompletas.Descripcion));
                parameters.Add(DB.CrearParametroSql("@SOL_Marca", SqlDbType.VarChar, solicitudPruebasCompletas.Marca));
                parameters.Add(DB.CrearParametroSql("@SOL_Modelo", SqlDbType.VarChar, solicitudPruebasCompletas.Modelo));
                parameters.Add(DB.CrearParametroSql("@SOL_Calibre", SqlDbType.VarChar, solicitudPruebasCompletas.Calibre));
                parameters.Add(DB.CrearParametroSql("@SOL_Subtotal", SqlDbType.Float, solicitudPruebasCompletas.Cotizacion.Subtotal));
                parameters.Add(DB.CrearParametroSql("@SOL_Iva", SqlDbType.Float, solicitudPruebasCompletas.Cotizacion.Iva));
                parameters.Add(DB.CrearParametroSql("@SOL_Total", SqlDbType.VarChar, solicitudPruebasCompletas.Cotizacion.Total));
                parameters.Add(DB.CrearParametroSql("@SOL_Observaciones", SqlDbType.VarChar, solicitudPruebasCompletas.Observaciones));
                parameters.Add(DB.CrearParametroSql("@SOL_Activo", SqlDbType.Bit, solicitudPruebasCompletas.Activo));
                parameters.Add(DB.CrearParametroSql("@SOL_USU_Id_Creacion", SqlDbType.BigInt, solicitudPruebasCompletas.UsuarioCrea));
                parameters.Add(DB.CrearParametroSql("@SOL_FechaModificacion", SqlDbType.DateTime, solicitudPruebasCompletas.FechaModifica));
                parameters.Add(DB.CrearParametroSql("@SOL_USU_Id_Modificacion", SqlDbType.BigInt, solicitudPruebasCompletas.UsuarioModifica));
                context.EjecutarSP("SPC_AltaSolicitud", parameters);

            }
            catch (Exception)
            {

                throw;
            }

        }

    }
}
