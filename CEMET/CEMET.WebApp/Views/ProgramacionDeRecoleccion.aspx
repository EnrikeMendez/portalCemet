<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="ProgramacionDeRecoleccion.aspx.cs" Inherits="CEMET.WebApp.Views.ProgramacionDeRecoleccion" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="py-5 text-center">
        <h1>Alta de nuevo servicio</h1>
    </div>

    <div class="d-flex align-items-center mb-3 mt-2">
        <h5 class="mb-0 me-3 me-md-4">Programación de recolección</h5>
        <div class="border-bottom flex-grow-1"></div>
    </div>

    <div class="row">
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="NoDeProgramacion" CssClass="form-label required-field">
                No. de programación
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="NoDeProgramacion" CssClass="form-control" placeholder="No. de programación" />
            </div>
        </div>
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="FechaDeRecoleccion" CssClass="form-label required-field">
                Fecha de recolección
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="FechaDeRecoleccion" CssClass="form-control" placeholder="Fecha de recolección" TextMode="Date" />
            </div>
        </div>

        <div class="form-group col-md-4 p-3">
            <asp:Label runat="server" AssociatedControlID="Horario" CssClass="form-label required-field">
                Horario
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Horario" CssClass="form-control" placeholder="Horario" />
            </div>
        </div>
        <div class="form-group col-md-4 p-3">
            <asp:Label runat="server" AssociatedControlID="Contacto" CssClass="form-label required-field">
                Contacto
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Contacto" CssClass="form-control" placeholder="Contacto" />
            </div>
        </div>
        <div class="form-group col-md-4 p-3">
            <asp:Label runat="server" AssociatedControlID="Telefono" CssClass="form-label required-field">
                Teléfono
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Telefono" CssClass="form-control" placeholder="Teléfono" TextMode="Phone" />
            </div>
        </div>

        <div class="form-group col-md-12 p-3">
            <asp:Label runat="server" AssociatedControlID="Direccion" CssClass="form-label required-field">
                Dirección
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Direccion" CssClass="form-control" placeholder="Dirección" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="CantidadDeBultosAEntregar" CssClass="form-label required-field">
                Cantidad de bultos a entregar
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="CantidadDeBultosAEntregar" CssClass="form-control" placeholder="Cantidad de bultos a entregar" TextMode="Number" />
            </div>
        </div>
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="CantidadDePresolicitudes" CssClass="form-label required-field">
                Cantidad de presolicitudes
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="CantidadDePresolicitudes" CssClass="form-control" placeholder="Cantidad de presolicitudes" TextMode="Number" value="6" />
            </div>
        </div>

        <div class="form-group col-md-12 p-3">
            <asp:Label runat="server" AssociatedControlID="NumerosDePresolicitud" CssClass="form-label required-field">
                Números de presolicitud
                <%--<br />Se despliega una cantidad de celdas igual a la cantidad de presolicitudes--%>
            </asp:Label>
            <div class="m-2">
                <div class="row row-cols-auto">
                    <div class="col border border-dark border-2 m-1">
                        <span>Presolicitud<br />
                            1</span>
                    </div>
                    <div class="col border border-dark border-2 m-1">
                        <span>Presolicitud<br />
                            2</span>
                    </div>
                    <div class="col border border-dark border-2 m-1">
                        <span>Presolicitud<br />
                            3</span>
                    </div>
                    <div class="col border border-dark border-2 m-1">
                        <span>Presolicitud<br />
                            4</span>
                    </div>
                    <div class="col border border-dark border-2 m-1">
                        <span>Presolicitud<br />
                            5</span>
                    </div>
                    <div class="col border border-dark border-2 m-1">
                        <span>Presolicitud<br />
                            6</span>
                    </div>
                </div>
                <asp:TextBox runat="server" ID="NumerosDePresolicitud" CssClass="form-control" placeholder="Números de presolicitud" Visible="false" />
            </div>
        </div>

        <div class="form-group col-md-12 p-3">
            <asp:Label runat="server" AssociatedControlID="ReferenciasAdicionales" CssClass="form-label">
                Referencias adicionales
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="ReferenciasAdicionales" CssClass="form-control" placeholder="Referencias adicionales" />
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col text-center">
            <br />
            <asp:Button runat="server" CssClass="btn btn-danger" Text="Guardar" type="button" />
        </div>
    </div>


</asp:Content>
