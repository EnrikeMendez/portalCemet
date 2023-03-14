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
        private const string ValidationGroupFormKey = "ValidationGroupModEntrCtrl";

        public bool EsRequerido { get; set; }

        public string ValidationGroup
        {
            get { return (string)Session[CreaLLaveUnica(llave: ValidationGroupFormKey)]; }
            set { Session[CreaLLaveUnica(llave: ValidationGroupFormKey)] = value; }
        }

        public string ModalidadDeRecoleccion { get { return modalidadDeRecoleccion.SelectedValue; } set { modalidadDeRecoleccion.SelectedValue = value; } }

        public string DiasHabiles { get { return diasHabiles.SelectedValue; } set { diasHabiles.SelectedValue = value; } }

        public string ModalidadDeEntrega { get { return modalidadDeEntrega.SelectedValue; } set { modalidadDeEntrega.SelectedValue = value; } }

        private string CreaLLaveUnica(string llave)
        {
            return string.Concat(llave, ID);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                FillCatalogs();

                if (EsRequerido)
                {
                    modalidadDeRecoleccion_Label.CssClass = "form-label required-field";
                    modalidadDeRecoleccion_RequiredFieldValidator.ValidationGroup = ValidationGroup;

                    modalidadDeEntrega_Label.CssClass = "form-label required-field";
                    modalidadDeEntrega_RequiredFieldValidator.ValidationGroup = ValidationGroup;

                    diasHabiles_Label.CssClass = "form-label required-field";
                    diasHabiles_RequiredFieldValidator.ValidationGroup = ValidationGroup;
                }
                else
                {
                    modalidadDeRecoleccion_RequiredFieldValidator.IsValid = true;
                    modalidadDeEntrega_RequiredFieldValidator.IsValid = true;
                    diasHabiles_RequiredFieldValidator.IsValid = true;
                }
            }
        }
        private void FillCatalogs()
        {

            Controles.FillDropDownList(modalidadDeRecoleccion, CatalogoService.GetCatModalidadDeRecoleccion());


            List<Catalog> catDiasHabiles = CatalogoService.GetCatDiasHabiles();
            Controles.FillDropDownList(diasHabiles, catDiasHabiles);

            List<Catalog> catModalidadEntrega = CatalogoService.GetCatModalidadDeEntrega();
            Controles.FillDropDownList(modalidadDeEntrega, catModalidadEntrega);
        }
    }
}