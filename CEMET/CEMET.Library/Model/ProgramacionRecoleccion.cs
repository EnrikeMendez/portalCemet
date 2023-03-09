using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cemetlib.Model
{
    public class ProgramacionRecoleccion
    {
        public int NumeroProgramacion { get; set; }
        public DateTime FechaRecoleccion { get; set; }
        public string Contacto { get; set; }
        public string Telefono { get; set; }
        public string Direccion { get; set; }
        public int CantidadBultos { get; set; }
        public int CantidadSolicitudes { get; set; }
        public string ReferenciasAdicionales { get; set; }
        public List<int> Solicitudes { get; set; }
    }
}
