<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubirArchivo.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.SubirArchivo" %>

<style>
    .file-input-rename:before {
        content: "Seleccionar";
        position: absolute;
        background-color: #f9f8fc;
        width: 6rem;
    }
</style>

<div class="row pb-2">
    <div class="col-md-6">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FileUpload1" ID="UploadTitle" CssClass="form-label">
                Seleccione los archivos
            </asp:Label>

            <asp:FileUpload ID="FileUpload1" CssClass="file-input-rename form-control" runat="server"></asp:FileUpload>
           
            <asp:CustomValidator
                ID="CustomValidator1"
                runat="server"
                CssClass="text-danger mt-1"
                EnableClientScript="true"
                OnServerValidate="CustomValidator1_ServerValidate"
                ErrorMessage="El campo es requerido">
            </asp:CustomValidator>

            <br />
            <asp:Button ID="UploadButton"
                OnClick="UploadButton_Click"
                CssClass="btn btn-primary"
                Text="Subir"
                runat="server"></asp:Button>
        </div>
    </div>
    <div class="col-md-6">
        <asp:ListView
            ID="DocumentosListView"
            runat="server"
            DataKeyNames="IdDocumento"
            GroupItemCount="1"
            ItemType="CEMET.WebApp.Models.DocumentoModel"
            OnLayoutCreated="DocumentosListView_LayoutCreated"
            OnDataBound="DocumentosListView_DataBound">
            <EmptyDataTemplate>
                <table class="table table-borderless align-middle mb-1" runat="server" id="SinDocsSeleccionados">
                    <tr>
                        <td class="text-center">
                            <div class="alert alert-dark" role="alert">
                                <br />
                                No ha seleccionado ningún documento<br />
                                <br />
                            </div>
                        </td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <EmptyItemTemplate>
                <li></li>
            </EmptyItemTemplate>
            <GroupTemplate>
                <li id="itemPlaceholder" runat="server"></li>
            </GroupTemplate>
            <ItemTemplate>
                <li class="list-group-item d-flex justify-content-between align-items-start list-group-item-secondary"
                    id="mainTmpl" runat="server">
                    <div class="ms-2 me-auto">
                        <div class="fw-bold">
                            <%#:Item.Nombre%>
                        </div>
                    </div>
                    <%--https://stackoverflow.com/questions/187482/how-can-i-use-the-button-tag-with-asp-net--%>
                    <div class="btn-group" role="group" aria-label="Basic mixed styles example">
                        <asp:LinkButton
                            ID="DescargaDocumento"
                            runat="server"
                            CommandArgument="<%#:Item.IdDocumento%>"
                            OnClick="DescargaDocumento_Click"
                            CssClass="btn btn-light"
                            Text="<span class='fa fa-arrow-down'></span>" />

                        <asp:LinkButton
                            ID="EliminaDocumento"
                            runat="server"
                            CommandArgument="<%#:Item.IdDocumento%>"
                            OnClick="EliminaDocumento_Click"
                            CssClass="btn btn-dark"
                            Text="<span class='fa fa-trash'></span>" />
                    </div>
                </li>
            </ItemTemplate>
            <LayoutTemplate>
                <ol class="list-group list-group-numbered" id="groupPlaceholderContainer" runat="server">
                    <li id="groupPlaceholder" runat="server"></li>
                </ol>
            </LayoutTemplate>
        </asp:ListView>
    </div>

    <div class="col-md-12 mt-3">
        <div visible="false" class="alert alert-danger" role="alert" id="ErrorMessagesContainer" runat="server">
        </div>
    </div>
</div>
