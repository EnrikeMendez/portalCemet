<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Datepicker.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.Datepicker" %>

<div class="form-group">
    <asp:Label
        ID="FechaSeleccionadaLabel"
        runat="server"
        AssociatedControlID="FechaSeleccionadaTxt"
        CssClass="form-label">
        Mi datepicker
    </asp:Label>
    <div>
        <div class="input-group">
            <asp:TextBox ID="FechaSeleccionadaTxt" runat="server" CssClass="form-control" autocomplete="off" />
            <button class="btn btn-primary" type="button" id="FechaSeleccionadaBtn" runat="server">
                <i class="fa fa-calendar"></i>
            </button>
        </div>
        <ajaxToolkit:CalendarExtender
            PopupButtonID="FechaSeleccionadaBtn"
            ID="Calendario"
            runat="server"
            TargetControlID="FechaSeleccionadaTxt"
            FirstDayOfWeek="Sunday"
            Animated="true" />

        <asp:CustomValidator
            ID="FechaSeleccionadaTxtReqVal"
            runat="server"
            CssClass="text-danger"
            EnableClientScript="true"
            Display="Static"
            OnServerValidate="FechaSeleccionadaTxtReqVal_ServerValidate"
            ErrorMessage="El campo es requerido">
        </asp:CustomValidator>
    </div>
</div>

