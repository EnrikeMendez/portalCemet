<%@ Page Title="Presolicitud" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PresolicitudCompleta.aspx.cs" Inherits="CEMET.WebApp.PresolicitudCompleta" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <main>

        <section class="position-relative">
            <div class="container py-9 py-lg-11">
                <div class="row justify-content-center">
                    <div class="col-lg-8 mb-5 mb-lg-0">
                        <form class="needs-validation" novalidate="">

                            <div class="d-flex align-items-center mb-5">
                                <h5 class="mb-0 me-3 me-md-4">Servicio requerido</h5>
                                <div class="border-bottom flex-grow-1"></div>
                            </div>

                            <div class="row g-3">

                                <div class="col-md-4">
                                    <label for="validationCustom01" class="form-label">Tipo de servicio</label>
                                    <select class="form-select" id="validationCustom01" required>
                                        <option selected="" disabled="" value="">Selecciona opción (D1/T1)...</option>
                                        <option>...</option>
                                    </select>
                                    <div class="valid-feedback">
                                        Campo válido
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="validationCustom02" class="form-label">Norma:</label>
                                    <select class="form-select" id="validationCustom02" required>
                                        <option selected="" disabled="" value="">Selecciona opción (D4)...</option>
                                        <option>...</option>
                                    </select>
                                    <div class="valid-feedback">
                                        Campo válido
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="validationCustom03" class="form-label">Categoría:</label>
                                    <select class="form-select" id="validationCustom03" required>
                                        <option selected="" disabled="" value="">Selecciona opción (D7)...</option>
                                        <option>...</option>
                                    </select>
                                    <div class="valid-feedback">
                                        Campo válido
                                    </div>
                                </div>
                                <%--<label for="validationCustomUsername" class="form-label">Username</label>
                                    <div class="input-group has-validation">
                                        <span class="input-group-text" id="inputGroupPrepend">@</span>
                                        <input type="text" class="form-control" id="validationCustomUsername" aria-describedby="inputGroupPrepend" required="">
                                        <div class="invalid-feedback">
                                            Please choose a username.
                                        </div>
                                    </div>--%>
                                <div class="col-md-6">
                                    <label for="validationCustom04" class="form-label">Referencia de ceritificación:</label>
                                    <input type="text" class="form-control" id="validationCustom04" required="">
                                    <div class="invalid-feedback">
                                        Inserte referencia válida
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="validationCustom05" class="form-label">Descripción del producto:</label>
                                    <input type="text" class="form-control" id="validationCustom05" required="">
                                    <div class="invalid-feedback">
                                        Ingrese descrición válida
                                    </div>
                                </div>


                                <div class="col-md-4">
                                    <label for="validationCustom06" class="form-label">Marca:</label>
                                    <input type="text" class="form-control" id="validationCustom06" required="">
                                    <div class="invalid-feedback">
                                        Inserte marca válida
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="validationCustom07" class="form-label">Modelo:</label>
                                    <input type="text" class="form-control" id="validationCustom07" required="">
                                    <div class="invalid-feedback">
                                        Inserte Modelo válida
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label for="validationCustom08" class="form-label">País de origen:</label>
                                    <select class="form-select" id="validationCustom08" required>
                                        <option selected="" disabled="" value="">Selecciona opción (D8)...</option>
                                        <option>...</option>
                                    </select>
                                    <div class="valid-feedback">
                                        Campo válido
                                    </div>
                                </div>

                            </div>
                            <br />
                            <div class="d-flex align-items-center mb-5">
                                <h5 class="mb-0 me-3 me-md-4">Documentos</h5>
                                <div class="border-bottom flex-grow-1"></div>
                            </div>

                            <div class="row g-3">
                            </div>
                            <br />
                            <div class="d-flex align-items-center mb-5">
                                <h5 class="mb-0 me-3 me-md-4">Modalidad de recolección</h5>
                                <div class="border-bottom flex-grow-1"></div>
                            </div>

                            <div class="row g-3">
                            </div>
                            <br />
                            <div class="d-flex align-items-center mb-5">
                                <h5 class="mb-0 me-3 me-md-4">Modalidad de entrega</h5>
                                <div class="border-bottom flex-grow-1"></div>
                            </div>

                            <div class="row g-3">
                            </div>

                            <br />
                            <div class="d-flex align-items-center mb-5">
                                <h5 class="mb-0 me-3 me-md-4">Cotalización</h5>
                                <div class="border-bottom flex-grow-1"></div>
                            </div>

                            <div class="row g-3">
                            </div>
                            <br />
                            <div class="d-flex align-items-center mb-5">
                                <h5 class="mb-0 me-3 me-md-4">Observación y/o declaracines adicionales</h5>
                                <div class="border-bottom flex-grow-1"></div>
                            </div>

                            <div class="row g-3">
                            </div>
                            <br />
                            <div class="d-flex align-items-center mb-5">
                                <h5 class="mb-0 me-3 me-md-4">Términos y condiciones</h5>
                                <div class="border-bottom flex-grow-1"></div>
                            </div>
                            <div class="row g-3">
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
                                        <input class="form-check-input" type="checkbox" value="" id="invalidCheck" required="">
                                        <label class="form-check-label" for="invalidCheck">
                                            Acepto las condiciones de servicio y declaro que los datos proporcionados son correctos
                                        </label>
                                        <div class="invalid-feedback">
                                            You must agree before submitting.
                                        </div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <button class="btn btn-primary" type="submit">Submit form</button>
                                </div>

                            </div>
                            <hr class="my-7">
                    </div>
                </div>
                </form>
            </div>
        </section>
    </main>
</asp:Content>
