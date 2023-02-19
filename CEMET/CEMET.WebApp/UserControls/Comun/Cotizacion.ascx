<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Cotizacion.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.Cotizacion" %>

<div class="row">

    <div class="col-md-12">
        <div class="input-group mb-3">
            <asp:DropDownList
                runat="server"
                ID="ServicioSolicitado"
                ValidationGroup="CotFormDropD"
                CssClass="form-select" />

            <label class="input-group-text" for="NoForm">&nbsp;&nbsp;</label>

            <asp:DropDownList
                runat="server"
                ID="Tarifa"
                ValidationGroup="CotFormDropD"
                CssClass="form-select" />

            <asp:Button
                ID="AgregarServTarBtn"
                runat="server"
                ValidationGroup="CotFormDropD"
                OnClick="AgregarServTarBtn_Click"
                Text="Agregar"
                CssClass="btn btn-outline-secondary" />
        </div>
    </div>

    <div class="col-md-12 text-center">
        <asp:CustomValidator
            ID="CustomValidator1"
            runat="server"
            CssClass="text-danger mb-2 mt-2"
            EnableClientScript="true"
            OnServerValidate="CustomValidator1_ServerValidate"
            ErrorMessage="El campo es requerido">
        </asp:CustomValidator>
    </div>

    <%--    https://learn.microsoft.com/en-us/dotnet/api/system.web.ui.webcontrols.listview.layouttemplate?view=netframework-4.8.1
https://learn.microsoft.com/en-us/aspnet/web-forms/overview/getting-started/getting-started-with-aspnet-45-web-forms/display_data_items_and_details--%>

    <asp:ListView
        ID="cotizacionList"
        runat="server"
        DataKeyNames="IdCotizacion"
        GroupItemCount="4"
        ItemType="CEMET.WebApp.Models.CotizacionModel"
        OnLayoutCreated="cotizacionList_LayoutCreated"
        OnDataBound="cotizacionList_DataBound">
        <EmptyDataTemplate>
            <div class="col-md-12">
                <table class="table table-borderless align-middle mb-3">
                    <tr>
                        <td class="text-center">
                            <div class="alert alert-dark" role="alert" runat="server" id="SinConceptosSeleccionados">
                                <br />
                                No ha seleccionado ningún concepto
                            <br />
                                <br />
                            </div>
                        </td>
                    </tr>
                </table>
            </div>
        </EmptyDataTemplate>
        <AlternatingItemTemplate>
            <tr id="Tr1" runat="server">
                <td class="text-end">
                    <%#:Item.Servicio%>
                </td>
                <td class="text-end" style="padding-right: 1.525rem;">
                    <%#:Item.Tarifa%>
                </td>
                <td class="text-center">
                    <asp:Button
                        ID="EliminaServTarBtn0"
                        runat="server"
                        CommandArgument="<%#:Item.IdCotizacion%>"
                        OnClick="EliminaServTarBtn1_Click"
                        CssClass="btn btn-danger"
                        Text="&nbsp;X&nbsp;"
                        type="button" />
                </td>
            </tr>
        </AlternatingItemTemplate>
        <EmptyItemTemplate>
            <td></td>
        </EmptyItemTemplate>
        <GroupTemplate>
            <tr id="itemPlaceholderContainer"
                runat="server"
                data-g="GroupTemplate">
                <td id="itemPlaceholder" runat="server"></td>
            </tr>
        </GroupTemplate>
        <ItemTemplate>
            <tr id="Tr2" runat="server">
                <td class="text-end">
                    <%#:Item.Servicio%>
                </td>
                <td class="text-end" style="padding-right: 1.525rem;">
                    <%#:Item.Tarifa%>
                </td>
                <td class="text-center">
                    <asp:Button
                        ID="EliminaServTarBtn1"
                        runat="server"
                        CommandArgument="<%#:Item.IdCotizacion%>"
                        OnClick="EliminaServTarBtn1_Click"
                        CssClass="btn btn-danger"
                        Text="&nbsp;X&nbsp;"
                        type="button" />
                </td>
            </tr>
        </ItemTemplate>
        <EditItemTemplate>
            <tr id="Tr2" runat="server">
                <td class="text-end">
                    <%#:Item.Servicio%>
                </td>
                <td class="text-end" style="padding-right: 1.525rem;">
                    <%#:Item.Tarifa%>
                </td>
                <td class="text-center">
                    <asp:Button
                        ID="EliminaServTarBtn2"
                        runat="server"
                        CommandArgument="<%#:Item.IdCotizacion%>"
                        OnClick="EliminaServTarBtn1_Click"
                        CssClass="btn btn-danger"
                        Text="&nbsp;X&nbsp;"
                        type="button" />
                </td>
            </tr>
        </EditItemTemplate>
        <LayoutTemplate>
            <div class="col-md-12">
                <table
                    id="groupPlaceholderContainer"
                    runat="server"
                    class="table table-borderless align-middle mb-3"
                    data-o="groupPlaceholderContainer">
                    <tr id="groupPlaceholder"></tr>
                    <tr>
                        <td class="text-end align-top">
                            <asp:Label runat="server"
                                AssociatedControlID="Subtotal"
                                CssClass="form-label required-field">
                            Subtotal
                            </asp:Label>
                        </td>
                        <td class="text-end">
                            <asp:TextBox
                                runat="server"
                                ID="Subtotal"
                                CssClass="form-control text-end"
                                OnTextChanged="Subtotal_TextChanged" />
                            <asp:RequiredFieldValidator
                                ID="SubtotalReqValidator"
                                runat="server"
                                ControlToValidate="Subtotal"
                                CssClass="text-danger"
                                ErrorMessage="El campo es requerido" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="text-end align-top">
                            <asp:Label
                                ID="IVALabel"
                                runat="server"
                                AssociatedControlID="IVA"
                                CssClass="form-label required-field">
                            IVA (0)
                            </asp:Label>
                        </td>
                        <td class="text-end">
                            <asp:TextBox
                                runat="server"
                                ID="IVA"
                                CssClass="form-control text-end" />
                            <asp:RequiredFieldValidator
                                ID="IVAReqValidator"
                                runat="server"
                                ControlToValidate="IVA"
                                CssClass="text-danger"
                                ErrorMessage="El campo es requerido" />
                        </td>
                        <td></td>
                    </tr>
                    <tr>
                        <td class="text-end align-top">
                            <asp:Label
                                ID="TotalLabel"
                                runat="server"
                                AssociatedControlID="Total"
                                CssClass="form-label required-field">
                            Total
                            </asp:Label>
                        </td>
                        <td class="text-end">
                            <asp:TextBox
                                runat="server"
                                ID="Total"
                                ReadOnly="true"
                                CssClass="form-control text-end bg-gray-200" />
                            <asp:RequiredFieldValidator
                                ID="TotalReqValidator"
                                runat="server"
                                ControlToValidate="Total"
                                CssClass="text-danger"
                                ErrorMessage="El campo es requerido" />
                        </td>
                        <td></td>
                    </tr>
                </table>
            </div>
        </LayoutTemplate>
    </asp:ListView>
    <%--update panels
https://stackoverflow.com/questions/1271176/sys-webforms-pagerequestmanagerservererrorexception--%>
</div>
