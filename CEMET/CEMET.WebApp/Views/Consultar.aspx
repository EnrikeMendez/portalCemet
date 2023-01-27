<%@ Page Title="Consultar" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="Consultar.aspx.cs" Inherits="CEMET.WebApp.Views.Consultar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-5 text-center">
        <%--<h1 class="display-5">Display 5</h1>--%>
        <h1>Consultar</h1>
    </div>
    <div class="container py-12">

        <div class="d-flex align-items-center mb-3 mt-2">
            <h5 class="mb-0 me-3 me-md-4">Consultar</h5>
            <div class="border-bottom flex-grow-1"></div>
            <%--<asp:ValidationSummary runat="server" CssClass="text-danger" />--%>
        </div>
        <div class="row d-flex align-items-end">
            <div class="form-group col-md-6 p-3">
                <asp:Label runat="server" AssociatedControlID="TipoDeConsulta" ID="lbl_TipoDeConsulta" CssClass="form-label required-field">
                            Tipo de consulta:</asp:Label>
                
            </div>
            <div class="form-group col-md-6 p-3">
                <div class="">
                    <asp:DropDownList runat="server" ID="TipoDeConsulta" CssClass="form-select" required="" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="TipoDeConsulta" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>

            <div class="form-group col-md-6 p-3">
                
                <div class="">
                    <asp:Label runat="server" AssociatedControlID="DelPeriodo" ID="lbl_DelPeriodo" CssClass="form-label required-field">
                            Del periodo:</asp:Label>
                    <asp:TextBox runat="server" ID="DelPeriodo" CssClass="form-control"/>
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="DelPeriodo" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>
            <div class="form-group col-md-6 p-3">
                
                <div class="">
                    <asp:Label runat="server" AssociatedControlID="AlPeriodo" ID="lbl_AlPeriodo" CssClass="form-label required-field">
                            Al periodo:</asp:Label>
                    <asp:TextBox runat="server" ID="AlPeriodo" CssClass="form-control" required="" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="AlPeriodo" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>
        </div>

        <hr class="my-4">

        <div class="row">
            <div class="col">
                <asp:Button runat="server" Text="Consultar" CssClass="btn btn-primary" /><%--OnClick="Unnamed_Click"--%>
            </div>
        </div>

    </div>
</asp:Content>
