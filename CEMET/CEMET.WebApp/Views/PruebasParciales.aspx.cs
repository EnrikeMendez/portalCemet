using System;
using System.Collections.Generic;
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
        string usuarioId = "User123";
        string appPath = "";
        string saveDir = @"Uploads\";
        protected void Page_Load(object sender, EventArgs e)
        {
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
            Cotizacion.Iva = "1.16";
            Cotizacion.SubTotal = "11.6";
            Cotizacion.Total = "12.22";
        }
    }
}