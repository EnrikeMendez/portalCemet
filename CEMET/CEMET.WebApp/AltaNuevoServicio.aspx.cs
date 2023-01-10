using Cemetlib.Business;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp
{
    public partial class DiagramaP5 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //TermYCond.YoAcepto;
            // Get the physical file system path for the currently
            // executing application.
            string appPath = Request.PhysicalApplicationPath;
            string saveDir = @"Uploads\User";
            if (!Page.IsPostBack)
            {
                FillCatalogs();
                ShowFullTestForm();
            }
            
            


            FichaTecnica.SavePath = Path.Combine(appPath, saveDir);
            //FichaTecnica.Extensiones = ".exe, .pdf";
            //FichaTecnica.VisualizaNombreDeArchivoComoLink = true;
            //SubirArchivo.OnDownloadClickEvent += new EventHandler(DonwloadButton_Click);
            //FichaTecnica.Etiqueta = "Ficha técnica del equipo";
            //FichaTecnica.DescargarNombreFuncion = "SubirArchivoDownload_Click";
            //****************************************************
            DocsAdicionales.SavePath = Path.Combine(appPath, saveDir);
            //DocsAdicionales.Extensiones = ".jpg";
            //DocsAdicionales.VisualizaNombreDeArchivoComoLink = true;
            //DocsAdicionales.OnDownloadClickEvent += new EventHandler(DonwloadButton_Click);
            //DocsAdicionales.Etiqueta = "Documentos adicionales";
            //DocsAdicionales.DescargarNombreFuncion = "DocsAdicionalesDownload_Click";

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
            List<Catalog> catModalidadEntrega = CatalogService.GetCatModalidadDeEntrega();
            FillDropDownList(ModalidadDeEntrega, catModalidadEntrega);


            List<Catalog> catCorriente = CatalogService.GetCatCorriente();
            FillDropDownList(Corriente, catCorriente);
            List<Catalog> catVoltaje = CatalogService.GetCatVoltaje();
            FillDropDownList(Voltaje, catVoltaje);
            List<Catalog> catPotencia = CatalogService.GetCatPotencia();
            FillDropDownList(Potencia, catPotencia);
            
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

        protected void TipoDeServicio_SelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList dropDownList = (DropDownList)sender;
            switch (dropDownList.SelectedItem.Text)
            {
                case "Pruebas completas":
                    ShowFullTestForm();
                    break;
                case "Pruebas parciales":
                    ShowParialTestForm();
                    break;
                case "Diagrama":
                    ShowDiagramForm();
                    break;
                case "Marcado":
                    ShowMarkForm();
                    break;
                default:
                    throw new ArgumentException("Opción de tipo de servicio no válida");
            }
        }
        protected void ShowFullTestForm()
        {
            Norma.Visible = true;
            lbl_Norma.Visible = true;
            Categoria.Visible = true;
            lbl_Categoria.Visible = true;
            ReferenciaCertificacion.Visible = true;
            lbl_ReferenciaCertificacion.Visible = true;
            PaisDeOrigen.Visible = true;
            lbl_PaisDeOrigen.Visible = true;
            InstructivoManual.Visible = true;
            DocsAdicionales.Visible = true;

            NormaParticular.Visible = false;
            lbl_NormaParticular.Visible = false;
            MetodoDePrueba.Visible = false;
            lbl_MetodoDePrueba.Visible = false;
            Voltaje.Visible = false;
            lbl_Voltaje.Visible = false;
            Corriente.Visible = false;
            lbl_Corriente.Visible = false;
            Potencia.Visible = false;
            lbl_Potencia.Visible = false;
            FichaTecnica.Visible = false;
            Marcado.Visible = false;
            Diagrama.Visible = false;
            TituloFileUploader.Visible = true;
            TituloEspecElectricas.Visible = false;
            TituloConsumo.Visible = false;
        }
        protected void ShowParialTestForm()
        {
            Norma.Visible = true;
            lbl_Norma.Visible = true;
            Categoria.Visible = false;
            lbl_Categoria.Visible = false;
            ReferenciaCertificacion.Visible = false;
            lbl_ReferenciaCertificacion.Visible = false;
            PaisDeOrigen.Visible = true;
            lbl_PaisDeOrigen.Visible = true;
            InstructivoManual.Visible = true;
            DocsAdicionales.Visible = true;
            NormaParticular.Visible = true;
            lbl_NormaParticular.Visible = true;
            MetodoDePrueba.Visible = true;
            lbl_MetodoDePrueba.Visible = true;
            Voltaje.Visible = false;
            lbl_Voltaje.Visible = false;
            Corriente.Visible = false;
            lbl_Corriente.Visible = false;
            Potencia.Visible = false;
            lbl_Potencia.Visible = false;
            FichaTecnica.Visible = false;
            TituloFileUploader.Visible = true;
            TituloEspecElectricas.Visible = false;
            TituloConsumo.Visible = false;
        }
        protected void ShowDiagramForm()
        {
            Norma.Visible = false;
            lbl_Norma.Visible = false;
            Categoria.Visible = false;
            lbl_Categoria.Visible = false;
            ReferenciaCertificacion.Visible = false;
            lbl_ReferenciaCertificacion.Visible = false;
            PaisDeOrigen.Visible = false;
            lbl_PaisDeOrigen.Visible = false;
            InstructivoManual.Visible = false;
            DocsAdicionales.Visible = false;
            NormaParticular.Visible = false;
            lbl_NormaParticular.Visible = false;
            MetodoDePrueba.Visible = false;
            lbl_MetodoDePrueba.Visible = false;
            Voltaje.Visible = true;
            lbl_Voltaje.Visible = true;
            Corriente.Visible = true;
            lbl_Corriente.Visible = true;
            Potencia.Visible = true;
            lbl_Potencia.Visible = true;
            FichaTecnica.Visible = false;
            TituloFileUploader.Visible = false;
            TituloEspecElectricas.Visible = true;
            TituloConsumo.Visible = true;
        }
        protected void ShowMarkForm()
        {
            Norma.Visible = true;
            lbl_Norma.Visible = true;
            Categoria.Visible = false;
            lbl_Categoria.Visible = false;
            ReferenciaCertificacion.Visible = false;
            lbl_ReferenciaCertificacion.Visible = false;
            PaisDeOrigen.Visible = true;
            lbl_PaisDeOrigen.Visible = true;
            InstructivoManual.Visible = false;
            DocsAdicionales.Visible = true;
            NormaParticular.Visible = false;
            lbl_NormaParticular.Visible = false;
            MetodoDePrueba.Visible = false;
            lbl_MetodoDePrueba.Visible = false;
            Voltaje.Visible = true;
            lbl_Voltaje.Visible = true;
            Corriente.Visible = true;
            lbl_Corriente.Visible = true;
            Potencia.Visible = true;
            lbl_Potencia.Visible = true;
            FichaTecnica.Visible = true;
            TituloFileUploader.Visible = true;
            TituloEspecElectricas.Visible = true;
            TituloConsumo.Visible = true;
        }
    }
}