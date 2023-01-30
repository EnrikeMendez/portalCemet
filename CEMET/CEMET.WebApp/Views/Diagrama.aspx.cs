using CEMET.WebApp.Models;
using CEMET.WebApp.UserControls.Comun;
using Cemetlib.Business;
using Cemetlib.Common;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.ModelBinding;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.Views
{
    public partial class Diagrama : System.Web.UI.Page
    {




        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }
            else
            {

                //the page is being rendered for the first time
                Controles.FillDropDownList(TipoDeServicio, CatalogService.GetCatTipoDeServicio(), agregarOpcionSeleccionar: true);

                //Controles.FillDropDownList(Norma, CatalogService.GetCatNorma(), agregarOpcionSeleccionar: true);

                Controles.FillDropDownList(Voltaje, CatalogService.GetCatVoltaje(), agregarOpcionSeleccionar: true);

                Controles.FillDropDownList(Corriente, CatalogService.GetCatVoltaje(), agregarOpcionSeleccionar: true);

                Controles.FillDropDownList(Potencia, CatalogService.GetCatVoltaje(), agregarOpcionSeleccionar: true);

                Controles.FillDropDownList(ModalidadDeRecoleccion, CatalogService.GetCatModalidadDeRecoleccion(), agregarOpcionSeleccionar: true);

                Controles.FillDropDownList(DiasHabiles, CatalogService.GetCatDiasHabilesPorNorma(), agregarOpcionSeleccionar: true);

                Controles.FillDropDownList(ModalidadDeEntrega, CatalogService.GetCatModalidadDeEntrega(), agregarOpcionSeleccionar: true);

                //Cotizacion2.ValidationGroupForm = TipoDeServicioReqVal.ValidationGroup;
                //Cotizacion2.ValorIVA = 0.16;
                //var g = new tr

            }
        }


        protected void GuardarDiagramaBtn_Click(object sender, EventArgs e)
        {
            //https://stackoverflow.com/questions/6230349/how-to-validate-expression-on-button-click-in-asp-net-c-sharp

            if (Page.IsValid)
            {
                //Do stuff
            }
            else
            {
                //No need for else, the validations should display accordingly
            }

        }
    }
}