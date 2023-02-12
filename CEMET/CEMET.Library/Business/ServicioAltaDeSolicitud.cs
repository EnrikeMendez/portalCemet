using Cemetlib.Data;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Cemetlib.Business
{
    public class ServicioAltaDeSolicitud
    {
        public readonly AltaSolicitud Solicitud;
        public ServicioAltaDeSolicitud(AltaSolicitud solicitud)
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
                        PruebasCompletas altaPruebasCompletas = (PruebasCompletas)Solicitud;
                        folio = ISolicitud.GuardaSolicitudPruebaCompleta(altaPruebasCompletas, out solicitudId);
                        break;
                    case "T2":
                        PruebasParciales pruebasParciales = (PruebasParciales)Solicitud;
                        folio = ISolicitud.GuardaSolicitudPruebaParcial(pruebasParciales);
                        break;
                    case "T3":
                        DiagramaMarcado diagrama = (DiagramaMarcado)Solicitud;
                        folio = ISolicitud.GuardaSolicitudDiagrama(diagrama);
                        break;
                    case "T4":
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
    }
}
