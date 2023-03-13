<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="NotificacionDeIngreso.aspx.cs" Inherits="CEMET.WebApp.Views.NotificacionDeIngreso" %>

<%@ Register Src="~/UserControls/Comun/NotificacionSolicitudDeServicio.ascx" TagPrefix="uc1" TagName="NotificacionSolicitudDeServicio" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-12">
            <p class="fs-5 fw-semibold mt-4">Estimado cliente:</p>
            <p>
                Por medio del presente, le informamos que durante la evaluación de su solicitud del servicio se detectó lo siguiente:
            </p>
        </div>
        <div class="col-md-12 text-center">
            <p class="fs-5 fw-semibold mt-4">Notificación de servicio FOP-07</p>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="FechaDeIngreso" CssClass="form-label required-field">
                 Fecha de ingreso
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="FechaDeIngreso" CssClass="form-control" Enabled="false" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="CantidadDeServiciosSolicitados" CssClass="form-label required-field">
                 Cantidad de servicios solicitados:
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="CantidadDeServiciosSolicitados" CssClass="form-control" Enabled="false" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="NoDeServicio" CssClass="form-label required-field">
                    No. de servicio (s) (Solicitud)
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="NoDeServicio" CssClass="form-control" Enabled="false" />
                </div>
            </div>
        </div>
    </div>

    <hr />
    <%--For each de entidades de solicitud de servicio--%>

   

    <uc1:NotificacionSolicitudDeServicio runat="server" ID="NotificacionSolicitudDeServicio" />

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="EnviarAlCorreo" CssClass="form-label required-field">
                    Enviar al correo:
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
