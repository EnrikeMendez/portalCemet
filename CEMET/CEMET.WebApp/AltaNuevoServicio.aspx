<%@ Page Title="Alta de nuevo servicio" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="AltaNuevoServicio.aspx.cs" Inherits="CEMET.WebApp.DiagramaP5" %>

<%@ Register Src="~/UserControls/Comun/TerminosYCondiciones.ascx" TagPrefix="uc" TagName="TerminosYCondiciones" %>
<%@ Register Src="~/UserControls/Comun/SubirArchivo.ascx" TagPrefix="uc" TagName="SubirArchivo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="py-5 text-center">
        <h1>Alta de nuevo servicio</h1>
    </div>

    <div class="d-flex align-items-center mb-3 mt-2">
        <h5 class="mb-0 me-3 me-md-4">Servicio requerido</h5>
        <div class="border-bottom flex-grow-1"></div>
    </div>
    <div class="row">
        <div class="form-group col-md-6">
            <asp:Label runat="server" AssociatedControlID="TipoDeServicio" ID="lbl_TipoDeServicio" CssClass="form-label">
                Tipo de servicio
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="TipoDeServicio" CssClass="form-select" OnSelectedIndexChanged="TipoDeServicio_SelectedIndexChanged" AutoPostBack="True" />
            </div>
        </div>
        <div class="form-group col-md-6">
            <asp:Label runat="server" AssociatedControlID="Norma" ID="lbl_Norma" CssClass="form-label required-field">
                    Norma
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="Norma" CssClass="form-select" />
            </div>
        </div>
        <div class="form-group col-md-6">
            <asp:Label runat="server" AssociatedControlID="NormaParticular" ID="lbl_NormaParticular" CssClass="form-label required-field">
                    Norma Particular
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="NormaParticular" CssClass="form-select" />
            </div>
        </div>

        <div class="form-group col-md-6">
            <asp:Label runat="server" AssociatedControlID="MetodoDePrueba" ID="lbl_MetodoDePrueba" CssClass="form-label required-field">
                    Metodo de prueba
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="MetodoDePrueba" CssClass="form-select" />
            </div>
        </div>

        <div class="form-group col-md-6">
            <asp:Label runat="server" AssociatedControlID="Categoria" ID="lbl_Categoria" CssClass="form-label required-field">
                    Categoria
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="Categoria" CssClass="form-select" />
            </div>
        </div>
        <div class="form-group col-md-6">
            <asp:Label runat="server" AssociatedControlID="ReferenciaCertificacion" ID="lbl_ReferenciaCertificacion" CssClass="form-label required-field">
                            Referencia de certificacion</asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="ReferenciaCertificacion" CssClass="form-control" />
            </div>
        </div>
        <div class="form-group col-md-6">
            <asp:Label runat="server" AssociatedControlID="DescripcionDelProducto" ID="lbl_DescripcionDelProducto" CssClass="form-label required-field">
                            Descripción del producto</asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="DescripcionDelProducto" CssClass="form-control" />
            </div>
        </div>
        <div class="form-group col-md-6">
            <asp:Label runat="server" AssociatedControlID="Marca" ID="lbl_Marca" CssClass="form-label">
                            Marca</asp:Label>
            <div class="f">
                <asp:TextBox runat="server" ID="Marca" CssClass="form-control" />
            </div>
        </div>
        <div class="form-group col-md-6">
            <asp:Label runat="server" AssociatedControlID="Modelo" ID="lbl_Modelo" CssClass="form-label">
                            Modelo</asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Modelo" CssClass="form-control" />
            </div>
        </div>
        <div class="form-group col-md-6">
            <asp:Label runat="server" AssociatedControlID="PaisDeOrigen" ID="lbl_PaisDeOrigen" CssClass="form-label">
                    Pais de Origen
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="PaisDeOrigen" CssClass="form-select" />
            </div>
        </div>
        <div class="col-md-12">
            <div class="row align-items-center">
                <div class="col-md-2">
                    <asp:Label runat="server" ID="TituloEspecElectricas" CssClass="form-label">
                                Especificaciones eléctricas de alimentación:
                    </asp:Label>

                </div>
                <div class="col-md-4">
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Voltaje" ID="lbl_Voltaje" CssClass="form-label">
                                Voltaje (V)
                        </asp:Label>
                        <div class="">
                            <asp:DropDownList runat="server" ID="Voltaje" CssClass="form-select" />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="row align-items-center">
                        <div class="col-md-3">
                            <asp:Label runat="server" ID="TituloConsumo" CssClass="form-label">
                                Consumo:
                            </asp:Label>
                        </div>
                        <div class="col-md-9">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Corriente" ID="lbl_Corriente" CssClass="form-label">
                                        Corriente (A)
                                </asp:Label>
                                <div class="">
                                    <asp:DropDownList runat="server" ID="Corriente" CssClass="form-select" />
                                </div>
                            </div>
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Potencia" ID="lbl_Potencia" CssClass="form-label">
                                        Potencia (W)
                                </asp:Label>
                                <div class="">
                                    <asp:DropDownList runat="server" ID="Potencia" CssClass="form-select" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
    <uc:SubirArchivo runat="server" ID="DocsAdicionales" Etiqueta="Documentos adicionales"
        VisualizaNombreDeArchivoComoLink="true"
        Extensiones=".jpg" DescargarNombreFuncion="DocsAdicionalesDownload_Click" />

    <uc:SubirArchivo runat="server" ID="FichaTecnica" Etiqueta="Ficha técnica del equipo"
        VisualizaNombreDeArchivoComoLink="true"
        Extensiones=".exe, .pdf" DescargarNombreFuncion="SubirArchivoDownload_Click" />



    <uc:SubirArchivo runat="server" ID="Marcado" Etiqueta="Marcado"
        VisualizaNombreDeArchivoComoLink="true"
        Extensiones=".jpg" DescargarNombreFuncion="MarcadoDownload_Click" />

    <uc:SubirArchivo runat="server" ID="Diagrama" Etiqueta="Diagrama"
        VisualizaNombreDeArchivoComoLink="true"
        Extensiones=".jpg" DescargarNombreFuncion="DiagramaDownload_Click" />

    <uc:SubirArchivo runat="server" ID="InstructivoManual" Etiqueta="Instructivo o manual"
        VisualizaNombreDeArchivoComoLink="true"
        Extensiones=".jpg" DescargarNombreFuncion="InstructivoManualDownload_Click" />

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

    <div class="d-flex align-items-center mb-5 mt-3">
        <h5 class="mb-0 me-3 me-md-4">Modalidad de recolección</h5>
        <div class="border-bottom flex-grow-1"></div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <asp:Label runat="server" AssociatedControlID="ModalidadDeRecoleccion" ID="lbl_ModalidadDeRecoleccion" CssClass="form-label">
                            Recolección</asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="ModalidadDeRecoleccion" CssClass="form-select" />
            </div>
        </div>
    </div>

    <div class="d-flex align-items-center mb-3 mt-4">
        <h5 class="mb-0 me-3 me-md-4">Modalidad de entrega</h5>
        <div class="border-bottom flex-grow-1"></div>
    </div>

    <div class="row">
        <div class="form-group col-md-12">
            <asp:Label runat="server" AssociatedControlID="ModalidadDeEntrega" ID="lbl_ModalidadDeEntrega" CssClass="form-label">
                    Entrega
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="ModalidadDeEntrega" CssClass="form-select" />
            </div>
        </div>
    </div>

    <div class="d-flex align-items-center mb-3 mt-4">
        <h5 class="mb-0 me-3 me-md-4">Cotización</h5>
        <div class="border-bottom flex-grow-1"></div>
    </div>

    <div class="row">

        <div class="row align-items-center">
            <div class="col-md-6 text-center">
                <p>Servicios solicitados</p>
            </div>
            <div class="col-md-6">

                <table class="table table-borderless">
                    <tbody class="">
                        <tr>
                            <th scope="row">S1	Informe de pruebas Completas - Andaderas</th>
                            <td>100 $</td>
                        </tr>
                        <tr>
                            <th scope="row">S2	Informe de pruebas Completas - Carriolas</th>
                            <td>100 $</td>
                        </tr>
                        <tr>
                            <th scope="row">S3	Informe de pruebas Completas - Corrales</th>
                            <td>100 $</td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row align-items-center">
            <div class="col-md-6 text-center">
                <p>Subtotal</p>
            </div>
            <div class="col-md-6 text-center">
                <strong>300 $</strong>
            </div>
        </div>
        <div class="row align-items-center">
            <div class="col-md-6 text-center">
                <p>IVA (16%)</p>
            </div>
            <div class="col-md-6 text-center">
                <strong>48 $</strong>
            </div>
        </div>
        <div class="row align-items-center">
            <div class="col-md-6 text-center">
                <p>Total</p>
            </div>
            <div class="col-md-6 text-center">
                <strong>348 $</strong>
            </div>
        </div>
    </div>

    <div class="d-flex align-items-center mb-3 mt-4">
        <h5 class="mb-0 me-3 me-md-4">Observación y/o declaracines adicionales</h5>
        <div class="border-bottom flex-grow-1"></div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="form-group">
                <asp:TextBox runat="server" ID="ObservacionesDeclaraciones" CssClass="form-control" TextMode="MultiLine" Wrap="true" Rows="7" />
            </div>
        </div>
    </div>

    <uc:TerminosYCondiciones runat="server" ID="TermYCond" />

    <hr class="my-4">

    <div class="row">
        <div class="col">
            <asp:Button runat="server" Text="Guardar" CssClass="btn btn-primary" />
        </div>
    </div>


</asp:Content>
