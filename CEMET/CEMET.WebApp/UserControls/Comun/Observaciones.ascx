<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Observaciones.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.Observaciones" %>

<div class="row">
    <div class="form-group col-md-12">
        <asp:Label runat="server" AssociatedControlID="ObservacionesDeclaraciones" CssClass="form-label">
                   Observaciones y/o declaraciones adicionales:
                </asp:Label>
        <div class="form-group">
            <asp:TextBox runat="server" ID="ObservacionesDeclaraciones" CssClass="form-control" TextMode="MultiLine" Wrap="true" Rows="7"/>
        </div>
    </div>
</div><br />