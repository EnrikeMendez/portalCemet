<%@ Page Title="Prueba completa | Alta de nuevo servicio" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="PruebasCompletas.aspx.cs" Inherits="CEMET.WebApp.Views.PresolicitudCompleta" %>

<%@ Register Src="~/UserControls/Comun/TerminosYCondiciones.ascx" TagPrefix="uc" TagName="TerminosYCondiciones" %>
<%@ Register Src="~/UserControls/Comun/SubirArchivo.ascx" TagPrefix="uc" TagName="SubirArchivo" %>
<%@ Register Src="~/UserControls/Comun/ModalidadEntrega.ascx" TagPrefix="uc" TagName="ModalidadEntrega" %>
<%@ Register Src="~/UserControls/Comun/Observaciones.ascx" TagPrefix="uc" TagName="Observaciones" %>
<%@ Register Src="~/UserControls/Comun/Cotizacion.ascx" TagPrefix="uc1" TagName="Cotizacion2" %>
<%@ Register Src="~/UserControls/Comun/CamposComunes.ascx" TagPrefix="uc" TagName="CamposComunes" %>

<%--PRESOLICITUD MM - PRUEBAS COMPLETAS - P3--%>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-12 py-5 text-center">
            <h1>Alta de nuevo servicio</h1>

            <h3 id="FolioContainer" runat="server" visible="false">
                <asp:Label runat="server" ID="Folio" CssClass="badge bg-success"></asp:Label>
            </h3>
        </div>
    </div>

    <div class="d-flex align-items-center mb-3 mt-2">
        <h5 class="mb-0 me-3 me-md-4">Servicio requerido</h5>
        <div class="border-bottom flex-grow-1"></div>

    </div>

    <div class="row">
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server"
                AssociatedControlID="TipoDeServicio"
                ID="lbl_TipoDeServicio"
                CssClass="form-label required-field">
                            Tipo de servicio:</asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="TipoDeServicio" CssClass="form-select" Enabled="false" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasCompletasValGroup" Display="Static" ControlToValidate="TipoDeServicio" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="Norma" ID="lbl_Norma" CssClass="form-label required-field">
                    Norma:
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="Norma" CssClass="form-control" data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}' />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasCompletasValGroup" Display="Static" ControlToValidate="Norma" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="Categoria" ID="lbl_Categoria" CssClass="form-label required-field">
                    Categoria:
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="Categoria" CssClass="form-control" data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}' />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasCompletasValGroup" Display="Static" ControlToValidate="Categoria" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="ReferenciaCertificacion" CssClass="form-label required-field">
                    Referencia de certificación:
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="ReferenciaCertificacion" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasCompletasValGroup" Display="Static" ControlToValidate="ReferenciaCertificacion" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <uc:CamposComunes
            runat="server"
            ID="CamposComunes"
            DescripcionDelProducto_EsRequerido="true"
            DescripcionDelProducto_ClientValidationFunction="DescripcionDelProducto_ClientValidationFunction"
            Marca_EsRequerido="true"
            Marca_ClientValidationFunction="Marca_ClientValidationFunction"
            Modelo_EsRequerido="true"
            Modelo_ClientValidationFunction="Modelo_ClientValidationFunction"
            PaisDeOrigen_EsRequerido="true"
            PaisDeOrigen_ClientValidationFunction="PaisDeOrigen_ClientValidationFunction"
            ValidationGroup="PruebasCompletasValGroup" />
    </div>

    <uc:ModalidadEntrega runat="server" ID="ModalidadEntrega" EsRequerido="true" ValidationGroup="PruebasCompletasValGroup" />

    <div class="d-flex align-items-center mb-3 mt-4">
        <h5 class="mb-0 me-3 me-md-4">Documentos
        </h5>
        <div class="border-bottom flex-grow-1"></div>
    </div>

    <uc:SubirArchivo
        runat="server"
        ID="InstructivoManual"
        Etiqueta="Instructivo o manual"
        EsRequerido="true"
        Extensiones=".jpg"
        ValidationGroupForm="PruebasCompletasValGroup"
        ClientValidationFunctionForValidator="InstructivoManual_ValidaListaDocs" />

    <uc:SubirArchivo
        runat="server"
        ID="DocsAdicionales"
        Etiqueta="Documentos adicionales"
        Extensiones=".jpg" />



    <div class="d-flex align-items-center mb-3 mt-4">
        <h5 class="mb-0 me-3 me-md-4">
            <asp:Label ID="Label1" runat="server">
                    Cotizacion
            </asp:Label>
        </h5>
        <div class="border-bottom flex-grow-1"></div>

    </div>

    <uc1:Cotizacion2
        runat="server"
        ID="Cotizacion2"
        EsRequerido="true"
        ValidationGroupForm="PruebasCompletasValGroup"
        ValorIVA="0.16"
        OnClientChangeEventDropdown="Cotizacion2_ActivaBotonAgregar()"
        ClientValidationFunctionForValidator="Cotizacion2_ValidateConceptosList" />

    <uc:Observaciones runat="server" ID="Observaciones" />

    <uc:TerminosYCondiciones runat="server" ID="TermYCond" ValidationGroupForm="PruebasCompletasValGroup" />

    <div class="row mt-3">
        <div class="col">
            <asp:Button ID="GuardaPruebCompBtn" runat="server" ValidationGroup="PruebasCompletasValGroup" Text="Guardar" CssClass="btn btn-primary" OnClick="GuardaPruebCompBtn_Click" />
        </div>
    </div>

    <script type="text/javascript">

        function InstructivoManual_ValidaListaDocs(sender, e) {

            if ("<%=InstructivoManual.EsRequerido%>".toLowerCase() == "true")
                e.IsValid = "<%=InstructivoManual.ListaDeDocumentos.Any()%>".toLowerCase() == 'true';
            else {
                e.IsValid = true;
            }
        }

        function Cotizacion2_ActivaBotonAgregar() {
            let serv = "<%= Cotizacion2.ServicioSolicitadoClientId %>";
            let tarf = "<%= Cotizacion2.TarifaClientId %>";

            if ($("#" + serv).val()) {
                $("#" + serv).removeClass("is-invalid");
            } else {
                $("#" + serv).addClass("is-invalid");
            }

            if ($("#" + tarf).val()) {
                $("#" + tarf).removeClass("is-invalid");
            } else {
                $("#" + tarf).addClass("is-invalid");
            }

            //https://stackoverflow.com/questions/7514716/enable-and-disable-button-using-javascript-and-asp-net
            if ($("#" + serv).val() && $("#" + tarf).val()) {
                $('#<%= Cotizacion2.AgregaServClientId %>').prop("disabled", false);
            } else {
                $('#<%= Cotizacion2.AgregaServClientId %>').prop("disabled", true);
            }
        }

        function Cotizacion2_ValidateConceptosList(sender, e) {
            e.IsValid = "<%=Cotizacion2.Cotizaciones.Any()%>".toLowerCase() == 'true';
        }

        function DescripcionDelProducto_ClientValidationFunction(sender, e) {
            if ("<%=CamposComunes.DescripcionDelProducto_EsRequerido.ToString().ToLower()%>" == "true") {
                let t = $("#" + "<%= CamposComunes.DescripcionDelProducto_ClientID %>").val();

                if (t) {
                    e.IsValid = true;
                }
                else {
                    e.IsValid = false;
                }
            }
            else {
                e.IsValid = true;
            }
        }

        function Marca_ClientValidationFunction(sender, e) {
            if ("<%=CamposComunes.Marca_EsRequerido.ToString().ToLower()%>" == "true") {
                let t = $("#" + "<%= CamposComunes.Marca_ClientID %>").val();

                if (t) {
                    e.IsValid = true;
                }
                else {
                    e.IsValid = false;
                }
            }
            else {
                e.IsValid = true;
            }
        }

        function Modelo_ClientValidationFunction(sender, e) {
            if ("<%=CamposComunes.Modelo_EsRequerido.ToString().ToLower()%>" == "true") {
                let t = $("#" + "<%= CamposComunes.Modelo_ClientID %>").val();

                if (t) {
                    e.IsValid = true;
                }
                else {
                    e.IsValid = false;
                }
            }
            else {
                e.IsValid = true;
            }
        }

        function PaisDeOrigen_ClientValidationFunction(sender, e) {
            if ("<%=CamposComunes.PaisDeOrigen_EsRequerido.ToString().ToLower()%>" == "true") {
                let t = $("#" + "<%= CamposComunes.PaisDeOrigen_ClientID %>").val();

                if (t) {
                    e.IsValid = true;
                }
                else {
                    e.IsValid = false;
                }
            }
            else {
                e.IsValid = true;
            }
        }
    </script>
</asp:Content>
