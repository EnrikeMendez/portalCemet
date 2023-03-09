<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="ProgramacionDeRecoleccion.aspx.cs" Inherits="CEMET.WebApp.Views.ProgramacionDeRecoleccion" %>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <div class="py-5 text-center">
        <h1>Programación de recolección</h1>
    </div>

    

    <div class="row">
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="NoDeProgramacion" CssClass="form-label required-field">
                No. de programación
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="NoDeProgramacion" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecoleccionValGroup" Display="Static" ControlToValidate="NoDeProgramacion" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="FechaDeRecoleccion" CssClass="form-label required-field">
                Fecha de recolección
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="FechaDeRecoleccion" CssClass="form-control" TextMode="Date" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecoleccionValGroup" Display="Static" ControlToValidate="FechaDeRecoleccion" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-4 p-3">
            <asp:Label runat="server" AssociatedControlID="Horario" CssClass="form-label required-field">
                Horario
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Horario" CssClass="form-control" TextMode="Time" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecoleccionValGroup" Display="Static" ControlToValidate="Horario" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>
        <div class="form-group col-md-4 p-3">
            <asp:Label runat="server" AssociatedControlID="Contacto" CssClass="form-label required-field">
                Contacto
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Contacto" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecoleccionValGroup" Display="Static" ControlToValidate="Contacto" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>
        <div class="form-group col-md-4 p-3">
            <asp:Label runat="server" AssociatedControlID="Telefono" CssClass="form-label required-field">
                Teléfono
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Telefono" CssClass="form-control" TextMode="Phone" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecoleccionValGroup" Display="Static" ControlToValidate="Telefono" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-12 p-3">
            <asp:Label runat="server" AssociatedControlID="Direccion" CssClass="form-label required-field">
                Dirección
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Direccion" CssClass="form-control"  />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecoleccionValGroup" Display="Static" ControlToValidate="Direccion" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="CantidadDeBultosAEntregar" CssClass="form-label required-field">
                Cantidad de bultos a entregar
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="CantidadDeBultosAEntregar" CssClass="form-control" TextMode="Number" />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecoleccionValGroup" Display="Static" ControlToValidate="CantidadDeBultosAEntregar" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>
        <div class="form-group col-md-6 p-3">
            <asp:Label runat="server" AssociatedControlID="CantidadDePresolicitudes" CssClass="form-label required-field">
                Cantidad de presolicitudes
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="CantidadDePresolicitudes" CssClass="form-control" TextMode="Number"  />
                <asp:RequiredFieldValidator runat="server" ValidationGroup="RecoleccionValGroup" Display="Static" ControlToValidate="CantidadDePresolicitudes" CssClass="text-danger" ErrorMessage="El campo es requerido" />
            </div>
        </div>

        <div class="form-group col-md-12 p-3">
            <asp:Label runat="server" CssClass="form-label required-field">
                Números de presolicitud
                <%--<br />Se despliega una cantidad de celdas igual a la cantidad de presolicitudes--%>
            </asp:Label>
            <div class="table table-sm py-3" style="overflow-x: auto; width: 100%;">

                <asp:GridView ID="gv_Solicitudes" runat="server" GridLines="Horizontal" AutoGenerateColumns="false" CssClass="table  table-sm table-bordered table-condensed table-responsive-sm table-hover table-striped">
                    <Columns>
                        <asp:TemplateField >
                            <ItemTemplate>
                                <asp:CheckBox ID="chbItem" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="SOL_Folio" HeaderText="Folio" />
                        <asp:BoundField DataField="SOL_Id" HeaderText="Id solicitud" />
                        <asp:BoundField DataField="CTS_Descripcion" HeaderText="Tipo de servicio" />
                        <asp:BoundField DataField="SOL_Referencia_Certificacion" HeaderText="Referencia certificación" />
                        <asp:BoundField DataField="SOL_Dsc_Producto" HeaderText="Descripción producto" />
                        <asp:BoundField DataField="SOL_Marca" HeaderText="Marca" />
                        <asp:BoundField DataField="SOL_Modelo" HeaderText="Modelo" />
                        <asp:BoundField DataField="SOL_Calibre" HeaderText="Calibre" />
                        <asp:BoundField DataField="SOL_Total" HeaderText="Total" />
                        <asp:BoundField DataField="SOL_Observaciones" HeaderText="Observaciones" />
                        <asp:BoundField DataField="SOL_Activo" HeaderText="Activo" />
                        <asp:BoundField DataField="SOL_FechaCreacion" HeaderText="Fecha creación" />

                    </Columns>
                </asp:GridView>

            </div>
        </div>

        <div class="form-group col-md-12 p-3">
            <asp:Label runat="server" AssociatedControlID="ReferenciasAdicionales" CssClass="form-label">
                Referencias adicionales
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="ReferenciasAdicionales" CssClass="form-control"/>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col text-center">
            <br />
            <asp:Button runat="server" CssClass="btn btn-danger" ValidationGroup="RecoleccionValGroup" Text="Guardar" type="button" OnClick="Guardar_Click"/>
        </div>
    </div>


</asp:Content>
