<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="ReporteDeDesviacion.aspx.cs" Inherits="CEMET.WebApp.Views.ReporteDeDesviacion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">


    <div class="container py-12">

        <div class="row d-flex align-items-end">

            <div class="form-group col-md-12 p-3">
                <div class="">
                    <p>Estimado cliente:</p>
                    <p>Por medio del presente, le informamos que durante las pruebas realizadas a su producto se encontraron las siguientes desviaciones:</p>
                </div>
            </div>

            <div class="py-5 text-center">
                <%--<h1 class="display-5">Display 5</h1>--%>
                <h1>Reporte de Desviaciones FOP-08</h1>
            </div>

            <hr class="my-4">

            <div class="form-group col-md-6 p-3">
            </div>

            <div class="form-group col-md-6 p-3" style="text-align: end">
                <asp:Label runat="server" ID="lbl_Fecha" CssClass="form-label">
                            Fecha: 27/01/2023 </asp:Label>
            </div>

            <div class="form-group col-md-12 p-3">
                <div class="">
                    <p>Estimado cliente se le informa que se detectó la(s) siguiente(s) desviación(es) en la(s) muestra(s) arriba descrita(s) durante el proceso de pruebas:</p>
                </div>
            </div>

            <div class="form-group col-md-6 p-3">

                <div class="">
                    <asp:Label runat="server" AssociatedControlID="NoSolicitud" ID="lbl_NoSolicitud" CssClass="form-label required-field">
                            No. Solicitud:</asp:Label>
                    <div class="">
                        <asp:DropDownList runat="server" ID="NoSolicitud" CssClass="form-select" required="" />
                        <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="NoSolicitud" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                    </div>
                </div>
            </div>

            <div class="form-group col-md-6 p-3">
                <asp:Label runat="server" AssociatedControlID="NoDeDesviacion" ID="lbl_NoDeDesviacion" CssClass="form-label required-field">
                            No. de desviación:</asp:Label>
                <asp:TextBox runat="server" ID="NoDeDesviacion" CssClass="form-control" required="" />
                <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="NoDeDesviacion" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
            </div>

            <div class="form-group col-md-6 p-3">

                <div class="">
                    <asp:Label runat="server" AssociatedControlID="Descripcion" ID="lbl_Descripcion" CssClass="form-label required-field">
                            Descripción:</asp:Label>
                    <asp:TextBox runat="server" ID="Descripcion" CssClass="form-control" required="" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="Descripcion" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>

            <div class="form-group col-md-6 p-3">
                <asp:Label runat="server" AssociatedControlID="Modelo" ID="lbl_Modelo" CssClass="form-label required-field">
                            Modelo:</asp:Label>
                <asp:TextBox runat="server" ID="Modelo" CssClass="form-control" required="" />
                <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="Modelo" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
            </div>

            <div class="form-group col-md-12 p-3">
                <div class="">
                    <asp:Label runat="server" AssociatedControlID="Inciso" ID="lbl_Inciso" CssClass="form-label required-field">
                            Inciso:</asp:Label>
                    <asp:TextBox runat="server" ID="Inciso" CssClass="form-control" required="" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="Inciso" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>

            <div class="form-group col-md-12 p-3">
                <div class="">
                    <asp:Label runat="server" AssociatedControlID="DescripcionDelInciso" ID="lbl_DescripcionDelInciso" CssClass="form-label required-field">
                            Descripción del inciso:</asp:Label>
                    <asp:TextBox runat="server" ID="DescripcionDelInciso" CssClass="form-control" required="" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="DescripcionDelInciso" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>

            <div class="form-group col-md-12 p-3">
                <div class="">
                    <asp:Label runat="server" AssociatedControlID="Observaciones" ID="lbl_Observaciones" CssClass="form-label ">
                            Observaciones:</asp:Label>
                    <asp:TextBox runat="server" ID="Observaciones" CssClass="form-control" />
                </div>
            </div>

            <div class="form-group col-md-12 p-3">
                <div class="">
                    <asp:Label runat="server" ID="lbl_Evidencia" CssClass="form-label required-field">
                            Evidencia:</asp:Label>
                </div>
            </div>

            <div class="form-group col-md-6 p-3" style="text-align:center">
                <asp:Image runat="server" ImageUrl="http://www.madrimasd.org/sites/default/files/abc-bacterias-s_0.jpg" Width="50%" />
            </div>
            <div class="form-group col-md-6 p-3" style="text-align:center">
                <asp:Image runat="server" ImageUrl="http://www.madrimasd.org/sites/default/files/abc-bacterias-s_0.jpg" Width="50%" />

            </div>

        </div>

        <hr class="my-4">

        <div class="row">
            <div class="col">
                <asp:Button runat="server" Text="Validar" CssClass="btn btn-primary" /><%--OnClick="Unnamed_Click"--%>
            </div>
        </div>

        <hr class="my-4">

        <div class="row d-flex align-items-end">
            <div class="col-md-6">
                <div class="form-group">
                    <asp:Label runat="server" AssociatedControlID="EnviarAlCorreo" CssClass="form-label required-field">
                    Enviar al correo:
                    </asp:Label>
                </div>
            </div>

            <div class="col-md-6">
                <div class="form-group">
                    <div class="">
                        <asp:DropDownList runat="server" ID="EnviarAlCorreo" CssClass="form-select" />
                    </div>
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
