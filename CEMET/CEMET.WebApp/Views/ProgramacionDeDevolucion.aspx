<%@ Page Title="Programación de devolución" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="ProgramacionDeDevolucion.aspx.cs" Inherits="CEMET.WebApp.Views.ProgramacionDeDevolucion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-5 text-center">
        <%--<h1 class="display-5">Display 5</h1>--%>
        <h1>Programación de devolución</h1>
    </div>
    <div class="container py-12">

        <div class="d-flex align-items-center mb-3 mt-2">
            <h5 class="mb-0 me-3 me-md-4">Devolución de muestras</h5>
            <div class="border-bottom flex-grow-1"></div>
            <%--<asp:ValidationSummary runat="server" CssClass="text-danger" />--%>
        </div>
        <div class="row d-flex align-items-end">

            <div class="form-group col-md-6 p-3">
                <div class="">
                    <asp:Label runat="server" AssociatedControlID="NoDeProgramacion" ID="lbl_NoDeProgramacion" CssClass="form-label required-field">
                            No. de programación:</asp:Label>
                    <asp:TextBox runat="server" ID="NoDeProgramacion" CssClass="form-control" required="" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="NoDeProgramacion" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>

            <div class="form-group col-md-6 p-3">
                <asp:Label runat="server" AssociatedControlID="Solicitud" ID="lbl_Solicitud" CssClass="form-label required-field">
                            Solicitud:</asp:Label>
                <div class="">
                    <asp:DropDownList runat="server" ID="Solicitud" CssClass="form-select" required="" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="Solicitud" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>

            </div>

            <div class="form-group col-md-6 p-3">

                <div class="">
                    <asp:Label runat="server" AssociatedControlID="FechaDeDevolucion" ID="lbl_FechaDeDevolucion" CssClass="form-label required-field">
                            Fecha de devolución:</asp:Label>
                    <div class="">
                        <asp:TextBox runat="server" ID="FechaDeDevolucion" CssClass="form-control" TextMode="Date" value="<%# DateTime.Now %>" required=""  />
                    </div>
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="FechaDeDevolucion" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>

            <div class="form-group col-md-6 p-3">

                <div class="">
                    <asp:Label runat="server" AssociatedControlID="Contacto" ID="lbl_Contacto" CssClass="form-label required-field">
                            Contacto:</asp:Label>
                    <asp:TextBox runat="server" ID="Contacto" CssClass="form-control" required="" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="Contacto" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>

            <div class="form-group col-md-6 p-3">

                <div class="">
                    <asp:Label runat="server" AssociatedControlID="Telefono" ID="lbl_Telefono" CssClass="form-label required-field">
                            Teléfono:</asp:Label>
                    <asp:TextBox runat="server" ID="Telefono" CssClass="form-control" required="" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="Telefono" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>

            <div class="form-group col-md-6 p-3">
                <asp:Label runat="server" AssociatedControlID="Direccion" ID="lbl_Direccion" CssClass="form-label required-field">
                            Dirección:</asp:Label>
                <div class="">
                    <asp:DropDownList runat="server" ID="Direccion" CssClass="form-select" required="" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="Direccion" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>

            </div>

            <div class="form-group col-md-6 p-3">

                <div class="">
                    <asp:Label runat="server" AssociatedControlID="Horario" ID="lbl_Horario" CssClass="form-label required-field">
                            Horario:</asp:Label>
                    <div class="">
                        <asp:TextBox runat="server" ID="Horario" CssClass="form-control" TextMode="Time"  required="" />
                    </div>
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="Horario" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>

            <div class="form-group col-md-6 p-3">

                <div class="">
                    <asp:Label runat="server" AssociatedControlID="CantidadDeBultos" ID="lbl_CantidadDeBultos" CssClass="form-label required-field">
                            Cantidad de bultos a entregar:</asp:Label>
                    <asp:TextBox runat="server" ID="CantidadDeBultos" CssClass="form-control" required="" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="CantidadDeBultos" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>

            <div class="form-group col-md-6 p-3">

                <div class="">
                    <asp:Label runat="server" AssociatedControlID="Contiene" ID="lbl_Contiene" CssClass="form-label required-field">
                            Contiene:</asp:Label>
                    <asp:TextBox runat="server" ID="Contiene" CssClass="form-control" required="" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="Contiene" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>

            <div class="form-group col-md-6 p-3">

                <div class="">
                    <asp:Label runat="server" AssociatedControlID="ReferenciasAdicionales" ID="Label2" CssClass="form-label">
                            Referencias adicionales:</asp:Label>
                    <asp:TextBox runat="server" ID="ReferenciasAdicionales" CssClass="form-control"/>
                </div>
            </div>

        </div>

        <hr class="my-4">

        <div class="row">
            <div class="col">
                <asp:Button runat="server" Text="Aceptar" CssClass="btn btn-primary" /><%--OnClick="Unnamed_Click"--%>
            </div>
        </div>

    </div>
</asp:Content>
