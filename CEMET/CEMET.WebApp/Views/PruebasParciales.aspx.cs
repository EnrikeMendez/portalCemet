using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Cemetlib.Business;
using Cemetlib.Common;
using Cemetlib.Model;

namespace CEMET.WebApp.Views
{
    public partial class PresolicitudParcial : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string usuarioId = "User123";
            string appPath = Request.PhysicalApplicationPath;
            string saveDirIns = @"Uploads\" + usuarioId + @"\PruebasParciales\InstructivoManual";
            string saveDirDocs = @"Uploads\" + usuarioId + @"\PruebasParciales\DocsAdicionales";
            InstructivoManual.SavePath = Path.Combine(appPath, saveDirIns);
            DocsAdicionales.SavePath = Path.Combine(appPath, saveDirDocs);
            if (!Page.IsPostBack)
            {
                FillCatalogs();
                FillDummyData();
            }
            TipoDeServicio.SelectedValue = "T2";
        }
        private void FillCatalogs()
        {
            List<Catalog> serviceTypeItems = CatalogService.GetCatTipoDeServicio();
            Controles.FillDropDownList(TipoDeServicio, serviceTypeItems);
            List<Catalog> catNorma = CatalogService.GetCatNorma();
            Controles.FillDropDownList(Norma, catNorma);
            List<Catalog> catNormaParticular = CatalogService.GetCatNormaParticular();
            Controles.FillDropDownList(NormaParticular, catNormaParticular);
            List<Catalog> catPaisOrigen = CatalogService.GetCatPaisDeOrigen();
            Controles.FillDropDownList(PaisDeOrigen, catPaisOrigen);
            List<Catalog> catModalidadRecoleccion = CatalogService.GetCatModalidadDeRecoleccion();
            Controles.FillDropDownList(ModalidadDeRecoleccion, catModalidadRecoleccion);
            List<Catalog> catMetodoPrueba = CatalogService.GetCatMetodoDePrueba();
            Controles.FillDropDownList(MetodoDePrueba, catMetodoPrueba);

        }
        private void FillDummyData()
        {
            DescripcionDelProducto.Text = "Test descripción";
            Marca.Text = "Test marca";
            Modelo.Text = "Test modelo";
            Observaciones.Obs = "";
            TermYCond.UsuarioEstaDeAcuerdo = true;
            
            Observaciones.Obs = "Test observaciones";
        }
        private void CrearDto()
        {
            PruebasParciales solicitudPruebasParciales = new PruebasParciales();
            solicitudPruebasParciales.Norma = Norma.SelectedValue;
            solicitudPruebasParciales.NormaParticular = NormaParticular.SelectedValue;
            solicitudPruebasParciales.MetodoPrueba = MetodoDePrueba.SelectedValue;
            solicitudPruebasParciales.TipoServicio = TipoDeServicio.SelectedValue;
            solicitudPruebasParciales.Descripcion = DescripcionDelProducto.Text;
            solicitudPruebasParciales.Marca = Marca.Text;
            solicitudPruebasParciales.Modelo = Modelo.Text;
            solicitudPruebasParciales.ModalidadRecoleccion = ModalidadDeRecoleccion.SelectedValue;
            solicitudPruebasParciales.Observaciones = Observaciones.Obs;
            solicitudPruebasParciales.TerminosYCondiciones = TermYCond.UsuarioEstaDeAcuerdo;
            solicitudPruebasParciales.ModalidadEntrega = ModalidadEntrega.ModalidadDeEntrega;
            solicitudPruebasParciales.DiasHabiles = ModalidadEntrega.DiasHabiles;
            solicitudPruebasParciales.Activo = true;
            solicitudPruebasParciales.UsuarioCrea = 1;//****
            solicitudPruebasParciales.UsuarioModifica = null;
            solicitudPruebasParciales.FechaModifica = null;
            List<Cotizacion> cotizaciones = new List<Cotizacion>();
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
            solicitudPruebasParciales.Cotizaciones = cotizaciones;
            solicitudPruebasParciales.Subtotal = float.Parse(Cotizacion2.SubTotal);
            solicitudPruebasParciales.Total = float.Parse(Cotizacion2.Total);
            solicitudPruebasParciales.Iva = (float)Cotizacion2.ValorIVA;

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

            solicitudPruebasParciales.Documentos = documentosSolicitud;
            string folioSolicitud = Request.QueryString["folio"];
            if (!string.IsNullOrEmpty(folioSolicitud))
            {
                solicitudPruebasParciales.NumeroFolioSolicitud = int.Parse(folioSolicitud);
            }
            int idFolio = ServicioAltaDeSolicitud.GuardarSolicitud(solicitudPruebasParciales);
            Folio.Text = $"Folio guardado {idFolio}";
            Response.Redirect($"SolicitudCreada.aspx?folio={idFolio}");

        }
        protected void GuardaPruebParcialBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                CrearDto();
            }
        }
    }
}