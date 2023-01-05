<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="CEMET.WebApp.Account.Login" Async="true" %>

<%@ Register Src="~/Account/OpenAuthProviders.ascx" TagPrefix="uc" TagName="OpenAuthProviders" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <%--<h2><%: Title %>.</h2>--%>
    <%--<link href="../Content/assan/assets/css/theme.css" rel="stylesheet" />--%>

    <main>
        <!--page-hero-->
        <section class="bg-white position-relative">
            <div class="bg-pattern text-light w-100 h-100 start-0 top-0 position-absolute"></div>
            <div class="container pt-11 pt-lg-14 pb-9 pb-lg-11 position-relative z-index-1">
                <div class="row align-items-center justify-content-center">
                    <div class=" col-xl-4 col-lg-5 col-md-6 col-sm-8 z-index-2">

                        <h2 class="mb-1 display-6">Bienvenido
                        </h2>
                        <%--   <p class="mb-4 text-muted">
                                  Please Sign In with details...
                               </p>--%>
                        <div class="position-relative">
                            <div>
                                <%--<form class="needs-validation" novalidate>--%>
                                <div class="needs-validation">
                                    <div class="input-icon-group mb-3">
                                        <span class="input-icon">
                                            <i class="bx bx-envelope"></i>
                                        </span>
                                        <input type="email" class="form-control" required autofocus placeholder="correo">
                                    </div>
                                    <div class="input-icon-group mb-3">
                                        <span class="input-icon">
                                            <i class="bx bx-lock-open"></i>
                                        </span>
                                        <input type="password" class="form-control" required placeholder="contraseña">
                                    </div>
                                    <div class="mb-3 d-flex justify-content-between">
                                        <div class="form-check">
                                            <input class="form-check-input" type="checkbox" value="" id="flexCheckDefault">
                                            <label class="form-check-label" for="flexCheckDefault">
                                                Recordarme
                                            </label>
                                        </div>
                                        <div>
                                            <label class="text-end d-block small mb-0"><a href="page-account-forget-password.html" class="text-muted link-decoration">Recuperar contraseña</a></label>
                                        </div>
                                    </div>

                                    <div class="d-grid">
                                        <button class="btn btn-primary" type="submit">
                                            Entrar
                                        </button>
                                    </div>
                                </div>

                                <!---->
                                <%--<p class="pt-4 small text-muted" data-developer="to add a new one from UI">
                                        Don’t have an account yet? <a href="page-account-signup.html" class="ms-2 text-dark fw-semibold link-underline">Sign Up</a>
                                    </p>--%>
                                <!--Divider-->
                                <%--                                <div class="d-flex align-items-center py-3">
                                    <span class="flex-grow-1 border-bottom pt-1"></span>
                                    <span class="d-inline-flex flex-center lh-1 width-2x height-2x rounded-circle bg-white text-mono">or</span>
                                    <span class="flex-grow-1 border-bottom pt-1"></span>
                                </div>
                                <div class="d-grid">
                                    <a href="#!" class="d-flex hover-lift btn-outline-secondary mb-2 btn position-relative flex-center">
                                        <div class="position-relative d-flex align-items-center" data-developer="Main Icon">
                                            <img src="assets/img/brands/google.svg" alt="" class="width-2x me-2">
                                            <span>sign in with google</span>
                                        </div>
                                    </a>
                                    <a href="#!" class="d-flex hover-lift btn-outline-secondary btn position-relative flex-center">
                                        <div class="position-relative d-flex align-items-center" data-developer="Main Icon">
                                            <img src="assets/img/brands/Facebook.svg" alt="" class="width-2x me-2">
                                            <span>sign in with facebook</span>
                                        </div>
                                    </a>
                                </div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </main>
    <%--  

    <div class="row">
        <div class="col-md-8">
            <section id="loginForm">
                <div class="form-horizontal">
                    <h4>Use a local account to log in.</h4>
                    <hr />
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Email</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                                CssClass="text-danger" ErrorMessage="The email field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator runat="server" ControlToValidate="Password" CssClass="text-danger" ErrorMessage="The password field is required." />
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div>
                <p>
                    <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
                </p>
                <p>
                    <-- 
        developer: You need comment this as aspx
        Enable this once you have account confirmation enabled for password reset functionality
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                    -->
                </p>
            </section>
        </div>

        <div class="col-md-4">
            <section id="socialLoginForm">
                <uc:OpenAuthProviders runat="server" ID="OpenAuthLogin" />
            </section>
        </div>
    </div>--%>
</asp:Content>
