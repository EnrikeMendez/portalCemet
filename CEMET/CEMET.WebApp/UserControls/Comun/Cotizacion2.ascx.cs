using CEMET.WebApp.Models;
using Cemetlib.Business;
using Cemetlib.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.UserControls.Comun
{
    public partial class Cotizacion2 : System.Web.UI.UserControl
    {
        //https://learn.microsoft.com/en-us/previous-versions/dotnet/articles/ms972429(v=msdn.10)?redirectedfrom=MSDN
        private const string CotizacionesLstKey = "CotizacionesTableLst";
        private const string ValidationGroupFormKey = "ValidationGroupFormLst";
        private const string ValorIVAKey = "ValorIvaFormLst";

        public double ValorIVA
        {
            get { return (double)Session[ValorIVAKey]; }
            set { Session[ValorIVAKey] = value; }
        }

        public string ValidationGroupForm
        {
            get { return (string)Session[ValidationGroupFormKey]; }
            set { Session[ValidationGroupFormKey] = value; }
        }


        public List<CotizacionModel> Cotizaciones
        {
            get { return (List<CotizacionModel>)Session[CotizacionesLstKey]; }
            set { Session[CotizacionesLstKey] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }
            else
            {
                Cotizaciones = new List<CotizacionModel>();

                Controles.FillDropDownList(ServicioSolicitado, CatalogService.GetCatServiciosSolicitados(), agregarOpcionSeleccionar: true);

                Controles.FillDropDownList(Tarifa, CatalogService.GetCatTarifas(), agregarOpcionSeleccionar: true);

                cotizacionList.DataSource = null;
                cotizacionList.DataSource = Cotizaciones;
                cotizacionList.DataBind();

                if (!string.IsNullOrEmpty(ValidationGroupForm))
                {
                    CustomValidator1.ValidationGroup = ValidationGroupForm;
                }

                AgregarServTarBtn.Enabled = false;
            }
        }

        protected void cotizacionList_LayoutCreated(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(ValidationGroupForm))
            {
                var subtotalVal = BuscaControlEnTemplate<RequiredFieldValidator>(idControl: "SubtotalReqValidator");
                subtotalVal.ValidationGroup = ValidationGroupForm;

                var ivaVal = BuscaControlEnTemplate<RequiredFieldValidator>(idControl: "IVAReqValidator");
                ivaVal.ValidationGroup = ValidationGroupForm;

                var ivaLbl = BuscaControlEnTemplate<Label>(idControl: "IVALabel");
                ivaLbl.Text = ivaLbl.Text.Trim().Replace("0", (ValorIVA * 100).ToString() + "%");
            }
        }

        protected void cotizacionList_DataBound(object sender, EventArgs e)
        {
            ActualizaSubTotalIVA();
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

                cotizacionList.DataSource = null;
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

            cotizacionList.DataSource = null;
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

            if (subTxt != null && subTxt != null)
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

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            args.IsValid = Cotizaciones.Any();
        }
    }
}