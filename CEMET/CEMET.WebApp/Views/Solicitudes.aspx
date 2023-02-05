<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Forms.Master" AutoEventWireup="true" CodeBehind="Solicitudes.aspx.cs" Inherits="CEMET.WebApp.Views.Solicitudes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="py-5 text-center">
        <%--<h1 class="display-5">Display 5</h1>--%>
        <h1>Solicitudes registradas</h1>
    </div>
    <div class="table table-sm py-3" style="overflow-x: auto; width: 100%;">

        <asp:GridView ID="gv_Solicitudes" runat="server" GridLines="Horizontal" AutoGenerateColumns="false" CssClass="table  table-sm table-bordered table-condensed table-responsive-sm table-hover table-striped">
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
        </asp:GridView>

    </div>
</asp:Content>
