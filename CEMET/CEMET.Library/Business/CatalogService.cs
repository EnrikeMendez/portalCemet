using Cemetlib.Model;
using System;
using System.Collections.Generic;
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
            serviceTypeItems.Add(new Catalog { Value = "1", Text = "Pruebas completas" });
            serviceTypeItems.Add(new Catalog { Value = "2", Text = "Pruebas parciales" });
            serviceTypeItems.Add(new Catalog { Value = "3", Text = "Diagrama" });
            serviceTypeItems.Add(new Catalog { Value = "4", Text = "Marcado" });
            return serviceTypeItems;
        }
        public static List<Catalog> GetCatServicioAdicional()
        {
            List<Catalog> catServicioAdicional = new List<Catalog>();
            catServicioAdicional.Add(new Catalog { Value = "1", Text = "Selecciona opcion..." });
            return catServicioAdicional;
        }
        public static List<Catalog> GetCatNorma()
        {
            List<Catalog> catNorma = new List<Catalog>();
            catNorma.Add(new Catalog { Value = "1", Text = "NOM-133/1-SCFI-1999" });
            return catNorma;
        }
        public static List<Catalog> GetCatNormaParticular()
        {
            List<Catalog> catNormaParticular = new List<Catalog>();
            catNormaParticular.Add(new Catalog { Value = "1", Text = "Selecciona opcion..." });
            return catNormaParticular;
        }
        public static List<Catalog> GetCatMetodoDePrueba()
        {
            List<Catalog> catMetodoDePrueba = new List<Catalog>();
            catMetodoDePrueba.Add(new Catalog { Value = "1", Text = "Selecciona opcion..." });
            return catMetodoDePrueba;
        }
        public static List<Catalog> GetCatCategoria()
        {
            List<Catalog> catCategoria = new List<Catalog>();
            catCategoria.Add(new Catalog { Value = "1", Text = "Nuevo" });
            return catCategoria;
        }
        public static List<Catalog> GetCatPaisDeOrigen()
        {
            List<Catalog> catPaisDeOrigen = new List<Catalog>();
            catPaisDeOrigen.Add(new Catalog { Value = "O148", Text = "México" });
            return catPaisDeOrigen;
        }
        public static List<Catalog> GetCatVoltaje()
        {
            List<Catalog> catVoltaje = new List<Catalog>();
            catVoltaje.Add(new Catalog { Value = "1", Text = "Selecciona opcion..." });
            return catVoltaje;
        }
        public static List<Catalog> GetCatCorriente()
        {
            List<Catalog> catCorriente = new List<Catalog>();
            catCorriente.Add(new Catalog { Value = "1", Text = "Selecciona opcion..." });
            return catCorriente;
        }
        public static List<Catalog> GetCatPotencia()
        {
            List<Catalog> catPotencia = new List<Catalog>();
            catPotencia.Add(new Catalog { Value = "1", Text = "Selecciona opcion..." });
            return catPotencia;
        }
        public static List<Catalog> GetCatModalidadDeRecoleccion()
        {
            List<Catalog> catModalidadDeRecoleccion = new List<Catalog>();
            catModalidadDeRecoleccion.Add(new Catalog { Value = "G1", Text = "Solicito que Logis recoja mis muestras" });
            return catModalidadDeRecoleccion;
        }
        public static List<Catalog> GetCatModalidadDeEntrega()
        {
            List<Catalog> catModalidadDeEntrega = new List<Catalog>();
            catModalidadDeEntrega.Add(new Catalog { Value = "1", Text = "Selecciona opcion..." });
            return catModalidadDeEntrega;
        }
        public static List<Catalog> GetCatDiasHabiles()
        {
            List<Catalog> catDiasHabiles = new List<Catalog>();
            catDiasHabiles.Add(new Catalog { Value = "H1", Text = "Dia habil 1" });
            return catDiasHabiles;
        }
        public static List<Catalog> GetCatServiciosSolicitados()
        {
            List<Catalog> catServiciosSolicitados = new List<Catalog>();
            catServiciosSolicitados.Add(new Catalog { Value = "S1", Text = "Informe de pruebas Completas - Andaderas" });
            return catServiciosSolicitados;
        }
        public static List<Catalog> GetCatTarifas()
        {
            List<Catalog> catTarifas = new List<Catalog>();
            catTarifas.Add(new Catalog { Value = "1", Text = "Selecciona opcion..." });
            return catTarifas;
        }
        public static List<Catalog> GetCatIncidenciasRegistroInspeccionVisual()
        {
            List<Catalog> catIncidenciasRegistroInspeccionVisual = new List<Catalog>();
            catIncidenciasRegistroInspeccionVisual.Add(new Catalog { Value = "1", Text = "Selecciona opcion..." });
            return catIncidenciasRegistroInspeccionVisual;
        }
        public static List<Catalog> GetCatCapturaDeAccesorios()
        {
            List<Catalog> catCapturaDeAccesorios = new List<Catalog>();
            catCapturaDeAccesorios.Add(new Catalog { Value = "1", Text = "Selecciona opcion..." });
            return catCapturaDeAccesorios;
        }
        public static List<Catalog> GetCatVeredicto()
        {
            List<Catalog> catVeredicto = new List<Catalog>();
            catVeredicto.Add(new Catalog { Value = "1", Text = "Selecciona opcion..." });
            return catVeredicto;
        }
        public static List<Catalog> GetCatHallazgo()
        {
            List<Catalog> catHallazgo = new List<Catalog>();
            catHallazgo.Add(new Catalog { Value = "1", Text = "Selecciona opcion..." });
            return catHallazgo;
        }
        public static List<Catalog> GetCatResponsivaDeMuestras()
        {
            List<Catalog> catResponsivaDeMuestras = new List<Catalog>();
            catResponsivaDeMuestras.Add(new Catalog { Value = "1", Text = "Selecciona opcion..." });
            return catResponsivaDeMuestras;
        }
        public static List<Catalog> GetCatTipoDeConsulta()
        {
            List<Catalog> catTipoDeConsulta = new List<Catalog>();
            catTipoDeConsulta.Add(new Catalog { Value = "1", Text = "Selecciona opcion..." });
            return catTipoDeConsulta;
        }
    }
}
