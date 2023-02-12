<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CamposComunes.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.CamposComunes" %>


<%--<div class="row">--%>
<div class="col-md-6" runat="server" id="DescripcionDelProducto_Container">
    <div class="form-group">
        <asp:Label
            ID="DescripcionDelProducto_Label"
            runat="server"
            AssociatedControlID="DescripcionDelProducto"
            CssClass="form-label">
                    Descripción del producto:
        </asp:Label>
        <div class="">
            <asp:TextBox
                runat="server"
                ID="DescripcionDelProducto"
                CssClass="form-control" />

            <asp:CustomValidator
                ID="DescripcionDelProducto_CustomValidator"
                runat="server"
                CssClass="text-danger"
                ValidateEmptyText="true"
                OnServerValidate="DescripcionDelProducto_CustomValidator_ServerValidate"
                ErrorMessage="El campo es requerido" />
        </div>
    </div>
</div>

<div class="col-md-6" runat="server" id="Marca_Container">
    <div class="form-group">
        <asp:Label
            ID="Marca_Label"
            runat="server"
            AssociatedControlID="Marca"
            CssClass="form-label">
                    Marca
        </asp:Label>
        <div class="">
            <asp:TextBox
                runat="server"
                ID="Marca"
                CssClass="form-control" />

            <asp:CustomValidator
                ID="Marca_CustomValidator"
                runat="server"
                CssClass="text-danger"
                ValidateEmptyText="true"
                OnServerValidate="Marca_CustomValidator_ServerValidate"
                ErrorMessage="El campo es requerido" />
        </div>
    </div>
</div>

<div class="col-md-6" runat="server" id="Modelo_Container">
    <div class="form-group">
        <asp:Label
            ID="Modelo_Label"
            runat="server"
            AssociatedControlID="Modelo"
            CssClass="form-label">
                    Modelo
        </asp:Label>
        <div class="">
            <asp:TextBox
                runat="server"
                ID="Modelo"
                CssClass="form-control" />

            <asp:CustomValidator
                ID="Modelo_CustomValidator"
                runat="server"
                CssClass="text-danger"
                ValidateEmptyText="true"
                OnServerValidate="Modelo_CustomValidator_ServerValidate"
                ErrorMessage="El campo es requerido" />
        </div>
    </div>
</div>

<div class="col-md-6" runat="server" id="PaisDeOrigen_Container">
    <div class="form-group">
        <asp:Label
            ID="PaisDeOrigen_Label"
            runat="server"
            AssociatedControlID="PaisDeOrigen"
            CssClass="form-label">
                    Pais de Origen:
        </asp:Label>
        <div class="">
            <asp:DropDownList
                runat="server"
                ID="PaisDeOrigen"
                CssClass="form-select" />

            <asp:CustomValidator
                ID="PaisDeOrigen_CustomValidator"
                runat="server"
                CssClass="text-danger"
                ValidateEmptyText="true"
                OnServerValidate="PaisDeOrigen_CustomValidator_ServerValidate"
                ErrorMessage="El campo es requerido" />
        </div>
    </div>
</div>


<%--</div>--%>
