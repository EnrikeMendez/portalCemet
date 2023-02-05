using Cemetlib.Data;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.Views
{
    public partial class Solicitudes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            DataTable solicitudes = new DataTable();
            solicitudes = ISolicitud.ObtenerSolicitudes();

            gv_Solicitudes.DataSource = solicitudes;
            gv_Solicitudes.DataBind();

        }
    }
}