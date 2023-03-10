using CEMET.WebApp.App_Code;
using Cemetlib.Business;
using Cemetlib.Common;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web.UI;

namespace CEMET.WebApp.Views
{
    public partial class PresolicitudParcial : SetupPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string usuarioId = "User123";
            string appPath = Request.PhysicalApplicationPath;

            if (!Page.IsPostBack)
            {
                FillCatalogs();
                FillDummyData();

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

                TipoDeServicio.SelectedValue = "T2";

                string rootSavePath = Helper.CreateTempPath(usuarioId: usuarioId);
                string saveDirIns = rootSavePath + "\\" + Helper.ReadSetting(key: "PruebasParciales_InstructivoManual");
                string saveDirDocs = rootSavePath + "\\" + Helper.ReadSetting(key: "PruebasParciales_DocumentosAdicionales");

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
            List<Catalog> catNormaParticular = CatalogoService.GetCatNormaParticular();
            Controles.FillDropDownList(NormaParticular, catNormaParticular);
            List<Catalog> catMetodoPrueba = CatalogoService.GetCatMetodoDePrueba();
            Controles.FillDropDownList(MetodoDePrueba, catMetodoPrueba);

        }
        private void FillDummyData()
        {
            Observaciones.Obs = "";
            TermYCond.UsuarioEstaDeAcuerdo = true;
            
            Observaciones.Obs = "Test observaciones";
        }
        private void CrearDto()
        {
            SolicitudPruebasParciales solicitudPruebasParciales = new SolicitudPruebasParciales();
            solicitudPruebasParciales.Norma = Norma.SelectedValue;
            solicitudPruebasParciales.NormaParticular = NormaParticular.SelectedValue;
            solicitudPruebasParciales.MetodoPrueba = MetodoDePrueba.SelectedValue;
            solicitudPruebasParciales.TipoServicio = TipoDeServicio.SelectedValue;

            solicitudPruebasParciales.Descripcion = CamposComunes.DescripcionDelProducto_Text;
            solicitudPruebasParciales.Marca = CamposComunes.Marca_Text;
            solicitudPruebasParciales.Modelo = CamposComunes.Modelo_Text;
            solicitudPruebasParciales.PaisOrigen = CamposComunes.PaisDeOrigen_Current_SelectedValue;

            solicitudPruebasParciales.ModalidadRecoleccion = ModalidadEntrega.ModalidadDeRecoleccion;
            solicitudPruebasParciales.ModalidadEntrega = ModalidadEntrega.ModalidadDeEntrega;
            solicitudPruebasParciales.DiasHabiles = ModalidadEntrega.DiasHabiles;

            solicitudPruebasParciales.Observaciones = Observaciones.Obs;
            solicitudPruebasParciales.TerminosYCondiciones = TermYCond.UsuarioEstaDeAcuerdo;

            solicitudPruebasParciales.Activo = true;
            solicitudPruebasParciales.UsuarioCrea = 1;//****
            solicitudPruebasParciales.UsuarioModifica = null;
            solicitudPruebasParciales.FechaModifica = null;

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
            solicitudPruebasParciales.Cotizaciones = cotizaciones;
            solicitudPruebasParciales.Subtotal = float.Parse(Cotizacion2.SubTotal);
            solicitudPruebasParciales.Total = float.Parse(Cotizacion2.Total);
            solicitudPruebasParciales.Iva = (float)Cotizacion2.ValorIVA;

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

            if (documentosSolicitud.Any())
            {
                documentosSolicitud.AddRange(
                   DocsAdicionales.ListaDeDocumentos.Select(x => new Documentos
                   {
                       Nombre = x.Nombre,
                       Ruta = DocsAdicionales.DocumentoRuta,
                       Tipo = "2"//Tipo Adicional
                   })
               );
            }

            solicitudPruebasParciales.Documentos = documentosSolicitud;

            if (!string.IsNullOrEmpty(FolioActual))
            {
                solicitudPruebasParciales.NumeroFolioSolicitud = int.Parse(FolioActual);
            }

            List<string> errores = new List<string>();
            SolicitudService servicioAltaDeSolicitud = new SolicitudService(solicitudPruebasParciales);
            int idFolio = servicioAltaDeSolicitud.GuardarSolicitud(out errores);
            FolioActual = idFolio.ToString();

            Response.Redirect($"SolicitudCreada.aspx");
        }
        protected void GuardaPruebParcialBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                CrearDto();
            }
        }
    }
}