<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="EspecificacionesElectricas.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.EspecificacionesElectricas" %>

<div class="row align-items-center">
    <div class="col-md-6">
        <div class="form-group">
            <asp:Label
                ID="Voltaje_Label"
                runat="server"
                AssociatedControlID="Voltaje"
                CssClass="form-label">
                Voltaje (V)
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="Voltaje" CssClass="form-control"
                     data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}'/>
                <asp:RequiredFieldValidator
                    ID="Voltaje_RequiredFieldValidator"
                    runat="server"
                    Display="Static"
                    ControlToValidate="Voltaje"
                    CssClass="text-danger"
                    ErrorMessage="El campo es requerido" />
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="row align-items-center">
            <div class="col-md-3 text-center">
                Consumo
            </div>
            <div class="col-md-9">
                <div class="form-group">
                    <asp:Label
                        ID="Corriente_Label"
                        runat="server"
                        AssociatedControlID="Corriente"
                        CssClass="form-label">
                        Corriente (A)
                    </asp:Label>
                    <div class="">
                        <asp:DropDownList runat="server" ID="Corriente" CssClass="form-control"
                             data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}'/>
                        <asp:RequiredFieldValidator
                            ID="Corriente_RequiredFieldValidator"
                            runat="server"
                            Display="Static"
                            ControlToValidate="Corriente"
                            CssClass="text-danger"
                            ErrorMessage="El campo es requerido" />
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label
                        ID="Potencia_Label"
                        runat="server"
                        AssociatedControlID="Potencia"
                        CssClass="form-label">
                        Potencia (W)
                    </asp:Label>
                    <div class="">
                        <asp:DropDownList runat="server" ID="Potencia" CssClass="form-control"
                             data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}'/>
                        <asp:RequiredFieldValidator
                            ID="Potencia_RequiredFieldValidator"
                            runat="server"
                            Display="Static"
                            ControlToValidate="Potencia"
                            CssClass="text-danger"
                            ErrorMessage="El campo es requerido" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
