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
        protected IEnumerable<SolicitudPruebasCompletas> Solicitudes { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillDummyData();
                int folio = Convert.ToInt32(FolioActual);

                //Obtiene la información del folio
                FolioSolicitud infoFolio = new SolicitudService().ObtenerFolioSolicitud(folio: folio);
                Solicitudes = new SolicitudService().GetSolicitudes(folio: folio);
                FechaDeIngreso.Text = infoFolio.FechaCarga.ToString("dd/MM/yyyy");
                CantidadDeServiciosSolicitados.Text =infoFolio.CantidadDeServiciosSolicitados.ToString();


                Repeater1.DataSource = Solicitudes;
                Repeater1.DataBind();

            }
        }
        protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item ||
                e.Item.ItemType == ListItemType.AlternatingItem)
            {
                var solicitud = e.Item.DataItem as SolicitudPruebasCompletas;

                var control = e.Item.FindControl("NotificacionSolicitudDeServicio") as NotificacionSolicitudDeServicio;
                control.DescripcionSolicitud = solicitud.Descripcion;
                control.MarcaSolicitud = solicitud.Marca;
                control.ModeloSolicitud = solicitud.Modelo;
            }
        }
        private void FillDummyData()
        {
            FolioActual = "121";
        }
    }
}