using Cemetlib.Business;
using Cemetlib.Common;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.Views
{
    public partial class PruebasCompletasEE : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string usuarioId = "User123";
            string appPath = Request.PhysicalApplicationPath;
            string saveDirIns = @"Uploads\" + usuarioId + @"\PruebasCompletas\InstructivoManual";
            string saveDirDocs = @"Uploads\" + usuarioId + @"\PruebasCompletas\DocsAdicionales";

            InstructivoManual.SavePath = Path.Combine(appPath, saveDirIns);
            DocsAdicionales.SavePath = Path.Combine(appPath, saveDirDocs);

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
                        //porque no le pertenece el folio
                        Response.Redirect("PruebasCompletas.aspx");
                    }
                    FolioContainer.Visible = true;
                    Folio.Text = string.Concat("Folio ", folio.Trim());
                }

                FillCatalogs();
                FillDummyData();

                TipoDeServicio.SelectedValue = "T1";
            }
        }

        private void FillCatalogs()
        {
            List<Catalog> serviceTypeItems = CatalogService.GetCatTipoDeServicio();
            Controles.FillDropDownList(TipoDeServicio, serviceTypeItems, agregarOpcionSeleccionar: true);
            List<Catalog> catNorma = CatalogService.GetCatNorma();
            Controles.FillDropDownList(Norma, catNorma, agregarOpcionSeleccionar: true);
            List<Catalog> catCategoria = CatalogService.GetCatCategoria();
            Controles.FillDropDownList(Categoria, catCategoria, agregarOpcionSeleccionar: true);
            List<Catalog> catPaisOrigen = CatalogService.GetCatPaisDeOrigen();
            Controles.FillDropDownList(PaisDeOrigen, catPaisOrigen, agregarOpcionSeleccionar: true);
            List<Catalog> catModalidadRecoleccion = CatalogService.GetCatModalidadDeRecoleccion();
            Controles.FillDropDownList(ModalidadDeRecoleccion, catModalidadRecoleccion, agregarOpcionSeleccionar: true);
            List<Catalog> catVoltaje = CatalogService.GetCatVoltaje();
            Controles.FillDropDownList(Voltaje, catVoltaje, agregarOpcionSeleccionar: true);
            List<Catalog> catCorriente = CatalogService.GetCatVoltaje();
            Controles.FillDropDownList(Corriente, catCorriente, agregarOpcionSeleccionar: true);
            List<Catalog> catPotencia = CatalogService.GetCatVoltaje();
            Controles.FillDropDownList(Potencia, catPotencia, agregarOpcionSeleccionar: true);

        }
        private void FillDummyData()
        {
            DescripcionDelProducto.Text = "Test descripción";
            Marca.Text = "Test marca";
            Modelo.Text = "Test modelo";
            Observaciones.Obs = "";
            TermYCond.UsuarioEstaDeAcuerdo = true;
            Categoria.Text = "Test categoria";
            ReferenciaCertificacion.Text = "Test referencia";
            Observaciones.Obs = "Test observaciones";
        }
        private void CrearDto()
        {
            PruebasCompletas solicitudPruebasCompletas = new PruebasCompletas();
            solicitudPruebasCompletas.TipoServicio = TipoDeServicio.SelectedValue;
            solicitudPruebasCompletas.ServicioAdicional = ServicioAdicional.SelectedValue; //Falta guardarlo en BD
            solicitudPruebasCompletas.Norma = Norma.SelectedValue;
            solicitudPruebasCompletas.NormaParticular = NormaParticular.SelectedValue; //Falta guardarlo en BD
            solicitudPruebasCompletas.Categoria = Categoria.SelectedValue;
            solicitudPruebasCompletas.ReferenciaCertificacion = ReferenciaCertificacion.Text;
            solicitudPruebasCompletas.Descripcion = DescripcionDelProducto.Text;
            solicitudPruebasCompletas.Marca = Marca.Text;
            solicitudPruebasCompletas.Modelo = Modelo.Text;
            solicitudPruebasCompletas.PaisOrigen = PaisDeOrigen.Text;
            solicitudPruebasCompletas.ModalidadRecoleccion = ModalidadDeRecoleccion.SelectedValue;
            solicitudPruebasCompletas.ModalidadEntrega = ModalidadEntrega.ModalidadDeEntrega;
            solicitudPruebasCompletas.DiasHabiles = ModalidadEntrega.DiasHabiles;
            solicitudPruebasCompletas.Observaciones = Observaciones.Obs;
            solicitudPruebasCompletas.TerminosYCondiciones = TermYCond.UsuarioEstaDeAcuerdo;
            solicitudPruebasCompletas.Activo = true;
            solicitudPruebasCompletas.UsuarioCrea = 1;//****
            solicitudPruebasCompletas.UsuarioModifica = null;
            solicitudPruebasCompletas.FechaModifica = null;

            List<EspecificacionElectrica> especificacionElectricas = new List<EspecificacionElectrica>(); 
            especificacionElectricas.Add(new EspecificacionElectrica
            {
                IdVoltaje = int.Parse(Voltaje.SelectedValue),
                IdCorriente = Corriente.SelectedValue,
                IdPotencia = Potencia.SelectedValue
            });
            solicitudPruebasCompletas.EspecificacionesElectricas = especificacionElectricas;

            List <Cotizacion> cotizaciones = new List<Cotizacion>();
            foreach (var cotizacion in Cotizacion2.Cotizaciones)
            {
                cotizaciones.Add(new Cotizacion
                {
                    IdCotizacion = cotizacion.IdCotizacion,
                    IdServicio = cotizacion.IdServicio,
                    IdTarifa = cotizacion.IdTarifa,
                    Servicio = cotizacion.IdServicio,
                    Tarifa = cotizacion.Tarifa
                });
            }
            solicitudPruebasCompletas.Cotizaciones = cotizaciones;
            solicitudPruebasCompletas.Subtotal = float.Parse(Cotizacion2.SubTotal);
            solicitudPruebasCompletas.Total = float.Parse(Cotizacion2.Total);
            solicitudPruebasCompletas.Iva = (float)Cotizacion2.ValorIVA;

            List<Documentos> documentosSolicitud = new List<Documentos>();

            //This is required
            documentosSolicitud.AddRange(
                InstructivoManual.ListaDeDocumentos.Select(x => new Documentos
                {
                    Nombre = x.Nombre,
                    Ruta = "1",//InstructivoManual.SavePath, //con string truena
                    Tipo = "1"//Tipo instructivo
                })
            );

            //This is required
            documentosSolicitud.AddRange(
                Marcado.ListaDeDocumentos.Select(x => new Documentos
                {
                    Nombre = x.Nombre,
                    Ruta = "4",//Revisar
                    Tipo = "4"//Revisar
                })
            );

            //This is required
            documentosSolicitud.AddRange(
                Diagrama.ListaDeDocumentos.Select(x => new Documentos
                {
                    Nombre = x.Nombre,
                    Ruta = "3",//Revisar
                    Tipo = "3"//Revisar
                })
            );

            if (documentosSolicitud.Any())
            {
                documentosSolicitud.AddRange(
                   DocsAdicionales.ListaDeDocumentos.Select(x => new Documentos
                   {
                       Nombre = x.Nombre,
                       Ruta = "2",//DocsAdicionales.SavePath,
                       Tipo = "2"//Tipo Adicional
                   })
               );
            }

            solicitudPruebasCompletas.Documentos = documentosSolicitud;
            string folioSolicitud = Request.QueryString["folio"];
            if (!string.IsNullOrEmpty(folioSolicitud))
            {
                solicitudPruebasCompletas.NumeroFolioSolicitud = int.Parse(folioSolicitud);
            }
            List<string> errores = new List<string>();
            ServicioAltaDeSolicitud servicioAltaDeSolicitud = new ServicioAltaDeSolicitud(solicitudPruebasCompletas);
            int idFolio = servicioAltaDeSolicitud.GuardarSolicitud(out errores);
            Folio.Text = $"Folio guardado {idFolio}";
            Response.Redirect($"SolicitudCreada.aspx?folio={idFolio}");

        }

        protected void GuardaPruebCompBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                CrearDto();
            }


        }
    }
}