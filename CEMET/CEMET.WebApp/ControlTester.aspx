<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="ControlTester.aspx.cs" Inherits="CEMET.WebApp.ControlTester" %>

<%@ Register Src="~/UserControls/Comun/Datepicker.ascx" TagPrefix="uc1" TagName="Datepicker" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="py-5 text-center">
        <h1>Página Prueba para controles</h1>
    </div>

    <div class="row">
        <div class="col-md-6">
            Date picker
        </div>
        <div class="col-md-6">
            <link href="Content/ajaxcontroltoolkit-calendar.css" rel="stylesheet" />
            <uc1:Datepicker runat="server" ID="Datepicker" Etiqueta="Fecha Seleccionada"
                EsRequerido="true"
                OnClientShownEvent="DisableWeekends"
                FormatoDeFecha="dd/MM/yyyy"
                RegexParaFecha="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" />
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <asp:Panel ID="ModalPanel" runat="server">
                ASP.NET AJAX is a free framework for quickly creating a new generation of more 
                efficient, more interactive and highly-personalized Web experiences that work 
                across all the most popular browsers.<br />

                <asp:Button ID="OKButton" runat="server" Text="Close" />
            </asp:Panel>

            <ajaxToolkit:ModalPopupExtender ID="mpe" runat="server" TargetControlID="ClientButton"
                PopupControlID="ModalPanel" OkControlID="OKButton" />
        </div>
    </div>

    <asp:Button ID="ClientButton" runat="server" Text="Launch Modal Popup (Client)" />
    <asp:Button ID="ServerButton" runat="server" Text="Launch Modal Popup (Server)" OnClick="ServerButton_Click" />

    
    <script type="text/javascript">
        function DisableWeekends(sender, args) {
            for (var i = 0; i < 6; i++) {
                var row = sender._days.children[0].childNodes[1].children[i];
                for (var j = 0; j < 7; j++) {
                    var cell = row.children[j].firstChild;

                    if (cell.id == sender._id + "_day_" + i + "_" + "0" || cell.id == sender._id + "_day_" + i + "_" + "6") {
                        cell.style.textDecoration = "line-through";
                        cell.style.color = "red";
                        cell.style.cursor = "default";
                        cell.style.pointerEvents = "none";
                    }
                }
            }
        }
    </script>

    <script type="text/javascript">
        var launch = false;
        function launchModal() {
            launch = true;
        }

        function pageLoad() {
            if (launch) {
                let modlExtId = "<%= mpe.ClientID %>";
                $find(modlExtId).show();
            }
        }
    </script>
</asp:Content>
