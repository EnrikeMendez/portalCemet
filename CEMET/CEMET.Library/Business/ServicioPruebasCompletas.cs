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
        public static void Guardar(PruebasCompletas altaPruebasCompletas)
        {
            //Validar cadenas

            //Validar catalogos

            //Guardar info
            IAltaSolicitud.GuardaSolicitudPruebaCompleta(altaPruebasCompletas);

            //Crear solicitud documentos
        }

    }
}
