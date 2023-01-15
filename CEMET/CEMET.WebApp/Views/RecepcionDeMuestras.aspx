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
            <div class="">
                <asp:TextBox runat="server" ID="PesoEnGuia" CssClass="form-control" placeholder="Peso en guía" />
            </div>
        </div>

        <div class="form-group col-md-4 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="PesoEnLaboratorio" CssClass="form-control" placeholder="Peso en laboratorio" />
            </div>
        </div>

        <div class="form-group col-md-12 p-3">
            <div class="">
                <asp:DropDownList runat="server" ID="CantidadDeBultos" CssClass="form-select" placeholder="Cantidad de bultos" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="CantidadDeBultosAEntregar" CssClass="form-control" placeholder="Cantidad de bultos a entregar" TextMode="Number" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="NumeroDeSolicitudDeRecoleccion" CssClass="form-control" placeholder="Número de solicitud de recolección" TextMode="Number" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <div class="">
                Incidencias
                <asp:DropDownList runat="server" ID="Incidencias" CssClass="form-select" placeholder="Incidencias" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <div class="">
                Cantidad de fotografías a subir
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
        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="NoDeManifiestoEntrada" CssClass="form-control" placeholder="Número de manifiesto de entrada" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="CantidadDeMuestrasARecibir" CssClass="form-control" placeholder="Cantidad de muestras a recibir" />
            </div>
        </div>
    </div>


    <div class="row">
        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="Descripcion" CssClass="form-control" placeholder="Descripción" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="Modelo" CssClass="form-control" placeholder="Modelo" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="Marca" CssClass="form-control" placeholder="Marca" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <div class="">
                <asp:TextBox runat="server" ID="Serie" CssClass="form-control" placeholder="Serie" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <div class="">
                Cantidad
                <asp:DropDownList runat="server" ID="Cantidad" CssClass="form-select" placeholder="Cantidad" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <div class="">
                Cantidad de fotografías a subir
                <asp:TextBox runat="server" ID="CantidadDeFotografiasASubirModal" CssClass="form-select" placeholder="Cantidad de fotografías a subir" />
            </div>
        </div>

        <uc1:SubirArchivo runat="server" ID="Fotografias" Etiqueta="Fotografías"
            VisualizaNombreDeArchivoComoLink="false" Extensiones=".jpg" />

        <div class="form-group col-md-6 p-3">
            <div class="">
                Registro de inspección visual
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





</asp:Content>
