<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="RevisionDeListaDeEvaluacion.aspx.cs" Inherits="CEMET.WebApp.Views.RevisionDeListaDeEvaluacion" %>

<%@ Register Src="~/UserControls/Comun/SubirArchivo.ascx" TagPrefix="uc1" TagName="SubirArchivo" %>


<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="py-5 text-center">
        <h2>Revisión de lista de evaluación</h2>
    </div>

    <div class="row">
        <div class="col-md-12 mb-4">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="InformesTerminados" CssClass="form-label required-field">
                    Informes terminados 
                </asp:Label>
                <div class="">
                    <asp:DropDownList runat="server" ID="InformesTerminados" CssClass="form-select" />
                </div>
            </div>
        </div>

        <uc1:SubirArchivo runat="server" ID="SeleccionDeSolicitud" Etiqueta="Selección de solicitud" EsRequerido="true" />
        <br />
        <uc1:SubirArchivo runat="server" ID="RevisionDeInforme" Etiqueta="Revisión de informe" EsRequerido="true" />
        <br />
        <uc1:SubirArchivo runat="server" ID="ArchivoWord" Etiqueta="Archivo Word" EsRequerido="true" Extensiones=".doc, .docx" />

        <div class="col-md-12 mt-4">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Comentarios" CssClass="form-label">
                    Comentarios
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="Comentarios" CssClass="form-control" TextMode="MultiLine" Wrap="true" Rows="5" />
                </div>
            </div>
        </div>

        <div class="col-md-12 text-center mt-5">
            <asp:Button runat="server" CssClass="btn btn-danger" Text="Aceptar" type="button" />
            <asp:Button runat="server" CssClass="btn btn-primary" Text="Enviar observaciones al TP" type="button"  />
        </div>

    </div>

</asp:Content>
