<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="ResponsivaControlDeMuestras.aspx.cs" Inherits="CEMET.WebApp.Views.ResponsivaControlDeMuestras" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="py-5 text-center">
        <h1>Responsiva de muestras</h1>
    </div>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="NoDeResponsiva" CssClass="form-label required-field">
                    No. de responsiva:
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="NoDeResponsiva" CssClass="form-control" value="AUTOMATICALLY" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
