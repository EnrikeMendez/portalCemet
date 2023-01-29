<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cotizacion2.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.Cotizacion2" %>

<div class="col-md-12">
    <div class="input-group mb-3">
        <asp:DropDownList runat="server" ID="ServicioSolicitado" CssClass="form-select" />

        <label class="input-group-text" for="NoForm">&nbsp;&nbsp;</label>
        <asp:DropDownList runat="server" ID="Tarifa" CssClass="form-select" />
        <asp:Button ID="agregarServTarBtn" runat="server" type="button"
            OnClick="agregarServTarBtn_Click"
            Text="Agregar" CssClass="btn btn-outline-secondary" />
    </div>
</div>
<%--SelectMethod="GetProducts"--%>
<%--<asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
    <ContentTemplate>--%>
        <asp:ListView
            ID="cotizacionList"
            runat="server"
            DataKeyNames="IdCotizacion"
            GroupItemCount="4"
            ItemType="CEMET.WebApp.Models.CotizacionModel"
            OnItemCommand="cotizacionList_ItemCommand"
            >
            <EmptyDataTemplate>
                <table>
                    <tr>
                        <td>No ha seleccionado ningún concepto</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <AlternatingItemTemplate>
                <tr id="Tr1" runat="server">
                    <td>
                        <%#:Item.Servicio%>
                    </td>
                    <td>
                        <%#:Item.Tarifa%>
                    </td>

                    <td>
                         <asp:Button ID="removeServTarBtn0" runat="server"
                            CommandArgument="<%#:Item.IdCotizacion%>" OnClick="removeServTarBtn1_Click" CssClass="btn btn-danger"
                            Text="Agregar" type="button" />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EmptyItemTemplate>
                <td></td>
            </EmptyItemTemplate>
            <GroupTemplate>
                <tr id="itemPlaceholderContainer" runat="server" data-g="GroupTemplate">
                    <td id="itemPlaceholder" runat="server"></td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <tr id="Tr2" runat="server">
                    <td>
                        <%#:Item.Servicio%>
                    </td>
                    <td>
                        <%#:Item.Tarifa%>
                    </td>

                    <td>
                        <asp:Button ID="removeServTarBtn1" runat="server"
                            CommandArgument="<%#:Item.IdCotizacion%>" OnClick="removeServTarBtn1_Click" CssClass="btn btn-danger"
                            Text="Agregar" type="button" />
                    </td>
                </tr>
            </ItemTemplate>
            <EditItemTemplate>
                <tr id="Tr2" runat="server">
                    <td>
                        <%#:Item.Servicio%>
                    </td>
                    <td>
                        <%#:Item.Tarifa%>
                    </td>

                    <td>
                       <asp:Button ID="removeServTarBtn2" runat="server"
                            CommandArgument="<%#:Item.IdCotizacion%>" OnClick="removeServTarBtn1_Click" CssClass="btn btn-danger"
                            Text="Agregar" type="button" />
                    </td>
                </tr>
            </EditItemTemplate>
            <LayoutTemplate>
                <div class="col-md-12">
                    <table id="groupPlaceholderContainer" runat="server" class="table table-borderless" data-o="groupPlaceholderContainer">
                        <tr id="groupPlaceholder"></tr>
                    </table>
                </div>


            </LayoutTemplate>
        </asp:ListView>
<%--    </ContentTemplate>
</asp:UpdatePanel>--%>

<%--<script type="text/javascript" language="javascript">
    /*
     * https://stackoverflow.com/questions/1271176/sys-webforms-pagerequestmanagerservererrorexception
     * https://learn.microsoft.com/en-us/previous-versions/bb398934(v=vs.140)?redirectedfrom=MSDN
     */
    Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
    function EndRequestHandler(sender, args) {
        if (args.get_error() != undefined) {
            var errorMessage;
            if (args.get_response().get_statusCode() == '200') {
                errorMessage = args.get_error().message;
            }
            else {
                // Error occurred somewhere other than the server page.
                errorMessage = 'An unspecified error occurred. ';
            }
            args.set_errorHandled(true);
        }
    }
</script>--%>
