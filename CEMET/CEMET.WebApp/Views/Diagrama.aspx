<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="Diagrama.aspx.cs" Inherits="CEMET.WebApp.Views.Diagrama" %>

<%@ Register Src="~/UserControls/Comun/SubirArchivo.ascx" TagPrefix="uc1" TagName="SubirArchivo" %>
<%@ Register Src="~/UserControls/Comun/TerminosYCondiciones.ascx" TagPrefix="uc1" TagName="TerminosYCondiciones" %>
<%@ Register Src="~/UserControls/Comun/Observaciones.ascx" TagPrefix="uc1" TagName="Observaciones" %>
<%@ Register Src="~/UserControls/Comun/Cotizacion2.ascx" TagPrefix="uc1" TagName="Cotizacion2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

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
                    <asp:DropDownList runat="server" ID="TipoDeServicio" CssClass="form-select" />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="diagramaCamposRequeridos" Display="Static" ControlToValidate="TipoDeServicio" CssClass="text-danger" ErrorMessage="El campo es requerido" ID="TipoDeServicioReqVal" />
                </div>
            </div>
        </div>

        <div class="form-group col-md-6">
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
        </div>

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

    <uc1:Cotizacion2 runat="server" ID="Cotizacion2" ValidationGroupForm="diagramaCamposRequeridos" ValorIVA="0.16" />

    <uc1:Observaciones runat="server" ID="Observaciones" />

    <uc1:TerminosYCondiciones runat="server" ID="TermYCond" ValidationGroupForm="diagramaCamposRequeridos" />

    <hr class="my-4">

    <div class="row">
        <div class="col">
            <asp:Button ID="GuardarDiagramaBtn" runat="server" OnClick="GuardarDiagramaBtn_Click" Text="Guardar" CssClass="btn btn-primary" ValidationGroup="diagramaCamposRequeridos" />
        </div>
    </div>

</asp:Content>
