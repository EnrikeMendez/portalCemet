<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ModalidadEntrega.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.ModalidadEntrega" %>


<div class="row">
    <div class="form-group col-md-6">
        <asp:Label runat="server" AssociatedControlID="modalidadDeEntrega" CssClass="form-label required-field">
            Modalidad de Entrega:
        </asp:Label>
    </div>
    <div class="form-group col-md-6">
        <asp:DropDownList runat="server" ID="modalidadDeEntrega" CssClass="form-control" data-choices='{"searchEnabled":false, "allowHTML":true,"itemSelectText":""}' required=""/>
    </div>
</div><br />


<div class="row">
    <div class="form-group col-md-6">
        <asp:Label runat="server" AssociatedControlID="diasHabiles" CssClass="form-label required-field">
            Emisión de informe urgente:
        </asp:Label>
    </div>
    <div class="form-group col-md-6">
        <asp:DropDownList runat="server" ID="diasHabiles" CssClass="form-control" data-choices='{"searchEnabled":false, "allowHTML":true,"itemSelectText":""}' required=""/>
    </div>
</div><br />