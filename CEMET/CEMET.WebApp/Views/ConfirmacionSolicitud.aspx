<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="ConfirmacionSolicitud.aspx.cs" Inherits="CEMET.WebApp.Views.ConfirmacionSolicitud" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-12 text-center">
        <div class="row" runat="server" id="MsgSolicitudCreada">
            <h1>¿Confirmas que la información capturada sea guardada?</h1>
            <label>*Si se selecciona "No" las solicitudes previamente creadas para el folio <% Response.Write( Session["Folio"] != null ? Session["Folio"].ToString() : ""); %> serán eliminadas</label><br />

        </div>
       
        <div class="row" runat="server" id="botones">
            <div class="offset-md-5 col-md-1">
                <asp:Button ID="Si" runat="server" Text="Si" CssClass="btn btn-primary" OnClick="SiBtn_Click"/>
            </div>
            <div class="col-md-1">
                <asp:Button ID="No" runat="server" Text="No" CssClass="btn btn-outline-secondary" OnClick="No_Click" />
            </div>
        </div>
        
    </div>
</asp:Content>
