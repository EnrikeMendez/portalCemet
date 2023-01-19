<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ModalidadEntrega.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.ModalidadEntrega" %>


<div class="row">
    <div class="form-group col-md-6">
        <asp:Label runat="server" AssociatedControlID="DiasHabilesEstandar" CssClass="form-label required-field">
            Emisión de informe en tiempo estándar:
        </asp:Label>
    </div>
    <div class="form-group col-md-6">
        <asp:DropDownList runat="server" ID="DiasHabilesEstandar" CssClass="form-select" required=""/>
    </div>
</div><br />


<div class="row">
    <div class="form-group col-md-6">
        <asp:Label runat="server" AssociatedControlID="DiasHabilesUrgente" CssClass="form-label required-field">
            Emisión de informe urgente:
        </asp:Label>
    </div>
    <div class="form-group col-md-6">
        <asp:DropDownList runat="server" ID="DiasHabilesUrgente" CssClass="form-select" required=""/>
    </div>
</div><br />