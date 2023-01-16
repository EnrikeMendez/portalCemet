<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="ControlTester.aspx.cs" Inherits="CEMET.WebApp.ControlTester" %>

<%@ Register Src="~/UserControls/Comun/Datepicker.ascx" TagPrefix="uc1" TagName="Datepicker" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-5 text-center">
        <h1>Alta de nuevo servicio</h1>
    </div>

    <div class="row">
        <div class="col-md-6">
            Date picker
        </div>
        <div class="col-md-6">
            <uc1:Datepicker runat="server" ID="Datepicker" IsReadOnlyTextbox="true" />
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            <asp:Button ID="ClientButton" runat="server" Text="Launch Modal Popup (Client)" />

            <asp:Panel ID="ModalPanel" runat="server" Width="500px">
                ASP.NET AJAX is a free framework for quickly creating a new generation of more 
 efficient, more interactive and highly-personalized Web experiences that work 
 across all the most popular browsers.<br />
                <asp:Button ID="OKButton" runat="server" Text="Close" />
            </asp:Panel>

            <ajaxtoolkit:modalpopupextender id="mpe" runat="server" targetcontrolid="ClientButton"
                popupcontrolid="ModalPanel" okcontrolid="OKButton" />
        </div>

        <asp:ScriptManager ID="asm" runat="server" />
    </div>

    <asp:Button ID="ServerButton" runat="server" Text="Launch Modal Popup (Server)"
        OnClick="ServerButton_Click" />

    <script runat="server">
        protected void ServerButton_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "key", "launchModal();", true);
        }
    </script>
    <script type="text/javascript">
        var launch = false;
        function launchModal() {
            launch = true;
        }

        function pageLoad() {
            if (launch) {
                $find("mpe").show();
            }
        }
    </script>
</asp:Content>
