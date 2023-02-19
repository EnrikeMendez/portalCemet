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
    public partial class PresolicitudCompleta : System.Web.UI.Page
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
                var folio = Request.QueryString["folio"];

                if (UserService.ValidaFolio(folio: folio, out var redirect))
                {
                    if (redirect)
                    {
                        //porque no tiene permisos
                        Response.Redirect("../Default.aspx");
                        //porque no le pertenece el folio
                        Response.Redirect("PruebasCompletas.aspx");
                    }
                    FolioContainer.Visible = true;
                    Folio.Text = string.Concat("Folio ", folio.Trim());
                }

                FillCatalogs();
                FillDummyData();

                TipoDeServicio.SelectedValue = "T1";

                string rootSavePath = Helper.CreateTempPath(usuarioId: usuarioId);
                string saveDirIns = rootSavePath + "\\" + Helper.ReadSetting(key: "PruebasCompletas_InstructivoManual");
                string saveDirDocs = rootSavePath + "\\" + Helper.ReadSetting(key: "PruebasCompletas_DocumentosAdicionales");

                InstructivoManual.SavePath = Path.Combine(appPath, saveDirIns);
                DocsAdicionales.SavePath = Path.Combine(appPath, saveDirDocs);

                if (!string.IsNullOrWhiteSpace(folio))
                {
                    InicializaCamposComunes(folio: int.Parse(folio));
                }
            }
        }

        private void FillCatalogs()
        {
            List<Catalog> serviceTypeItems = CatalogService.GetCatTipoDeServicio();
            Controles.FillDropDownList(TipoDeServicio, serviceTypeItems);
            List<Catalog> catNorma = CatalogService.GetCatNorma();
            Controles.FillDropDownList(Norma, catNorma);
            List<Catalog> catCategoria = CatalogService.GetCatCategoria();
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
            PruebasCompletas solicitudPruebasCompletas = new PruebasCompletas();
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
            string folioSolicitud = Request.QueryString["folio"];
            if (!string.IsNullOrEmpty(folioSolicitud))
            {
                solicitudPruebasCompletas.NumeroFolioSolicitud = int.Parse(folioSolicitud);
            }
            List<string> errores = new List<string>();
            ServicioAltaDeSolicitud servicioAltaDeSolicitud = new ServicioAltaDeSolicitud(solicitudPruebasCompletas);
            int idFolio = servicioAltaDeSolicitud.GuardarSolicitud(out errores);

            //var destinationFolderPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), Helper.ReadSetting(key: "PruebasCompletas_InstructivoManual").Replace("{NoSolicitud}", servicioAltaDeSolicitud.Solicitud.SolicitudId.ToString()));
            //Helper.MoveAllFiles(sourceFolderPath: InstructivoManual.SavePath, destinationFolderPath: destinationFolderPath);

            //if (DocsAdicionales.ListaDeDocumentos.Any())
            //{
            //    destinationFolderPath = Path.Combine(Environment.GetFolderPath(Environment.SpecialFolder.MyDocuments), Helper.ReadSetting(key: "PruebasCompletas_DocumentosAdicionales").Replace("{NoSolicitud}", servicioAltaDeSolicitud.Solicitud.SolicitudId.ToString()));
            //    Helper.MoveAllFiles(sourceFolderPath: DocsAdicionales.SavePath, destinationFolderPath: destinationFolderPath);
            //}

            Folio.Text = $"Folio guardado {idFolio}";
            Response.Redirect($"SolicitudCreada.aspx?folio={idFolio}");

        }

        private void InicializaCamposComunes(int folio)
        {
            var db = ISolicitud.ObtenerSolicitudes(folio: folio);
            var ppList = new List<PruebasCompletas>();

            if (db != null && db.Rows.Count > 0)
            {
                ppList = db.AsEnumerable().Select(row =>
                  new PruebasCompletas
                  {
                      Descripcion = row.Field<string>("SOL_Dsc_Producto"),
                      Marca = row.Field<string>("SOL_Marca"),
                      Modelo = row.Field<string>("SOL_Modelo"),
                      PaisOrigen = row.Field<string>("SOL_CPA_Id")
                  }).ToList();

                var lastPP = ppList.Last();

                if (!string.IsNullOrWhiteSpace(lastPP.Descripcion))
                {
                    CamposComunes.DescripcionDelProducto_Text = lastPP.Descripcion;
                }

                if (!string.IsNullOrWhiteSpace(lastPP.Marca))
                {
                    CamposComunes.Marca_Text = lastPP.Marca;
                }

                if (!string.IsNullOrWhiteSpace(lastPP.Modelo))
                {
                    CamposComunes.Modelo_Text = lastPP.Modelo;
                }

                if (!string.IsNullOrWhiteSpace(lastPP.PaisOrigen))
                {
                    CamposComunes.PaisDeOrigen_SelectedValue = lastPP.PaisOrigen;
                }
            }
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