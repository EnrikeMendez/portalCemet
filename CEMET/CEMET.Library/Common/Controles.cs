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
        public static void FillDropDownList(DropDownList fillingDropDownList, List<Catalog> catalogElements)
        {
            fillingDropDownList.DataValueField = "Value";
            fillingDropDownList.DataTextField = "Text";
            fillingDropDownList.DataSource = catalogElements;
            fillingDropDownList.DataBind();
        }
    }
}
