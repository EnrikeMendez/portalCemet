using CEMET.WebApp.App_Code;
using Cemetlib.Business;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.Views
{
    public partial class ProgramacionDeRecoleccion : SetupPage
    {
        protected List<int> SolicitudesProgramadas{ get; set; }
        protected bool RecoleccionGuardada { get; set; }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataTable solicitudes = new DataTable();
                solicitudes = new SolicitudService().ObtenerSolicitudesParaProgramaRecoleccion();
                gv_Solicitudes.DataSource = solicitudes;
                gv_Solicitudes.DataBind();
                MensajeExito.Visible = false;
            }
        }
        protected void Guardar_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                bool solicitudSeleccionada = false;
                ProgramacionRecoleccion programacionRecoleccion = new ProgramacionRecoleccion();
                programacionRecoleccion.Solicitudes = new List<int>();
                //Check which folios were selected
                foreach (GridViewRow row in gv_Solicitudes.Rows)
                {
                    CheckBox chk = row.Cells[0].FindControl("chbItem") as CheckBox;
                    if (chk.Checked && chk != null)
                    {
                        solicitudSeleccionada = true;
                        programacionRecoleccion.Solicitudes.Add(int.Parse(row.Cells[2].Text));
                    }
                }
                if (solicitudSeleccionada)
                {
                    programacionRecoleccion.CantidadBultos = int.Parse(CantidadDeBultosAEntregar.Text);
                    programacionRecoleccion.CantidadSolicitudes = int.Parse(CantidadDePresolicitudes.Text);
                    programacionRecoleccion.Contacto = Contacto.Text;
                    programacionRecoleccion.Direccion = Direccion.Text;
                    DateTime fechaRecoleccion = DateTime.Parse(FechaDeRecoleccion.Text);
                    TimeSpan horario = TimeSpan.Parse(Horario.Text);
                    
                    programacionRecoleccion.FechaRecoleccion = new DateTime(fechaRecoleccion.Year, fechaRecoleccion.Month, fechaRecoleccion.Day, horario.Hours, horario.Minutes, horario.Seconds);
                    programacionRecoleccion.NumeroProgramacion = int.Parse(NoDeProgramacion.Text);
                    programacionRecoleccion.ReferenciasAdicionales = ReferenciasAdicionales.Text;
                    programacionRecoleccion.Telefono = Telefono.Text;

                    SolicitudService solicitudService = new SolicitudService();
                    solicitudService.ProgramarRecoleccion(programacionRecoleccion);
                    SolicitudesProgramadas = programacionRecoleccion.Solicitudes;
                    FormularioRecoleccion.Visible = false;
                    MensajeExito.Visible = true;
                }
            }
        }
    }
}