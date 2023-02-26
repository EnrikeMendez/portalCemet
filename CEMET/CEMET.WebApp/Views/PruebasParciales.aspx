<%@ Page Title="Prueba parcial | Alta de nuevo servicio" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="PruebasParciales.aspx.cs" Inherits="CEMET.WebApp.Views.PresolicitudParcial" %>

<%@ Register Src="~/UserControls/Comun/TerminosYCondiciones.ascx" TagPrefix="uc" TagName="TerminosYCondiciones" %>
<%@ Register Src="~/UserControls/Comun/SubirArchivo.ascx" TagPrefix="uc" TagName="SubirArchivo" %>
<%@ Register Src="~/UserControls/Comun/ModalidadEntrega.ascx" TagPrefix="uc" TagName="ModalidadEntrega" %>
<%@ Register Src="~/UserControls/Comun/Observaciones.ascx" TagPrefix="uc" TagName="Observaciones" %>
<%@ Register Src="~/UserControls/Comun/Cotizacion.ascx" TagPrefix="uc1" TagName="Cotizacion2" %>
<%@ Register Src="~/UserControls/Comun/CamposComunes.ascx" TagPrefix="uc" TagName="CamposComunes" %>


<%--PRESOLICITUD MM (P.PARCIALES) - P4--%>

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
    <div class="row d-flex">
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="TipoDeServicio" ID="lbl_TipoDeServicio" CssClass="form-label">
                            Tipo de servicio</asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="TipoDeServicio" CssClass="form-select" Enabled="false" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasParcialesValGroup" Display="Static" ControlToValidate="TipoDeServicio" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="Norma" ID="lbl_Norma" CssClass="form-label required-field">
                    Norma
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="Norma" CssClass="form-control"
                    data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}'/>
                <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasParcialesValGroup" Display="Static" ControlToValidate="Norma" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="NormaParticular" ID="lbl_NormaParticular" CssClass="form-label required-field">
                    Norma Particular
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="NormaParticular" CssClass="form-control"
                    data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}'/>
                <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasParcialesValGroup" Display="Static" ControlToValidate="NormaParticular" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="MetodoDePrueba" ID="lbl_MetodoDePrueba" CssClass="form-label required-field">
                    Metodo de prueba
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="MetodoDePrueba" CssClass="form-control"
                    data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}'/>
                <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasParcialesValGroup" Display="Static" ControlToValidate="MetodoDePrueba" CssClass="text-danger" ErrorMessage="El campo es requerido" />
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
            ValidationGroup="PruebasParcialesValGroup" />
    </div>

    <div class="d-flex align-items-center mb-3 mt-4">
        <h5 class="mb-0 me-3 me-md-4">
            <asp:Label ID="TituloFileUploader" runat="server">
            Documentos
            </asp:Label>
        </h5>
        <div class="border-bottom flex-grow-1"></div>
    </div>

    <uc:SubirArchivo
        runat="server"
        ID="InstructivoManual"
        Etiqueta="Instructivo o manual"
        EsRequerido="true"
        Extensiones=".jpg"
        ValidationGroupForm="PruebasParcialesValGroup"
        ClientValidationFunctionForValidator="InstructivoManual_ValidaListaDocs" />

    <uc:SubirArchivo
        runat="server"
        ID="DocsAdicionales"
        Etiqueta="Documentos adicionales"
        Extensiones=".jpg" />

    <uc:ModalidadEntrega runat="server" ID="ModalidadEntrega" EsRequerido="true" ValidationGroup="PruebasParcialesValGroup" />

    <div class="d-flex align-items-center mb-3 mt-4">
        <h5 class="mb-0 me-3 me-md-4">
            <asp:Label ID="Label1" runat="server">
                    Cotización
            </asp:Label>
        </h5>
        <div class="border-bottom flex-grow-1"></div>

    </div>

    <uc1:Cotizacion2
        runat="server"
        ID="Cotizacion2"
        EsRequerido="true"
        ValidationGroupForm="PruebasParcialesValGroup"
        ValorIVA="0.16"
        OnClientChangeEventDropdown="Cotizacion2_ActivaBotonAgregar()"
        ClientValidationFunctionForValidator="Cotizacion2_ValidateConceptosList" />

    <uc:Observaciones runat="server" ID="Observaciones" />


    <script type="text/javascript">
        function InstructivoManual_ValidaListaDocs(sender, e) {
            console.log("InstructivoManual_ValidaListaDocs");
            if ("<%=InstructivoManual.EsRequerido%>".toLowerCase() == "true")
                    e.IsValid = "<%=InstructivoManual.ListaDeDocumentos.Any()%>".toLowerCase() == 'true';
            else {
                e.IsValid = true;
            }
        }

        function Cotizacion2_ActivaBotonAgregar() {
            console.log("Cotizacion2_ActivaBotonAgregar");
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
            console.log("Cotizacion2_ValidateConceptosList");
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

    <uc:TerminosYCondiciones runat="server" ID="TermYCond" ValidationGroupForm="PruebasParcialesValGroup" />

    <hr class="my-4">

    <div class="row">
        <div class="col">
            <asp:Button ID="GuardaPruebParcialBtn" runat="server" ValidationGroup="PruebasParcialesValGroup" Text="Guardar" CssClass="btn btn-primary" OnClick="GuardaPruebParcialBtn_Click" />
        </div>
    </div>

</asp:Content>
