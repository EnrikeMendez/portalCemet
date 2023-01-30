using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.UserControls.Comun
{
    public partial class TerminosYCondiciones : System.Web.UI.UserControl
    {
        private bool _UsuarioEstaDeAcuerdo;
        private const string ValidationGroupFormKey = "ValidationGroupTermCond";

        public bool UsuarioEstaDeAcuerdo
        {
            get { return _UsuarioEstaDeAcuerdo; }
            set { _UsuarioEstaDeAcuerdo = value; }
        }

        public string ValidationGroupForm
        {
            get { return (string)Session[ValidationGroupFormKey]; }
            set { Session[ValidationGroupFormKey] = value; }
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            //https://stackoverflow.com/questions/997342/why-does-asp-net-radiobutton-and-checkbox-render-inside-a-span
            AceptoCheck.InputAttributes.Add("class", "form-check-input styled");

            if (IsPostBack)
            {

            }
            else
            {
                if (!string.IsNullOrEmpty(ValidationGroupForm))
                {
                    CustomValidator1.ValidationGroup = ValidationGroupForm;
                }
            }
        }

        //https://stackoverflow.com/questions/10593796/required-field-validator-for-user-control-not-working

        protected void AceptoCheck_CheckedChanged(object sender, EventArgs e)
        {
            _UsuarioEstaDeAcuerdo = AceptoCheck.Checked;
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = AceptoCheck.Checked;
        }
    }
}