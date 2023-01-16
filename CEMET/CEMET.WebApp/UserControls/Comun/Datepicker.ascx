<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Datepicker.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.Datepicker" %>

<div class="form-group">
    <asp:Calendar
        ID="Calendario"
        runat="server"
        OnSelectionChanged="Calendario_SelectionChanged"
        CssClass="table table-bordered">
        <OtherMonthDayStyle ForeColor="LightGray"></OtherMonthDayStyle>

        <TitleStyle CssClass="Hola"></TitleStyle>

        <%--    <DayStyle BackColor="gray"></DayStyle>

    <SelectedDayStyle BackColor="LightGray"
        Font-Bold="True"></SelectedDayStyle>--%>
    </asp:Calendar>

    <div class="input-group mt-3">
        <span class="input-group-text" id="FechaLabel" runat="server">Fecha (XXXXX)</span>
        <asp:TextBox ID="FechaSeleccionada" runat="server" CssClass="form-control">

        </asp:TextBox>
    </div>
</div>

