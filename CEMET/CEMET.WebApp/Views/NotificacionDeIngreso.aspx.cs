using CEMET.WebApp.App_Code;
using CEMET.WebApp.UserControls.Comun;
using Cemetlib.Business;
using Cemetlib.Model;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.Views
{
    public partial class NotificacionDeIngreso : SetupPage
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillDummyData();
                int folio = Convert.ToInt32(FolioActual);

                //Obtiene la información del folio
                FolioSolicitud infoFolio = new SolicitudService().ObtenerFolioSolicitud(folio: folio);
                FechaDeIngreso.Text = infoFolio.FechaCarga.ToString("dd/MM/yyyy");
                CantidadDeServiciosSolicitados.Text =infoFolio.CantidadDeServiciosSolicitados.ToString();   

                NotificacionSolicitudDeServicio.Folio = folio;

            }
        }

        private void FillDummyData()
        {
            FolioActual = "121";
        }
    }
}