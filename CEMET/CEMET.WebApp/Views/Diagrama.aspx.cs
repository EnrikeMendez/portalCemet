using CEMET.WebApp.UserControls.Comun;
using Cemetlib.Business;
using Cemetlib.Common;
using Cemetlib.Data;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
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

                if (!string.IsNullOrWhiteSpace(folio))
                {
                    InicializaCamposComunes(folio: int.Parse(folio));
                }
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

        private void InicializaCamposComunes(int folio)
        {
            var db = ISolicitud.ObtenerSolicitudes(folio: folio);
            var ppList = new List<PruebasCompletas>();

            if (db != null && db.Rows.Count > 0)
            {
                ppList = db.AsEnumerable().Select(row =>
                  new PruebasCompletas
                  {
                      Descripcion = row.Field<string>("SOL_Dsc_Producto"),
                      Marca = row.Field<string>("SOL_Marca"),
                      Modelo = row.Field<string>("SOL_Modelo"),
                      PaisOrigen = row.Field<string>("SOL_CPA_Id")
                  }).ToList();

                var lastPP = ppList.Last();

                if (!string.IsNullOrWhiteSpace(lastPP.Descripcion))
                {
                    CamposComunes.DescripcionDelProducto_Text = lastPP.Descripcion;
                }

                if (!string.IsNullOrWhiteSpace(lastPP.Marca))
                {
                    CamposComunes.Marca_Text = lastPP.Marca;
                }

                if (!string.IsNullOrWhiteSpace(lastPP.Modelo))
                {
                    CamposComunes.Modelo_Text = lastPP.Modelo;
                }

                if (!string.IsNullOrWhiteSpace(lastPP.PaisOrigen))
                {
                    CamposComunes.PaisDeOrigen_SelectedValue = lastPP.PaisOrigen;
                }
            }
        }

        protected void CreaDTO(string folio)
        {
            var diagrama = new DiagramaMarcado();

            diagrama.TipoServicio = TipoDeServicio.SelectedValue;
            diagrama.Descripcion = CamposComunes.DescripcionDelProducto_Text;
            diagrama.Marca = CamposComunes.Marca_Text;
            diagrama.Modelo = CamposComunes.Modelo_Text;
            if(!string.IsNullOrWhiteSpace(CamposComunes.PaisDeOrigen_Current_SelectedValue))
            {
                diagrama.PaisOrigen = CamposComunes.PaisDeOrigen_Current_SelectedValue;
            }
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