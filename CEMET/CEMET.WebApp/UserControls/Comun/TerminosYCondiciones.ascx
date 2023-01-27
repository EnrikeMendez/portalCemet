<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="TerminosYCondiciones.ascx.cs" Inherits="CEMET.WebApp.UserControls.Comun.TerminosYCondiciones" %>

<div class="d-flex align-items-center mb-3 mt-4">
    <h5 class="mb-0 me-3 me-md-4">Términos y condiciones</h5>
    <div class="border-bottom flex-grow-1"></div>
</div>
<div class="row">
    <div class="col-12">
        <ul class="form-label">
            <li>Los campos que no sean utilizados, deben ser cubiertos con las letras N.A. (No Aplica) o en su defecto con una línea diagonal.</li>
            <li>El solicitante declara estar de acuerdo en proporcionar cualquier información necesaria para la evaluación de su muestra.</li>
            <li>Clientes sin crédito deben liquidar los servicios en su totalidad por anticipado.</li>
            <li>El laboratorio no subcontrata en su totalidad o parcialmente ningún tipo de prueba de ensayo.</li>
            <li>CEMET no se hace responsable por los daños totales o parciales de los ítems durante la realización de las pruebas.</li>
            <li>Las pruebas correspondientes se limitan al alcance de la norma solicitada.</li>
            <li>El Laboratorio reporta los resultados de los ensayos de acuerdo a lo que especifica el método probado, la declaración de conformidad y regla de decisión es inherente a la especificación de la norma a evaluar, por lo que dependerán de los resultados obtenidos en cada prueba realizada, sin tomar en cuenta la incertidumbre del ensayo debido a que la norma del producto que se evalúan y las dependencias competentes de dichas normas no lo consideran y no se han pronunciado al respecto.</li>
            <li>Cualquier incumplimiento en el ítem quedará asentado en el informe de ensayo y se emitirá con No Cumplimiento.</li>
            <li>El cliente tendrá 15 días para subsanar los faltantes de información comercial o su informe se emitirá con No Cumplimiento.</li>
            <li>El cliente cuenta con 30 días hábiles para recolectar su muestra de lo contrario será desechada. El desecho los ítems tiene un costo adicional.</li>
        </ul>

    </div>
    <div class="col-12">
        <div class="form-check">
            <div class="">
                <asp:Label runat="server" AssociatedControlID="AceptoCheck" CssClass="form-check-label required-field">
                    Acepto las condiciones de servicio y declaro que los datos proporcionados son correctos    
                </asp:Label>
                <asp:CheckBox runat="server" ID="AceptoCheck" CssClass="" OnCheckedChanged="AceptoCheck_CheckedChanged" required="" />
                <%--<asp:RequiredFieldValidator runat="server" ControlToValidate="AceptoCheck" CssClass="text-danger" ErrorMessage="El campo es requerido" />--%>
            </div>
        </div>
    </div>
</div>
