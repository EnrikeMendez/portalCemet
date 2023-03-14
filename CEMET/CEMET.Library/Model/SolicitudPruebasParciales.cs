using System.Collections.Generic;

namespace Cemetlib.Model
{
    public class SolicitudPruebasParciales : Solicitud
    {
        public SolicitudPruebasParciales()
        {
            EspecificacionesElectricas = new List<EspecificacionElectrica>();
            Normas = new List<Norma>();
            ServiciosAdicionales = new List<ServicioAdicional>();
            Cotizaciones = new List<Cotizacion>();
            Documentos = new List<Documentos>();
        }

        public string NormaParticular { get; set; }
        public string MetodoPrueba { get; set; }
        public string Categoria { get; set; }
        public string ReferenciaCertificacion { get; set; }
        public string Calibre { get; set; }

        public List<EspecificacionElectrica> EspecificacionesElectricas { get; set; }
        public List<Norma> Normas { get; set; }
        public List<ServicioAdicional> ServiciosAdicionales { get; set; }
        public List<MetodoDePrueba> MetodoDePruebas { get; set; }

    }

}
