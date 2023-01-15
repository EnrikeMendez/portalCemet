using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cemetlib.Model
{
    public class DiagramaMarcado : AltaSolicitud
    {
        public int Voltaje { get; set; }
        public int Corriente { get; set; }
        public int Potencia { get; set; }
    }
}
