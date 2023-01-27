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
    public partial class ModalidadEntrega : System.Web.UI.UserControl
    {
        public string DiasHabiles { get { return diasHabiles.SelectedValue; } set { diasHabiles.SelectedValue = value; } }
        public string ModalidadDeEntrega { get { return modalidadDeEntrega.SelectedValue; } set { modalidadDeEntrega.SelectedValue = value; } }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillCatalogs();
            }
        }
        private void FillCatalogs()
        {
            List<Catalog> catDiasHabiles = CatalogService.GetCatDiasHabiles();
            Controles.FillDropDownList(diasHabiles, catDiasHabiles);

            List<Catalog> catModalidadEntrega = CatalogService.GetCatModalidadDeEntrega();
            Controles.FillDropDownList(modalidadDeEntrega, catModalidadEntrega);
        }
    }
}