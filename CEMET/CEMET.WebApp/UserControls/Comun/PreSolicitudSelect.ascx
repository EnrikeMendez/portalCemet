<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PreSolicitudSelect.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.PreSolicitudSelect" %>
<asp:DropDownList
    runat="server"
    ID="PresolicitudesSelect"
    CssClass="form-control"
    data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}'/>

<%--<asp:CustomValidator
    ID="CustomValidator1"
    runat="server"
    CssClass="text-danger mb-2 mt-2"
    EnableClientScript="true"
    OnServerValidate="CustomValidator1_ServerValidate"
    ErrorMessage="El campo es requerido"></asp:CustomValidator>--%>