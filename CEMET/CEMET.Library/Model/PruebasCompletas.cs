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
        public string PaisOrigen { get; set; }
        public string Calibre { get; set; }
    }
}
