using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cemetlib.Model
{
    public class Cotizacion
    {
        public int IdCotizacion { get; set; }

        public string Servicio { get; set; }

        public string Tarifa { get; set; }

        public string IdServicio { get; set; }

        public string IdTarifa { get; set; }
    }
}
