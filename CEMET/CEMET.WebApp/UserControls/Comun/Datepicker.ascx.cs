using CEMET.WebApp.App_Code;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.UserControls.Comun
{
    public partial class Datepicker : SetupUserControl
    {
        //public const string DateFormatDefault = "dd/MM/yyyy";
        //private const string FormatoFechaKey = "FormatoFechaKeyDatPic";
        private const string RegexParaFechaKey = "RegexParaFechaDatPic";

        public bool EsRequerido { get; set; }

        public bool EsSoloLectura { get; set; }

        public string Etiqueta { get; set; }

        public string ValidationGroup { get; set; }

        public string FechaSeleccionada
        {
            get { return FechaSeleccionadaTxt.Text; }
            set { FechaSeleccionadaTxt.Text = value; }
        }

        public DateTime? FechaSeleccionadaDT
        {
            get { return Calendario.SelectedDate; }
            set { Calendario.SelectedDate = value; }
        }

        public string FormatoDeFecha { get; set; }

        public string RegexParaFecha
        {
            get { return (string)Session[CreaLLaveUnica(llave: RegexParaFechaKey)]; }
            set { Session[CreaLLaveUnica(llave: RegexParaFechaKey)] = value; }
        }

        public DateTime? FechaFinal { get; set; }

        public DateTime? FechaInicio { get; set; }

        public string OnClientShownEvent { get; set; }

        public string FechaSeleccionada_ClientValidationFunction { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {

            }
            else
            {
                Calendario.Format = FormatoDeFecha;
                Calendario.StartDate = FechaInicio;
                Calendario.EndDate = FechaFinal;
                Calendario.OnClientShown = OnClientShownEvent;

                FechaSeleccionadaTxt.Attributes.Add("placeholder", FormatoDeFecha);

                if (!string.IsNullOrWhiteSpace(Etiqueta))
                {
                    FechaSeleccionadaLabel.Text = Etiqueta;
                }

                if (EsSoloLectura)
                {
                    FechaSeleccionadaTxt.Enabled = false;
                }
                else
                {
                    if (EsRequerido)
                    {
                        FechaSeleccionadaLabel.CssClass = "form-label required-field";
                        FechaSeleccionadaTxtReqVal.ValidationGroup = ValidationGroup;

                        if (!string.IsNullOrWhiteSpace(FechaSeleccionada_ClientValidationFunction))
                        {
                            FechaSeleccionadaTxtReqVal.ClientValidationFunction = FechaSeleccionada_ClientValidationFunction;
                        }
                    }
                    else
                    {
                        FechaSeleccionadaTxtReqVal.IsValid = true;
                    }
                }
            }
        }

        protected void FechaSeleccionadaTxtReqVal_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (EsRequerido)
            {
                args.IsValid = !string.IsNullOrEmpty(FechaSeleccionadaTxt.Text) && ValidaFecha();
            }
            else
            {
                if (string.IsNullOrWhiteSpace(FechaSeleccionadaTxt.Text))
                {
                    args.IsValid = true;
                }
                else
                {
                    args.IsValid = ValidaFecha();
                }
            }
        }

        protected bool ValidaFecha()
        {
            Regex regex = new Regex(@RegexParaFecha);
            bool isValid = regex.IsMatch(FechaSeleccionadaTxt.Text.Trim()) &&
                DateTime.TryParseExact(FechaSeleccionadaTxt.Text.Trim(), Calendario.Format, new CultureInfo("en-GB"), DateTimeStyles.None, out _);

            return isValid;
        }
    }
}