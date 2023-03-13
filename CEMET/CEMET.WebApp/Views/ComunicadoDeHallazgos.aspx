<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="ComunicadoDeHallazgos.aspx.cs" Inherits="CEMET.WebApp.Views.ComunicadoDeHallazgos" %>

<%@ Register Src="~/UserControls/Comun/Datepicker.ascx" TagPrefix="uc1" TagName="Datepicker" %>
<%@ Register Src="~/UserControls/Comun/PreSolicitudSelect.ascx" TagPrefix="uc1" TagName="PreSolicitudSelect" %>
<%@ Register Src="~/UserControls/Comun/Hallazgo.ascx" TagPrefix="uc1" TagName="Hallazgo" %>



<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-12">
            <p class="fs-5 fw-semibold mt-4">Estimado cliente:</p>
            <p>
                Por medio del presente, le informamos que durante la evaluación de su solicitud del servicio se detectó lo siguiente:
            </p>
        </div>

        <div class="col-md-12">
            <p class="fs-5 fw-semibold mt-4">Comunicado</p>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="PreSolicitudSelect" CssClass="form-label required-field">
                    No. de presolicitud:
                </asp:Label>
                <div class="">
                    <uc1:PreSolicitudSelect runat="server" ID="PreSolicitudSelect" EsRequerido="true" ValidationGroupForm="ComunicadoDeHallazgosFormGroup" />
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <link href="Content/ajaxcontroltoolkit-calendar.css" rel="stylesheet" />
            <uc1:Datepicker
                runat="server"
                ID="Fecha"
                Etiqueta="Fecha"
                EsRequerido="true"
                ValidationGroup="ComunicadoDeHallazgosFormGroup"
                FormatoDeFecha="dd/MM/yyyy"
                RegexParaFecha="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$" />
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="NoDeListaDeEvaluacion" CssClass="form-label required-field">
                    No. de lista de evaluación:
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="NoDeListaDeEvaluacion" CssClass="form-control" />
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="CantidadDeHallazgos" CssClass="form-label required-field">
                    Cantidad de Hallazgos:
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="CantidadDeHallazgos" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="col-md-12 mt-4">
                   <div class="col-md-12 mt-5">

            <asp:ListView
                ID="EvaluacionesLV"
                runat="server"
                DataKeyNames="Value"
                GroupItemCount="4"
                ItemType="Cemetlib.Model.Catalog"
                OnItemDataBound="EvaluacionesLV_ItemDataBound">
                <EmptyDataTemplate>
                    <div class="col-md-12">
                        <table class="table table-borderless align-middle mb-3">
                            <tr>
                                <td class="text-center">
                                    <div class="alert alert-dark" role="alert" runat="server" id="SinEvaluaciones">
                                        <br />
                                        No hay evaluaciones por mostrar
                                        <br />
                                        <br />
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </EmptyDataTemplate>
                <GroupTemplate>
                    <tr id="itemPlaceholderContainer"
                        runat="server"
                        data-g="GroupTemplate">
                        <td id="itemPlaceholder" runat="server"></td>
                    </tr>
                </GroupTemplate>
                <ItemTemplate>
                    <tr id="Tr1" runat="server">
                        <td class="align-middle p-3">
                            <%#:Item.Value %>
                        </td>
                        <td class="align-middle p-3">
                            <%#:Item.Text %>
                        </td>
                        <td class="align-middle p-3">
                            <asp:DropDownList
                                runat="server"
                                ID="Veredicto"
                                CssClass="form-control"
                                AutoPostBack="true"
                                OnSelectedIndexChanged="Veredicto_SelectedIndexChanged"
                                data-choices='{"searchEnabled":true, "allowHTML":true,"itemSelectText":""}' />
                        </td>
                        <td class="align-middle p-3 w-25">
                            <uc1:Hallazgo runat="server" ID="HallazgoCtrl"
                                Visible="false"
                                EsRequerido="true" ValidationGroupForm="EvaluacionDePreForm"
                                IdEvaluacion="<%#int.Parse(Item.Value)%>" />
                        </td>
                    </tr>
                </ItemTemplate>
                <LayoutTemplate>
                    <div class="col-md-12">
                        <table
                            id="groupPlaceholderContainer"
                            runat="server"
                            class="table table-bordered table-hover mb-3"
                            data-o="groupPlaceholderContainer">
                            <tr>
                                <td scope="row" colspan="2" class="align-middle p-3">
                                    <asp:Label
                                        runat="server"
                                        AssociatedControlID="PreSolicitudSelect"
                                        ID="PreSolicitudSelectLbl"
                                        CssClass="form-label required-field">No. de Presolicitud</asp:Label>
                                </td>
                                <td scope="row" colspan="2" class="align-middle p-3">
                                    <uc1:PreSolicitudSelect runat="server" ID="PreSolicitudSelect" />
                                </td>
                            </tr>
                            <tr>
                                <td scope="row" colspan="2" class="align-middle p-3">
                                    <asp:Label runat="server"
                                        AssociatedControlID="NoDeListaDeEvaluacion"
                                        ID="Label1"
                                        CssClass="form-label required-field">No. de Lista de evaluación de solicitud de servicio</asp:Label>
                                </td>
                                <td scope="row" colspan="2" class="align-middle p-3">
                                    <asp:TextBox runat="server" ID="NoDeListaDeEvaluacion" CssClass="form-control" />
                                    <asp:RequiredFieldValidator runat="server" ValidationGroup="EvaluacionDePreForm" Display="Static"
                                        ControlToValidate="NoDeListaDeEvaluacion" CssClass="text-danger" ErrorMessage="El campo es requerido" />
                                </td>
                            </tr>
                            <tr id="groupPlaceholder"></tr>
                        </table>
<%--                        <div class="col-md-12 text-center mt-5">
                            <asp:Button runat="server"
                                ID="ValidarBtn"
                                CssClass="btn btn-danger"
                                OnClick="ValidarBtn_Click"
                                Text="Validar"
                                type="button"
                                ValidationGroup="EvaluacionDePreForm" />
                            <asp:Button runat="server" CssClass="btn btn-danger" Text="Aceptar" type="button" />
                        </div>--%>
                    </div>
                </LayoutTemplate>
            </asp:ListView>
        </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="EnviarAlCorreo" CssClass="form-label required-field">
                    Enviar al correo:
                </asp:Label>
            </div>
        </div>

        <div class="col-md-6">
            <div class="form-group">
                <div class="">
                    <asp:DropDownList runat="server" ID="EnviarAlCorreo" CssClass="form-select" />
                </div>
            </div>
        </div>

        <div class="col-md-12">
            <p class="fs-5 fw-semibold mt-4">Observaciones</p>
            <p>
                Le recordamos que es indispensable que subsané los hallazgos previamente mencionados ya que sin ellos su producto no podrá ingresar a pruebas.
            </p>
            <p>
                Todos los hallazgos detectados deben ser subsanados en un lapso no mayor de 15 días hábiles, de lo contrario su servicio será inactivado.		
            </p>
        </div>

    </div>


</asp:Content>
