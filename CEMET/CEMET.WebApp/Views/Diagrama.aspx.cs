using CEMET.WebApp.UserControls.Comun;
using Cemetlib.Business;
using Cemetlib.Common;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Web.UI;
using Cotizacion = Cemetlib.Model.Cotizacion;

namespace CEMET.WebApp.Views
{
    public partial class Diagrama : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {

            }
            else
            {
                var folio = Request.QueryString["folio"];

                if (UserService.ValidaFolio(folio: folio, out var redirect))
                {
                    if (redirect)
                    {
                        //porque no tiene permisos
                        Response.Redirect("../Default.aspx");
                        ////porque no le pertenece el folio
                        //Response.Redirect("PruebasCompletas.aspx");
                    }
                    FolioContainer.Visible = true;
                    Folio.Text = string.Concat("Folio ", folio.Trim());
                }

                //the page is being rendered for the first time
                Controles.FillDropDownList(TipoDeServicio, CatalogService.GetCatTipoDeServicio(), agregarOpcionSeleccionar: true);

                Controles.FillDropDownList(Voltaje, CatalogService.GetCatVoltaje(), agregarOpcionSeleccionar: true);

                Controles.FillDropDownList(Corriente, CatalogService.GetCatVoltaje(), agregarOpcionSeleccionar: true);

                Controles.FillDropDownList(Potencia, CatalogService.GetCatVoltaje(), agregarOpcionSeleccionar: true);

                Controles.FillDropDownList(ModalidadDeRecoleccion, CatalogService.GetCatModalidadDeRecoleccion(), agregarOpcionSeleccionar: true);

                Controles.FillDropDownList(DiasHabiles, CatalogService.GetCatDiasHabilesPorNorma(), agregarOpcionSeleccionar: true);

                Controles.FillDropDownList(ModalidadDeEntrega, CatalogService.GetCatModalidadDeEntrega(), agregarOpcionSeleccionar: true);

                TipoDeServicio.SelectedValue = "T3";
            }
        }

        protected void GuardarDiagramaBtn_Click(object sender, EventArgs e)
        {
            //https://stackoverflow.com/questions/6230349/how-to-validate-expression-on-button-click-in-asp-net-c-sharp

            if (Page.IsValid)
            {
                CreaDTO(folio: Request.QueryString["folio"]);
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
            diagrama.Descripcion = DescripcionDelProducto.Text;
            diagrama.Marca = Marca.Text;
            diagrama.Modelo = Modelo.Text;
            //region Solicitud_Especificaciones_Electricas
            diagrama.EspecificacionesElectricas = new List<EspecificacionElectrica>();
            diagrama.EspecificacionesElectricas.Add(new EspecificacionElectrica
            {
                IdVoltaje = int.Parse(Voltaje.SelectedValue),
                IdCorriente = Corriente.SelectedValue,
                IdPotencia = Potencia.SelectedValue
            });
            //endregion
            diagrama.ModalidadRecoleccion = ModalidadDeRecoleccion.SelectedValue;
            diagrama.ModalidadEntrega = ModalidadDeEntrega.SelectedValue;
            diagrama.DiasHabiles = DiasHabiles.SelectedValue;
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
                FolioContainer.Visible = true;
                Folio.Text = string.Concat("Folio ", folio.Trim());
            }
            List<string> errores = new List<string>();
            ServicioAltaDeSolicitud servicioAltaDeSolicitud = new ServicioAltaDeSolicitud(diagrama);
            int idFolio = servicioAltaDeSolicitud.GuardarSolicitud(out errores);

            Response.Redirect($"SolicitudCreada.aspx?folio={idFolio}");
        }
    }
}