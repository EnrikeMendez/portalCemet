using Cemetlib.Data;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cemetlib.Business
{
    public static class ServicioPruebasCompletas
    {
        public static int Guardar(PruebasCompletas altaPruebasCompletas)
        {
            int numeroSolicitud = 0;
            //Validar cadenas

            //Validar catalogos

            //Guardar info
            numeroSolicitud = IAltaSolicitud.GuardaSolicitudPruebaCompleta(altaPruebasCompletas);

            //Crear solicitud documentos
            return numeroSolicitud;
        }

    }
}
