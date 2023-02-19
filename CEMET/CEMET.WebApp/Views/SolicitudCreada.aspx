<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="SolicitudCreada.aspx.cs" Inherits="CEMET.WebApp.Views.SolicitudCreada" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container py-12 text-center">
        <div class="row" runat="server" id="MsgSolicitudCreada">
            <h1>Solicitud creada correctamente</h1>
            <label>Se ha creado correctamente la solicitud vinculada al folio numero: </label>
            <asp:Label runat="server" ID="lb_solicitud"><%Response.Write(Request.QueryString["folio"]);%></asp:Label>
            <label>¿Desea agregar otra solicitud al folio creado?</label><br />

        </div>
        <div class="row" runat="server" id="MsgNuevaSolicitud">
            <h1>Nueva solicitud</h1>
            
            <label>Seleccione el tipo de solicitud que desea crear:</label><br />

        </div>
        <div class="row" runat="server" id="botones">
            <div class="offset-md-5 col-md-1">
                <asp:Button ID="Si" runat="server" Text="Si" CssClass="btn btn-primary" OnClick="SiBtn_Click"/>
            </div>
            <div class="col-md-1">
                <asp:Button ID="No" runat="server" Text="No" CssClass="btn btn-outline-secondary" OnClick="No_Click" />
            </div>
        </div>
        <div class="row" id="frmTipoServicio" runat="server">
             <div class="form-group col-md-12 p-3">
                <asp:Label runat="server" AssociatedControlID="TipoDeServicio" ID="lbl_TipoDeServicio" CssClass="form-label required-field">
                            Tipo de servicio:</asp:Label>
                <div class="">
                    <asp:DropDownList runat="server" ID="TipoDeServicio" CssClass="form-control" data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}'/>
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasCompletasValGroup" Display="Static" ControlToValidate="TipoDeServicio" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                </div>
            </div>
            <div class="col-md12">
                <asp:Button ID="AgregarBtn" runat="server"  Text="Agregar" CssClass="btn btn-primary" OnClick="AgregarBtn_Click" />
            </div>
        </div>
        
        
    </div>


</asp:Content>
