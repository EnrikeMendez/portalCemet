using CEMET.WebApp.App_Code;
using Cemetlib.Business;
using Cemetlib.Common;
using Cemetlib.Data;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.Views
{
    public partial class PresolicitudCompleta : SetupPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string usuarioId = "User123";
            string appPath = Request.PhysicalApplicationPath;

            if (Page.IsPostBack)
            {

            }
            else
            {
                if (UsuarioService.ValidaFolio(folio: FolioActual, out var redirect))
                {
                    if (redirect)
                    {
                        //porque no tiene permisos
                        Response.Redirect("../Default.aspx");
                        //porque no le pertenece el folio
                        //Response.Redirect("PruebasCompletas.aspx");
                    }
                    FolioContainer.Visible = true;
                    Folio.Text = string.Concat("Folio ", FolioActual.Trim());
                }

                FillCatalogs();
                FillDummyData();

                TipoDeServicio.SelectedValue = "T1";

                string rootSavePath = Helper.CreateTempPath(usuarioId: usuarioId);
                string saveDirIns = rootSavePath + "\\" + Helper.ReadSetting(key: "PruebasCompletas_InstructivoManual");
                string saveDirDocs = rootSavePath + "\\" + Helper.ReadSetting(key: "PruebasCompletas_DocumentosAdicionales");

                InstructivoManual.SavePath = Path.Combine(appPath, saveDirIns);
                DocsAdicionales.SavePath = Path.Combine(appPath, saveDirDocs);

                if (!string.IsNullOrWhiteSpace(FolioActual))
                {
                    InicializaCamposComunes(folio: int.Parse(FolioActual), camposComunes: CamposComunes);
                }
            }
        }

        private void FillCatalogs()
        {
            List<Catalog> serviceTypeItems = CatalogoService.GetCatTipoDeServicio();
            Controles.FillDropDownList(TipoDeServicio, serviceTypeItems);
            List<Catalog> catNorma = CatalogoService.GetCatNorma();
            Controles.FillDropDownList(Norma, catNorma);
            List<Catalog> catCategoria = CatalogoService.GetCatCategoria();
            Controles.FillDropDownList(Categoria, catCategoria);
            //List<Catalog> catPaisOrigen = CatalogService.GetCatPaisDeOrigen();
            ////Controles.FillDropDownList(PaisDeOrigen, catPaisOrigen);
            //CamposComunes.PaisDeOrigen_DataSource = catPaisOrigen;
            //List<Catalog> catModalidadRecoleccion = CatalogService.GetCatModalidadDeRecoleccion();
            //Controles.FillDropDownList(ModalidadDeRecoleccion, catModalidadRecoleccion);
        }
        private void FillDummyData()
        {
            //DescripcionDelProducto.Text = "Test descripción";
            //Marca.Text = "Test marca";
            //Modelo.Text = "Test modelo";
            Observaciones.Obs = "";
            TermYCond.UsuarioEstaDeAcuerdo = true;
            Categoria.Text = "Test categoria";
            ReferenciaCertificacion.Text = "Test referencia";
            Observaciones.Obs = "Test observaciones";
        }
        private void CrearDto()
        {
            SolicitudPruebasCompletas solicitudPruebasCompletas = new SolicitudPruebasCompletas();
            solicitudPruebasCompletas.Norma = Norma.SelectedValue;
            solicitudPruebasCompletas.TipoServicio = TipoDeServicio.SelectedValue;
            solicitudPruebasCompletas.Descripcion = CamposComunes.DescripcionDelProducto_Text;
            solicitudPruebasCompletas.Marca = CamposComunes.Marca_Text;
            solicitudPruebasCompletas.Modelo = CamposComunes.Modelo_Text;
            solicitudPruebasCompletas.ModalidadRecoleccion = ModalidadEntrega.ModalidadDeRecoleccion;
            solicitudPruebasCompletas.Observaciones = Observaciones.Obs;
            solicitudPruebasCompletas.TerminosYCondiciones = TermYCond.UsuarioEstaDeAcuerdo;
            solicitudPruebasCompletas.ModalidadEntrega = ModalidadEntrega.ModalidadDeEntrega;
            solicitudPruebasCompletas.DiasHabiles = ModalidadEntrega.DiasHabiles;
            solicitudPruebasCompletas.Activo = true;
            solicitudPruebasCompletas.UsuarioCrea = 1;//****
            solicitudPruebasCompletas.UsuarioModifica = null;
            solicitudPruebasCompletas.FechaModifica = null;
            solicitudPruebasCompletas.Categoria = Categoria.Text;
            solicitudPruebasCompletas.ReferenciaCertificacion = ReferenciaCertificacion.Text;
            solicitudPruebasCompletas.PaisOrigen = CamposComunes.PaisDeOrigen_Current_SelectedValue;
            solicitudPruebasCompletas.Calibre = null;
            List<Cotizacion> cotizaciones = new List<Cotizacion>();
            foreach (var cotizacion in Cotizacion2.Cotizaciones)
            {
                cotizaciones.Add(new Cotizacion
                {
                    IdCotizacion = cotizacion.IdCotizacion,
                    IdServicio = cotizacion.IdServicio,
                    IdTarifa = cotizacion.IdTarifa,
                    Servicio = cotizacion.IdServicio,
                    Tarifa = cotizacion.Tarifa
                });
            }
            solicitudPruebasCompletas.Cotizaciones = cotizaciones;
            solicitudPruebasCompletas.Subtotal = float.Parse(Cotizacion2.SubTotal);
            solicitudPruebasCompletas.Total = float.Parse(Cotizacion2.Total);
            solicitudPruebasCompletas.Iva = (float)Cotizacion2.ValorIVA;

            List<Documentos> documentosSolicitud = new List<Documentos>();

            //This is required
            documentosSolicitud.AddRange(
                InstructivoManual.ListaDeDocumentos.Select(x => new Documentos
                {
                    Nombre = x.Nombre,
                    Ruta = InstructivoManual.SavePath,
                    Tipo = "1"//Tipo instructivo
                })
            );

            if (DocsAdicionales.ListaDeDocumentos.Any())
            {
                documentosSolicitud.AddRange(
                   DocsAdicionales.ListaDeDocumentos.Select(x => new Documentos
                   {
                       Nombre = x.Nombre,
                       Ruta = DocsAdicionales.SavePath,
                       Tipo = "2"//Tipo Adicional
                   })
               );
            }

            solicitudPruebasCompletas.Documentos = documentosSolicitud;

            if (!string.IsNullOrEmpty(FolioActual))
            {
                solicitudPruebasCompletas.NumeroFolioSolicitud = int.Parse(FolioActual);
            }

            List<string> errores = new List<string>();
            SolicitudService servicioAltaDeSolicitud = new SolicitudService(solicitudPruebasCompletas);
            int idFolio = servicioAltaDeSolicitud.GuardarSolicitud(out errores);
            FolioActual = idFolio.ToString();

            Response.Redirect($"SolicitudCreada.aspx");
            //var destinationFolderPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), Helper.ReadSetting(key: "PruebasCompletas_InstructivoManual").Replace("{NoSolicitud}", servicioAltaDeSolicitud.Solicitud.SolicitudId.ToString()));
            //Helper.MoveAllFiles(sourceFolderPath: InstructivoManual.SavePath, destinationFolderPath: destinationFolderPath);

            //if (DocsAdicionales.ListaDeDocumentos.Any())
            //{
            //    destinationFolderPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), Helper.ReadSetting(key: "PruebasCompletas_DocumentosAdicionales").Replace("{NoSolicitud}", servicioAltaDeSolicitud.Solicitud.SolicitudId.ToString()));
            //    Helper.MoveAllFiles(sourceFolderPath: DocsAdicionales.SavePath, destinationFolderPath: destinationFolderPath);
            //}
        }

        protected void GuardaPruebCompBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                CrearDto();
            }


        }
    }
}