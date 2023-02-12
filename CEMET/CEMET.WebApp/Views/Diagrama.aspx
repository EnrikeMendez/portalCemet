<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="Diagrama.aspx.cs" Inherits="CEMET.WebApp.Views.Diagrama" %>

<%@ Register Src="~/UserControls/Comun/SubirArchivo.ascx" TagPrefix="uc1" TagName="SubirArchivo" %>
<%@ Register Src="~/UserControls/Comun/TerminosYCondiciones.ascx" TagPrefix="uc1" TagName="TerminosYCondiciones" %>
<%@ Register Src="~/UserControls/Comun/Observaciones.ascx" TagPrefix="uc1" TagName="Observaciones" %>
<%@ Register Src="~/UserControls/Comun/Cotizacion2.ascx" TagPrefix="uc1" TagName="Cotizacion2" %>
<%@ Register Src="~/UserControls/Comun/CamposComunes.ascx" TagPrefix="uc1" TagName="CamposComunes" %>


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
                <asp:Label runat="server" AssociatedControlID="TipoDeServicio" CssClass="form-label required-field">
                            Tipo de servicio</asp:Label>
                <div class="">
                    <asp:DropDownList
                        runat="server"
                        ID="TipoDeServicio"
                        CssClass="form-select"
                        Enabled="false" />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="diagramaCamposRequeridos" Display="Static" ControlToValidate="TipoDeServicio" CssClass="text-danger" ErrorMessage="El campo es requerido" ID="TipoDeServicioReqVal" />
                </div>
            </div>
        </div>

        <uc1:CamposComunes
            runat="server"
            ID="CamposComunes"
            DescripcionDelProducto_EsRequerido="true"
            DescripcionDelProducto_ClientValidationFunction="DescripcionDelProducto_ClientValidationFunction"
            Marca_EsRequerido="true"
            Marca_ClientValidationFunction="Marca_ClientValidationFunction"
            Modelo_EsRequerido="true"
            Modelo_ClientValidationFunction="Modelo_ClientValidationFunction"
            PaisDeOrigen_Visible="false"
            ValidationGroup="diagramaCamposRequeridos" />


        <%--        <div class="form-group col-md-6">
            <asp:Label runat="server" AssociatedControlID="DescripcionDelProducto" CssClass="form-label required-field">
                            Descripción del producto</asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="DescripcionDelProducto" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="diagramaCamposRequeridos" Display="Static" ControlToValidate="DescripcionDelProducto" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6">
            <asp:Label runat="server" AssociatedControlID="Marca" CssClass="form-label required-field">
                            Marca</asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Marca" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="diagramaCamposRequeridos" Display="Static" ControlToValidate="Marca" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6">
            <asp:Label runat="server" AssociatedControlID="Modelo" CssClass="form-label required-field">
                            Modelo</asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Modelo" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="diagramaCamposRequeridos" Display="Static" ControlToValidate="Modelo" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>--%>

        <div class="col-md-12">
            <div class="row align-items-center">
                <div class="col-md-2">
                    Especificaciones eléctricas de alimentación:
                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Voltaje" CssClass="form-label required-field">
                                Voltaje (V)
                        </asp:Label>
                        <div class="">
                            <asp:DropDownList runat="server" ID="Voltaje" CssClass="form-select" />
                            <asp:RequiredFieldValidator runat="server" ValidationGroup="diagramaCamposRequeridos" Display="Static" ControlToValidate="Voltaje" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row align-items-center">
                        <div class="col-md-3">
                            Consumo
                        </div>
                        <div class="col-md-9">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Corriente" CssClass="form-label required-field">
                                        Corriente (A)
                                </asp:Label>
                                <div class="">
                                    <asp:DropDownList runat="server" ID="Corriente" CssClass="form-select" />
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="diagramaCamposRequeridos" Display="Static" ControlToValidate="Corriente" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Potencia" CssClass="form-label required-field">
                                        Potencia (W)
                                </asp:Label>
                                <div class="">
                                    <asp:DropDownList runat="server" ID="Potencia" CssClass="form-select" />
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="diagramaCamposRequeridos" Display="Static" ControlToValidate="Potencia" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ModalidadDeRecoleccion" CssClass="form-label">
                            Recolección</asp:Label>
                <div class="">
                    <asp:DropDownList runat="server" ID="ModalidadDeRecoleccion" CssClass="form-select" />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="diagramaCamposRequeridos" Display="Static" ControlToValidate="ModalidadDeRecoleccion" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-7">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="ModalidadDeEntrega" CssClass="form-label">
                    Entrega
                    </asp:Label>
                    <div class="">
                        <asp:DropDownList runat="server" ID="ModalidadDeEntrega" CssClass="form-select" />
                        <asp:RequiredFieldValidator runat="server" ValidationGroup="diagramaCamposRequeridos" Display="Static" ControlToValidate="ModalidadDeEntrega" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                    </div>
                </div>
            </div>
            <div class="col-md-5">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="DiasHabiles" CssClass="form-label">
                        Días hábiles
                    </asp:Label>
                    <div class="">
                        <asp:DropDownList runat="server" ID="DiasHabiles" CssClass="form-select" />
                        <asp:RequiredFieldValidator runat="server" ValidationGroup="diagramaCamposRequeridos" Display="Static" ControlToValidate="DiasHabiles" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="d-flex align-items-center mb-3 mt-4">
        <h5 class="mb-0 me-3 me-md-4">Cotización</h5>
        <div class="border-bottom flex-grow-1"></div>
    </div>

    <uc1:Cotizacion2
        runat="server"
        ID="Cotizacion2"
        ValidationGroupForm="diagramaCamposRequeridos"
        EsRequerido="true"
        OnClientChangeEventDropdown="Cotizacion2_ActivaBotonAgregar()"
        ClientValidationFunctionForValidator="Cotizacion2_ValidateConceptosList"
        ValorIVA="0.16" />

    <uc1:Observaciones runat="server" ID="Observaciones" />

    <uc1:TerminosYCondiciones runat="server" ID="TermYCond" ValidationGroupForm="diagramaCamposRequeridos" />

    <hr class="my-4">

    <div class="row">
        <div class="col">
            <asp:Button ID="GuardarDiagramaBtn" runat="server" OnClick="GuardarDiagramaBtn_Click" Text="Guardar" CssClass="btn btn-primary" ValidationGroup="diagramaCamposRequeridos" />
        </div>
    </div>

    <script type="text/javascript">

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
                        let t = "<%=CamposComunes.DescripcionDelProducto_Text%>";
                console.log("DescripcionDelProducto_Text", t);
                e.IsValid = "<%=CamposComunes.DescripcionDelProducto_Text%>" !== '';
            }
            else {
                e.IsValid = true;
            }
        }

        function Marca_ClientValidationFunction(sender, e) {
            if ("<%=CamposComunes.Marca_EsRequerido.ToString().ToLower()%>" == "true") {
                let t = "<%=CamposComunes.Marca_Text%>";
                console.log("Marca_Text", t);
                e.IsValid = "<%=CamposComunes.Marca_Text%>" !== '';
            }
            else {
                e.IsValid = true;
            }
        }

        function Modelo_ClientValidationFunction(sender, e) {
            if ("<%=CamposComunes.Modelo_EsRequerido.ToString().ToLower()%>" == "true") {
                let t = "<%=CamposComunes.Modelo_Text%>";
                console.log("Modelo_Text", t);
                e.IsValid = "<%=CamposComunes.Modelo_Text%>" !== '';
            }
            else {
                e.IsValid = true;
            }
        }

    </script>

</asp:Content>
