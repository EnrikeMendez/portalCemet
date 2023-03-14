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
    public partial class Marcado : SetupPage
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
                        ////porque no le pertenece el folio
                        //Response.Redirect("PruebasCompletas.aspx");
                    }
                    FolioContainer.Visible = true;
                    Folio.Text = string.Concat("Folio ", FolioActual.Trim());
                }

                //the page is being rendered for the first time
                Controles.FillDropDownList(TipoDeServicio, CatalogoService.GetCatTipoDeServicio(), agregarOpcionSeleccionar: true);

                Controles.FillDropDownList(Norma, CatalogoService.GetCatNorma());

                TipoDeServicio.SelectedValue = "T4";

                string rootSavePath = Helper.CreateTempPath(usuarioId: usuarioId);
                string saveFichaTecnica = rootSavePath + "\\" + Helper.ReadSetting(key: "Marcado_FichaTecnicaDelEquipo");
                string saveDirDocs = rootSavePath + "\\" + Helper.ReadSetting(key: "Marcado_DocumentosAdicionales");

                FichaTecnicaDelEquipo.SavePath = Path.Combine(appPath, saveFichaTecnica);
                DocsAdicionales.SavePath = Path.Combine(appPath, saveDirDocs);

                if (!string.IsNullOrWhiteSpace(FolioActual))
                {
                    InicializaCamposComunes(folio: int.Parse(FolioActual), camposComunes: CamposComunes);
                }
            }
        }

        protected void GuardarDiagramaBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                //var folio = Session["Folio"] != null ? Session["Folio"].ToString() : "";
                CreaDTO(folio: FolioActual);
            }
        }


        protected void CreaDTO(string folio)
        {
            var diagrama = new SolicitudDiagramaMarcado();

            diagrama.TipoServicio = TipoDeServicio.SelectedValue;
            diagrama.Norma = Norma.SelectedValue;

            diagrama.Descripcion = CamposComunes.DescripcionDelProducto_Text;
            diagrama.Marca = CamposComunes.Marca_Text;
            diagrama.Modelo = CamposComunes.Modelo_Text;
            diagrama.PaisOrigen = CamposComunes.PaisDeOrigen_Current_SelectedValue;
            //region Solicitud_Especificaciones_Electricas
            diagrama.EspecificacionesElectricas = new List<EspecificacionElectrica>() { EspecificacionesElectricas.GetEspecificacionesElectricas() };
            //endregion
            diagrama.ModalidadRecoleccion = ModalidadEntrega.ModalidadDeRecoleccion;
            diagrama.ModalidadEntrega = ModalidadEntrega.ModalidadDeEntrega;
            diagrama.DiasHabiles = ModalidadEntrega.DiasHabiles;
            //region Solicitud_Cotizacion
            diagrama.Cotizaciones = new List<Cotizacion>();
            foreach (var cotizacion in Cotizacion2.Cotizaciones)
            {
                diagrama.Cotizaciones.Add(new Cotizacion
                {
                    IdCotizacion = cotizacion.IdCotizacion,
                    IdServicio = cotizacion.IdServicio,
                    IdTarifa = cotizacion.IdTarifa,
                    Servicio = cotizacion.IdServicio,
                    Tarifa = cotizacion.Tarifa
                });
            }
            diagrama.Subtotal = float.Parse(Cotizacion2.SubTotal);
            diagrama.Total = float.Parse(Cotizacion2.Total);
            diagrama.Iva = (float)Cotizacion2.ValorIVA;
            //endregion

            diagrama.Documentos = new List<Documentos>();

            diagrama.Documentos.AddRange(
                FichaTecnicaDelEquipo.ListaDeDocumentos.Select(x => new Documentos
                {
                    Nombre = x.Nombre,
                    Ruta = FichaTecnicaDelEquipo.DocumentoRuta,
                    Tipo = "5" //Revisar
                })
            );

            diagrama.Documentos.AddRange(
                DocsAdicionales.ListaDeDocumentos.Select(x => new Documentos
                {
                    Nombre = x.Nombre,
                    Ruta = DocsAdicionales.DocumentoRuta,
                    Tipo = "2" //Tipo Adicional
                })
            );

            diagrama.Observaciones = Observaciones.Obs;
            diagrama.TerminosYCondiciones = TermYCond.UsuarioEstaDeAcuerdo;

            diagrama.Activo = true;
            diagrama.UsuarioCrea = 1;
            diagrama.UsuarioModifica = null;
            diagrama.FechaModifica = null;

            if (!string.IsNullOrWhiteSpace(folio))
            {
                diagrama.NumeroFolioSolicitud = int.Parse(folio.Trim());
            }

            List<string> errores = new List<string>();
            SolicitudService servicioAltaDeSolicitud = new SolicitudService(diagrama);
            int idFolio = servicioAltaDeSolicitud.GuardarSolicitud(out errores);
            FolioActual = idFolio.ToString();

            Response.Redirect($"SolicitudCreada.aspx");
        }
    }
}