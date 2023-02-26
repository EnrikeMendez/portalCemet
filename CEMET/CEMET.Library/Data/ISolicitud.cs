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
                                INEER JOIN CTipo_Servicio ON SOL_CTS_Id = CTS_Id ORDER BY SOL_Id desc ";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }

        public static int GuardaSolicitudPruebaCompleta(PruebasCompletas solicitudPruebasCompletas, out int solicitudId)
        {
            int folio;
            solicitudId = 0;
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
                parameters.Add(DB.CrearParametroSql("@SOL_Subtotal", SqlDbType.Float, solicitudPruebasCompletas.Subtotal));
                parameters.Add(DB.CrearParametroSql("@SOL_Iva", SqlDbType.Float, solicitudPruebasCompletas.Iva));
                parameters.Add(DB.CrearParametroSql("@SOL_Total", SqlDbType.VarChar, solicitudPruebasCompletas.Total));
                parameters.Add(DB.CrearParametroSql("@SOL_Observaciones", SqlDbType.VarChar, solicitudPruebasCompletas.Observaciones));
                parameters.Add(DB.CrearParametroSql("@SOL_Activo", SqlDbType.Bit, solicitudPruebasCompletas.Activo));
                parameters.Add(DB.CrearParametroSql("@SOL_USU_Id_Creacion", SqlDbType.BigInt, solicitudPruebasCompletas.UsuarioCrea));
                parameters.Add(DB.CrearParametroSql("@SOL_FechaModificacion", SqlDbType.DateTime, solicitudPruebasCompletas.FechaModifica));
                parameters.Add(DB.CrearParametroSql("@SOL_USU_Id_Modificacion", SqlDbType.BigInt, solicitudPruebasCompletas.UsuarioModifica));
                parameters.Add(DB.CrearParametroSql("@FOL_Folio", SqlDbType.BigInt, solicitudPruebasCompletas.NumeroFolioSolicitud));

                parameters.Add(DB.CrearParametroSql("@Documentos", SqlDbType.Structured, CreaTablaDocumentos(documentos: solicitudPruebasCompletas.Documentos)));

                parameters.Add(DB.CrearParametroSql("@Cotizaciones", SqlDbType.Structured, CreaTablaCotizaciones(cotizaciones: solicitudPruebasCompletas.Cotizaciones)));

                parameters.Add(DB.CrearParametroSql("@Normas", SqlDbType.Structured, CreaTablaNormas(normas: solicitudPruebasCompletas.Normas)));

                parameters.Add(DB.CrearParametroSql("@ServiciosAdicionales", SqlDbType.Structured, CreaTablaServiciosAdicionales(serviciosAdicionales: solicitudPruebasCompletas.ServiciosAdicionales)));

                var solIdParameter = DB.CrearParametroSql("@SOL_Id", SqlDbType.BigInt, null);
                solIdParameter.Direction = ParameterDirection.Output;
                parameters.Add(solIdParameter);

                folio = context.EjecutarSP("SPC_AltaSolicitud", parameters, out Dictionary<string, object> parametrosSalida);

                if (parametrosSalida.Any())
                {
                    solicitudId = int.Parse(parametrosSalida["@SOL_Id"].ToString());
                }

            }
            catch (Exception ex)
            {

                throw;
            }
            return folio;
        }
      
        public static int GuardaSolicitudPruebaParcial(PruebasParciales solicitudPruebaParcial)
        {
            int folio;
            try
            {
                DB context = new DB();
                List<SqlParameter> parameters = new List<SqlParameter>();
                parameters.Add(DB.CrearParametroSql("@SOL_CTS_Id", SqlDbType.VarChar, solicitudPruebaParcial.TipoServicio));
                parameters.Add(DB.CrearParametroSql("@SOL_NOR_Id", SqlDbType.VarChar, solicitudPruebaParcial.Norma));
                parameters.Add(DB.CrearParametroSql("@SOL_CPA_Id", SqlDbType.VarChar, solicitudPruebaParcial.PaisOrigen));
                parameters.Add(DB.CrearParametroSql("@SOL_CMR_Id", SqlDbType.VarChar, solicitudPruebaParcial.ModalidadRecoleccion));
                parameters.Add(DB.CrearParametroSql("@SOL_CME_Id", SqlDbType.VarChar, solicitudPruebaParcial.ModalidadEntrega));
                parameters.Add(DB.CrearParametroSql("@SOL_CDH_Id", SqlDbType.VarChar, solicitudPruebaParcial.DiasHabiles));
                parameters.Add(DB.CrearParametroSql("@SOL_Dsc_Producto", SqlDbType.VarChar, solicitudPruebaParcial.Descripcion));
                parameters.Add(DB.CrearParametroSql("@SOL_Marca", SqlDbType.VarChar, solicitudPruebaParcial.Marca));
                parameters.Add(DB.CrearParametroSql("@SOL_Modelo", SqlDbType.VarChar, solicitudPruebaParcial.Modelo));
                parameters.Add(DB.CrearParametroSql("@SOL_Subtotal", SqlDbType.Float, solicitudPruebaParcial.Subtotal));
                parameters.Add(DB.CrearParametroSql("@SOL_Iva", SqlDbType.Float, solicitudPruebaParcial.Iva));
                parameters.Add(DB.CrearParametroSql("@SOL_Total", SqlDbType.VarChar, solicitudPruebaParcial.Total));
                parameters.Add(DB.CrearParametroSql("@SOL_Observaciones", SqlDbType.VarChar, solicitudPruebaParcial.Observaciones));
                parameters.Add(DB.CrearParametroSql("@SOL_Activo", SqlDbType.Bit, solicitudPruebaParcial.Activo));
                parameters.Add(DB.CrearParametroSql("@SOL_USU_Id_Creacion", SqlDbType.BigInt, solicitudPruebaParcial.UsuarioCrea));
                parameters.Add(DB.CrearParametroSql("@SOL_FechaModificacion", SqlDbType.DateTime, solicitudPruebaParcial.FechaModifica));
                parameters.Add(DB.CrearParametroSql("@SOL_USU_Id_Modificacion", SqlDbType.BigInt, solicitudPruebaParcial.UsuarioModifica));
                parameters.Add(DB.CrearParametroSql("@FOL_Folio", SqlDbType.BigInt, solicitudPruebaParcial.NumeroFolioSolicitud));

                parameters.Add(DB.CrearParametroSql("@Documentos", SqlDbType.Structured, CreaTablaDocumentos(documentos: solicitudPruebaParcial.Documentos)));

                parameters.Add(DB.CrearParametroSql("@Cotizaciones", SqlDbType.Structured, CreaTablaCotizaciones(cotizaciones: solicitudPruebaParcial.Cotizaciones)));

                parameters.Add(DB.CrearParametroSql("@Normas", SqlDbType.Structured, CreaTablaNormas(normas: solicitudPruebaParcial.Normas)));

                parameters.Add(DB.CrearParametroSql("@ServiciosAdicionales", SqlDbType.Structured, CreaTablaServiciosAdicionales(serviciosAdicionales: solicitudPruebaParcial.ServiciosAdicionales)));

                parameters.Add(DB.CrearParametroSql("@MetodosDePrueba", SqlDbType.Structured, CreaTablaMetodosDePruebas(metodoDePruebas: solicitudPruebaParcial.MetodoDePruebas)));

                folio = context.EjecutarSP("SPC_AltaSolicitud", parameters);

            }
            catch (Exception ex)
            {

                throw;
            }
            return folio;
        }
       
        public static int GuardaSolicitudDiagrama(DiagramaMarcado solicitud)
        {
            int folioSolicitud;
            try
            {
                DB context = new DB();
                List<SqlParameter> parameters = new List<SqlParameter>();

                parameters.Add(DB.CrearParametroSql("@SOL_CTS_Id", SqlDbType.VarChar, solicitud.TipoServicio));
                //Controles comunes
                parameters.Add(DB.CrearParametroSql("@SOL_Dsc_Producto", SqlDbType.VarChar, solicitud.Descripcion));
                parameters.Add(DB.CrearParametroSql("@SOL_Marca", SqlDbType.VarChar, solicitud.Marca));
                parameters.Add(DB.CrearParametroSql("@SOL_Modelo", SqlDbType.VarChar, solicitud.Modelo));
                parameters.Add(DB.CrearParametroSql("@SOL_CPA_Id", SqlDbType.VarChar, solicitud.PaisOrigen));

                parameters.Add(DB.CrearParametroSql("@SOL_CMR_Id", SqlDbType.VarChar, solicitud.ModalidadRecoleccion));
                parameters.Add(DB.CrearParametroSql("@SOL_CME_Id", SqlDbType.VarChar, solicitud.ModalidadEntrega));
                parameters.Add(DB.CrearParametroSql("@SOL_CDH_Id", SqlDbType.VarChar, solicitud.DiasHabiles));

                parameters.Add(DB.CrearParametroSql("@SOL_Subtotal", SqlDbType.Float, solicitud.Subtotal));
                parameters.Add(DB.CrearParametroSql("@SOL_Iva", SqlDbType.Float, solicitud.Iva));
                parameters.Add(DB.CrearParametroSql("@SOL_Total", SqlDbType.VarChar, solicitud.Total));

                parameters.Add(DB.CrearParametroSql("@SOL_Observaciones", SqlDbType.VarChar, solicitud.Observaciones));

                parameters.Add(DB.CrearParametroSql("@SOL_Activo", SqlDbType.Bit, solicitud.Activo));
                parameters.Add(DB.CrearParametroSql("@SOL_USU_Id_Creacion", SqlDbType.BigInt, solicitud.UsuarioCrea));
                parameters.Add(DB.CrearParametroSql("@SOL_FechaModificacion", SqlDbType.DateTime, solicitud.FechaModifica));
                parameters.Add(DB.CrearParametroSql("@SOL_USU_Id_Modificacion", SqlDbType.BigInt, solicitud.UsuarioModifica));

                parameters.Add(DB.CrearParametroSql("@FOL_Folio", SqlDbType.BigInt, solicitud.NumeroFolioSolicitud));

                ////documentos
                //parameters.Add(DB.CrearParametroSql("@Documentos", SqlDbType.Structured, CreaTablaDocumentos(documentos: solicitud.Documentos)));

                //cotizaciones
                parameters.Add(DB.CrearParametroSql("@Cotizaciones", SqlDbType.Structured, CreaTablaCotizaciones(cotizaciones: solicitud.Cotizaciones)));

                //electricas
                parameters.Add(DB.CrearParametroSql("@EspecificacionesElectricas", SqlDbType.Structured, CreaTablaEspecificacionesElectricas(espElectricas: solicitud.EspecificacionesElectricas)));

                var solIdParameter = DB.CrearParametroSql("@SOL_Id", SqlDbType.BigInt, null);
                solIdParameter.Direction = ParameterDirection.Output;
                parameters.Add(solIdParameter);

                folioSolicitud = context.EjecutarSP("SPC_AltaSolicitud", parameters, out Dictionary<string, object> idSolicitud);

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return folioSolicitud;
        }
       
        public static int GuardaSolicitudMarcado(DiagramaMarcado solicitud)
        {
            int folioSolicitud;
            try
            {
                DB context = new DB();
                List<SqlParameter> parameters = new List<SqlParameter>();

                parameters.Add(DB.CrearParametroSql("@SOL_CTS_Id", SqlDbType.VarChar, solicitud.TipoServicio));
                parameters.Add(DB.CrearParametroSql("@SOL_NOR_Id", SqlDbType.VarChar, solicitud.Norma));
                //Control campos comunes
                parameters.Add(DB.CrearParametroSql("@SOL_Dsc_Producto", SqlDbType.VarChar, solicitud.Descripcion));
                parameters.Add(DB.CrearParametroSql("@SOL_Marca", SqlDbType.VarChar, solicitud.Marca));
                parameters.Add(DB.CrearParametroSql("@SOL_Modelo", SqlDbType.VarChar, solicitud.Modelo));
                parameters.Add(DB.CrearParametroSql("@SOL_CPA_Id", SqlDbType.VarChar, solicitud.PaisOrigen));
                //Control recolección
                parameters.Add(DB.CrearParametroSql("@SOL_CMR_Id", SqlDbType.VarChar, solicitud.ModalidadRecoleccion));
                parameters.Add(DB.CrearParametroSql("@SOL_CME_Id", SqlDbType.VarChar, solicitud.ModalidadEntrega));
                parameters.Add(DB.CrearParametroSql("@SOL_CDH_Id", SqlDbType.VarChar, solicitud.DiasHabiles));
                //Control Cotización
                parameters.Add(DB.CrearParametroSql("@SOL_Subtotal", SqlDbType.Float, solicitud.Subtotal));
                parameters.Add(DB.CrearParametroSql("@SOL_Iva", SqlDbType.Float, solicitud.Iva));
                parameters.Add(DB.CrearParametroSql("@SOL_Total", SqlDbType.VarChar, solicitud.Total));

                parameters.Add(DB.CrearParametroSql("@SOL_Observaciones", SqlDbType.VarChar, solicitud.Observaciones));

                parameters.Add(DB.CrearParametroSql("@SOL_Activo", SqlDbType.Bit, solicitud.Activo));
                parameters.Add(DB.CrearParametroSql("@SOL_USU_Id_Creacion", SqlDbType.BigInt, solicitud.UsuarioCrea));
                parameters.Add(DB.CrearParametroSql("@SOL_FechaModificacion", SqlDbType.DateTime, solicitud.FechaModifica));
                parameters.Add(DB.CrearParametroSql("@SOL_USU_Id_Modificacion", SqlDbType.BigInt, solicitud.UsuarioModifica));

                parameters.Add(DB.CrearParametroSql("@FOL_Folio", SqlDbType.BigInt, solicitud.NumeroFolioSolicitud));

                //Control Documentos
                parameters.Add(DB.CrearParametroSql("@Documentos", SqlDbType.Structured, CreaTablaDocumentos(documentos: solicitud.Documentos)));

                //Control Cotización
                parameters.Add(DB.CrearParametroSql("@Cotizaciones", SqlDbType.Structured, CreaTablaCotizaciones(cotizaciones: solicitud.Cotizaciones)));

                //Control Electricas
                parameters.Add(DB.CrearParametroSql("@EspecificacionesElectricas", SqlDbType.Structured, CreaTablaEspecificacionesElectricas(espElectricas: solicitud.EspecificacionesElectricas)));

                var solIdParameter = DB.CrearParametroSql("@SOL_Id", SqlDbType.BigInt, null);
                solIdParameter.Direction = ParameterDirection.Output;
                parameters.Add(solIdParameter);

                folioSolicitud = context.EjecutarSP("SPC_AltaSolicitud", parameters, out Dictionary<string, object> idSolicitud);

            }
            catch (Exception ex)
            {
                throw ex;
            }

            return folioSolicitud;
        }

        private static DataTable CreaTablaDocumentos(List<Documentos> documentos)
        {
            DataTable tablaDocumentos = new DataTable();

            DataColumn column = new DataColumn();
            column.ColumnName = "DOC_Ruta";
            column.DataType = typeof(string);
            tablaDocumentos.Columns.Add(column);

            column = new DataColumn();
            column.ColumnName = "DOC_Nombre";
            column.DataType = typeof(string);
            tablaDocumentos.Columns.Add(column);

            column = new DataColumn();
            column.ColumnName = "Doc_Tipo";
            column.DataType = typeof(string);
            tablaDocumentos.Columns.Add(column);

            foreach (Documentos doc in documentos)
            {
                DataRow DR = tablaDocumentos.NewRow();
                DR[0] = doc.Ruta;
                DR[1] = doc.Nombre;
                DR[2] = doc.Tipo;
                tablaDocumentos.Rows.Add(DR);
            }

            return tablaDocumentos;
        }

        private static DataTable CreaTablaCotizaciones(List<Cotizacion> cotizaciones)
        {
            DataTable tablaCotizacion = new DataTable();

            DataColumn column = new DataColumn();
            column.ColumnName = "COT_CSS_Id";
            column.DataType = typeof(string);
            tablaCotizacion.Columns.Add(column);

            column = new DataColumn();
            column.ColumnName = "COT_CTA_Id";
            column.DataType = typeof(string);
            tablaCotizacion.Columns.Add(column);

            foreach (Cotizacion cotizacion in cotizaciones)
            {
                DataRow DR = tablaCotizacion.NewRow();
                DR[0] = cotizacion.IdServicio;
                DR[1] = cotizacion.IdTarifa;
                tablaCotizacion.Rows.Add(DR);
            }

            return tablaCotizacion;
        }

        private static DataTable CreaTablaEspecificacionesElectricas(List<EspecificacionElectrica> espElectricas)
        {
            DataTable tablaEspElect = new DataTable();

            DataColumn column = new DataColumn();
            column.ColumnName = "EEL_CVO_Id";
            column.DataType = typeof(int);
            tablaEspElect.Columns.Add(column);

            column = new DataColumn();
            column.ColumnName = "EEL_Corriente";
            column.DataType = typeof(string);
            tablaEspElect.Columns.Add(column);

            column = new DataColumn();
            column.ColumnName = "EEL_Potencia";
            column.DataType = typeof(string);
            tablaEspElect.Columns.Add(column);

            foreach (var cotizacion in espElectricas)
            {
                DataRow DR = tablaEspElect.NewRow();
                DR[0] = cotizacion.IdVoltaje;
                DR[1] = cotizacion.IdCorriente;
                DR[2] = cotizacion.IdPotencia;
                tablaEspElect.Rows.Add(DR);
            }

            return tablaEspElect;
        }

        private static DataTable CreaTablaNormas(List<Norma> normas)
        {
            DataTable tabla = new DataTable();

            DataColumn column = new DataColumn
            {
                ColumnName = "NOR_CNR_Id",
                DataType = typeof(int)
            };
            tabla.Columns.Add(column);

            column = new DataColumn
            {
                ColumnName = "NOR_CNP_Id",
                DataType = typeof(int)
            };
            tabla.Columns.Add(column);

            foreach (var item in normas)
            {
                DataRow DR = tabla.NewRow();
                DR[0] = item.IdNormaReferencia;
                DR[1] = item.IdNormaParticular;
                tabla.Rows.Add(DR);
            }

            return tabla;
        }

        private static DataTable CreaTablaServiciosAdicionales(List<ServicioAdicional> serviciosAdicionales)
        {
            DataTable tabla = new DataTable();

            DataColumn column = new DataColumn
            {
                ColumnName = "CSA_Id",
                DataType = typeof(string)
            };
            tabla.Columns.Add(column);


            foreach (var item in serviciosAdicionales)
            {
                DataRow DR = tabla.NewRow();
                DR[0] = item.IdServicioAdicional;
                tabla.Rows.Add(DR);
            }

            return tabla;
        }

        private static DataTable CreaTablaMetodosDePruebas(List<MetodoDePrueba> metodoDePruebas)
        {
            DataTable tabla = new DataTable();

            DataColumn column = new DataColumn
            {
                ColumnName = "CMP_Id",
                DataType = typeof(int)
            };
            tabla.Columns.Add(column);

            if (metodoDePruebas != null)
            {
                foreach (var item in metodoDePruebas)
                {
                    DataRow DR = tabla.NewRow();
                    DR[0] = item.IdMetodoDePrueba;
                    tabla.Rows.Add(DR);
                }
            }

            return tabla;
        }

        public static DataTable ObtenerSolicitudes(int folio)
        {
            DB context = new DB();
            string query = $@"SELECT v.* FROM VSolicitud_Servicio v WHERE v.[SOL_Folio] = @SOL_Folio ORDER BY v.[SOL_Folio], v.[SOL_Id]";

            List<SqlParameter> parameters = new List<SqlParameter>
            {
                DB.CrearParametroSql("@SOL_Folio", SqlDbType.BigInt, folio)
            };

            DataTable catalogo = context.ObtieneDataTable(query, parametros: parameters);
            return catalogo;
        }
    }
}
