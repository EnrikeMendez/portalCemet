using Cemetlib.Business;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.IO;
using System.Linq;
using System.Web.UI;

namespace CEMET.WebApp.App_Code
{

    /// <summary>
    /// Clase intermediaria para métodos de configuración que se repiten en las vistas, esta clase hereda Page
    /// y esta debe ser heredada por la clase de la vista
    /// </summary>
    public class SetupPage : Page
    {
        /// <summary>
        /// Inicializa el control de CamposComunes
        /// </summary>
        /// <param name="folio"></param>
        /// <param name="camposComunes"></param>
        public void InicializaCamposComunes(int folio, UserControls.Comun.CamposComunes camposComunes)
        {
            var solicitudes = new SolicitudService().GetSolicitudes(folio: folio);

            if (solicitudes.Any())
            {
                var lastPP = solicitudes.LastOrDefault();

                if (!string.IsNullOrWhiteSpace(lastPP.Descripcion))
                {
                    camposComunes.DescripcionDelProducto_Text = lastPP.Descripcion;
                }

                if (!string.IsNullOrWhiteSpace(lastPP.Marca))
                {
                    camposComunes.Marca_Text = lastPP.Marca;
                }

                if (!string.IsNullOrWhiteSpace(lastPP.Modelo))
                {
                    camposComunes.Modelo_Text = lastPP.Modelo;
                }

                if (!string.IsNullOrWhiteSpace(lastPP.PaisOrigen))
                {
                    camposComunes.PaisDeOrigen_SelectedValue = lastPP.PaisOrigen;
                }
            }
        }

        public string FolioActual
        {
            get
            {
                return Session["Folio"] != null ? Session["Folio"].ToString() : "";
            }
            set
            {
                Session["Folio"] = value;
            }
        }


    }

    /// <summary>
    /// Clase intermediaria para métodos de configuración que se repiten en los controles, esta clase hereda UserControl
    /// y esta debe ser heredada por la clase del control
    /// </summary>
    public class SetupUserControl : UserControl
    {
        /// <summary>
        /// Crea un key-string con el ID del control
        /// </summary>
        /// <param name="llave"></param>
        /// <returns></returns>
        public string CreaLLaveUnica(string llave)
        {
            return string.Concat(llave, ID);
        }
    }

    public static class Helper
    {
        /// <summary>
        /// For read one setting
        /// </summary>
        /// <param name="key">Key correspondent a your setting</param>
        /// <returns>Return the String contains the value to setting</returns>
        public static string ReadSetting(string key)
        {
            var appSettings = ConfigurationManager.AppSettings;
            return appSettings[key] ?? string.Empty;
        }

        /// <summary>
        /// Read all settings for output Dictionary<string,string> 
        /// </summary>        
        /// <returns>Return the Dictionary<string,string> contains all settings</returns>
        public static Dictionary<string, string> ReadAllSettings()
        {
            var result = new Dictionary<string, string>();
            foreach (var key in ConfigurationManager.AppSettings.AllKeys)
                result.Add(key, ConfigurationManager.AppSettings[key]);
            return result;
        }

        /// <summary>
        /// Move all the files defined in the <paramref name="sourceFolderPath"/> to the <
        /// </summary>
        /// <param name="sourceFolderPath"></param>
        /// <param name="destinationFolderPath"></param>
        public static void MoveAllFiles(string sourceFolderPath, string destinationFolderPath)
        {
            try
            {
                var destFolder = Directory.CreateDirectory(path: destinationFolderPath);

                var sourceFiles = Directory.GetFiles(path: sourceFolderPath, searchPattern: "*.*", searchOption: SearchOption.AllDirectories);

                foreach (string file in sourceFiles)
                {
                    FileInfo mFile = new FileInfo(file);
                    // to remove name collisions
                    if (!new FileInfo(destFolder + "\\" + mFile.Name).Exists)
                    {
                        mFile.MoveTo(destFolder + "\\" + mFile.Name);
                    }
                }

                Directory.Delete(path: sourceFolderPath, recursive: true);
            }
            catch (Exception ex)
            {
                //throw ex;
            }
        }

        /// <summary>
        /// 
        /// </summary>
        /// <param name="usuarioId"></param>
        /// <returns></returns>
        public static string CreateTempPath(string usuarioId)
        {
            return ReadSetting(key: "FolderTemporalDocs") + usuarioId;
        }
    }
}