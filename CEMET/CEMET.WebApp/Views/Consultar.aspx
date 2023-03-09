<%@ Page Title="Consultar" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="Consultar.aspx.cs" Inherits="CEMET.WebApp.Views.Consultar" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-5 text-center">
        <h1>Consultar</h1>
    </div>
    <div class="container py-2">

        <div class="d-flex align-items-center mb-3 mt-2">
            <h5 class="mb-0 me-3 me-md-4">Consultar</h5>
            <div class="border-bottom flex-grow-1"></div>
            <%--<asp:ValidationSummary runat="server" CssClass="text-danger" />--%>
        </div>
        <div class="row d-flex align-items-end">
            <div class="form-group col-md-4 p-3">
                <asp:Label runat="server" AssociatedControlID="TipoDeConsulta" ID="lbl_TipoDeConsulta" CssClass="form-label required-field">
                            Tipo de servicio:</asp:Label>

                <div class="">
                    <asp:DropDownList runat="server" ID="TipoDeConsulta" CssClass="form-select" required="" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="TipoDeConsulta" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>

            <div class="form-group col-md-4 p-3">

                <div class="">
                    <asp:Label runat="server" AssociatedControlID="DelPeriodo" ID="lbl_DelPeriodo" CssClass="form-label required-field">
                            Del periodo:</asp:Label>
                    <asp:TextBox runat="server" ID="DelPeriodo" CssClass="form-control" TextMode="Date" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="DelPeriodo" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>
            <div class="form-group col-md-4 p-3">

                <div class="">
                    <asp:Label runat="server" AssociatedControlID="AlPeriodo" ID="lbl_AlPeriodo" CssClass="form-label required-field">
                            Al periodo:</asp:Label>
                    <asp:TextBox runat="server" ID="AlPeriodo" CssClass="form-control" required="" TextMode="Date" />
                    <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="AlPeriodo" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
                </div>
            </div>
        </div>

        <hr class="my-4">

        <div class="row">
            <div class="col">
                <asp:Button runat="server" Text="Consultar" CssClass="btn btn-primary" />
            </div>
        </div>

        <hr class="my-4">

        <div class="table table-sm py-3" style="overflow-x: auto; width: 100%;">

            <asp:GridView ID="gv_Solicitudes" runat="server" GridLines="Horizontal" AllowPaging="true" PageSize="10" OnPageIndexChanging="Gv_IndexChanged" AutoGenerateColumns="false" CssClass="table  table-sm table-bordered table-condensed table-responsive-sm table-hover table-striped">
                <Columns>
                    <asp:BoundField DataField="SOL_Folio" HeaderText="Folio" />
                    <asp:BoundField DataField="SOL_Id" HeaderText="Id solicitud" />
                    <asp:BoundField DataField="CTS_Descripcion" HeaderText="Tipo de servicio" />
                    <asp:BoundField DataField="SOL_Referencia_Certificacion" HeaderText="Referencia certificación" />
                    <asp:BoundField DataField="SOL_Dsc_Producto" HeaderText="Descripción producto" />
                    <asp:BoundField DataField="SOL_Marca" HeaderText="Marca" />
                    <asp:BoundField DataField="SOL_Modelo" HeaderText="Modelo" />
                    <asp:BoundField DataField="SOL_Calibre" HeaderText="Calibre" />
                    <asp:BoundField DataField="SOL_Subtotal" HeaderText="Subtotal" />
                    <asp:BoundField DataField="SOL_Iva" HeaderText="IVA" />
                    <asp:BoundField DataField="SOL_Total" HeaderText="Total" />
                    <asp:BoundField DataField="SOL_Observaciones" HeaderText="Observaciones" />
                    <asp:BoundField DataField="SOL_Activo" HeaderText="Activo" />
                    <asp:BoundField DataField="SOL_FechaCreacion" HeaderText="Fecha creación" />

                </Columns>
                <PagerStyle HorizontalAlign="Center" CssClass="GridPager" />
            </asp:GridView>

        </div>

    </div>
    <style type="text/css">
        .GridPager a,
        .GridPager span {
            display: inline-block;
            padding: 0px 9px;
            margin-right: 4px;
            border-radius: 3px;
            background: #e9e9e9;
            box-shadow: inset 0px 1px 0px rgba(255,255,255, .8), 0px 1px 3px rgba(0,0,0, .1);
            font-size: .875em;
            font-weight: bold;
            text-decoration: none;
            color: #717171;
            text-shadow: 0px 1px 0px rgba(255,255,255, 1);
        }

        .GridPager a {
            background-color: #f5f5f5;
            color: #969696;
            border: 1px solid #969696;
        }

        .GridPager span {
            background: #7360f2;
            box-shadow: inset 0px 0px 8px rgba(0,0,0, .5), 0px 1px 0px rgba(255,255,255, .8);
            color: #f0f0f0;
            text-shadow: 0px 0px 3px rgba(0,0,0, .5);
            border: 1px solid #7360f2;
        }
    </style>
</asp:Content>
