using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.UserControls.Comun
{
    public partial class SubirArchivo : System.Web.UI.UserControl
    {

        const string SuccessMessageDefault = "Se subió el archivo {0} correctamente.";
        const string MaxSizeErrorMessageDefault = "El archivo {0} supera el máximo permitido en bytes que es {1}.";
        const string ExtensionNotAllowedErrorMessageDefault = "El archivo {0} no se subió debido a que no tiene la extensión {1}.";
        const string NoFileMessageDefault = "No has especificado algún archivo para subir.";
        const string ClaseParaArchivoComoLinkDefault = "btn btn-link";

        public EventHandler OnClickEvent { get; set; }
        public string SavePath { get; set; }
        public string SuccessMessage { get; set; }
        public string MaxSizeErrorMessage { get; set; }
        public string ExtensionNotAllowedErrorMessage { get; set; }
        public string NoFileMessage { get; set; }
        public string SeparadorDeMensaje { get; set; }
        public bool VisualizaNombreDeArchivoComoLink { get; set; }
        public string ClaseParaArchivoComoLink { get; set; }
        public string Etiqueta { get; set; }
        public string DescargarNombreFuncion { get; set; }
        public IDictionary<string, string> MapeoDeArchivos { get; private set; }


        /// <summary>
        /// Comma separated
        /// </summary>
        public string Extensiones { get; set; }

        public int? MaxSizeInBytes { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {
            UploadButton.Click += new EventHandler(UploadButton_Click);
            if (OnClickEvent != null)
            {
                UploadButton.Click += OnClickEvent;
            }

            if (!string.IsNullOrWhiteSpace(Etiqueta))
            {
                UploadTitle.Text = Etiqueta;
            }
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFiles)
            {
                var messages = new List<string>();
                var fileMapping = new Dictionary<string, string>();
                var msg = string.Empty;
                foreach (var file in FileUpload1.PostedFiles)
                {
                    try
                    {
                        // Get the size in bytes of the file to upload.
                        int fileSize = file.ContentLength;
                        string fileName = Server.HtmlEncode(file.FileName);
                        string extension = Path.GetExtension(fileName);

                        // Allow only files less than 2,100,000 bytes (approximately 2 MB) to be uploaded.
                        if (MaxSizeInBytes.HasValue && fileSize < MaxSizeInBytes.Value)
                        {
                            // Notify the user why their file was not uploaded.
                            messages.Add(string.Format(MaxSizeErrorMessage ?? MaxSizeErrorMessageDefault, fileName, MaxSizeInBytes.Value));
                            continue;
                        }

                        // Allow only files with .doc or .xls extensions to be uploaded.
                        if (!string.IsNullOrWhiteSpace(Extensiones)
                            && !Extensiones.Split(',').Select(x => x.ToLowerInvariant().Trim()).Any(y => y.Equals(extension.ToLowerInvariant())))
                        {
                            // Notify the user why their file was not uploaded.
                            messages.Add(string.Format(ExtensionNotAllowedErrorMessage ?? ExtensionNotAllowedErrorMessageDefault,
                                fileName,
                                Extensiones));
                            continue;
                        }

                        Directory.CreateDirectory(SavePath);

                        // Append the name of the uploaded file to the path.
                        var path = Path.Combine(SavePath, fileName);

                        if (File.Exists(path))
                        {
                            File.Delete(path);
                        }

                        // Call the SaveAs method to save the 
                        // uploaded file to the specified path.
                        // This example does not perform all
                        // the necessary error checking.               
                        // If a file with the same name
                        // already exists in the specified path,  
                        // the uploaded file overwrites it.
                        FileUpload1.SaveAs(path);

                        // Notify the user that the file was uploaded successfully.

                        if (VisualizaNombreDeArchivoComoLink)
                        {
                            //msg = string.Format(SuccessMessage ?? SuccessMessageDefault, fileName);
                            //Button button = new Button
                            //{
                            //    CssClass = ClaseParaArchivoComoLink ?? ClaseParaArchivoComoLinkDefault
                            //};
                            //button.Click += OnDownloadClickEvent;
                            //button.Text = msg;

                            //msg = "<button type=\"button\" OnClick=\"DonwloadButton_Click(event)\" class=\"" + (ClaseParaArchivoComoLink ?? ClaseParaArchivoComoLinkDefault) + "\" data-fileName=\"" + fileName + "\">" + string.Format(SuccessMessage ?? SuccessMessageDefault, fileName) + "</button>";
                            msg = "<button type=\"button\" OnClick=\"" + DescargarNombreFuncion + "(event)\" class=\"" + (ClaseParaArchivoComoLink ?? ClaseParaArchivoComoLinkDefault) + "\" data-fileName=\"" + fileName + "\">" + string.Format(SuccessMessage ?? SuccessMessageDefault, fileName) + "</button>";
                            //UploadStatusLabel.Controls.Add(button);
                        }
                        else
                        {

                            msg = string.Format(SuccessMessage ?? SuccessMessageDefault, fileName);
                            //Label label = new Label
                            //{
                            //    CssClass = "",
                            //    Text = msg
                            //};

                            //UploadStatusLabel.Controls.Add(label);
                        }
                        //messages.Add(msg);

                        //We save the path in case user want to see it
                        fileMapping.Add(fileName, path);
                    }
                    catch (Exception ex)
                    {
                        msg = "Excepción para el archivo " + Server.HtmlEncode(file.FileName) + " " + ex.Message;
                        //messages.Add(msg);
                        //Label label = new Label
                        //{
                        //    CssClass = "",
                        //    Text = msg
                        //};
                        //UploadStatusLabel.Controls.Add(label);
                    }
                    messages.Add(msg);
                }

                if (messages.Any())
                {
                    UploadStatusLabel.InnerHtml = string.Join(SeparadorDeMensaje ?? "<br />", messages.ToArray());
                }

                MapeoDeArchivos = fileMapping;
            }
            else
            {
                // Notify the user that a file was not uploaded.
                UploadStatusLabel.InnerHtml = NoFileMessage ?? NoFileMessageDefault;
            }
        }
    }
}