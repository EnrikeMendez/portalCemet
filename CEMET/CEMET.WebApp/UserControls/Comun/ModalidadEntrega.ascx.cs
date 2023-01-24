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
        public string Estandar { get { return DiasHabilesEstandar.SelectedValue; } }
        public string Urgente { get { return DiasHabilesUrgente.SelectedValue; } }
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
            Controles.FillDropDownList(DiasHabilesEstandar, catDiasHabiles);
            Controles.FillDropDownList(DiasHabilesUrgente, catDiasHabiles);
        }
    }
}