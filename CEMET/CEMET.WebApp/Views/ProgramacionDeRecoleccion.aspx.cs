using CEMET.WebApp.App_Code;
using Cemetlib.Business;
using Cemetlib.Data;
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
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                DataTable solicitudes = new DataTable();
                solicitudes = ISolicitud.ObtenerSolicitudesParaProgramaRecoleccion();

                gv_Solicitudes.DataSource = solicitudes;
                gv_Solicitudes.DataBind();
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
                    programacionRecoleccion.FechaRecoleccion = DateTime.Parse(FechaDeRecoleccion.Text);
                    programacionRecoleccion.NumeroProgramacion = int.Parse(NoDeProgramacion.Text);
                    programacionRecoleccion.ReferenciasAdicionales = ReferenciasAdicionales.Text;
                    programacionRecoleccion.Telefono = Telefono.Text;

                    SolicitudService solicitudService = new SolicitudService();
                    solicitudService.ProgramarRecoleccion(programacionRecoleccion);
                    Response.Redirect("../Default.aspx");
                }
            }
        }
    }
}