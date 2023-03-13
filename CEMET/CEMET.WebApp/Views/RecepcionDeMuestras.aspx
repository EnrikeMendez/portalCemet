<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="RecepcionDeMuestras.aspx.cs" Inherits="CEMET.WebApp.Views.RecepcionDeMuestras" %>

<%@ Register Src="~/UserControls/Comun/SubirArchivo.ascx" TagPrefix="uc1" TagName="SubirArchivo" %>




<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="py-5 text-center">
        <h1>Alta de nuevo servicio</h1>
    </div>

    <div class="d-flex align-items-center mb-3 mt-2">
        <h5 class="mb-0 me-3 me-md-4">Programación de recolección</h5>
        <div class="border-bottom flex-grow-1"></div>
    </div>

    <div class="row">
        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="PresolicitudesPendientes" CssClass="form-control" placeholder="Presolicitudes pendientes" />
                <%--<label for="floatingSelect">Works with selects</label>--%>
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="Transportista" CssClass="form-control" placeholder="Transportista" />
            </div>
        </div>

        <div class="form-group col-md-4 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="Guia" CssClass="form-control" placeholder="Guía" />
            </div>
        </div>

        <div class="form-group col-md-4 p-3">
            <asp:Label runat="server" AssociatedControlID="PesoEnGuia" CssClass="form-label required-field">
                    Peso en guía
            </asp:Label>
            <div class="">

                <asp:TextBox runat="server" ID="PesoEnGuia" CssClass="form-control" placeholder="Peso en guía" />
            </div>
        </div>

        <div class="form-group col-md-4 p-3">
            <asp:Label runat="server" AssociatedControlID="PesoEnLaboratorio" CssClass="form-label required-field">
                    Peso en laboratorio
            </asp:Label>
            <div class="">

                <asp:TextBox runat="server" ID="PesoEnLaboratorio" CssClass="form-control" placeholder="Peso en laboratorio" />
            </div>
        </div>

        <div class="form-group col-md-12 p-3">
            <asp:Label runat="server" AssociatedControlID="CantidadDeBultos" CssClass="form-label required-field">
    Cantidad de bultos
            </asp:Label>
            <div class="">

                <asp:DropDownList runat="server" ID="CantidadDeBultos" CssClass="form-select" placeholder="Cantidad de bultos" />
            </div>
        </div>

        <%--        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="CantidadDeBultosAEntregar" CssClass="form-control" placeholder="Cantidad de bultos a entregar" TextMode="Number" />
            </div>
        </div>--%>

        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="NumeroDeSolicitudDeRecoleccion" CssClass="form-control" placeholder="Número de solicitud de recolección" TextMode="Number" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="Incidencias" CssClass="form-label required-field">
    Incidencias
            </asp:Label>
            <div class="">


                <asp:DropDownList runat="server" ID="Incidencias" CssClass="form-select" placeholder="Incidencias" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="CantidadDeFotografiasASubir" CssClass="form-label required-field">
                    Cantidad de fotografías a subir
            </asp:Label>
            <div class="">

                <asp:DropDownList runat="server" ID="CantidadDeFotografiasASubir" CssClass="form-select" placeholder="Cantidad de fotografías a subir" />
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

                <asp:TextBox runat="server" ID="NoDeManifiestoEntrada" CssClass="form-control" placeholder="Número de manifiesto de entrada" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="CantidadDeMuestrasARecibir" CssClass="form-label required-field">
    Cantidad de muestras a recibir
            </asp:Label>
            <div class="">

                <asp:TextBox runat="server" ID="CantidadDeMuestrasARecibir" CssClass="form-control" placeholder="Cantidad de muestras a recibir" />
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
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="Modelo" CssClass="form-label required-field">
                Modelo
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Modelo" CssClass="form-control" placeholder="Modelo" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="Marca" CssClass="form-label required-field">
                Marca
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Marca" CssClass="form-control" placeholder="Marca" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="Serie" CssClass="form-label required-field">
                Serie
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Serie" CssClass="form-control" placeholder="Serie" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="Cantidad" CssClass="form-label required-field">
                Cantidad
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="Cantidad" CssClass="form-select" placeholder="Cantidad" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="CantidadDeFotografiasASubirModal" CssClass="form-label required-field">
                Cantidad de fotografías a subir
            </asp:Label>
            <div class="">

                <asp:TextBox runat="server" ID="CantidadDeFotografiasASubirModal" CssClass="form-select" placeholder="Cantidad de fotografías a subir" />
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
                <asp:TextBox runat="server" ID="NumeroDeAccesoriosRecibidos" CssClass="form-control" placeholder="Cuántos accesorios se reciben" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="DescripcionAccesorio" CssClass="form-label required-field">
                Descripción
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="DescripcionAccesorio" CssClass="form-control" placeholder="Descripción" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="NumeroDeParteAccesorio" CssClass="form-label required-field">
                Número de parte
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="NumeroDeParteAccesorio" CssClass="form-control" placeholder="Número de parte" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="CantidadAccesorio" CssClass="form-label required-field">
                Número de parte
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="CantidadAccesorio" CssClass="form-control" placeholder="Número de parte" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="NumeroDeIncidenciaAccesorio" CssClass="form-control" placeholder="Número de incidencia" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
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
