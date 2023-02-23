using Cemetlib.Business;
using Cemetlib.Common;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Web.UI;

namespace CEMET.WebApp.Views
{
    public partial class SolicitudCreada : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            var folio = Request.QueryString["folio"];

            if (UserService.ValidaFolio(folio: folio, out var redirect))
            {
                frmTipoServicio.Visible = false;
                MsgSolicitudCreada.Visible = true;
                MsgNuevaSolicitud.Visible = false;
                if (redirect)
                {
                    //porque no tiene permisos
                    Response.Redirect("../Default.aspx");
                    //porque no le pertenece el folio
                    Response.Redirect("PruebasCompletas.aspx");
                }
            }
            else
            {
                botones.Visible = false;
                frmTipoServicio.Visible = true;
                MsgSolicitudCreada.Visible = false;
                MsgNuevaSolicitud.Visible = true;
            }
            if (!Page.IsPostBack)
            {
                List<Catalog> serviceTypeItems = new List<Catalog>()
                {
                    new Catalog
                    {
                         Text = "Pruebas completas",
                         Value = "T1"
                    },
                    new Catalog
                    {
                         Text = "Pruebas Parciales",
                         Value = "T2"
                    },
                    new Catalog
                    {
                         Text = "Diagrama",
                         Value = "T3"
                    },
                    new Catalog
                    {
                         Text = "Pruebas completas EE",
                         Value = "T5"
                    },
                    new Catalog
                    {
                         Text = "Pruebas Parciales EE",
                         Value = "T6"
                    },
                    new Catalog
                    {
                         Text = "Programación de recolección (*)",
                         Value = "P10"
                    },
                    new Catalog
                    {
                         Text = "Recepción de muestras (*)",
                         Value = "P11"
                    },
                    new Catalog
                    {
                         Text = "Evaluación de presolicitud (*)",
                         Value = "P12"
                    },
                    new Catalog
                    {
                         Text = "Comunicado de hallazgos (*)",
                         Value = "P13"
                    },
                    new Catalog
                    {
                         Text = "Notificación de ingreso FOP-07 (*)",
                         Value = "P14"
                    },
                    new Catalog
                    {
                         Text = "Responsiva control de muestras (*)",
                         Value = "P15"
                    },
                    new Catalog
                    {
                         Text = "Revisión de lista de evaluación (*)",
                         Value = "P16"
                    },
                    new Catalog
                    {
                         Text = "Reporte de desviación FOP-08 (*)",
                         Value = "P17"
                    },
                    new Catalog
                    {
                         Text = "Modalidad de devolución (*)",
                         Value = "P21"
                    },
                    new Catalog
                    {
                         Text = "Consultar (*)",
                         Value = "P25"
                    },
                };
                Controles.FillDropDownList(TipoDeServicio, serviceTypeItems);
            }
           
        }
        protected void SiBtn_Click(object sender, EventArgs e)
        {
            botones.Visible = false;
            frmTipoServicio.Visible = true;
        }
        protected void AgregarBtn_Click(object sender, EventArgs e)
        {
            string folioSolicitud = Request.QueryString["folio"];
            string pagina = string.Empty;
            string tipoSolicitud = TipoDeServicio.SelectedItem.Value;
            switch (tipoSolicitud)
            {
                case "T1":
                    pagina = "PruebasCompletas";
                    break;
                case "T2":
                    pagina = "PruebasParciales";
                    break;
                case "T3":
                    pagina = "Diagrama";
                    break;
                case "T5":
                    pagina = "PruebasCompletasEE";
                    break;
                case "T6":
                    pagina = "PruebasParcialesEE";
                    break;
                case "P10":
                    pagina = "ProgramacionDeRecoleccion";
                    break;
                case "P11":
                    pagina = "RecepcionDeMuestras";
                    break;
                case "P12":
                    pagina = "EvaluacionDePresolicitud";
                    break;
                case "P13":
                    pagina = "ComunicadoDeHallazgos";
                    break;
                case "P14":
                    pagina = "NotificacionDeIngreso";
                    break;
                case "P15":
                    pagina = "ResponsivaControlDeMuestras";
                    break;
                case "P16":
                    pagina = "RevisionDeListaDeEvaluacion";
                    break;
                case "P17":
                    pagina = "ReporteDeDesviacion";
                    break;
                case "P21":
                    pagina = "ProgramacionDeDevolucion";
                    break;
                case "P25":
                    pagina = "Consultar";
                    break;
                default:
                    throw new ArgumentException("La solicitud seleccionada es inválida.");
            }
            string redirectPage = string.IsNullOrEmpty(folioSolicitud) ? $"{pagina}.aspx" : $"{pagina}.aspx?folio={folioSolicitud}";
            Response.Redirect(redirectPage);
        }

        protected void No_Click(object sender, EventArgs e)
        {
            Response.Redirect("/Views/Solicitudes.aspx");
        }
    }
}