using System;

namespace CEMET.WebApp.UserControls.Comun
{
    public partial class Observaciones : System.Web.UI.UserControl
    {
        public string Obs { get { return ObservacionesDeclaraciones.Text; } set { ObservacionesDeclaraciones.Text = value; } }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}