using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.UserControls.Comun
{
    //https://stackoverflow.com/questions/1469280/asp-net-datetime-picker
    //https://learn.microsoft.com/en-us/dotnet/api/system.web.ui.webcontrols.calendar?view=netframework-4.8.1

    public partial class Datepicker : System.Web.UI.UserControl
    {
        public const string DateFormatDefault = "yyyy/MM/dd";

        private string _DateFormat;

        public bool IsReadOnlyCalendar { get; set; }

        public bool IsReadOnlyTextbox { get; set; }

        public DateTime? SelectedDate { get; set; }

        public string DateFormat
        {
            get { return FormatoDeFecha(); }
            set { _DateFormat = value; }
        }

        public string GetSelectedDateFormated
        {
            get { return SelectedDate.HasValue ? null : SelectedDate.Value.ToString(FormatoDeFecha()); }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (SelectedDate.HasValue)
                {
                    Calendario.SelectedDate = SelectedDate.Value;
                    Calendario.TodaysDate = SelectedDate.Value;
                }
                else
                {
                    Calendario.SelectedDate = DateTime.Now;
                    Calendario.TodaysDate = DateTime.Now;
                }

                FechaSeleccionada.Text = Calendario.SelectedDate.ToString(FormatoDeFecha());
                FechaSeleccionada.ReadOnly = IsReadOnlyTextbox;

                FechaLabel.InnerText = FechaLabel.InnerText.Replace("XXXXX", FormatoDeFecha());
                Calendario.Enabled = !IsReadOnlyCalendar;
            }
        }

        protected void Calendario_SelectionChanged(object sender, EventArgs e)
        {
            FechaSeleccionada.Text = Calendario.SelectedDate.ToString(FormatoDeFecha());
            SelectedDate = Calendario.SelectedDate;
        }

        private string FormatoDeFecha()
        {
            return _DateFormat ?? DateFormatDefault;
        }
    }
}