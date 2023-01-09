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

        public bool UsuarioEstaDeAcuerdo
        {
            get { return _UsuarioEstaDeAcuerdo; }
            set { _UsuarioEstaDeAcuerdo = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            //https://stackoverflow.com/questions/997342/why-does-asp-net-radiobutton-and-checkbox-render-inside-a-span
            AceptoCheck.InputAttributes.Add("class", "form-check-input");
        }

        //https://stackoverflow.com/questions/10593796/required-field-validator-for-user-control-not-working

        protected void AceptoCheck_CheckedChanged(object sender, EventArgs e)
        {
            _UsuarioEstaDeAcuerdo = AceptoCheck.Checked;
        }
    }
}