using System.Collections.Generic;

namespace Cemetlib.Model
{
    public class EvaluacionPresolicitud
    {
        public long IdSolicitud { get; set; }

        public long IdEvaluacionDeSolicitudDeServicio { get; set; }

        public int CantidadDeHallazgos { get; set; }

        public string Sugerencias { get; set; }

        public List<Evaluacion> Evaluaciones { get; set; }

        public long UsuarioCrea { get; set; }

    }
}
