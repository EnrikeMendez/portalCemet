using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cemetlib.Model
{
    public class FolioSolicitud
    {
        public int Folio { get; set; }
        public bool Activo { get; set; }
        public DateTime FechaCarga { get; set; }
        public int UsuarioCargaId { get; set; }
        public DateTime FechaModificacion { get; set; }
        public int UsuarioModificaId { get; set; }
    }
}
