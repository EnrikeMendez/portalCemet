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
        public static void GuardarSolicitud(AltaSolicitud solicitud) {
            try
            {
                switch (solicitud.TipoServicio)
                {
                    case "1":
                        PruebasCompletas altaPruebasCompletas = (PruebasCompletas)solicitud;
                        ServicioPruebasCompletas.Guardar(altaPruebasCompletas);
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
            
        }
    }
}
