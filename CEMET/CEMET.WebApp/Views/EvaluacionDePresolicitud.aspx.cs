using CEMET.WebApp.App_Code;
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
    public partial class EvaluacionDePresolicitud : SetupPage
    {
        private void EvaluacionesLV_LoadData(List<Catalog> datos)
        {
            EvaluacionesLV.DataSource = datos;
            EvaluacionesLV.DataBind();
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                
            }
            else
            {
                //the page is being rendered for the first time
                EvaluacionesLV_LoadData(datos: CatalogService.GetCatEvaluacion());
            }
        }


        protected void EvaluacionesLV_DataBound(object sender, EventArgs e)
        {

        }

        protected void EvaluacionesLV_LayoutCreated(object sender, EventArgs e)
        {

        }

        protected void EvaluacionesLV_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var hallazgSle = (DropDownList)e.Item.FindControl("Veredicto");
                Controles.FillDropDownList(hallazgSle, CatalogService.GetCatVeredicto());
            }
        }

        protected void Veredicto_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddlListFind = (DropDownList)sender;
            ListViewItem rowItem = (ListViewItem)ddlListFind.NamingContainer; // item1, is current row of Listview, which hold the dropdownlist that caused postback. 
            var hallazgoCtrl = (UserControls.Comun.Hallazgo)rowItem.FindControl("HallazgoCtrl");
            if (ddlListFind.SelectedValue == "2")
            {
                hallazgoCtrl.Visible = true;
            }
            else
            {
                hallazgoCtrl.Visible = false;
            }
        }

        protected void ValidarBtn_Click(object sender, EventArgs e)
        {

        }
    }
}