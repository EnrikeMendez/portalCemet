using CEMET.WebApp.Views;
using Cemetlib.Business;
using Cemetlib.Model;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.UserControls.Comun
{
    public partial class NotificacionSolicitudDeServicio : System.Web.UI.UserControl
    {
        public int Folio { get; set; }

        public string DescripcionSolicitud { get; set; }
        public string MarcaSolicitud { get; set; }
        public string ModeloSolicitud { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

                Producto.Text = DescripcionSolicitud;
                Marca.Text = MarcaSolicitud;
                Modelo.Text = ModeloSolicitud;
            }
        }
    }
}