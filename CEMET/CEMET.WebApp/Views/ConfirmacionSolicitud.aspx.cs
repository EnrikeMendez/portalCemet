using CEMET.WebApp.App_Code;
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
    public partial class ConfirmacionSolicitud : SetupPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void SiBtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Views/Solicitudes.aspx");
        }

        protected void No_Click(object sender, EventArgs e)
        {
            FolioSolicitud folioSolicitud = new FolioSolicitud();
            folioSolicitud.Folio = int.Parse(FolioActual);
            ServicioFolioSolicitud servicioFolioSolicitud = new ServicioFolioSolicitud(folioSolicitud);
            servicioFolioSolicitud.EliminarSolicitudesAsociadas();

            Response.Redirect("/Views/Solicitudes.aspx");
        }
    }
}