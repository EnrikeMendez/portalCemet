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
    public partial class PresolicitudCompleta : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string usuarioId = "User123";
            string appPath = Request.PhysicalApplicationPath;
            string saveDir = @"Uploads\"+ usuarioId;

            //InstructivoManual.SavePath = Path.Combine(appPath, saveDir);
            //DocsAdicionales.SavePath = Path.Combine(appPath, saveDir);

            if (Page.IsPostBack)
            {

            }
            else
            {
                FillCatalogs();
                FillDummyData();
            }
        }
        private void FillCatalogs()
        {
            List<Catalog> serviceTypeItems = CatalogService.GetCatTipoDeServicio();
            Controles.FillDropDownList(TipoDeServicio, serviceTypeItems);
            List<Catalog> catNorma = CatalogService.GetCatNorma();
            Controles.FillDropDownList(Norma, catNorma);
            List<Catalog> catCategoria = CatalogService.GetCatCategoria();
            Controles.FillDropDownList(Categoria, catCategoria);
            List<Catalog> catPaisOrigen = CatalogService.GetCatPaisDeOrigen();
            Controles.FillDropDownList(PaisDeOrigen, catPaisOrigen);
            List<Catalog> catModalidadRecoleccion = CatalogService.GetCatModalidadDeRecoleccion();
            Controles.FillDropDownList(ModalidadDeRecoleccion, catModalidadRecoleccion);
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
            Cotizacion.Iva = "1.16";
            Cotizacion.SubTotal = "11.6";
            Cotizacion.Total = "12.22";
        }
        private void CrearDto()
        {
            PruebasCompletas solicitudPruebasCompletas = new PruebasCompletas();
            solicitudPruebasCompletas.Norma = Norma.SelectedValue;
            solicitudPruebasCompletas.TipoServicio = TipoDeServicio.SelectedValue;
            solicitudPruebasCompletas.Descripcion = DescripcionDelProducto.Text;
            solicitudPruebasCompletas.Marca = Marca.Text;
            solicitudPruebasCompletas.Modelo = Modelo.Text;
            solicitudPruebasCompletas.ModalidadRecoleccion = ModalidadDeRecoleccion.SelectedValue;
            solicitudPruebasCompletas.Observaciones = Observaciones.Obs;
            solicitudPruebasCompletas.TerminosYCondiciones = TermYCond.UsuarioEstaDeAcuerdo;
            solicitudPruebasCompletas.ModalidadEntrega = ModalidadEntrega.ModalidadDeEntrega;
            solicitudPruebasCompletas.DiasHabiles = ModalidadEntrega.DiasHabiles;
            solicitudPruebasCompletas.Activo = true;
            solicitudPruebasCompletas.UsuarioCrea = 1;//****
            solicitudPruebasCompletas.UsuarioModifica = null;
            solicitudPruebasCompletas.FechaModifica = null;
            solicitudPruebasCompletas.Categoria = Categoria.Text;
            solicitudPruebasCompletas.ReferenciaCertificacion = ReferenciaCertificacion.Text;
            solicitudPruebasCompletas.PaisOrigen = PaisDeOrigen.Text;
            solicitudPruebasCompletas.Calibre = null;
            solicitudPruebasCompletas.Cotizacion = new Cotizacion
            {
                Subtotal = float.Parse(Cotizacion.SubTotal),
                Iva = float.Parse(Cotizacion.Iva),
                Total = float.Parse(Cotizacion.Total)
            };
            int idFolio = ServicioAltaDeSolicitud.GuardarSolicitud(solicitudPruebasCompletas);
            Folio.Text = $"Folio guardado {idFolio}";
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