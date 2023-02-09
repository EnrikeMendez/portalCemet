using Cemetlib.Data;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cemetlib.Business
{
    public static class CatalogService
    {
        public static List<Catalog> GetCatTipoDeServicio()
        {
            List<Catalog> serviceTypeItems = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatTipoDeServicio();
            foreach (DataRow row in catalogo.Rows)
            {
                serviceTypeItems.Add(new Catalog { Value = row["CTS_Id"].ToString(), Text = row["CTS_Descripcion"].ToString() });
            }

            return serviceTypeItems;
        }
        public static List<Catalog> GetCatServicioAdicional()
        {
            List<Catalog> catServicioAdicional = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatServicioAdicional();
            foreach (DataRow row in catalogo.Rows)
            {
                catServicioAdicional.Add(new Catalog { Value = row["CSA_Id"].ToString(), Text = row["CSA_Descripcion"].ToString() });
            }

            return catServicioAdicional;
        }
        public static List<Catalog> GetCatNorma()
        {
            List<Catalog> catNorma = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatNorma();
            foreach (DataRow row in catalogo.Rows)
            {
                catNorma.Add(new Catalog { Value = row["CNR_Clave"].ToString(), Text = row["CNR_Descripcion"].ToString() });
            }
            return catNorma;
        }
        public static List<Catalog> GetCatNormaParticular()
        {
            List<Catalog> catNormaParticular = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatNormaParticular();
            foreach (DataRow row in catalogo.Rows)
            {
                catNormaParticular.Add(new Catalog { Value = row["CNP_Clave"].ToString(), Text = row["CNP_Descripcion"].ToString() });
            }

            return catNormaParticular;
        }
        public static List<Catalog> GetCatMetodoDePrueba()
        {
            List<Catalog> catMetodoDePrueba = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatMetodoDePrueba();
            foreach (DataRow row in catalogo.Rows)
            {
                catMetodoDePrueba.Add(new Catalog { Value = row["CMP_Clave"].ToString(), Text = row["CMP_Metodo"].ToString() });
            }

            return catMetodoDePrueba;
        }
        public static List<Catalog> GetCatCategoria()
        {
            List<Catalog> catCategoria = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatCategoria();
            foreach (DataRow row in catalogo.Rows)
            {
                catCategoria.Add(new Catalog { Value = row["CCA_Id"].ToString(), Text = row["CCA_Descripcion"].ToString() });
            }
            return catCategoria;
        }
        public static List<Catalog> GetCatPaisDeOrigen()
        {
            List<Catalog> catPaisDeOrigen = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatPaisDeOrigen();
            foreach (DataRow row in catalogo.Rows)
            {
                catPaisDeOrigen.Add(new Catalog { Value = row["CPA_Id"].ToString(), Text = row["CPA_Nombre"].ToString() });
            }
            return catPaisDeOrigen;
        }
        public static List<Catalog> GetCatVoltaje()
        {
            List<Catalog> catVoltaje = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatVoltaje();
            foreach (DataRow row in catalogo.Rows)
            {
                //catVoltaje.Add(new Catalog { Value = row["CVO_Clave"].ToString(), Text = row["CVO_Descripcion"].ToString() });
                catVoltaje.Add(new Catalog { Value = row["CVO_Id"].ToString(), Text = string.Concat("(" , row["CVO_Clave"].ToString(), ") ", row["CVO_Descripcion"].ToString()) });
            }

            return catVoltaje;
        }
        public static List<Catalog> GetCatCorriente()
        {
            List<Catalog> catCorriente = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatCorriente();
            foreach (DataRow row in catalogo.Rows)
            {
                catCorriente.Add(new Catalog { Value = row["CSS_Id"].ToString(), Text = row["CSS_Descripcion"].ToString() });
            }

            return catCorriente;
        }
        public static List<Catalog> GetCatPotencia()
        {
            List<Catalog> catPotencia = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatPotencia();
            foreach (DataRow row in catalogo.Rows)
            {
                catPotencia.Add(new Catalog { Value = row["CSS_Id"].ToString(), Text = row["CSS_Descripcion"].ToString() });
            }

            return catPotencia;
        }
        public static List<Catalog> GetCatModalidadDeRecoleccion()
        {
            List<Catalog> catModalidadDeRecoleccion = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatModalidadDeRecoleccion();
            foreach (DataRow row in catalogo.Rows)
            {
                catModalidadDeRecoleccion.Add(new Catalog { Value = row["CMR_Id"].ToString(), Text = row["CMR_Descripcion"].ToString() });
            }

            return catModalidadDeRecoleccion;
        }
        public static List<Catalog> GetCatModalidadDeEntrega()
        {
            List<Catalog> catModalidadDeEntrega = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatModalidadDeEntrega();
            foreach (DataRow row in catalogo.Rows)
            {
                catModalidadDeEntrega.Add(new Catalog { Value = row["CME_Id"].ToString(), Text = row["CME_Descripcion"].ToString() });
            }

            return catModalidadDeEntrega;
        }
        public static List<Catalog> GetCatDiasHabiles()
        {
            List<Catalog> catDiasHabiles = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatDiasHabiles();
            foreach (DataRow row in catalogo.Rows)
            {
                catDiasHabiles.Add(new Catalog { Value = row["CDH_Id"].ToString(), Text = row["CDH_Descripcion"].ToString() });
            }
            return catDiasHabiles;
        }
        public static List<Catalog> GetCatServiciosSolicitados()
        {
            List<Catalog> catServiciosSolicitados = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatServiciosSolicitados();

            foreach (DataRow row in catalogo.Rows)
            {
                catServiciosSolicitados.Add(new Catalog { Value = row["CSS_Id"].ToString(), Text = row["CSS_Descripcion"].ToString() });
            }
            return catServiciosSolicitados;
        }

        public static List<Catalog> GetCatTarifas()
        {
            List<Catalog> catTarifas = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatTarifas();
            foreach (DataRow row in catalogo.Rows)
            {
                catTarifas.Add(new Catalog { Value = row["CTA_Id"].ToString(), Text = row["CTA_Monto"].ToString() });
            }

            return catTarifas;
        }
        public static List<Catalog> GetCatIncidenciasRegistroInspeccionVisual()
        {
            List<Catalog> catIncidenciasRegistroInspeccionVisual = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatIncidenciasRegistroInspeccionVisual();
            foreach (DataRow row in catalogo.Rows)
            {
                catIncidenciasRegistroInspeccionVisual.Add(new Catalog { Value = row["CSS_Id"].ToString(), Text = row["CSS_Descripcion"].ToString() });
            }

            return catIncidenciasRegistroInspeccionVisual;
        }
        public static List<Catalog> GetCatCapturaDeAccesorios()
        {
            List<Catalog> catCapturaDeAccesorios = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatCapturaDeAccesorios();
            foreach (DataRow row in catalogo.Rows)
            {
                catCapturaDeAccesorios.Add(new Catalog { Value = row["CSS_Id"].ToString(), Text = row["CSS_Descripcion"].ToString() });
            }

            return catCapturaDeAccesorios;
        }
        public static List<Catalog> GetCatVeredicto()
        {
            List<Catalog> catVeredicto = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatVeredicto();
            foreach (DataRow row in catalogo.Rows)
            {
                catVeredicto.Add(new Catalog { Value = row["CSS_Id"].ToString(), Text = row["CSS_Descripcion"].ToString() });
            }

            return catVeredicto;
        }
        public static List<Catalog> GetCatHallazgo()
        {
            List<Catalog> catHallazgo = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatHallazgo();
            foreach (DataRow row in catalogo.Rows)
            {
                catHallazgo.Add(new Catalog { Value = row["CSS_Id"].ToString(), Text = row["CSS_Descripcion"].ToString() });
            }

            return catHallazgo;
        }
        public static List<Catalog> GetCatResponsivaDeMuestras()
        {
            List<Catalog> catResponsivaDeMuestras = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatResponsivaDeMuestras();
            foreach (DataRow row in catalogo.Rows)
            {
                catResponsivaDeMuestras.Add(new Catalog { Value = row["CSS_Id"].ToString(), Text = row["CSS_Descripcion"].ToString() });
            }

            return catResponsivaDeMuestras;
        }
        public static List<Catalog> GetCatTipoDeConsulta()
        {
            List<Catalog> catTipoDeConsulta = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatTipoDeConsulta();
            foreach (DataRow row in catalogo.Rows)
            {
                catTipoDeConsulta.Add(new Catalog { Value = row["CSS_Id"].ToString(), Text = row["CSS_Descripcion"].ToString() });
            }

            return catTipoDeConsulta;
        }

        public static List<Catalog> GetCatDiasHabilesPorNorma()
        {
            List<Catalog> catDiasHabiles = new List<Catalog>();
            DataTable catalogo = ICatalogo.GetCatDiasHabilesPorNorma();
            foreach (DataRow row in catalogo.Rows)
            {
                catDiasHabiles.Add(new Catalog
                {
                    Value = row["CDH_Id"].ToString(),
                    Text = string.Concat(
                        row["CDH_Descripcion"].ToString(), " / ",
                        (string.IsNullOrWhiteSpace(row["CHDN_Norma"].ToString()) ? null : row["CHDN_Norma"].ToString().Trim()) ?? "Norma sin descripción", " / ",
                        (string.IsNullOrWhiteSpace(row["CDHN_Dia_Habil"].ToString()) ? null : row["CDHN_Dia_Habil"].ToString().Trim()) ?? "Sin día hábil"
                    )
                });
            }
            return catDiasHabiles;
        }
    }
}