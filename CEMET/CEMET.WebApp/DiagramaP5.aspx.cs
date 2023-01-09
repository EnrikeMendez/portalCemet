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


    }
}