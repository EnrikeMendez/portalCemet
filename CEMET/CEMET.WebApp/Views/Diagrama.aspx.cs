using CEMET.WebApp.App_Code;
using CEMET.WebApp.UserControls.Comun;
using Cemetlib.Business;
using Cemetlib.Common;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Web.UI;
using Cotizacion = Cemetlib.Model.Cotizacion;

namespace CEMET.WebApp.Views
{
    public partial class Diagrama : SetupPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {

            }
            else
            {
                if (UserService.ValidaFolio(folio: FolioActual, out var redirect))
                {
                    if (redirect)
                    {
                        //porque no tiene permisos
                        Response.Redirect("../Default.aspx");
                        ////porque no le pertenece el folio
                        //Response.Redirect("PruebasCompletas.aspx");
                    }
                    FolioContainer.Visible = true;
                    Folio.Text = string.Concat("Folio ", FolioActual.Trim());
                }

                //the page is being rendered for the first time
                Controles.FillDropDownList(TipoDeServicio, CatalogService.GetCatTipoDeServicio(), agregarOpcionSeleccionar: true);

                TipoDeServicio.SelectedValue = "T3";

                if (!string.IsNullOrWhiteSpace(FolioActual))
                {
                    InicializaCamposComunes(folio: int.Parse(FolioActual), camposComunes: CamposComunes);
                }
            }
        }

        protected void GuardarDiagramaBtn_Click(object sender, EventArgs e)
        {
            //https://stackoverflow.com/questions/6230349/how-to-validate-expression-on-button-click-in-asp-net-c-sharp

            if (Page.IsValid)
            {
                var folio = Session["Folio"] != null ? Session["Folio"].ToString() : "";
                CreaDTO(folio: folio);
            }
            else
            {
                //No need for else, the validations should display accordingly
            }

        }

        protected void CreaDTO(string folio)
        {
            var diagrama = new DiagramaMarcado();

            diagrama.TipoServicio = TipoDeServicio.SelectedValue;
            diagrama.Descripcion = CamposComunes.DescripcionDelProducto_Text;
            diagrama.Marca = CamposComunes.Marca_Text;
            diagrama.Modelo = CamposComunes.Modelo_Text;
            diagrama.PaisOrigen = CamposComunes.PaisDeOrigen_Current_SelectedValue;
            //region Solicitud_Especificaciones_Electricas
            diagrama.EspecificacionesElectricas = new List<EspecificacionElectrica>() { EspecificacionesElectricas.GetEspecificacionesElectricas() };
            //endregion
            diagrama.ModalidadRecoleccion = ModalidadEntrega.ModalidadDeRecoleccion;
            diagrama.ModalidadEntrega = ModalidadEntrega.ModalidadDeEntrega;
            diagrama.DiasHabiles = ModalidadEntrega.DiasHabiles;
            //region Solicitud_Cotizacion
            diagrama.Cotizaciones = new List<Cotizacion>();
            foreach (var cotizacion in Cotizacion2.Cotizaciones)
            {
                diagrama.Cotizaciones.Add(new Cotizacion
                {
                    IdCotizacion = cotizacion.IdCotizacion,
                    IdServicio = cotizacion.IdServicio,
                    IdTarifa = cotizacion.IdTarifa,
                    Servicio = cotizacion.IdServicio,
                    Tarifa = cotizacion.Tarifa
                });
            }
            diagrama.Subtotal = float.Parse(Cotizacion2.SubTotal);
            diagrama.Total = float.Parse(Cotizacion2.Total);
            diagrama.Iva = (float)Cotizacion2.ValorIVA;
            //endregion
            diagrama.Observaciones = Observaciones.Obs;
            diagrama.TerminosYCondiciones = TermYCond.UsuarioEstaDeAcuerdo;

            diagrama.Activo = true;
            diagrama.UsuarioCrea = 1;//****
            diagrama.UsuarioModifica = null;
            diagrama.FechaModifica = null;

            if (!string.IsNullOrWhiteSpace(folio))
            {
                diagrama.NumeroFolioSolicitud = int.Parse(folio.Trim());
            }

            List<string> errores = new List<string>();
            ServicioAltaDeSolicitud servicioAltaDeSolicitud = new ServicioAltaDeSolicitud(diagrama);
            int idFolio = servicioAltaDeSolicitud.GuardarSolicitud(out errores);
            FolioActual = idFolio.ToString();

            Response.Redirect($"SolicitudCreada.aspx");
        }
    }
}