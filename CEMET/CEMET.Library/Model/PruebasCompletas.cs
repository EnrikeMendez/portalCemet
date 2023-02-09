using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cemetlib.Model
{
    public class PruebasCompletas : AltaSolicitud
    {
        public string Categoria { get; set; }
        public string ReferenciaCertificacion { get; set; }
        public string Calibre { get; set; }
        public string ServicioAdicional { get; set; }
        public string NormaParticular { get; set; }
        public List<EspecificacionElectrica> EspecificacionesElectricas { get; set; }
    }
}
