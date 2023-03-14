using Cemetlib.Data;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
namespace Cemetlib.Business
{
    public class SolicitudService
    {
        public readonly Solicitud Solicitud;
       
        public SolicitudService()
        {

        }
        public SolicitudService(Solicitud solicitud)
        {
            Solicitud = solicitud;
        }
        public int GuardarSolicitud(out List<string> errores)
        {
            errores = new List<string>();
            List<string> erroresDocumentos = new List<string>();
            List<string> erroresCotizacion = new List<string>();
            int folio = 0;
            int solicitudId = 0;

            try
            {
                erroresCotizacion = ValidaCotizacion(Solicitud.Cotizaciones);
                errores.AddRange(erroresCotizacion);
                erroresDocumentos = ValidaDocumentos();
                errores.AddRange(erroresDocumentos);
                switch (Solicitud.TipoServicio)
                {
                    case "T1":
                        SolicitudPruebasCompletas altaPruebasCompletas = (SolicitudPruebasCompletas)Solicitud;
                        folio = ISolicitud.GuardaSolicitudPruebaCompleta(altaPruebasCompletas, out solicitudId);
                        break;
                    case "T2":
                        SolicitudPruebasParciales pruebasParciales = (SolicitudPruebasParciales)Solicitud;
                        folio = ISolicitud.GuardaSolicitudPruebaParcial(pruebasParciales);
                        break;
                    case "T3":
                        SolicitudDiagramaMarcado diagrama = (SolicitudDiagramaMarcado)Solicitud;
                        folio = ISolicitud.GuardaSolicitudDiagrama(diagrama);
                        break;
                    case "T4":
                        SolicitudDiagramaMarcado marcado = (SolicitudDiagramaMarcado)Solicitud;
                        folio = ISolicitud.GuardaSolicitudMarcado(marcado);
                        break;
                    default:
                        throw new ArgumentException("La solicitud seleccionada es inválida.");
                }

            }
            catch (Exception ex)
            {

                throw ex;
            }

            Solicitud.SolicitudId = solicitudId;

            return folio;
        }

        private List<string> ValidaDocumentos()
        {
            List<string> errores = new List<string>();
            if (Solicitud.Documentos != null)
            {
                foreach (Documentos doc in Solicitud.Documentos)
                {
                    if (string.IsNullOrEmpty(doc.Tipo))
                    {
                        throw new ArgumentException("El tipo de documento proporcionado no es válido"); //Hard stop because this is not provided by user.
                    }
                    if (string.IsNullOrEmpty(doc.Nombre))
                    {
                        errores.Add($"El nombre del documento tipo {doc.Tipo} no puede estár vacío");
                    }
                    if (string.IsNullOrEmpty(doc.Ruta))
                    {
                        errores.Add($"La ruta del documento tipo {doc.Tipo} no puede estár vacía");
                    }
                }
            }

            return errores;
        }

        private List<string> ValidaCotizacion(List<Cotizacion> cotizaciones)
        {
            List<string> errores = new List<string>();
            float subtotal = 0;
            float total = 0;
            foreach (Cotizacion cotizacion in Solicitud.Cotizaciones)
            {
                if (float.TryParse(cotizacion.Tarifa, out float t))
                    subtotal += t;
            }
            total = subtotal + (subtotal * Solicitud.Iva);

            //el subtotal puede variar a lo que capture el usuario, por eso se dejaron abiertos los campos
            //if (subtotal != Solicitud.Subtotal)
            //{
            //    errores.Add("El subtotal no coincide con el cálculo de las cotizaciones.");
            //}
            //if (total != Solicitud.Total)
            //{
            //    errores.Add("El total no coincide con el cálculo de las cotizaciones.");
            //}

            return errores;
        }
        public IEnumerable<SolicitudPruebasCompletas> GetSolicitudes(int folio)
        {
            var db = ISolicitud.ObtenerSolicitudes(folio: folio);
            var ppList = new List<SolicitudPruebasCompletas>();

            if (db != null && db.Rows.Count > 0)
            {
                ppList = db.AsEnumerable().Select(row =>
                new SolicitudPruebasCompletas
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
        public DataTable ObtieneSolicitudes(string TipoDeConsulta, string DelPeriodo, string AlPeriodo)
        {
            DataTable solicitudes = new DataTable();
            solicitudes = ISolicitud.ObtenerSolicitudesFiltradas(TipoDeConsulta, DelPeriodo, AlPeriodo);

            return solicitudes;

        }

        public FolioSolicitud ObtenerFolioSolicitud(int folio)
        {
            var db = ISolicitud.ObtenerFolioSolicitud(folio: folio);
            var folioSolicitud = new FolioSolicitud();
            folioSolicitud.Folio = Convert.ToInt32(db.Rows[0].Field<long>("FOL_Folio"));
            folioSolicitud.FechaCarga = db.Rows[0].Field<DateTime>("FOL_FechaCarga");
            folioSolicitud.CantidadDeServiciosSolicitados = db.Rows[0].Field<int>("CantidadDeServiciosSolicitados");

            return folioSolicitud;
        }

        public DataTable ObtenerSolicitudesParaProgramaRecoleccion()
        {
            return ISolicitud.ObtenerSolicitudesParaProgramaRecoleccion();

        }

        public List<Catalog> ObtenerSolicitudesParaProgramaRecoleccionCat()
        {
            return ISolicitud.ObtenerSolicitudesParaProgramaRecoleccionCat();
        }

        public void GuardaEvaluacionDePresolictud(EvaluacionPresolicitud evaluacionPresolicitud)
        {
            //Validaciones

            ISolicitud.GuardaEvaluacionDePresolictud(evaluacionPresolicitud: evaluacionPresolicitud);
        }

    }
}
