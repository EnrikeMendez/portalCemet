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
                        numeroSolicitud = IAltaSolicitud.GuardaSolicitudPruebaCompleta(altaPruebasCompletas);
                        break;
                    case "2":
                        break;
                    case "3":
                        break;
                    case "4":
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
