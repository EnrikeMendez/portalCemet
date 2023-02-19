using CEMET.WebApp.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.UserControls.Comun
{
    public partial class SubirArchivo : System.Web.UI.UserControl
    {
        const string MaxSizeErrorMessageDefault = "El archivo {0} supera el máximo permitido en bytes que es {1}.";
        const string ExtensionNotAllowedErrorMessageDefault = "El archivo {0} no se subió debido a que no tiene la extensión {1}.";
        const string ClaseParaCampoRequeridoDefault = "required-field";

        private const string DocumentosLstKey = "LstDocKey";
        private const string ValidationGroupFormKey = "ValGrpSubArcForm";
        private const string SavePathKey = "SavPathKey";

        public string SavePath
        {
            get { return (string)Session[CreaLLaveUnica(llave: SavePathKey)]; }
            set { Session[CreaLLaveUnica(llave: SavePathKey)] = value; }
        }

        /// <summary>
        /// Para eliminar la ruta origen de código (c:/algto/algo/) y solo dejar la ruta final
        /// </summary>
        public string DocumentoRuta
        {
            get { return ((string)Session[CreaLLaveUnica(llave: SavePathKey)] ?? string.Empty).Replace(Request.PhysicalApplicationPath, string.Empty); }
        }

        public string MaxSizeErrorMessage { get; set; }
        public string ExtensionNotAllowedErrorMessage { get; set; }
        public string Etiqueta { get; set; }
        public List<DocumentoModel> ListaDeDocumentos
        {
            get { return (List<DocumentoModel>)Session[CreaLLaveUnica(llave: DocumentosLstKey)]; }
            set { Session[CreaLLaveUnica(llave: DocumentosLstKey)] = value; }
        }
        public bool EsRequerido { get; set; }
        public string ClaseParaCampoRequerido { get; set; }
        public bool CargaMultiple { get; set; }
        public bool ModoLectura { get; set; }
        public string ValidationGroupForm
        {
            get { return (string)Session[CreaLLaveUnica(llave: ValidationGroupFormKey)]; }
            set { Session[CreaLLaveUnica(llave: ValidationGroupFormKey)] = value; }
        }
        /// <summary>
        /// Comma separated
        /// </summary>
        public string Extensiones { get; set; }
        public int? MaxSizeInBytes { get; set; }
        public string ClientValidationFunctionForValidator { get; set; }
        private string CreaLLaveUnica(string llave)
        {
            return string.Concat(llave, ID);
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (IsPostBack)
            {
                ErrorMessagesContainer.InnerHtml = string.Empty;
                ErrorMessagesContainer.Visible = false;
            }
            else
            {
                ListaDeDocumentos = new List<DocumentoModel>();
                DocumentosListView.DataSource = ListaDeDocumentos;
                DocumentosListView.DataBind();

                if (!string.IsNullOrWhiteSpace(Etiqueta))
                {
                    UploadTitle.Text = Etiqueta;
                }

                if (!string.IsNullOrWhiteSpace(Extensiones))
                {
                    UploadTitle.Text = string.Concat(UploadTitle.Text, " ", "(", Extensiones.ToLower(), ")");
                }

                if (EsRequerido)
                {
                    var requeridCss = ClaseParaCampoRequerido ?? ClaseParaCampoRequeridoDefault;

                    if (!string.IsNullOrWhiteSpace(UploadTitle.CssClass)
                        && !UploadTitle.CssClass.Trim().Split(' ').Select(x => x.Trim()).Any(x => x.Equals(requeridCss)))
                    {
                        UploadTitle.CssClass = UploadTitle.CssClass + " " + requeridCss;
                    }
                    else
                    {
                        UploadTitle.CssClass = requeridCss;
                    }
                }

                FileUpload1.AllowMultiple = CargaMultiple;

                if (ModoLectura)
                {
                    FileUpload1.Visible = false;
                    UploadButton.Visible = false;
                }

                if (!string.IsNullOrEmpty(ValidationGroupForm) && EsRequerido)
                {
                    CustomValidator1.ValidationGroup = ValidationGroupForm;
                }

                if (!string.IsNullOrEmpty(ClientValidationFunctionForValidator) && EsRequerido)
                {
                    CustomValidator1.ClientValidationFunction = ClientValidationFunctionForValidator;
                }
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (EsRequerido)
            {
                args.IsValid = ListaDeDocumentos.Any();
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void UploadButton_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFiles)
            {
                var errorMessages = new List<string>();
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
                            errorMessages.Add(string.Format(MaxSizeErrorMessage ?? MaxSizeErrorMessageDefault, fileName, MaxSizeInBytes.Value));
                            continue;
                        }

                        // Allow only files with .doc or .xls extensions to be uploaded.
                        if (!string.IsNullOrWhiteSpace(Extensiones)
                            && !Extensiones.Split(',').Select(x => x.ToLowerInvariant().Trim()).Any(y => y.Equals(extension.ToLowerInvariant())))
                        {
                            // Notify the user why their file was not uploaded.
                            errorMessages.Add(string.Format(ExtensionNotAllowedErrorMessage ?? ExtensionNotAllowedErrorMessageDefault,
                                fileName,
                                Extensiones));
                            continue;
                        }

                        Directory.CreateDirectory(SavePath);

                        // Append the name of the uploaded file to the path.
                        var path = Path.Combine(SavePath, fileName);

                        if (File.Exists(path))
                        {
                            var docDel = ListaDeDocumentos.RemoveAll(x => x.Path.Equals(path));
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
                        //messages.Add(msg);

                        //We save the path in case user want to see it
                        ListaDeDocumentos.Add(new DocumentoModel
                        {
                            IdDocumento = ListaDeDocumentos.Count,
                            Nombre = fileName,
                            Path = path
                        });
                        DocumentosListView.DataSource = ListaDeDocumentos;
                        DocumentosListView.DataBind();
                    }
                    catch (Exception ex)
                    {
                        msg = "Excepción para el archivo " + Server.HtmlEncode(file.FileName) + " " + ex.Message;
                        errorMessages.Add(msg);
                    }
                }

                if (errorMessages.Any())
                {
                    ErrorMessagesContainer.Visible = true;
                    ErrorMessagesContainer.InnerHtml = string.Join("<br />", errorMessages.ToArray());
                }
            }
            else
            {
                // Notify the user that a file was not uploaded.
                //UploadStatusLabel.InnerHtml = NoFileMessage ?? NoFileMessageDefault;
            }
        }

        protected void DocumentosListView_LayoutCreated(object sender, EventArgs e)
        {

        }

        protected void DocumentosListView_DataBound(object sender, EventArgs e)
        {

        }

        protected void EliminaDocumento_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string value = btn.CommandArgument;
            var removed = ListaDeDocumentos.RemoveAll(x => x.IdDocumento.Equals(int.Parse(value)));

            DocumentosListView.DataSource = ListaDeDocumentos;
            DocumentosListView.DataBind();
        }

        protected void DescargaDocumento_Click(object sender, EventArgs e)
        {
            LinkButton btn = sender as LinkButton;
            string value = btn.CommandArgument;
            var documento = ListaDeDocumentos.FirstOrDefault(x => x.IdDocumento == int.Parse(value));

            Response.Clear();
            Response.AddHeader("content-type", GetContentType(Path.GetExtension(path: documento.Path).ToLower()));
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", documento.Nombre));
            Response.TransmitFile(documento.Path);
            Response.End();
        }

        private string GetContentType(string extension)
        {
            //https://developer.mozilla.org/en-US/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types
            var mediaType = "application /octet-stream";

            switch (extension)
            {
                case ".txt":
                    mediaType = "text/plain";
                    break;
                case ".jpeg":
                case ".jpg":
                    mediaType = "image/jpeg";
                    break;
                case ".png":
                    mediaType = "image/png";
                    break;
                case ".doc":
                    mediaType = "application/msword";
                    break;
                case ".docx":
                    mediaType = "application/vnd.openxmlformats-officedocument.wordprocessingml.document";
                    break;
                case ".xls":
                    mediaType = "application/vnd.ms-excel";
                    break;
                case ".xlsx":
                    mediaType = "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet";
                    break;
            }

            return mediaType;
        }



    }
}