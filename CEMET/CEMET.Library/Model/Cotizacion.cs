using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cemetlib.Model
{
    public class Cotizacion
    {
        public int? ServiciosSolicitados { get; set; }
        public float? Subtotal { get; set; }
        public float? Iva { get; set; }
        public float? Total { get; set; }
    }
}
