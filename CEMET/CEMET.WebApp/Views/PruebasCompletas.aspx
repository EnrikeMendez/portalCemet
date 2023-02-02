<%@ Page Title="Presolicitud completa | Alta de nuevo servicio" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="PruebasCompletas.aspx.cs" Inherits="CEMET.WebApp.Views.PresolicitudCompleta" %>

<%@ Register Src="~/UserControls/Comun/TerminosYCondiciones.ascx" TagPrefix="uc" TagName="TerminosYCondiciones" %>
<%@ Register Src="~/UserControls/Comun/SubirArchivo.ascx" TagPrefix="uc" TagName="SubirArchivo" %>
<%@ Register Src="~/UserControls/Comun/ModalidadEntrega.ascx" TagPrefix="uc" TagName="ModalidadEntrega" %>
<%@ Register Src="~/UserControls/Comun/Cotizacion.ascx" TagPrefix="uc" TagName="Cotizacion" %>
<%@ Register Src="~/UserControls/Comun/Observaciones.ascx" TagPrefix="uc" TagName="Observaciones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-5 text-center">
        <h1>Alta de nuevo servicio</h1>
        <asp:Label runat="server" ID="Folio"></asp:Label>
    </div>
    <div class="container py-12">

        <div class="d-flex align-items-center mb-3 mt-2">
            <h5 class="mb-0 me-3 me-md-4">Servicio requerido</h5>
            <div class="border-bottom flex-grow-1"></div>

        </div>
        <div class="row d-flex align-items-end">
            <div class="form-group col-md-6 p-3">
                <asp:Label runat="server" AssociatedControlID="TipoDeServicio" ID="lbl_TipoDeServicio" CssClass="form-label required-field">
                            Tipo de servicio:</asp:Label>
                <div class="">
                    <asp:DropDownList runat="server" ID="TipoDeServicio" CssClass="form-select" required="" />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasCompletasValGroup" Display="Static" ControlToValidate="TipoDeServicio" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                </div>
            </div>
            <div class="form-group col-md-6 p-3">
                <asp:Label runat="server" AssociatedControlID="Norma" ID="lbl_Norma" CssClass="form-label required-field">
                    Norma:
                </asp:Label>
                <div class="">
                    <asp:DropDownList runat="server" ID="Norma" CssClass="form-select" required="" />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasCompletasValGroup" Display="Static" ControlToValidate="Norma" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                </div>
            </div>

            <div class="form-group col-md-6 p-3">
                <asp:Label runat="server" AssociatedControlID="Categoria" ID="lbl_Categoria" CssClass="form-label required-field">
                    Categoria:
                </asp:Label>
                <div class="">
                    <asp:DropDownList runat="server" ID="Categoria" CssClass="form-select" required="" />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasCompletasValGroup" Display="Static" ControlToValidate="Categoria" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                </div>
            </div>
            <div class="form-group col-md-6 p-3">
                <asp:Label runat="server" AssociatedControlID="ReferenciaCertificacion" CssClass="form-label required-field">
                    Referencia de certificación:
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="ReferenciaCertificacion" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasCompletasValGroup" Display="Static" ControlToValidate="ReferenciaCertificacion" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                </div>
            </div>
            <div class="form-group col-md-6 p-3">
                <asp:Label runat="server" AssociatedControlID="DescripcionDelProducto" CssClass="form-label">
                    Descripcion del producto:
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="DescripcionDelProducto" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasCompletasValGroup" Display="Static" ControlToValidate="DescripcionDelProducto" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                </div>
            </div>
            <div class="form-group col-md-6 p-3">
                <asp:Label runat="server" AssociatedControlID="Marca" CssClass="form-label required-field">
                    Marca:
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="Marca" CssClass="form-control" required="" />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasCompletasValGroup" Display="Static" ControlToValidate="Marca" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                </div>
            </div>
            <div class="form-group col-md-6 p-3">
                <asp:Label runat="server" AssociatedControlID="Modelo" CssClass="form-label required-field">
                    Modelo:
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="Modelo" CssClass="form-control" required="" />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasCompletasValGroup" Display="Static" ControlToValidate="Modelo" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                </div>
            </div>
            <div class="form-group col-md-6 p-3">
                <asp:Label runat="server" AssociatedControlID="PaisDeOrigen" ID="lbl_PaisDeOrigen" CssClass="form-label required-field">
                    Pais de Origen:
                </asp:Label>
                <div class="">
                    <asp:DropDownList runat="server" ID="PaisDeOrigen" CssClass="form-select" required="" />
                    <asp:RequiredFieldValidator runat="server" ValidationGroup="PruebasCompletasValGroup" Display="Static" ControlToValidate="PaisDeOrigen" CssClass="text-danger" ErrorMessage="El campo es requerido" />
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

        <uc:SubirArchivo
            runat="server"
            ID="InstructivoManual"
            Etiqueta="Instructivo o manual"
            VisualizaNombreDeArchivoComoLink="true"
            Extensiones=".jpg"
            DescargarNombreFuncion="InstructivoManualDownload_Click" />

        <uc:SubirArchivo
            runat="server"
            ID="DocsAdicionales"
            Etiqueta="Documentos adicionales"
            VisualizaNombreDeArchivoComoLink="true"
            Extensiones=".jpg"
            DescargarNombreFuncion="DocsAdicionalesDownload_Click" />

        <div class="row">
            <div class="form-group col-md-6 p-3">
                <asp:Label runat="server" AssociatedControlID="ModalidadDeRecoleccion" ID="lbl_ModalidadDeRecoleccion" CssClass="form-label required-field">
                    Modalidad de recolección:
                </asp:Label>
            </div>
            <div class="form-group col-md-6 p-3">
                <asp:DropDownList runat="server" ID="ModalidadDeRecoleccion" CssClass="form-select" required="" />
            </div>
        </div>



        <div class="d-flex align-items-center mb-3 mt-4">
            <h5 class="mb-0 me-3 me-md-4">
                <asp:Label ID="Label2" runat="server">
                    Modalidad de entrega
                </asp:Label>
            </h5>
            <div class="border-bottom flex-grow-1"></div>

        </div>

        <uc:ModalidadEntrega runat="server" ID="ModalidadEntrega" />

        <div class="d-flex align-items-center mb-3 mt-4">
            <h5 class="mb-0 me-3 me-md-4">
                <asp:Label ID="Label1" runat="server">
                    Cotizacion
                </asp:Label>
            </h5>
            <div class="border-bottom flex-grow-1"></div>

        </div>

        <uc:Cotizacion runat="server" ID="Cotizacion" />

        <uc:Observaciones runat="server" ID="Observaciones" />


        <script type="text/javascript">
            function DocsAdicionalesDownload_Click(ev) {
                console.log(ev);
            }

            function InstructivoManualDownload_Click(ev) {
                console.log(ev);
            }
        </script>



        <uc:TerminosYCondiciones runat="server" ID="TermYCond" ValidationGroupForm="PruebasCompletasValGroup" />

        <hr class="my-4">

        <div class="row">
            <div class="col">
                <asp:Button ID="GuardaPruebCompBtn" runat="server" ValidationGroup="PruebasCompletasValGroup" Text="Guardar" CssClass="btn btn-primary" OnClick="GuardaPruebCompBtn_Click" /><%--OnClick="Unnamed_Click"--%>
            </div>
        </div>

    </div>
</asp:Content>
