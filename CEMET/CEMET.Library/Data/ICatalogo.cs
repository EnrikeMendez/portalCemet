using Cemetlib.Common;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Cemetlib.Data
{
    public static class ICatalogo
    {
        public static DataTable GetCatTipoDeServicio()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM CTipo_Servicio";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatServicioAdicional()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM CServicio_Adicional";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatNorma()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM CNorma_Referencia";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatNormaParticular()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM CNorma_Particular";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatMetodoDePrueba()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM CMetodo_Prueba";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatCategoria()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM CCategoria";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatPaisDeOrigen()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM CPais";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatVoltaje()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM CVoltaje";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatCorriente()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM ";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatPotencia()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM ";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatModalidadDeRecoleccion()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM CModalidad_Recoleccion";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatModalidadDeEntrega()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM CModalidad_Entrega";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatDiasHabiles()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM CDias_Habiles";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }

        public static DataTable GetCatServiciosSolicitados()
        {
            DB context = new DB();
            string queryServiciosSolicitados = $@"SELECT * FROM CServicio_Solicitado";
            DataTable catalogo = context.ObtieneDataTable(queryServiciosSolicitados);
            return catalogo;
        }
        public static DataTable GetCatTarifas()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM CTarifa";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatIncidenciasRegistroInspeccionVisual()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM ";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatCapturaDeAccesorios()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM ";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatVeredicto()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM ";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatHallazgo()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM ";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatResponsivaDeMuestras()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM ";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }
        public static DataTable GetCatTipoDeConsulta()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM ";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }

        public static DataTable GetCatDiasHabilesPorNorma()
        {
            DB context = new DB();
            string query = $@"SELECT * FROM [usr_qa].[VDias_Habiles_Norma]";
            DataTable catalogo = context.ObtieneDataTable(query);
            return catalogo;
        }

    }
}
