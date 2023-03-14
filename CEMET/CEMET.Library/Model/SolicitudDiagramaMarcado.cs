using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cemetlib.Model
{
    public class SolicitudDiagramaMarcado : Solicitud
    {
        public List<EspecificacionElectrica> EspecificacionesElectricas { get; set; }

    }
}
