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
    public partial class EspecificacionesElectricas : System.Web.UI.UserControl
    {
        private const string ValidationGroupFormKey = "ValidationGroupEspElectCtrl";


        public bool EsRequerido { get; set; }

        public string ValidationGroup
        {
            get { return (string)Session[CreaLLaveUnica(llave: ValidationGroupFormKey)]; }
            set { Session[CreaLLaveUnica(llave: ValidationGroupFormKey)] = value; }
        }

        private string CreaLLaveUnica(string llave)
        {
            return string.Concat(llave, ID);
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {

            }
            else
            {
                Controles.FillDropDownList(Voltaje, CatalogService.GetCatVoltaje());

                Controles.FillDropDownList(Corriente, CatalogService.GetCatVoltaje());

                Controles.FillDropDownList(Potencia, CatalogService.GetCatVoltaje());

                if (EsRequerido)
                {
                    Voltaje_Label.CssClass = "form-label required-field";
                    Voltaje_RequiredFieldValidator.ValidationGroup = ValidationGroup;

                    Corriente_Label.CssClass = "form-label required-field";
                    Corriente_RequiredFieldValidator.ValidationGroup = ValidationGroup;

                    Potencia_Label.CssClass = "form-label required-field";
                    Potencia_RequiredFieldValidator.ValidationGroup = ValidationGroup;
                }
                else
                {
                    Voltaje_RequiredFieldValidator.IsValid = true;
                    Corriente_RequiredFieldValidator.IsValid = true;
                    Potencia_RequiredFieldValidator.IsValid = true;
                }

            }
        }

        public EspecificacionElectrica GetEspecificacionesElectricas()
        {
            return new EspecificacionElectrica
            {
                IdVoltaje = int.Parse(Voltaje.SelectedValue),
                IdCorriente = Corriente.SelectedValue,
                IdPotencia = Potencia.SelectedValue
            };
        }
    }
}