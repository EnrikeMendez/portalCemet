<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="ComunicadoDeHallazgos.aspx.cs" Inherits="CEMET.WebApp.Views.ComunicadoDeHallazgos" %>

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
                <asp:Label runat="server" AssociatedControlID="NoDePresolicitud" CssClass="form-label required-field">
                    No. de presolicitud:
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="NoDePresolicitud" CssClass="form-control" />
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Fecha" CssClass="form-label required-field">
                    Fecha:
                </asp:Label>
                <div class="">
                    <asp:TextBox runat="server" ID="Fecha" CssClass="form-control" TextMode="Date" value="<%# DateTime.Now %>" />
                </div>
            </div>
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
            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th colspan="2" class="text-center fw-semibold">Hallazgos</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <tr>
                        <th scope="row">1</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">4</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">5</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">6</th>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">7</th>
                        <td></td>
                    </tr>
                </tbody>
            </table>
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
