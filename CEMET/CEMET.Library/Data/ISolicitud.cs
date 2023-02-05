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
    public static class ISolicitud
    {
        public static DataTable ObtenerSolicitudes()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM Solicitud_Servicio 
                                INEER JOIN CTipo_Servicio ON SOL_CTS_Id = CTS_Id";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static int GuardaSolicitudPruebaCompleta(PruebasCompletas solicitudPruebasCompletas)
        {
            int numeroSolicitud = 0;
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
                parameters.Add(DB.CrearParametroSql("@FOL_Folio", SqlDbType.BigInt, solicitudPruebasCompletas.NumeroFolioSolicitud));
                DataTable tablaDocumentos = new DataTable();

                // Adding Columns    
                DataColumn column = new DataColumn();
                column.ColumnName = "DOC_Ruta";
                column.DataType = typeof(int);
                tablaDocumentos.Columns.Add(column);

                column = new DataColumn();
                column.ColumnName = "DOC_Nombre";
                column.DataType = typeof(string);
                tablaDocumentos.Columns.Add(column);

                column = new DataColumn();
                column.ColumnName = "Doc_Tipo";
                column.DataType = typeof(string);
                tablaDocumentos.Columns.Add(column);
                foreach (Documentos doc in solicitudPruebasCompletas.Documentos)
                {
                    DataRow DR = tablaDocumentos.NewRow();
                    DR[0] = doc.Ruta;
                    DR[1] = doc.Nombre;
                    DR[2] = doc.Tipo;
                    tablaDocumentos.Rows.Add(DR);
                }
                parameters.Add(DB.CrearParametroSql("@Documentos", SqlDbType.Structured, tablaDocumentos));

                numeroSolicitud = context.EjecutarSP("SPC_AltaSolicitud", parameters);

            }
            catch (Exception)
            {

                throw;
            }
            return numeroSolicitud;
        }

    }
}
