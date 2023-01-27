using Cemetlib.Business;
using Cemetlib.Common;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.UserControls.Comun
{
    public partial class Cotizacion : System.Web.UI.UserControl
    {
        public string SubTotal { get { return Subtotal.Text; } set { Subtotal.Text = value; } }
        public string Iva { get { return iva.Text; } set { iva.Text = value; } }
        public string Total { get { return total.Text; } set { total.Text = value; } }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillCatalogs();
            }
        }
        private void FillCatalogs()
        {
            List<Catalog> catDesgloce = CatalogService.GetCatServiciosSolicitados();
            Controles.FillDropDownList(Desgloce, catDesgloce);
        }
    }
}