using Cemetlib.Business;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
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
            if (!Page.IsPostBack)
            {
                FillCatalogs();
            }
        }
        private void FillCatalogs()
        {
            List<Catalog> serviceTypeItems = CatalogService.GetCatTipoDeServicio();
            FillDropDownList(TipoDeServicio, serviceTypeItems);
            List<Catalog> catNorma = CatalogService.GetCatNorma();
            FillDropDownList(Norma, catNorma);
            List<Catalog> catCategoria = CatalogService.GetCatCategoria();
            FillDropDownList(Categoria, catCategoria);
            List<Catalog> catPaisOrigen = CatalogService.GetCatPaisDeOrigen();
            FillDropDownList(PaisDeOrigen, catPaisOrigen);
            List<Catalog> catModalidadRecoleccion = CatalogService.GetCatModalidadDeRecoleccion();
            FillDropDownList(ModalidadDeRecoleccion, catModalidadRecoleccion);
           

            //List<Catalog> catDiasHabiles = CatalogService.GetCatDiasHabiles();
            //FillDropDownList(ModalidadDeEntrega, catDiasHabiles);
        }
        private void FillDropDownList(DropDownList fillingDropDownList, List<Catalog> catalogElements)
        {
            fillingDropDownList.DataValueField = "Value";
            fillingDropDownList.DataTextField = "Text";
            fillingDropDownList.DataSource = catalogElements;
            fillingDropDownList.DataBind();
        }
        private void CrearDto()
        {
            PruebasCompletas solicitudPruebasCompletas = new PruebasCompletas();
            solicitudPruebasCompletas.Norma = Norma.SelectedValue;
            solicitudPruebasCompletas.TipoServicio = TipoDeServicio.SelectedValue;
            solicitudPruebasCompletas.Descripcion = DescripcionDelProducto.Text;
            solicitudPruebasCompletas.Marca = Marca.Text;
            solicitudPruebasCompletas.Modelo = Modelo.Text;
            solicitudPruebasCompletas.ModalidadRecoleccion = null;
            solicitudPruebasCompletas.ModalidadEntrega = null;
            solicitudPruebasCompletas.Observaciones = null;
            solicitudPruebasCompletas.TerminosYCondiciones = false;
            solicitudPruebasCompletas.DiasHabiles = null;
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
                Subtotal = null,
                Iva = null,
                Total = null
            };
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            CrearDto();
        }
    }
}