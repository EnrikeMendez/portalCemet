using CEMET.WebApp.Models;
using Cemetlib.Business;
using Cemetlib.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.UserControls.Comun
{
    public partial class Cotizacion : System.Web.UI.UserControl
    {
        //https://learn.microsoft.com/en-us/previous-versions/dotnet/articles/ms972429(v=msdn.10)?redirectedfrom=MSDN
        private const string CotizacionesLstKey = "CotizacionesTableLst";
        private const string ValidationGroupFormKey = "ValidationGroupCotFormLst";
        private const string ValorIVAKey = "ValorIvaFormLst";

        public double ValorIVA
        {
            get { return (double)Session[CreaLLaveUnica(llave: ValorIVAKey)]; }
            set { Session[CreaLLaveUnica(llave: ValorIVAKey)] = value; }
        }

        public string ValidationGroupForm
        {
            get { return (string)Session[CreaLLaveUnica(llave: ValidationGroupFormKey)]; }
            set { Session[CreaLLaveUnica(llave: ValidationGroupFormKey)] = value; }
        }

        public List<CotizacionModel> Cotizaciones
        {
            get { return (List<CotizacionModel>)Session[CreaLLaveUnica(llave: CotizacionesLstKey)]; }
            set { Session[CreaLLaveUnica(llave: CotizacionesLstKey)] = value; }
        }

        public string SubTotal
        {
            get
            {
                var totalTxt = BuscaControlEnTemplate<TextBox>(idControl: "Subtotal");
                return totalTxt.Text;
            }
        }

        public string Total
        {
            get
            {
                var subTxt = BuscaControlEnTemplate<TextBox>(idControl: "Total");
                return subTxt.Text;
            }
        }

        /// <summary>
        /// Esta función debe de incluir los paréntesis al final del nombre debido a que se pasa como atributo y será llamado por el control como nombre_de_la_funcion()
        /// </summary>
        public string OnClientChangeEventDropdown { get; set; }

        public string ClientValidationFunctionForValidator { get; set; }

        public string AgregaServClientId
        {
            get
            {
                return AgregarServTarBtn.ClientID;
            }
        }

        public string ServicioSolicitadoClientId
        {
            get
            {
                return ServicioSolicitado.ClientID;
            }
        }

        public string TarifaClientId
        {
            get
            {
                return Tarifa.ClientID;
            }
        }

        public bool EsRequerido { get; set; }

        private string CreaLLaveUnica(string llave)
        {
            return string.Concat(llave, ID);
        }


        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }
            else
            {
                Cotizaciones = new List<CotizacionModel>();

                Controles.FillDropDownList(ServicioSolicitado, CatalogoService.GetCatServiciosSolicitados(), agregarOpcionSeleccionar: true);

                Controles.FillDropDownList(Tarifa, CatalogoService.GetCatTarifas(), agregarOpcionSeleccionar: true);

                cotizacionList.DataSource = Cotizaciones;
                cotizacionList.DataBind();

                if (!string.IsNullOrEmpty(ValidationGroupForm))
                {
                    CustomValidator1.ValidationGroup = ValidationGroupForm;
                }

                AgregarServTarBtn.Enabled = false;

                if (!string.IsNullOrEmpty(OnClientChangeEventDropdown))
                {
                    ServicioSolicitado.Attributes.Add("onchange", OnClientChangeEventDropdown);
                    Tarifa.Attributes.Add("onchange", OnClientChangeEventDropdown);
                }

                if (!string.IsNullOrEmpty(ClientValidationFunctionForValidator) && EsRequerido)
                {
                    CustomValidator1.ClientValidationFunction = ClientValidationFunctionForValidator;
                }
            }
        }

        protected void cotizacionList_LayoutCreated(object sender, EventArgs e)
        {
            var ivaLbl = BuscaControlEnTemplate<Label>(idControl: "IVALabel");
            ivaLbl.Text = ivaLbl.Text.Trim().Replace("0", (ValorIVA * 100).ToString() + "%");

            if (!string.IsNullOrEmpty(ValidationGroupForm) && EsRequerido)
            {
                var subtotalVal = BuscaControlEnTemplate<RequiredFieldValidator>(idControl: "SubtotalReqValidator");
                subtotalVal.ValidationGroup = ValidationGroupForm;

                var ivaVal = BuscaControlEnTemplate<RequiredFieldValidator>(idControl: "IVAReqValidator");
                ivaVal.ValidationGroup = ValidationGroupForm;

                var totalVal = BuscaControlEnTemplate<RequiredFieldValidator>(idControl: "TotalReqValidator");
                totalVal.ValidationGroup = ValidationGroupForm;
            }
        }

        protected void cotizacionList_DataBound(object sender, EventArgs e)
        {
            ActualizaSubTotalIVA();
            ActualizaTotal();
        }

        protected void AgregarServTarBtn_Click(object sender, EventArgs e)
        {
            if (!string.IsNullOrWhiteSpace(ServicioSolicitado.SelectedValue) &&
               !string.IsNullOrWhiteSpace(Tarifa.SelectedValue))
            {
                Cotizaciones.Add(new CotizacionModel
                {
                    IdCotizacion = Cotizaciones.Count(),
                    IdServicio = ServicioSolicitado.SelectedItem.Value,
                    Servicio = ServicioSolicitado.SelectedItem.Text,
                    IdTarifa = Tarifa.SelectedItem.Value,
                    Tarifa = Tarifa.SelectedItem.Text
                });

                AgregarServTarBtn.Enabled = true;

                cotizacionList.DataSource = Cotizaciones;
                cotizacionList.DataBind();
            }
            else
            {
                AgregarServTarBtn.Enabled = false;
            }
        }

        protected void EliminaServTarBtn1_Click(object sender, EventArgs e)
        {
            //https://stackoverflow.com/questions/30348225/pass-variable-with-onclick-method-in-asp-net
            Button btn = sender as Button;
            string value = btn.CommandArgument;
            var removed = Cotizaciones.RemoveAll(x => x.IdCotizacion.Equals(int.Parse(value)));

            cotizacionList.DataSource = Cotizaciones;
            cotizacionList.DataBind();
        }

        protected T BuscaControlEnTemplate<T>(string idControl)
        {
            //https://stackoverflow.com/questions/433846/access-a-control-inside-a-the-layouttemplate-of-a-listview
            return (T)Convert.ChangeType(cotizacionList.FindControl(idControl), typeof(T));
        }

        protected void ActualizaSubTotalIVA()
        {
            var subTxt = BuscaControlEnTemplate<TextBox>(idControl: "Subtotal");
            var ivaTxt = BuscaControlEnTemplate<TextBox>(idControl: "IVA");

            if (subTxt != null && ivaTxt != null)
            {
                var sub = 0.0;
                if (Cotizaciones != null && Cotizaciones.Any())
                {
                    Cotizaciones.ForEach(x =>
                    {
                        if (double.TryParse(x.Tarifa.Replace(",", string.Empty).Replace("$", string.Empty).Replace(" ", string.Empty), out var number))
                        {
                            sub += number;
                        }
                    });
                }

                if (sub > 0)
                {
                    subTxt.Text = sub.ToString();
                    ivaTxt.Text = (sub * ValorIVA).ToString();
                }
                else
                {
                    subTxt.Text = string.Empty;
                    ivaTxt.Text = string.Empty;
                }
            }
        }

        protected void ActualizaTotal()
        {
            var totalTxt = BuscaControlEnTemplate<TextBox>(idControl: "Total");
            var subTxt = BuscaControlEnTemplate<TextBox>(idControl: "Subtotal");
            var ivaTxt = BuscaControlEnTemplate<TextBox>(idControl: "IVA");

            if (totalTxt != null && subTxt != null && ivaTxt != null)
            {
                var total = 0.0;

                if (!string.IsNullOrWhiteSpace(subTxt.Text) &&
                    double.TryParse(subTxt.Text.Replace(",", string.Empty).Replace("$", string.Empty).Replace(" ", string.Empty), out var number))
                {
                    total += number;
                }

                if (!string.IsNullOrWhiteSpace(ivaTxt.Text) &&
                    double.TryParse(ivaTxt.Text.Replace(",", string.Empty).Replace("$", string.Empty).Replace(" ", string.Empty), out number))
                {
                    total += number;
                }

                if (total > 0)
                {
                    totalTxt.Text = total.ToString();
                }
                else
                {
                    totalTxt.Text = 0.ToString();
                }
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (EsRequerido)
            {
                args.IsValid = Cotizaciones.Any();
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void Subtotal_TextChanged(object sender, EventArgs e)
        {

        }
    }
}