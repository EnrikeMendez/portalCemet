using CEMET.WebApp.Models;
using Cemetlib.Business;
using Cemetlib.Common;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.UserControls.Comun
{
    public partial class Cotizacion2 : System.Web.UI.UserControl
    {

        //public List<CotizacionModel> Cotizaciones { get; set; }

        //private int myVar;
        private const string CotizacionesLstKey = "CotizacionesTableLst";

        public List<CotizacionModel> Cotizaciones
        {
            get { return (List<CotizacionModel>)Session[CotizacionesLstKey]; }
            set { Session[CotizacionesLstKey] = value; }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {

            }
            else
            {
                Cotizaciones = new List<CotizacionModel>();

                Controles.FillDropDownList(ServicioSolicitado, CatalogService.GetCatServiciosSolicitados(), agregarOpcionSeleccionar: true);

                Controles.FillDropDownList(Tarifa, CatalogService.GetCatTarifas(), agregarOpcionSeleccionar: true);
            }
        }

        //public IQueryable<CotizacionModel> GetCotizaciones()
        //{
        //    return Cotizaciones.AsQueryable();
        //}

        protected void cotizacionList_ItemCommand(object sender, ListViewCommandEventArgs e)
        {
            if (e.CommandName == "Delete")
            {
                string value = e.CommandArgument.ToString();
                var lstView = sender as ListView;
                var removed = Cotizaciones.RemoveAll(x => x.IdCotizacion.Equals(int.Parse(value)));

                cotizacionList.DataSource = null;
                cotizacionList.DataSource = Cotizaciones;
                cotizacionList.DataBind();
                //UpdatePanel1.Update();
            }
        }

        protected void agregarServTarBtn_Click(object sender, EventArgs e)
        {
            Cotizaciones.Add(new CotizacionModel { IdCotizacion = Cotizaciones.Count(), Servicio = "hola", Tarifa = Cotizaciones.Count().ToString() });
            cotizacionList.DataSource = null;
            cotizacionList.DataSource = Cotizaciones;
            cotizacionList.DataBind();
            //UpdatePanel1.Update();
        }

        protected void removeServTarBtn1_Click(object sender, EventArgs e)
        {
            Button btn = sender as Button;
            string value = btn.CommandArgument;
            var removed = Cotizaciones.RemoveAll(x => x.IdCotizacion.Equals(int.Parse(value)));

            cotizacionList.DataSource = null;
            cotizacionList.DataSource = Cotizaciones;
            cotizacionList.DataBind();
        }
    }
}