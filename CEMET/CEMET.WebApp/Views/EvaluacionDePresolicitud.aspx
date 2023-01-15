<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="EvaluacionDePresolicitud.aspx.cs" Inherits="CEMET.WebApp.Views.EvaluacionDePresolicitud" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-12">
            <p class="fs-5 fw-semibold mt-4">Estimado cliente:</p>
            <p>
                Por medio del presente, le informamos que durante la evaluación de su solicitud del servicio se detectó lo siguiente:
            </p>
        </div>
        <div class="col-md-12 text-center">
            <div class="card">
                <div class="card-header">
                    Número de lista de evaluación de presolicitud
                </div>
                <ul class="list-group list-group-flush fw-semibold">
                    <li class="list-group-item">EV-PRE-0001234</li>
                </ul>
            </div>
        </div>

        <div class="col-md-12 mt-5">

            <table class="table table-bordered">
                <thead>
                    <tr>
                        <th scope="col" colspan="4" class="text-center">Lista de Evaluación de Presolicitud</th>
                    </tr>
                    <tr>
                        <th colspan="2" class="w-50 text-center">No. de Presolicitud</th>
                        <th colspan="2" class="text-start">XXX-345678-XXX</th>
                    </tr>
                    <tr>
                        <th colspan="2" class="w-50 text-center">No. de Lista de evaluación de solicitud de servicio</th>
                        <th colspan="2" class="text-start">YYYY-345678-ZZZZ</th>
                    </tr>
                </thead>
                <tbody class="table-group-divider">
                    <tr>
                        <th scope="col">No</th>
                        <th scope="col">Descripción de la evaluación</th>
                        <th scope="col">Veredicto</th>
                        <th scope="col">Hallazgos</th>
                    </tr>
                    <tr>
                        <th scope="row">1</th>
                        <td>La norma solicitada aplica a la muestra</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">2</th>
                        <td>El estado físico de la muestra</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">3</th>
                        <td>La muestra contiene los componentes necesarios para realizar pruebas</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">4</th>
                        <td>Información comercial (Que contega instructivo, marcado)</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">5</th>
                        <td>Instructivo: leyendas, símbología, idioma</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">6</th>
                        <td>Marcado: tensión, corriente, frecuencia, potencia, marca, modelo, país de orígen</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <th scope="row">6</th>
                        <td>La muestra es funcional</td>
                        <td></td>
                        <td></td>
                    </tr>
                    <tr>
                        <td scope="row" colspan="2" class="required-field">Cantidad de hallazgos encontrados</td>
                        <td scope="row" colspan="2">
                            <asp:TextBox runat="server" ID="CantidadDeHallazgosEncontrados" CssClass="form-control" TextMode="Number" />
                        </td>
                    </tr>
                    <tr>
                        <td scope="row" colspan="2">Sugerencias</td>
                        <td scope="row" colspan="2">
                            <asp:TextBox runat="server" ID="Sugerencias" CssClass="form-control" TextMode="MultiLine" Wrap="true" Rows="5" />
                        </td>
                    </tr>
                </tbody>
            </table>

        </div>

        <div class="col-md-12 text-center mt-5">
            <asp:Button runat="server" CssClass="btn btn-danger" Text="Validar" type="button" />
            <asp:Button runat="server" CssClass="btn btn-danger" Text="Aceptar" type="button" />
        </div>
    </div>



</asp:Content>
