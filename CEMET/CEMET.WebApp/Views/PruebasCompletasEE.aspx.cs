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
    public partial class PruebasCompletasEE : SetupPage
    {
        private const string NormaIdBandera = "8"; // NOM-003-SCFI
        //066 = 19
        //177 = 17
        private readonly string[] NormaParticularIdBandera = new string[] { "19", "17" };

        protected void Page_Load(object sender, EventArgs e)
        {
            string usuarioId = "User123";
            string appPath = Request.PhysicalApplicationPath;

            if (Page.IsPostBack)
            {

            }
            else
            {
                var folio = Session["Folio"] != null ? Session["Folio"].ToString() : "";

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
                string saveDirIns = rootSavePath + "\\" + Helper.ReadSetting(key: "PruebasCompletas_EE_InstructivoManual");
                string saveMarcado = rootSavePath + "\\" + Helper.ReadSetting(key: "PruebasCompletas_EE_Marcado");
                string saveDirDiagrama = rootSavePath + "\\" + Helper.ReadSetting(key: "PruebasCompletas_EE_Diagrama");
                string saveDirDocs = rootSavePath + "\\" + Helper.ReadSetting(key: "PruebasCompletas_EE_DocumentosAdicionales");

                InstructivoManual.SavePath = Path.Combine(appPath, saveDirIns);
                Marcado.SavePath = Path.Combine(appPath, saveMarcado);
                Diagrama.SavePath = Path.Combine(appPath, saveDirDiagrama);
                DocsAdicionales.SavePath = Path.Combine(appPath, saveDirDocs);

                if (!string.IsNullOrWhiteSpace(folio))
                {
                    InicializaCamposComunes(folio: int.Parse(folio), camposComunes: CamposComunes);
                }
            }
        }

        private void FillCatalogs()
        {
            Controles.FillDropDownList(ServicioAdicional, CatalogService.GetCatServicioAdicional());
            Controles.FillDropDownList(NormaParticular, CatalogService.GetCatNormaParticular());

            List<Catalog> serviceTypeItems = CatalogService.GetCatTipoDeServicio();
            Controles.FillDropDownList(TipoDeServicio, serviceTypeItems);
            List<Catalog> catNorma = CatalogService.GetCatNorma();
            Controles.FillDropDownList(Norma, catNorma);
            List<Catalog> catCategoria = CatalogService.GetCatCategoria();
            Controles.FillDropDownList(Categoria, catCategoria);
        }

        private void FillDummyData()
        {
            Observaciones.Obs = "";
            TermYCond.UsuarioEstaDeAcuerdo = true;
            Categoria.Text = "Test categoria";
            ReferenciaCertificacion.Text = "Test referencia";
            Observaciones.Obs = "Test observaciones";
        }

        private void CrearDto()
        {
            PruebasCompletas solicitudPruebasCompletas = new PruebasCompletas();
            solicitudPruebasCompletas.TipoServicio = TipoDeServicio.SelectedValue;
            solicitudPruebasCompletas.Norma = Norma.SelectedValue;

            solicitudPruebasCompletas.ServiciosAdicionales = new List<ServicioAdicional>()
            {
                new ServicioAdicional { IdServicioAdicional = ServicioAdicional.SelectedValue}
            };

            if (Norma.SelectedValue == NormaIdBandera)
            {
                solicitudPruebasCompletas.Normas = new List<Norma>
                {
                    new Norma {
                        IdNormaReferencia = int.Parse(Norma.SelectedValue),
                        IdNormaParticular = int.Parse(NormaParticular.SelectedValue)
                    }
                };

                if (NormaParticularIdBandera.Contains(NormaParticular.SelectedValue))
                {
                    solicitudPruebasCompletas.Calibre = Calibre.Text;
                }
            }

            solicitudPruebasCompletas.Categoria = Categoria.SelectedValue;
            solicitudPruebasCompletas.ReferenciaCertificacion = ReferenciaCertificacion.Text;

            solicitudPruebasCompletas.Descripcion = CamposComunes.DescripcionDelProducto_Text;
            solicitudPruebasCompletas.Marca = CamposComunes.Marca_Text;
            solicitudPruebasCompletas.Modelo = CamposComunes.Modelo_Text;
            solicitudPruebasCompletas.PaisOrigen = CamposComunes.PaisDeOrigen_Current_SelectedValue;

            solicitudPruebasCompletas.ModalidadRecoleccion = ModalidadEntrega.ModalidadDeRecoleccion;
            solicitudPruebasCompletas.ModalidadEntrega = ModalidadEntrega.ModalidadDeEntrega;
            solicitudPruebasCompletas.DiasHabiles = ModalidadEntrega.DiasHabiles;

            solicitudPruebasCompletas.Observaciones = Observaciones.Obs;
            solicitudPruebasCompletas.TerminosYCondiciones = TermYCond.UsuarioEstaDeAcuerdo;

            solicitudPruebasCompletas.Activo = true;
            solicitudPruebasCompletas.UsuarioCrea = 1;//****
            solicitudPruebasCompletas.UsuarioModifica = null;
            solicitudPruebasCompletas.FechaModifica = null;

            solicitudPruebasCompletas.EspecificacionesElectricas = new List<EspecificacionElectrica>()
            {
                EspecificacionesElectricas.GetEspecificacionesElectricas()
            };

            solicitudPruebasCompletas.Cotizaciones = new List<Cotizacion>();
            foreach (var cotizacion in Cotizacion2.Cotizaciones)
            {
                solicitudPruebasCompletas.Cotizaciones.Add(new Cotizacion
                {
                    IdCotizacion = cotizacion.IdCotizacion,
                    IdServicio = cotizacion.IdServicio,
                    IdTarifa = cotizacion.IdTarifa,
                    Servicio = cotizacion.IdServicio,
                    Tarifa = cotizacion.Tarifa
                });
            }
            solicitudPruebasCompletas.Subtotal = float.Parse(Cotizacion2.SubTotal);
            solicitudPruebasCompletas.Total = float.Parse(Cotizacion2.Total);
            solicitudPruebasCompletas.Iva = (float)Cotizacion2.ValorIVA;

            List<Documentos> documentosSolicitud = new List<Documentos>();

            //This is required
            documentosSolicitud.AddRange(
                InstructivoManual.ListaDeDocumentos.Select(x => new Documentos
                {
                    Nombre = x.Nombre,
                    Ruta = InstructivoManual.DocumentoRuta,
                    Tipo = "1"//Tipo instructivo
                })
            );

            //This is required
            documentosSolicitud.AddRange(
                Marcado.ListaDeDocumentos.Select(x => new Documentos
                {
                    Nombre = x.Nombre,
                    Ruta = Marcado.DocumentoRuta,
                    Tipo = "3"//Revisar
                })
            );

            //This is required
            documentosSolicitud.AddRange(
                Diagrama.ListaDeDocumentos.Select(x => new Documentos
                {
                    Nombre = x.Nombre,
                    Ruta = Diagrama.DocumentoRuta,
                    Tipo = "4"//Revisar
                })
            );

            documentosSolicitud.AddRange(
               DocsAdicionales.ListaDeDocumentos.Select(x => new Documentos
               {
                   Nombre = x.Nombre,
                   Ruta = DocsAdicionales.DocumentoRuta,
                   Tipo = "2"//Tipo Adicional
               })
           );

            solicitudPruebasCompletas.Documentos = documentosSolicitud;
            var folioSolicitud = Session["Folio"] != null ? Session["Folio"].ToString() : "";
            if (!string.IsNullOrEmpty(folioSolicitud))
            {
                solicitudPruebasCompletas.NumeroFolioSolicitud = int.Parse(folioSolicitud);
            }
            List<string> errores = new List<string>();
            ServicioAltaDeSolicitud servicioAltaDeSolicitud = new ServicioAltaDeSolicitud(solicitudPruebasCompletas);
            int idFolio = servicioAltaDeSolicitud.GuardarSolicitud(out errores);
            Folio.Text = $"Folio guardado {idFolio}";
            Session["Folio"] = idFolio;
            Response.Redirect($"SolicitudCreada.aspx");

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