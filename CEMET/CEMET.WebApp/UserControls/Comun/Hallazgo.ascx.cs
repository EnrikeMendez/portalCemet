using CEMET.WebApp.App_Code;
using Cemetlib.Business;
using Cemetlib.Common;
using System;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.UserControls.Comun
{
    public partial class Hallazgo : SetupUserControl
    {

        public string ClientValidationFunctionForValidator { get; set; }

        public string ValidationGroupForm { get; set; }

        public bool EsRequerido { get; set; }

        public int IdEvaluacion { get; set; }

        public int IdHallazgo
        {
            get { return int.Parse(HallazgoSl.SelectedValue); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }
            else
            {
                Controles.FillDropDownList(HallazgoSl, CatalogoService.GetCatHallazgo(idEvaluacion: IdEvaluacion));

                //if (!string.IsNullOrEmpty(ValidationGroupForm) && EsRequerido)
                //{
                //    CustomValidator1.ValidationGroup = ValidationGroupForm;
                //}

                //if (!string.IsNullOrEmpty(ClientValidationFunctionForValidator) && EsRequerido)
                //{
                //    CustomValidator1.ClientValidationFunction = ClientValidationFunctionForValidator;
                //}
                //else if(!EsRequerido)
                //{
                //    CustomValidator1.IsValid = true;
                //}
            }
        }

        //protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        //{
        //    if (EsRequerido)
        //    {
        //        args.IsValid = !string.IsNullOrEmpty(HallazgoSl.SelectedValue);
        //    }
        //    else
        //    {
        //        args.IsValid = true;
        //    }
        //}
    }
}