<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cotizacion.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.Cotizacion" %>

<div class="row pb-4">
    <div class="form-group col-md-6">
        <asp:Label runat="server" AssociatedControlID="Desgloce" CssClass="form-label required-field">
            Servicios solicitados:
        </asp:Label>
    </div>
    <div class="form-group col-md-6">
        <asp:DropDownList runat="server" ID="Desgloce" CssClass="form-select" />
    </div>
</div>
<div class="row pb-4">

    <div class="form-group col-md-6">
        <asp:Label runat="server" AssociatedControlID="Subtotal" CssClass="form-label required-field">
            Subtotal:
        </asp:Label>
        <asp:TextBox runat="server" ID="Subtotal" CssClass="form-control" required=""/>
    </div>
    <div class="form-group col-md-6">
        <asp:Label runat="server" AssociatedControlID="Iva" CssClass="form-label required-field">
            Iva:
        </asp:Label>
        <asp:TextBox runat="server" ID="Iva" CssClass="form-control" required=""/>
    </div>
    
</div>
<div class="row pb-4">
    <asp:Label runat="server" AssociatedControlID="Total" CssClass="form-label required-field">
            Total:
        </asp:Label>
    <div class="form-group col-md-6">
        <asp:TextBox runat="server" ID="Total" CssClass="form-control" required=""/>
    </div>
</div>
