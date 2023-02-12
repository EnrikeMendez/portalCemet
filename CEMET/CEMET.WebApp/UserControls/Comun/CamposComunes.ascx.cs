using Cemetlib.Business;
using Cemetlib.Common;
using Cemetlib.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CEMET.WebApp.UserControls.Comun
{
    public partial class CamposComunes : System.Web.UI.UserControl
    {
        public bool DescripcionDelProducto_EsRequerido { get; set; }

        public string DescripcionDelProducto_ClientValidationFunction { get; set; }

        public string DescripcionDelProducto_Text
        {
            get { return DescripcionDelProducto.Text; }
            set { DescripcionDelProducto.Text = value; }
        }

        public string DescripcionDelProducto_ClientID
        {
            get { return DescripcionDelProducto.ClientID; }
        }

        public bool DescripcionDelProducto_Visible
        {
            get { return DescripcionDelProducto_Container.Visible; }
            set { DescripcionDelProducto_Container.Visible = value; }
        }

        public bool Marca_EsRequerido { get; set; }

        public string Marca_ClientValidationFunction { get; set; }

        public string Marca_Text
        {
            get { return Marca.Text; }
            set { Marca.Text = value; }
        }

        public string Marca_ClientID
        {
            get { return Marca.ClientID; }
        }

        public bool Marca_Visible
        {
            get { return Marca_Container.Visible; }
            set { Marca_Container.Visible = value; }
        }

        public bool Modelo_EsRequerido { get; set; }

        public string Modelo_ClientValidationFunction { get; set; }

        public string Modelo_Text
        {
            get { return Modelo.Text; }
            set { Modelo.Text = value; }
        }

        public string Modelo_ClientID
        {
            get { return Modelo.ClientID; }
        }

        public bool Modelo_Visible
        {
            get { return Modelo_Container.Visible; }
            set { Modelo_Container.Visible = value; }
        }

        public bool PaisDeOrigen_EsRequerido { get; set; }

        public string PaisDeOrigen_ClientValidationFunction { get; set; }

        public string PaisDeOrigen_SelectedValue { get; set; }
        public string PaisDeOrigen_Current_SelectedValue
        {
            get { return PaisDeOrigen.SelectedValue; }
        }

        public string PaisDeOrigen_ClientID
        {
            get { return PaisDeOrigen.ClientID; }
        }

        public List<Catalog> PaisDeOrigen_DataSource { get; set; }

        public bool PaisDeOrigen_Visible
        {
            get { return PaisDeOrigen_Container.Visible; }
            set { PaisDeOrigen_Container.Visible = value; }
        }

        public string ValidationGroup { get; set; }

        protected void Page_Load(object sender, EventArgs e)
        {

            if (IsPostBack)
            {

            }
            else
            {
                if (DescripcionDelProducto_Container.Visible)
                {
                    if (string.IsNullOrWhiteSpace(DescripcionDelProducto.Text))
                    {
                        if (DescripcionDelProducto_EsRequerido)
                        {
                            if (!string.IsNullOrWhiteSpace(DescripcionDelProducto_ClientValidationFunction))
                            {
                                DescripcionDelProducto_CustomValidator.EnableClientScript = true;
                                DescripcionDelProducto_CustomValidator.ClientValidationFunction = DescripcionDelProducto_ClientValidationFunction;
                            }

                            DescripcionDelProducto_Label.CssClass = "form-label required-field";
                            DescripcionDelProducto_CustomValidator.ValidationGroup = ValidationGroup;
                        }
                    }
                    else
                    {
                        DescripcionDelProducto.ReadOnly = true;
                        DescripcionDelProducto.Enabled = false;
                    }
                }

                if (Marca_Container.Visible)
                {
                    if (string.IsNullOrWhiteSpace(Marca.Text))
                    {
                        if (Marca_EsRequerido)
                        {
                            if (!string.IsNullOrWhiteSpace(Marca_ClientValidationFunction))
                            {
                                Marca_CustomValidator.EnableClientScript = true;
                                Marca_CustomValidator.ClientValidationFunction = Marca_ClientValidationFunction;
                            }

                            Marca_Label.CssClass = "form-label required-field";
                            Marca_CustomValidator.ValidationGroup = ValidationGroup;
                        }
                    }
                    else
                    {
                        Marca.ReadOnly = true;
                        Marca.Enabled = false;
                    }
                }

                if (Modelo_Container.Visible)
                {
                    if (string.IsNullOrWhiteSpace(Modelo.Text))
                    {
                        if (Modelo_EsRequerido)
                        {
                            if (!string.IsNullOrWhiteSpace(Modelo_ClientValidationFunction))
                            {
                                Modelo_CustomValidator.EnableClientScript = true;
                                Modelo_CustomValidator.ClientValidationFunction = Modelo_ClientValidationFunction;
                            }

                            Modelo_Label.CssClass = "form-label required-field";
                            Modelo_CustomValidator.ValidationGroup = ValidationGroup;
                        }
                    }
                    else
                    {
                        Modelo.ReadOnly = true;
                        Modelo.Enabled = false;
                    }
                }

                Controles.FillDropDownList(PaisDeOrigen, CatalogService.GetCatPaisDeOrigen(), true);

                //bugfix: pruebas completas -> diagrama -> pruebas completas
                if (!string.IsNullOrWhiteSpace(PaisDeOrigen_SelectedValue))
                {
                    PaisDeOrigen.SelectedValue = PaisDeOrigen_SelectedValue;
                }

                if (PaisDeOrigen_Container.Visible)
                {


                    if (string.IsNullOrWhiteSpace(PaisDeOrigen_SelectedValue))
                    {
                        if (PaisDeOrigen_EsRequerido)
                        {
                            if (!string.IsNullOrWhiteSpace(PaisDeOrigen_ClientValidationFunction))
                            {
                                PaisDeOrigen_CustomValidator.EnableClientScript = true;
                                PaisDeOrigen_CustomValidator.ClientValidationFunction = PaisDeOrigen_ClientValidationFunction;
                            }

                            PaisDeOrigen_Label.CssClass = "form-label required-field";
                            PaisDeOrigen_CustomValidator.ValidationGroup = ValidationGroup;
                        }
                    }
                    else
                    {
                        PaisDeOrigen.Enabled = false;
                        //PaisDeOrigen.SelectedValue = PaisDeOrigen_SelectedValue;
                    }
                }
            }
        }

        protected void DescripcionDelProducto_CustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (DescripcionDelProducto_EsRequerido)
            {
                args.IsValid = !string.IsNullOrEmpty(DescripcionDelProducto.Text);
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void Marca_CustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Marca_EsRequerido)
            {
                args.IsValid = !string.IsNullOrEmpty(Marca.Text);
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void Modelo_CustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (Modelo_EsRequerido)
            {
                args.IsValid = !string.IsNullOrEmpty(Modelo.Text);
            }
            else
            {
                args.IsValid = true;
            }
        }

        protected void PaisDeOrigen_CustomValidator_ServerValidate(object source, ServerValidateEventArgs args)
        {
            if (PaisDeOrigen_EsRequerido)
            {
                args.IsValid = !string.IsNullOrEmpty(PaisDeOrigen.SelectedValue);
            }
            else
            {
                args.IsValid = true;
            }
        }
    }
}