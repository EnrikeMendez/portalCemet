using Cemetlib.Data;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace Cemetlib.Business
{
    public static class ServicioAltaDeSolicitud
    {
        public static int GuardarSolicitud(AltaSolicitud solicitud)
        {
            int numeroSolicitud = 0;
            try
            {
                switch (solicitud.TipoServicio)
                {
                    case "T1":
                        PruebasCompletas altaPruebasCompletas = (PruebasCompletas)solicitud;
                        numeroSolicitud = ISolicitud.GuardaSolicitudPruebaCompleta(altaPruebasCompletas);
                        break;
                    case "T2":
                        PruebasParciales pruebasParciales = (PruebasParciales)solicitud;
                        numeroSolicitud = ISolicitud.GuardaSolicitudPruebaParcial(pruebasParciales);
                        break;
                    case "T3":
                        DiagramaMarcado diagrama = (DiagramaMarcado)solicitud;
                        numeroSolicitud = ISolicitud.GuardaSolicitudDiagrama(diagrama);
                        break;
                    case "T4":
                        break;
                    default:
                        throw new ArgumentException("La solicitud seleccionada es inválida.");
                }
            }
            catch (Exception ex)
            {

                throw;
            }

            return numeroSolicitud;
        }
    }
}
