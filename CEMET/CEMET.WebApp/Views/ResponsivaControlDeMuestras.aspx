<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="ResponsivaControlDeMuestras.aspx.cs" Inherits="CEMET.WebApp.Views.ResponsivaControlDeMuestras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="py-5 text-center">
        <h1>Responsiva de muestras</h1>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="NoDeResponsiva" CssClass="form-label required-field">
                    No. de responsiva:
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="NoDeResponsiva" CssClass="form-control" value="AUTOMATICALLY" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Fecha" CssClass="form-label required-field">
                    Fecha
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="Fecha" CssClass="form-control" TextMode="Date" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="SolicitudAsignada" CssClass="form-label required-field">
                    Solicitud asignada
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="SolicitudAsignada" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Cliente" CssClass="form-label required-field">
                    Cliente
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="Cliente" CssClass="form-control" />
                </div>
            </div>
        </div>
    </div>

    <div class="row mt-5">
        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="CantidadDeMuestras" CssClass="form-label required-field">
                    Cantidad de muestras
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="CantidadDeMuestras" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Descripcion" CssClass="form-label required-field">
                    Descripción
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="Descripcion" CssClass="form-control" TextMode="MultiLine" Wrap="true" Rows="5" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Modelo" CssClass="form-label required-field">
                    Modelo
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="Modelo" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Marca" CssClass="form-label required-field">
                    Marca
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="Marca" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Serie" CssClass="form-label required-field">
                    Serie
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="Serie" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="NoDeAccesorios" CssClass="form-label">
                    No. de accesorios
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="NoDeAccesorios" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Descripcion2" CssClass="form-label">
                    Descripción 2
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="Descripcion2" CssClass="form-control" TextMode="MultiLine" Wrap="true" Rows="5" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="NoDeParte" CssClass="form-label">
                    No. de parte
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="NoDeParte" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Cantidad" CssClass="form-label">
                    Cantidad
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="Cantidad" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="col-md-12 mt-4">
            <div class="form-check">
                <asp:Label runat="server" AssociatedControlID="ConfirmacionChkBx" CssClass="required-field">
                </asp:Label>
                <asp:CheckBox runat="server" ID="ConfirmacionChkBx" Checked="false" />
                <asp:Label runat="server" AssociatedControlID="ConfirmacionChkBx" CssClass="form-check-label">
                    Confirmo que la muestra que me fue entrega se encuentra completa conforme a lo registrado en la notificación de servicio y me fue entregada en buen estado
                </asp:Label>
            </div>
        </div>

        <div class="col-md-12 mt-4 mb-4">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Comentarios" CssClass="form-label">
                    Comentarios
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="Comentarios" CssClass="form-control" TextMode="MultiLine" Wrap="true" Rows="5" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="EnviarAlCorreo" CssClass="form-label required-field">
                    Enviar comentarios a:
                </asp:Label>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <div class="">
                    <asp:DropDownList runat="server" ID="EnviarAlCorreo" CssClass="form-select" />
                </div>
            </div>
        </div>

        <div class="col-md-12 text-center mt-5">
            <asp:Button runat="server" CssClass="btn btn-danger" Text="Validar" type="button" />
            <asp:Button runat="server" CssClass="btn btn-danger" Text="Aceptar" type="button" />
        </div>

    </div>



</asp:Content>
