using Cemetlib.Business;
using Cemetlib.Common;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.Views
{
    public partial class SolicitudCreada : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            frmTipoServicio.Visible = false;
            List<Catalog> serviceTypeItems = CatalogService.GetCatTipoDeServicio();
            Controles.FillDropDownList(TipoDeServicio, serviceTypeItems);
        }
        protected void SiBtn_Click(object sender, EventArgs e)
        {
            botones.Visible = false;
            frmTipoServicio.Visible = true;
        }
        protected void AgregarBtn_Click(object sender, EventArgs e)
        {
            string folioSolicitud = Request.QueryString["folio"];
            string pagina = string.Empty;
            switch (TipoDeServicio.SelectedValue)
            {
                case "T1":
                    pagina = "PruebasCompletas";
                    break;
                case "2":
                    break;
                case "3":
                    break;
                case "4":
                    break;
                default:
                    throw new ArgumentException("La solicitud seleccionada es inválida.");
            }

            Response.Redirect($"{pagina}.aspx?folio={folioSolicitud}");
        }

        protected void No_Click(object sender, EventArgs e)
        {
            Response.Redirect("../Default.aspx");
        }
    }
}