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

        public IEnumerable<PruebasCompletas> Solicitudes { get; set; }

        public string CantidadDeServiciosSolicitados { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                Solicitudes = new SolicitudService().GetSolicitudes(folio: Folio);
                CantidadDeServiciosSolicitados = Solicitudes.Count().ToString();

                Producto.Text = Solicitudes.ElementAt(0).Descripcion;
                Marca.Text = Solicitudes.ElementAt(0).Marca;
                Modelo.Text = Solicitudes.ElementAt(0).Modelo;
            }
        }
    }
}