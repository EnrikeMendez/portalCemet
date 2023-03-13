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

        protected void EvaluacionesLV_ItemDataBound(object sender, ListViewItemEventArgs e)
        {
            if (e.Item.ItemType == ListViewItemType.DataItem)
            {
                var veredictoDL = (DropDownList)e.Item.FindControl("Veredicto");
                Controles.FillDropDownList(veredictoDL, CatalogService.GetCatVeredicto());
            }
        }

        protected void Veredicto_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList veredictoSlt = (DropDownList)sender;
            ListViewItem rowItem = (ListViewItem)veredictoSlt.NamingContainer; // item1, is current row of Listview, which hold the dropdownlist that caused postback. 
            var hallazgoCtrl = (UserControls.Comun.Hallazgo)rowItem.FindControl("HallazgoCtrl");
            if (veredictoSlt.SelectedValue == "2")
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

        protected void GuardarBtn_Click(object sender, EventArgs e)
        {
            var preSolEval = new EvaluacionPresolicitud();

            var solicitudesCtrl = (UserControls.Comun.PreSolicitudSelect)EvaluacionesLV.FindControl("PreSolicitudSelect");
            var noListDeEvalTxt = (TextBox)EvaluacionesLV.FindControl("NoDeListaDeEvaluacion");
            var cantHallTxt = (TextBox)EvaluacionesLV.FindControl("CantidadDeHallazgosEncontrados");
            var sugerenciasTxt = (TextBox)EvaluacionesLV.FindControl("Sugerencias");

            preSolEval.IdSolicitud = solicitudesCtrl.IdSolicitud;
            preSolEval.IdEvaluacionDeSolicitudDeServicio = int.Parse(noListDeEvalTxt.Text);
            preSolEval.Evaluaciones = new List<Evaluacion>();

            foreach (var item in EvaluacionesLV.Items)
            {
                if (item.ItemType == ListViewItemType.DataItem)
                {
                    var veredictoDL = (DropDownList)item.FindControl("Veredicto");
                    var hallazgoCtrl = (UserControls.Comun.Hallazgo)item.FindControl("HallazgoCtrl");

                    //VALIDAR: Aquí metemos el foreach para barrer el control hallazgoCtrl en caso de que sea multiselect
                    var evaluacion = new Evaluacion
                    {
                        //IdEvaluacion = hallazgoCtrl.IdEvaluacion, //Para guardar no es necesario la evaliuacion
                        IdVeredicto = int.Parse(veredictoDL.SelectedValue)
                    };

                    if (evaluacion.IdVeredicto == 2)
                    {
                        evaluacion.IdHallazgo = hallazgoCtrl.IdHallazgo;
                    }

                    preSolEval.Evaluaciones.Add(evaluacion);
                }
            }

            preSolEval.CantidadDeHallazgos = int.Parse(cantHallTxt.Text);
            preSolEval.Sugerencias = sugerenciasTxt.Text;
            preSolEval.UsuarioCrea = 1;

            SolicitudService solicitudService = new SolicitudService();
            solicitudService.GuardaEvaluacionDePresolictud(evaluacionPresolicitud: preSolEval);
            //ReiniciaCampos();
        }

        private void ReiniciaCampos()
        {
            EvaluacionesLV_LoadData(datos: CatalogService.GetCatEvaluacion());

            //var solicitudesCtrl = (UserControls.Comun.PreSolicitudSelect)EvaluacionesLV.FindControl("PreSolicitudSelect");
            var noListDeEvalTxt = (TextBox)EvaluacionesLV.FindControl("NoDeListaDeEvaluacion");
            noListDeEvalTxt.Text = null;
            var cantHallTxt = (TextBox)EvaluacionesLV.FindControl("CantidadDeHallazgosEncontrados");
            cantHallTxt.Text = null;
            var sugerenciasTxt = (TextBox)EvaluacionesLV.FindControl("Sugerencias");
            sugerenciasTxt.Text = null;
        }
    }
}