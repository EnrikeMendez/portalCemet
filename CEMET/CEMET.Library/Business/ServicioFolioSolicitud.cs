using Cemetlib.Data;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cemetlib.Business
{
    public class ServicioFolioSolicitud
    {
        private FolioSolicitud FolioSolicitud;
        public ServicioFolioSolicitud(FolioSolicitud folioSolicitud)
        {
            FolioSolicitud = folioSolicitud;
        }
        public void EliminarSolicitudesAsociadas()
        {
            if (FolioSolicitud.Folio == 0)
            {
                throw new ArgumentException("Numero de folio inválido");
            }
            IFolioSolicitud.EliminarSolicitudesPorFolio(FolioSolicitud);
        }
    }
}
