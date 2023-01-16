<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubirArchivo.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.SubirArchivo" %>

<style>
    .file-input-rename:before {
        content: "Seleccionar";
        position: absolute;
        background-color: #f9f8fc;
        width: 6rem;
    }
</style>

<div class="row pb-4">
    <div class="form-group col-md-6" runat="server">
        <asp:Label runat="server" AssociatedControlID="FileUpload1" ID="UploadTitle" CssClass="form-label">
             Seleccione los archivos
        </asp:Label>
        <asp:FileUpload ID="FileUpload1" CssClass="file-input-rename form-control" runat="server"></asp:FileUpload>

        <br />

        <asp:Button ID="UploadButton"
            CssClass="btn btn-primary"
            Text="Subir"
            runat="server"></asp:Button>
    </div>
    <div class="col-md-6 bg-light" runat="server">
        <p id="UploadStatusLabel" runat="server">
        </p>
    </div>
</div>