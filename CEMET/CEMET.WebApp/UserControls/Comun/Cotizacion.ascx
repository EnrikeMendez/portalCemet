<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cotizacion.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.Cotizacion" %>

<div class="row pb-4">
    <div class="form-group col-md-6">
        <asp:Label runat="server" AssociatedControlID="Desgloce" CssClass="form-label">
            Servicios solicitados:
        </asp:Label>
    </div>
    <div class="form-group col-md-6">
        <asp:DropDownList runat="server" ID="Desgloce" CssClass="form-select" />
    </div>
</div>
<div class="row pb-4">

    <div class="form-group col-md-6">
        <asp:TextBox runat="server" ID="Subtotal" CssClass="form-control" placeholder="Subtotal" required=""/>
    </div>
    <div class="form-group col-md-6">
        <asp:TextBox runat="server" ID="Iva" CssClass="form-control" placeholder="IVA" required=""/>
    </div>
    
</div>
<div class="row pb-4">
    <div class="form-group col-md-6">
        <asp:TextBox runat="server" ID="Total" CssClass="form-control" placeholder="Total" required=""/>
    </div>
</div>
