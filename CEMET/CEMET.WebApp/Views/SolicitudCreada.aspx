<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="SolicitudCreada.aspx.cs" Inherits="CEMET.WebApp.Views.SolicitudCreada" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-5 text-center">
        <h1>Solicitud creada correctamente</h1>
        <label>Se ha creado correctamente la solicitud con el folio numero: </label>
        <asp:Label runat="server" ID="lb_solicitud"></asp:Label>
    </div>

</asp:Content>
