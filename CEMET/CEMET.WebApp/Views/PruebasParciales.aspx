<%@ Page Title="Prueba parcial | Alta de nuevo servicio" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="PruebasParciales.aspx.cs" Inherits="CEMET.WebApp.Views.PresolicitudParcial" %>

<%@ Register Src="~/UserControls/Comun/TerminosYCondiciones.ascx" TagPrefix="uc" TagName="TerminosYCondiciones" %>
<%@ Register Src="~/UserControls/Comun/SubirArchivo.ascx" TagPrefix="uc" TagName="SubirArchivo" %>
<%@ Register Src="~/UserControls/Comun/ModalidadEntrega.ascx" TagPrefix="uc" TagName="ModalidadEntrega" %>
<%@ Register Src="~/UserControls/Comun/Observaciones.ascx" TagPrefix="uc" TagName="Observaciones" %>
<%@ Register Src="~/UserControls/Comun/Cotizacion2.ascx" TagPrefix="uc1" TagName="Cotizacion2" %>

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
        <%--<asp:ValidationSummary runat="server" CssClass="text-danger" />--%>
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
                <asp:DropDownList runat="server" ID="Norma" CssClass="form-select" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasParcialesValGroup" Display="Static" ControlToValidate="Norma" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="NormaParticular" ID="lbl_NormaParticular" CssClass="form-label required-field">
                    Norma Particular
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="NormaParticular" CssClass="form-select" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasParcialesValGroup" Display="Static" ControlToValidate="NormaParticular" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="MetodoDePrueba" ID="lbl_MetodoDePrueba" CssClass="form-label required-field">
                    Metodo de prueba
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="MetodoDePrueba" CssClass="form-select" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasParcialesValGroup" Display="Static" ControlToValidate="MetodoDePrueba" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>


        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="DescripcionDelProducto" CssClass="form-label required-field">
                Descripción del producto
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="DescripcionDelProducto" CssClass="form-control"/>
                <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasParcialesValGroup" Display="Static" ControlToValidate="DescripcionDelProducto" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="Marca" CssClass="form-label">
                Marca
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Marca" CssClass="form-control"/>
            </div>
        </div>
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="Modelo" CssClass="form-label">
                Modelo
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Modelo" CssClass="form-control"/>
            </div>
        </div>
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="PaisDeOrigen" ID="lbl_PaisDeOrigen" CssClass="form-label">
                    Pais de Origen
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="PaisDeOrigen" CssClass="form-select" />
            </div>
        </div>
    </div>

    <%--
            https://es.stackoverflow.com/questions/41008/error-de-servidor-en-la-aplicaci%C3%B3n#:~:text=Argumento%20de%20devoluci%C3%B3n%20o%20de,%22%20%25%3E%20en%20una%20p%C3%A1gina.
    --%>
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

    <div class="row">
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="ModalidadDeRecoleccion" ID="lbl_ModalidadDeRecoleccion" CssClass="form-label required-field">
                    Modalidad de recolección:
            </asp:Label>
        </div>
        <div class="form-group col-md-6 p-3">
            <asp:DropDownList runat="server" ID="ModalidadDeRecoleccion" CssClass="form-select" required="" />
        </div>
    </div>



    <div class="d-flex align-items-center mb-3 mt-4">
        <h5 class="mb-0 me-3 me-md-4">
            <asp:Label ID="Label2" runat="server">
                    Modalidad de entrega
            </asp:Label>
        </h5>
        <div class="border-bottom flex-grow-1"></div>

    </div>

    <uc:ModalidadEntrega runat="server" ID="ModalidadEntrega" />

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
    </script>



    <uc:TerminosYCondiciones runat="server" ID="TermYCond" ValidationGroupForm="PruebasParcialesValGroup" />

    <hr class="my-4">

    <div class="row">
        <div class="col">
            <asp:Button ID="GuardaPruebParcialBtn" runat="server" ValidationGroup="PruebasParcialesValGroup" Text="Guardar" CssClass="btn btn-primary" OnClick="GuardaPruebParcialBtn_Click" />
        </div>
    </div>

</asp:Content>
