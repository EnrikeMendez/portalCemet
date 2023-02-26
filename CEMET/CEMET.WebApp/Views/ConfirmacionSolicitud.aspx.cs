using Cemetlib.Business;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.Views
{
    public partial class ConfirmacionSolicitud : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SiBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Default.aspx");
        }

        protected void No_Click(object sender, EventArgs e)
        {
            var folio = Session["Folio"] != null ? Session["Folio"].ToString() : "";
            FolioSolicitud folioSolicitud = new FolioSolicitud();
            folioSolicitud.Folio = int.Parse(folio);
            ServicioFolioSolicitud servicioFolioSolicitud = new ServicioFolioSolicitud(folioSolicitud);
            servicioFolioSolicitud.EliminarSolicitudesAsociadas();

            Response.Redirect("/Default.aspx");
        }
    }
}