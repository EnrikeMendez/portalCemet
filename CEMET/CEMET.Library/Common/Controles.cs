using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Web.UI.WebControls;

namespace Cemetlib.Common
{
    public static class Controles
    {
        public static void FillDropDownList(DropDownList fillingDropDownList, List<Catalog> catalogElements, bool agregarOpcionSeleccionar = false, string textoOpcionSeleccionar = null)
        {
            fillingDropDownList.DataValueField = "Value";
            fillingDropDownList.DataTextField = "Text";

            if (agregarOpcionSeleccionar)
            {
                var lst = new List<Catalog>() { new Catalog { Value = null, Text = textoOpcionSeleccionar ?? "-- Por favor selecciona una opción --" } };
                lst.AddRange(catalogElements);
                catalogElements = lst;
            }

            fillingDropDownList.DataSource = catalogElements;
            fillingDropDownList.DataBind();
        }
    }
}
