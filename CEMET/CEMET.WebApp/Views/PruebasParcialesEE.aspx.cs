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
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.Views
{
    public partial class PruebasParcialesEE : System.Web.UI.Page
    {
        private readonly string[] NormaIdBandera = new string[] { "8", "9" }; //  NOM-003 y NOM-001

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

                TipoDeServicio.SelectedValue = "T2";

                string rootSavePath = Helper.CreateTempPath(usuarioId: usuarioId);
                string saveDirIns = rootSavePath + "\\" + Helper.ReadSetting(key: "PruebasParciales_EE_InstructivoManual");
                string saveMarcado = rootSavePath + "\\" + Helper.ReadSetting(key: "PruebasParciales_EE_Marcado");
                string saveDirDiagrama = rootSavePath + "\\" + Helper.ReadSetting(key: "PruebasParciales_EE_Diagrama");
                string saveDirDocs = rootSavePath + "\\" + Helper.ReadSetting(key: "PruebasParciales_EE_DocumentosAdicionales");

                InstructivoManual.SavePath = Path.Combine(appPath, saveDirIns);
                Marcado.SavePath = Path.Combine(appPath, saveMarcado);
                Diagrama.SavePath = Path.Combine(appPath, saveDirDiagrama);
                DocsAdicionales.SavePath = Path.Combine(appPath, saveDirDocs);

                if (!string.IsNullOrWhiteSpace(folio))
                {
                    InicializaCamposComunes(folio: int.Parse(folio));
                }
            }
        }

        private void FillCatalogs()
        {
            Controles.FillDropDownList(ServicioAdicional, CatalogService.GetCatServicioAdicional());
            Controles.FillDropDownList(NormaParticular, CatalogService.GetCatNormaParticular());

            MetodoDePrueba.DataSource = CatalogService.GetCatMetodoDePrueba().Select(x => new ListItem(text: x.Text, value: x.Value));
            MetodoDePrueba.DataBind();

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
            var pruebasParcialesEE = new PruebasParciales();
            pruebasParcialesEE.TipoServicio = TipoDeServicio.SelectedValue;
            pruebasParcialesEE.Norma = Norma.SelectedValue;

            pruebasParcialesEE.ServiciosAdicionales = new List<ServicioAdicional>()
            {
                new ServicioAdicional { IdServicioAdicional = ServicioAdicional.SelectedValue}
            };

            if (NormaIdBandera.Contains(Norma.SelectedValue))
            {
                pruebasParcialesEE.Normas = new List<Norma>
                {
                    new Norma {
                        IdNormaReferencia = int.Parse(Norma.SelectedValue),
                        IdNormaParticular = int.Parse(NormaParticular.SelectedValue)
                    }
                };
            }

            pruebasParcialesEE.MetodoDePruebas = MetodoDePrueba.Items.OfType<ListItem>()
                .Where(x => x.Selected)
                .Select(x => new MetodoDePrueba { IdMetodoDePrueba = int.Parse(x.Value) })
                .ToList();
            pruebasParcialesEE.Categoria = Categoria.SelectedValue;
            pruebasParcialesEE.ReferenciaCertificacion = ReferenciaCertificacion.Text;

            pruebasParcialesEE.Descripcion = CamposComunes.DescripcionDelProducto_Text;
            pruebasParcialesEE.Marca = CamposComunes.Marca_Text;
            pruebasParcialesEE.Modelo = CamposComunes.Modelo_Text;
            pruebasParcialesEE.PaisOrigen = CamposComunes.PaisDeOrigen_Current_SelectedValue;

            pruebasParcialesEE.ModalidadRecoleccion = ModalidadEntrega.ModalidadDeRecoleccion;
            pruebasParcialesEE.ModalidadEntrega = ModalidadEntrega.ModalidadDeEntrega;
            pruebasParcialesEE.DiasHabiles = ModalidadEntrega.DiasHabiles;

            pruebasParcialesEE.Observaciones = Observaciones.Obs;
            pruebasParcialesEE.TerminosYCondiciones = TermYCond.UsuarioEstaDeAcuerdo;

            pruebasParcialesEE.Activo = true;
            pruebasParcialesEE.UsuarioCrea = 1;//****
            pruebasParcialesEE.UsuarioModifica = null;
            pruebasParcialesEE.FechaModifica = null;

            pruebasParcialesEE.EspecificacionesElectricas = new List<EspecificacionElectrica>()
            {
                EspecificacionesElectricas.GetEspecificacionesElectricas()
            };

            pruebasParcialesEE.Cotizaciones = new List<Cotizacion>();
            foreach (var cotizacion in Cotizacion2.Cotizaciones)
            {
                pruebasParcialesEE.Cotizaciones.Add(new Cotizacion
                {
                    IdCotizacion = cotizacion.IdCotizacion,
                    IdServicio = cotizacion.IdServicio,
                    IdTarifa = cotizacion.IdTarifa,
                    Servicio = cotizacion.IdServicio,
                    Tarifa = cotizacion.Tarifa
                });
            }
            pruebasParcialesEE.Subtotal = float.Parse(Cotizacion2.SubTotal);
            pruebasParcialesEE.Total = float.Parse(Cotizacion2.Total);
            pruebasParcialesEE.Iva = (float)Cotizacion2.ValorIVA;

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

            pruebasParcialesEE.Documentos = documentosSolicitud;

            string folioSolicitud = Request.QueryString["folio"];
            if (!string.IsNullOrEmpty(folioSolicitud))
            {
                pruebasParcialesEE.NumeroFolioSolicitud = int.Parse(folioSolicitud);
            }
            List<string> errores = new List<string>();
            ServicioAltaDeSolicitud servicioAltaDeSolicitud = new ServicioAltaDeSolicitud(pruebasParcialesEE);
            int idFolio = servicioAltaDeSolicitud.GuardarSolicitud(out errores);
            Folio.Text = $"Folio guardado {idFolio}";
            Response.Redirect($"SolicitudCreada.aspx?folio={idFolio}");

        }

        protected void GuardaPruebCompBtn_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                CrearDto();
            }
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
    }
}