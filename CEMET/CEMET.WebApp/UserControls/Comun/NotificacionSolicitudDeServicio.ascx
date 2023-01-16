<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NotificacionSolicitudDeServicio.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.NotificacionSolicitudDeServicio" %>
<%@ Register Src="~/UserControls/Comun/SubirArchivo.ascx" TagPrefix="uc1" TagName="SubirArchivo" %>

<div class="row">
    <div class="col-md-12 mb-4">
        <div class="card">

            <div class="card-body ">
                <h5 class="card-title">Producto NOMBRE PRODUCTO</h5>
                <div class="card-text">


                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Producto" CssClass="form-label">
                    Producto
                                </asp:Label>
                                <div class="">
                                    <asp:TextBox runat="server" ID="Producto" CssClass="form-control" Text="NOMBRE PRODUCTO" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Marca" CssClass="form-label">
                    Marca
                                </asp:Label>
                                <div class="">
                                    <asp:TextBox runat="server" ID="Marca" CssClass="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="Modelo" CssClass="form-label">
                    Modelo
                                </asp:Label>
                                <div class="">
                                    <asp:TextBox runat="server" ID="Modelo" CssClass="form-control" />
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="NumeroDeComponentes" CssClass="form-label">
                    Número de componentes
                                </asp:Label>
                                <div class="">
                                    <asp:TextBox runat="server" ID="NumeroDeComponentes" CssClass="form-control" />
                                </div>
                            </div>
                        </div>

                        <div class="row g-2 mt-4">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <asp:Label runat="server" AssociatedControlID="Folio" CssClass="form-label required-field">
                    Folios
                                    </asp:Label>

                                    <div class="input-group mb-3">
                                        <asp:Button runat="server" CssClass="btn btn-outline-secondary" Text="Agregar" />
                                        <asp:TextBox runat="server" ID="Folio" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>

                            <div class="col-md-6">
                                <ol class="list-group list-group-numbered">
                                    <li class="list-group-item">Folio 1</li>
                                    <li class="list-group-item">Folio 2</li>
                                    <li class="list-group-item">Folio 3</li>
                                    <li class="list-group-item">Folio 4</li>
                                    <li class="list-group-item">Folio 5</li>
                                </ol>
                            </div>
                        </div>

                        <div class="col-md-12 mb-4">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="CondicionesDeLaMuestra" CssClass="form-label">
                    Condiciones de la muestra
                                </asp:Label>
                                <div class="">
                                    <asp:TextBox runat="server" ID="CondicionesDeLaMuestra" CssClass="form-control" TextMode="MultiLine" Wrap="true" Rows="5" />
                                </div>
                            </div>
                        </div>

                        <uc1:SubirArchivo runat="server" ID="SubirArchivo"
                            Etiqueta="Evidencia fotográfica" EsRequerido="true"
                            ModoLectura="true" />

                        <div class="col-md-6">
                            <div class="form-group">
                                <asp:Label runat="server" AssociatedControlID="FechaEstimadaDeEntrega" CssClass="form-label required-field">
                    Fecha estimada de entrega
                                </asp:Label>
                                <div class="">
                                    <asp:TextBox runat="server" ID="FechaEstimadaDeEntrega" CssClass="form-control" TextMode="Date" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>



<%--
<div class="row">
    <div class="col-md-6">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Producto" CssClass="form-label">
                    Producto
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Producto" CssClass="form-control" Text="NOMBRE PRODUCTO" />
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Marca" CssClass="form-label">
                    Marca
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Marca" CssClass="form-control" />
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Modelo" CssClass="form-label">
                    Modelo
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="Modelo" CssClass="form-control" />
            </div>
        </div>
    </div>
    <div class="col-md-6">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="NumeroDeComponentes" CssClass="form-label">
                    Número de componentes
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="NumeroDeComponentes" CssClass="form-control" />
            </div>
        </div>
    </div>

    <div class="row g-2 mt-4">
        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Folio" CssClass="form-label required-field">
                    Folios
                </asp:Label>

                <div class="input-group mb-3">
                    <asp:Button runat="server" CssClass="btn btn-outline-secondary" Text="Agregar" />
                    <asp:TextBox runat="server" ID="Folio" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="col-md-6">
            <ol class="list-group list-group-numbered">
                <li class="list-group-item">Folio 1</li>
                <li class="list-group-item">Folio 2</li>
                <li class="list-group-item">Folio 3</li>
                <li class="list-group-item">Folio 4</li>
                <li class="list-group-item">Folio 5</li>
            </ol>
        </div>
    </div>

    <div class="col-md-12 mb-4">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="CondicionesDeLaMuestra" CssClass="form-label">
                    Condiciones de la muestra
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="CondicionesDeLaMuestra" CssClass="form-control" TextMode="MultiLine" Wrap="true" Rows="5" />
            </div>
        </div>
    </div>

    <uc1:SubirArchivo runat="server" ID="SubirArchivo"
        Etiqueta="Evidencia fotográfica" EsRequerido="true"
        ModoLectura="true" />

    <div class="col-md-6">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="FechaEstimadaDeEntrega" CssClass="form-label required-field">
                    Fecha estimada de entrega
            </asp:Label>
            <div class="">
                <asp:TextBox runat="server" ID="FechaEstimadaDeEntrega" CssClass="form-control" TextMode="Date" />
            </div>
        </div>
    </div>

    <div class="col-md-6">
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="EnviarAlCorreo" CssClass="form-label required-field">
                    Enviar al correo:
            </asp:Label>
            <div class="">
                <asp:DropDownList runat="server" ID="EnviarAlCorreo" CssClass="form-select" />
            </div>
        </div>
    </div>

</div>--%>
