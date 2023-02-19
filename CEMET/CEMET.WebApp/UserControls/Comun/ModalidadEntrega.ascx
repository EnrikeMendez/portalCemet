<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ModalidadEntrega.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.ModalidadEntrega" %>


<div class="col-md-12">
    <div class="form-group">
        <asp:Label
            ID="modalidadDeRecoleccion_Label"
            runat="server" AssociatedControlID="modalidadDeRecoleccion" CssClass="form-label">
                    Recolección
        </asp:Label>
        <div class="">
            <asp:DropDownList runat="server"
                ID="modalidadDeRecoleccion" CssClass="form-control"
                data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}' />
            <asp:RequiredFieldValidator
                ID="modalidadDeRecoleccion_RequiredFieldValidator"
                runat="server"
                Display="Static"
                ControlToValidate="ModalidadDeRecoleccion"
                CssClass="text-danger"
                ErrorMessage="El campo es requerido" />
        </div>
    </div>
</div>
<div class="col-md-12">
    <div class="row">
        <div class="col-md-7">
            <div class="form-group">
                <asp:Label
                    ID="modalidadDeEntrega_Label"
                    runat="server" AssociatedControlID="modalidadDeEntrega" CssClass="form-label">
                        Entrega
                </asp:Label>
                <div class="">
                    <asp:DropDownList runat="server" ID="modalidadDeEntrega" CssClass="form-control"
                        data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}' />
                    <asp:RequiredFieldValidator
                        ID="modalidadDeEntrega_RequiredFieldValidator"
                        runat="server"
                        Display="Static"
                        ControlToValidate="ModalidadDeEntrega"
                        CssClass="text-danger"
                        ErrorMessage="El campo es requerido" />
                </div>
            </div>
        </div>
        <div class="col-md-5">
            <div class="form-group">
                <asp:Label
                    ID="diasHabiles_Label" runat="server" AssociatedControlID="diasHabiles" CssClass="form-label">
                        Días hábiles
                </asp:Label>
                <div class="">
                    <asp:DropDownList runat="server" ID="diasHabiles" CssClass="form-control"
                        data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}' />
                    <asp:RequiredFieldValidator
                        ID="diasHabiles_RequiredFieldValidator"
                        runat="server"
                        Display="Static" ControlToValidate="DiasHabiles"
                        CssClass="text-danger"
                        ErrorMessage="El campo es requerido" />
                </div>
            </div>
        </div>
    </div>
</div>
