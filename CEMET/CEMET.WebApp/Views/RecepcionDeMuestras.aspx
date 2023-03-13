<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="RecepcionDeMuestras.aspx.cs" Inherits="CEMET.WebApp.Views.RecepcionDeMuestras" %>

<%@ Register Src="~/UserControls/Comun/SubirArchivo.ascx" TagPrefix="uc1" TagName="SubirArchivo" %>




<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="py-5 text-center">
        <h1>Recepción de muestras</h1>
    </div>

    <div class="row">
        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:Label runat="server" AssociatedControlID="PresolicitudesPendientes" CssClass="form-label">
                    Presolicitudes pendientes
                </asp:Label>
                <asp:TextBox runat="server" ID="PresolicitudesPendientes" CssClass="form-control" />

            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:Label runat="server" AssociatedControlID="Transportista" CssClass="form-label">
                    Transportista
                </asp:Label>
                <asp:TextBox runat="server" ID="Transportista" CssClass="form-control" />
            </div>
        </div>

        <div class="form-group col-md-4 p-3">
            <div class="">
                <asp:Label runat="server" AssociatedControlID="Guia" CssClass="form-label required-field">
                    Guía
                </asp:Label>
                <asp:TextBox runat="server" ID="Guia" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="Guia" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            
            </div>
        </div>

        <div class="form-group col-md-4 p-3">
            <asp:Label runat="server" AssociatedControlID="PesoEnGuia" CssClass="form-label required-field">
                    Peso en guía
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="PesoEnGuia" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="PesoEnGuia" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-4 p-3">
            <asp:Label runat="server" AssociatedControlID="PesoEnLaboratorio" CssClass="form-label required-field">
                    Peso en laboratorio
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="PesoEnLaboratorio" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="PesoEnLaboratorio" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-12 p-3">
            <asp:Label runat="server" AssociatedControlID="CantidadDeBultos" CssClass="form-label required-field">
                Cantidad de bultos
            </asp:Label>
            <div class="">

                <asp:DropDownList runat="server" ID="CantidadDeBultos" CssClass="form-select" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="CantidadDeBultos" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <%--        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="CantidadDeBultosAEntregar" CssClass="form-control" placeholder="Cantidad de bultos a entregar" TextMode="Number" />
            </div>
        </div>--%>

        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:Label runat="server" AssociatedControlID="NumeroDeSolicitudDeRecoleccion" CssClass="form-label">
                   Número de solicitud de recolección
                </asp:Label>
                <asp:TextBox runat="server" ID="NumeroDeSolicitudDeRecoleccion" CssClass="form-control" TextMode="Number" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="Incidencias" CssClass="form-label required-field">
                Incidencias
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="Incidencias" CssClass="form-select" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="Incidencias" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="CantidadDeFotografiasASubir" CssClass="form-label required-field">
                    Cantidad de fotografías a subir
            </asp:Label>
            <div class="">

                <asp:DropDownList runat="server" ID="CantidadDeFotografiasASubir" CssClass="form-select" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="CantidadDeFotografiasASubir" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <uc1:SubirArchivo runat="server" ID="FotografiasDeLosBultosRecibidos" Etiqueta="Fotografías de los bultos recibidos"
            VisualizaNombreDeArchivoComoLink="false" Extensiones=".docx, .jpg" />

    </div>

    <div class="row">
        <div class="col-md-12 text-center">
            <br />
            <asp:Button runat="server" CssClass="btn btn-danger" Text="Aceptar" type="button" />
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="alert alert-warning" role="alert">
                Se genera un número de manifiesto de entrada
                En caso de recolección Logis, se relaciona con la solicitud de recolección que aparezca en el talón
            </div>
        </div>
    </div>


    <div class="row">
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="NoDeManifiestoEntrada" CssClass="form-label required-field">
                Número de manifiesto de entrada
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="NoDeManifiestoEntrada" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="NoDeManifiestoEntrada" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="CantidadDeMuestrasARecibir" CssClass="form-label required-field">
                Cantidad de muestras a recibir
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="CantidadDeMuestrasARecibir" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="CantidadDeMuestrasARecibir" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="alert alert-warning" role="alert">
                Se despliega un cuadro de captura indicando la cantidad de muestras a recibir
                Para cada muestra a recibir se ingresan en el siguiente cuadro
            </div>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="Descripcion" CssClass="form-label required-field">
                Descripción
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Descripcion" CssClass="form-control" placeholder="Descripción" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="Descripcion" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="Modelo" CssClass="form-label required-field">
                Modelo
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Modelo" CssClass="form-control" placeholder="Modelo" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="Modelo" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="Marca" CssClass="form-label required-field">
                Marca
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Marca" CssClass="form-control" placeholder="Marca" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="Marca" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="Serie" CssClass="form-label required-field">
                Serie
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Serie" CssClass="form-control" placeholder="Serie" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="Serie" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="Cantidad" CssClass="form-label required-field">
                Cantidad
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="Cantidad" CssClass="form-select" placeholder="Cantidad" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="Cantidad" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="CantidadDeFotografiasASubirModal" CssClass="form-label required-field">
                Cantidad de fotografías a subir
            </asp:Label>
            <div class="">

                <asp:TextBox runat="server" ID="CantidadDeFotografiasASubirModal" CssClass="form-select" placeholder="Cantidad de fotografías a subir" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="CantidadDeFotografiasASubirModal" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <uc1:SubirArchivo runat="server" ID="Fotografias" Etiqueta="Fotografías"
            VisualizaNombreDeArchivoComoLink="false" Extensiones=".jpg" />

        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:Label runat="server" AssociatedControlID="RegistroDeInspecciónVisual" CssClass="form-label required-field">
                    Registro de inspección visual
                </asp:Label>
                <asp:DropDownList runat="server" ID="RegistroDeInspecciónVisual" CssClass="form-select" placeholder="Registro de inspección visual" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="RegistroDeInspecciónVisual" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12 text-center">
            <br />
            <asp:Button runat="server" CssClass="btn btn-danger" Text="Aceptar" type="button" />
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:Label runat="server" AssociatedControlID="CapturarAccesoriosDeMuestra" CssClass="form-label required-field">
                    Desea capturar accesorios para esta muestra:
                </asp:Label>
            </div>
        </div>
        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:DropDownList runat="server" ID="CapturarAccesoriosDeMuestra" CssClass="form-select" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="CapturarAccesoriosDeMuestra" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="alert alert-warning" role="alert">
                Si	En caso positivo, se despliega el siguiente cuadro
                <br />
                No	En caso negativo, el usuario puede regresar a capturar accesorios para la muestra indicada,
                señalando el número de muestra al cual van a estar asociados los accesorios							
            </div>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="NumeroDeAccesoriosRecibidos" CssClass="form-label required-field">
                Cuántos accesorios se reciben
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="NumeroDeAccesoriosRecibidos" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="NumeroDeAccesoriosRecibidos" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="DescripcionAccesorio" CssClass="form-label required-field">
                Descripción
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="DescripcionAccesorio" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="DescripcionAccesorio" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="NumeroDeParteAccesorio" CssClass="form-label required-field">
                 Número de parte
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="NumeroDeParteAccesorio" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="NumeroDeParteAccesorio" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="CantidadAccesorio" CssClass="form-label required-field">
                Cantidad
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="CantidadAccesorio" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="CantidadAccesorio" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="NumeroDeIncidenciaAccesorio" CssClass="form-label">
                Número de incidencia
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="NumeroDeIncidenciaAccesorio" CssClass="form-control" />
                </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="ComentariosAccesorio" CssClass="form-label">
                Comentarios
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="ComentariosAccesorio" CssClass="form-control" placeholder="Comentarios" TextMode="MultiLine" Wrap="true" Rows="5" />
                </div>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="alert alert-warning" role="alert">
                Validación de la información para cada accesorio
                Generación de un número consecutivo de accesorio (cada accesorio asociado a este número consecutivo puede tener una cantidad N)
                Una vez terminada la captura y validación de los accesorios, se realiza la carga de fotografías
                Fotos de manera global
            </div>
        </div>
    </div>

    <div class="row">
        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:Label runat="server" AssociatedControlID="CantidadDeFotografias" CssClass="form-label required-field">
                    Cantidad de fotografías a subir
                </asp:Label>
            </div>
        </div>
        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="CantidadDeFotografias" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecepcionValGroup" Display="Static" ControlToValidate="CantidadDeFotografias" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <uc1:SubirArchivo runat="server" ID="SubirArchivo" Etiqueta="Fotografías"
            VisualizaNombreDeArchivoComoLink="false" Extensiones=".jpg,.png" EsRequerido="true" />
    </div>

    <div class="row">
        <div class="col-md-12 text-center">
            <br />
            <asp:Button runat="server" CssClass="btn btn-danger" Text="Guardar" type="button" />
            <asp:Button runat="server" CssClass="btn btn-danger" Text="Aceptar" type="button" />
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            <div class="alert alert-warning" role="alert">
                Las fotografíascargadas se relacionan con el número de muestra señalado, así como con todos los números de registro de accesorios generados
            </div>
        </div>
    </div>
</asp:Content>
