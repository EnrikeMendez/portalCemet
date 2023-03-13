namespace Cemetlib.Model
{
    public class Evaluacion
    {
        //Este se setea cuando se carga como modo detalle (falta crear vista)
        public int IdEvaluacion { get; set; }

        //IdEvaluacion está ligado con IdVeredicto en base de datos, no es necesario pasarlo
        public int IdVeredicto { get; set; }

        public int? IdHallazgo { get; set; }

    }
}
