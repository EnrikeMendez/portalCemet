using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cemetlib.Model
{
    public abstract class AltaSolicitud
    {
        public string Norma { get; set; }
        public string TipoServicio { get; set; }
        public string Descripcion { get; set; }
        public string Marca { get; set; }
        public string Modelo { get; set; }
        public string ModalidadRecoleccion { get; set; }
        public List<Cotizacion> Cotizaciones { get; set; }
        public string Observaciones { get; set; }
        public bool TerminosYCondiciones { get; set; }
        public List<string> UploadedDocs { get; set; }
        public string ModalidadEntrega { get; set; }
        public string DiasHabiles { get; set; }
        public bool Activo { get; set; }
        public DateTime FechaCreacion { get; set; }
        public long UsuarioCrea { get; set; }
        public long? UsuarioModifica { get; set; }
        public DateTime? FechaModifica { get; set; }
        public int? NumeroFolioSolicitud { get; set; }
        public List<Documentos> Documentos { get; set; }
        public float Subtotal { get; set; }
        public float Iva { get; set; }
        public float Total { get; set; }
        public string PaisOrigen { get; set; }
        public int SolicitudId { get; set; }
    }
}
