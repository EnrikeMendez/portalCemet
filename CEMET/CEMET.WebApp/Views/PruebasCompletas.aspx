<%@ Page Title="Presolicitud completa | Alta de nuevo servicio" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="PruebasCompletas.aspx.cs" Inherits="CEMET.WebApp.Views.PresolicitudCompleta" %>

<%@ Register Src="~/UserControls/Comun/TerminosYCondiciones.ascx" TagPrefix="uc" TagName="TerminosYCondiciones" %>
<%@ Register Src="~/UserControls/Comun/SubirArchivo.ascx" TagPrefix="uc" TagName="SubirArchivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-5 text-center">
        <%--<h1 class="display-5">Display 5</h1>--%>
        <h1>Alta de nuevo servicio</h1>
    </div>
    <div class="container py-12">

        <div class="d-flex align-items-center mb-3 mt-2">
            <h5 class="mb-0 me-3 me-md-4">Servicio requerido</h5>
            <div class="border-bottom flex-grow-1"></div>
            <%--<asp:ValidationSummary runat="server" CssClass="text-danger" />--%>
        </div>
        <div class="row">
            <div class="form-group col-md-6">
                <asp:Label runat="server" AssociatedControlID="TipoDeServicio" ID="lbl_TipoDeServicio" CssClass="form-label">
                            Tipo de servicio</asp:Label>
                <div class="">
                    <asp:DropDownList runat="server" ID="TipoDeServicio" CssClass="form-select" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="TipoDeServicio" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>
            <div class="form-group col-md-6">
                <asp:Label runat="server" AssociatedControlID="Norma" ID="lbl_Norma" CssClass="form-label required-field">
                    Norma
                </asp:Label>
                <div class="">
                    <asp:DropDownList runat="server" ID="Norma" CssClass="form-select" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="DescripcionDelProducto" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>

            <div class="form-group col-md-6">
                <asp:Label runat="server" AssociatedControlID="Categoria" ID="lbl_Categoria" CssClass="form-label required-field">
                    Categoria
                </asp:Label>
                <div class="">
                    <asp:DropDownList runat="server" ID="Categoria" CssClass="form-select" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="DescripcionDelProducto" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>
            <div class="form-group col-md-6">
                <asp:Label runat="server" AssociatedControlID="ReferenciaCertificacion" ID="lbl_ReferenciaCertificacion" CssClass="form-label required-field">
                            Referencia de certificacion</asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="ReferenciaCertificacion" CssClass="form-control" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="DescripcionDelProducto" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>
            <div class="form-group col-md-6">
                <asp:Label runat="server" AssociatedControlID="DescripcionDelProducto" ID="lbl_DescripcionDelProducto" CssClass="form-label required-field">
                            Descripción del producto</asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="DescripcionDelProducto" CssClass="form-control" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="DescripcionDelProducto" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>
            <div class="form-group col-md-6">
                <asp:Label runat="server" AssociatedControlID="Marca" ID="lbl_Marca" CssClass="form-label">
                            Marca</asp:Label>
                <div class="f">
                    <asp:TextBox runat="server" ID="Marca" CssClass="form-control" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="Marca" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>
            <div class="form-group col-md-6">
                <asp:Label runat="server" AssociatedControlID="Modelo" ID="lbl_Modelo" CssClass="form-label">
                            Modelo</asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="Modelo" CssClass="form-control" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="Modelo" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>
            <div class="form-group col-md-6">
                <asp:Label runat="server" AssociatedControlID="PaisDeOrigen" ID="lbl_PaisDeOrigen" CssClass="form-label">
                    Pais de Origen
                </asp:Label>
                <div class="">
                    <asp:DropDownList runat="server" ID="PaisDeOrigen" CssClass="form-select" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="TipoDeServicio" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>
        </div>

        <%--
            https://es.stackoverflow.com/questions/41008/error-de-servidor-en-la-aplicaci%C3%B3n#:~:text=Argumento%20de%20devoluci%C3%B3n%20o%20de,%22%20%25%3E%20en%20una%20p%C3%A1gina.
        --%>
        <div class="d-flex align-items-center mb-3 mt-4">
            <h5 class="mb-0 me-3 me-md-4">
                <asp:Label ID="TituloFileUploader" runat="server">
            Documentos
                </asp:Label>
            </h5>
            <div class="border-bottom flex-grow-1"></div>
        </div>

        <uc:SubirArchivo runat="server" ID="InstructivoManual" Etiqueta="Instructivo o manual"
            VisualizaNombreDeArchivoComoLink="true"
            Extensiones=".jpg" DescargarNombreFuncion="InstructivoManualDownload_Click" />


        <uc:SubirArchivo runat="server" ID="DocsAdicionales" Etiqueta="Documentos adicionales"
            VisualizaNombreDeArchivoComoLink="true"
            Extensiones=".jpg" DescargarNombreFuncion="DocsAdicionalesDownload_Click" />




        <script type="text/javascript">
            function SubirArchivoDownload_Click(ev) {
                console.log(ev);
            }

            function DocsAdicionalesDownload_Click(ev) {
                console.log(ev);
            }

            function InstructivoManualDownload_Click(ev) {
                console.log(ev);
            }

            function MarcadoDownload_Click(ev) {
                console.log(ev);
            }

            function DiagramaDownload_Click(ev) {
                console.log(ev);
            }
        </script>

        

        <uc:TerminosYCondiciones runat="server" ID="TermYCond" />

        <hr class="my-4">

        <div class="row">
            <div class="col">
                <asp:Button runat="server" Text="Guardar" CssClass="btn btn-primary" /><%--OnClick="Unnamed_Click"--%>
            </div>
        </div>

    </div>
</asp:Content>
