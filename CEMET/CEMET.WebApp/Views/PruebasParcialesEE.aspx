<%@ Page Title="Presolicitud EE (P.Parciales)" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="PruebasParcialesEE.aspx.cs" Inherits="CEMET.WebApp.Views.PruebasParcialesEE" %>

<%@ Register Src="~/UserControls/Comun/TerminosYCondiciones.ascx" TagPrefix="uc" TagName="TerminosYCondiciones" %>
<%@ Register Src="~/UserControls/Comun/SubirArchivo.ascx" TagPrefix="uc" TagName="SubirArchivo" %>
<%@ Register Src="~/UserControls/Comun/ModalidadEntrega.ascx" TagPrefix="uc" TagName="ModalidadEntrega" %>
<%@ Register Src="~/UserControls/Comun/Cotizacion.ascx" TagPrefix="uc1" TagName="Cotizacion2" %>
<%@ Register Src="~/UserControls/Comun/Observaciones.ascx" TagPrefix="uc" TagName="Observaciones" %>
<%@ Register Src="~/UserControls/Comun/EspecificacionesElectricas.ascx" TagPrefix="uc" TagName="EspecificacionesElectricas" %>
<%@ Register Src="~/UserControls/Comun/CamposComunes.ascx" TagPrefix="uc" TagName="CamposComunes" %>

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
        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="TipoDeServicio" ID="lbl_TipoDeServicio" CssClass="form-label required-field">
                Tipo de servicio:
                </asp:Label>
                <div class="">
                    <asp:DropDownList runat="server" ID="TipoDeServicio" CssClass="form-select" Enabled="false" />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasParcialesEEValGroup" Display="Static" ControlToValidate="TipoDeServicio" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ServicioAdicional" ID="lbl_ServicioAdicional" CssClass="form-label">
                            Servicio adicional:
                </asp:Label>
                <div class="">
                    <asp:DropDownList
                        runat="server"
                        ID="ServicioAdicional"
                        CssClass="form-control"
                        data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}' />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasParcialesEEValGroup" Display="Static" ControlToValidate="ServicioAdicional" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Norma" ID="lbl_Norma" CssClass="form-label required-field">
                    Norma:
                </asp:Label>
                <div class="">
                    <asp:DropDownList
                        runat="server"
                        ID="Norma"
                        CssClass="form-control"
                        onchange="Norma_ClienOnChange()"
                        data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}' />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasParcialesEEValGroup" Display="Static" ControlToValidate="Norma" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                </div>
            </div>
        </div>

        <div class="col-md-6" id="normaParticular_Container">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="NormaParticular" ID="lbl_NormaParticular" CssClass="form-label">
                    Norma particular:
                </asp:Label>
                <div class="">
                    <asp:DropDownList
                        runat="server"
                        ID="NormaParticular"
                        CssClass="form-control"
                        data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}' />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="MetodoDePrueba" ID="MetodoDePrueba_Label" CssClass="form-label required-field">
                    Método De Prueba
                </asp:Label>
                <div class="">
                    <asp:ListBox
                        DataValueField="Value"
                        DataTextField="Text"
                        runat="server"
                        CssClass="form-select"
                        ID="MetodoDePrueba"
                        Rows="5"
                        SelectionMode="Multiple"></asp:ListBox>
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasParcialesEEValGroup" Display="Static" ControlToValidate="MetodoDePrueba" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Categoria" ID="lbl_Categoria" CssClass="form-label required-field">
                    Categoria:
                </asp:Label>
                <div class="">
                    <asp:DropDownList
                        runat="server"
                        ID="Categoria"
                        CssClass="form-control"
                        data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}' />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasParcialesEEValGroup" Display="Static" ControlToValidate="Categoria" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ReferenciaCertificacion" CssClass="form-label required-field">
                    Referencia de certificación:
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="ReferenciaCertificacion" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasParcialesEEValGroup" Display="Static" ControlToValidate="ReferenciaCertificacion" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                </div>
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
            ValidationGroup="PruebasParcialesEEValGroup" />

        <uc:ModalidadEntrega runat="server" ID="ModalidadEntrega" EsRequerido="true" ValidationGroup="PruebasParcialesEEValGroup" />
    </div>

    <div class="d-flex align-items-center mb-3 mt-4">
        <h5 class="mb-0 me-3 me-md-4">Especificaciones eléctricas de alimentación</h5>
        <div class="border-bottom flex-grow-1"></div>
    </div>

    <div class="col-md-12">
        <uc:EspecificacionesElectricas
            runat="server"
            ID="EspecificacionesElectricas"
            EsRequerido="true"
            ValidationGroup="diagramaCamposRequeridos" />
    </div>

    <div class="d-flex align-items-center mb-3 mt-4">
        <h5 class="mb-0 me-3 me-md-4">Documentos</h5>
        <div class="border-bottom flex-grow-1"></div>
    </div>

    <uc:SubirArchivo
        runat="server"
        ID="InstructivoManual"
        Etiqueta="Instructivo o manual"
        Extensiones=".jpg" />

    <uc:SubirArchivo
        runat="server"
        ID="Marcado"
        Etiqueta="Marcado"
        Extensiones=".jpg" />

    <uc:SubirArchivo
        runat="server"
        ID="Diagrama"
        Etiqueta="Diagrama"
        Extensiones=".jpg" />

    <uc:SubirArchivo
        runat="server"
        ID="DocsAdicionales"
        Etiqueta="Documentos adicionales"
        Extensiones=".jpg" />

    <div class="d-flex align-items-center mb-3 mt-4">
        <h5 class="mb-0 me-3 me-md-4">Cotizacion</h5>
        <div class="border-bottom flex-grow-1"></div>
    </div>

    <uc1:Cotizacion2
        runat="server"
        ID="Cotizacion2"
        ValidationGroupForm="PruebasParcialesEEValGroup"
        ValorIVA="0.16"
        EsRequerido="true"
        OnClientChangeEventDropdown="Cotizacion2_ActivaBotonAgregar()"
        ClientValidationFunctionForValidator="Cotizacion2_ValidateConceptosList" />

    <uc:Observaciones runat="server" ID="Observaciones" />

    <uc:TerminosYCondiciones runat="server" ID="TermYCond" ValidationGroupForm="PruebasParcialesEEValGroup" />

    <div class="row">
        <div class="col">
            <asp:Button
                ID="GuardaPruebCompBtn"
                runat="server"
                ValidationGroup="PruebasParcialesEEValGroup"
                Text="Guardar"
                CssClass="btn btn-primary"
                OnClick="GuardaPruebCompBtn_Click" />
        </div>
    </div>

    <script type="text/javascript">

        $(document).ready(function () {
            $("#normaParticular_Container").hide();
            $("#Calibre_Container").hide();

            $("#" + "<%= Norma.ClientID %>").change();
            $("#" + "<%= NormaParticular.ClientID %>").change();
        });

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

        function Norma_ClienOnChange() {
            let normaId = $("#" + "<%= Norma.ClientID %>").val();
            //  NOM-003 y NOM-001
            if (["8", "9"].indexOf(normaId) != -1) {
                $("#normaParticular_Container").show();
            } else {
                $("#normaParticular_Container").hide();
            }
        }

    </script>

</asp:Content>
