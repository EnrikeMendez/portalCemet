using CEMET.WebApp.App_Code;
using Cemetlib.Business;
using Cemetlib.Common;
using Cemetlib.Data;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.Views
{
    public partial class Consultar : SetupPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable solicitudes = new DataTable();
            solicitudes = ISolicitud.ObtenerSolicitudes();

            gv_Solicitudes.DataSource = solicitudes;
            gv_Solicitudes.DataBind();

            FillCatalogs();
        }

        private void FillCatalogs()
        {
            List<Catalog> serviceTypeItems = CatalogService.GetCatTipoDeServicio();
            Controles.FillDropDownList(TipoDeConsulta, serviceTypeItems, true);
        }

        public void Gv_IndexChanged(object obj, GridViewPageEventArgs e)
        {
            gv_Solicitudes.PageIndex = e.NewPageIndex;
            gv_Solicitudes.DataBind();
        }
    }
}