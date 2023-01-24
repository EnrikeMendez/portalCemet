using Cemetlib.Business;
using Cemetlib.Common;
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
       
        private void CrearDto()
        {
            PruebasCompletas solicitudPruebasCompletas = new PruebasCompletas();
            solicitudPruebasCompletas.Norma = Norma.SelectedValue;
            solicitudPruebasCompletas.TipoServicio = TipoDeServicio.SelectedValue;
            solicitudPruebasCompletas.Descripcion = DescripcionDelProducto.Text;
            solicitudPruebasCompletas.Marca = Marca.Text;
            solicitudPruebasCompletas.Modelo = Modelo.Text;
            solicitudPruebasCompletas.ModalidadRecoleccion = ModalidadDeRecoleccion.SelectedValue;
            solicitudPruebasCompletas.ModalidadEntrega = ModalidadEntrega.Estandar;
            solicitudPruebasCompletas.Observaciones = Observaciones.Obs;
            solicitudPruebasCompletas.TerminosYCondiciones = TermYCond.UsuarioEstaDeAcuerdo;
            solicitudPruebasCompletas.EmisionInformeEstandar = ModalidadEntrega.Estandar;
            solicitudPruebasCompletas.EmisionInformeEstandar = ModalidadEntrega.Urgente;
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
                Subtotal = 0,
                Iva = 0,
                Total = 0
            };
        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {
            CrearDto();


        }
    }
}