<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="CEMET.WebApp.Index" %>

<!doctype html>
<html lang="en">

  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="Content/assan/assets/img/favicon.ico" type="image/ico">

    <!--Box Icons-->
    <link rel="stylesheet" href="Content/assan/assets/fonts/boxicons/css/boxicons.min.css">

    <!--AOS Animations-->
    <link rel="stylesheet" href="Content/assan/assets/vendor/node_modules/css/aos.css">

    <!--Iconsmind Icons-->
    <link rel="stylesheet" href="Content/assan/assets/fonts/iconsmind/iconsmind.css">

    <!--Google fonts-->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,200;0,300;0,400;0,500;0,600;0,700;1,400&family=Source+Serif+Pro:ital@0;1&display=swap" rel="stylesheet">

    <!--Master slider-->
    <link rel="stylesheet" href="Content/assan/assets/vendor/masterslider/style/masterslider.css">
    <link rel="stylesheet" href="Content/assan/assets/vendor/masterslider/skins/black-1/style.css">

    <!--Swiper slider-->
    <link rel="stylesheet" href="Content/assan/assets/vendor/node_modules/css/swiper-bundle.min.css">
    <!-- Main CSS -->
    <link href="Content/assan/assets/css/theme.min.css" rel="stylesheet">

    <title>Assan 4</title>
  </head>

  <body>
     <!--Preloader Spinner-->
     <div class="spinner-loader bg-primary text-white">
        <div class="spinner-grow" role="status">
        </div>
        <span class="small d-block ms-2">Loading...</span>
    </div>
    <!--begin:Header-->
    <header class="header-transparent sticky-fixed">

       <!--begin:navbar-->
      <nav class="navbar navbar-expand-lg fixed-top navbar-light navbar-link-white">
        <!--Navbar-fixed-background-->
        <div class="navbar-fixed-bg position-absolute"></div>
        <div class="container position-relative z-index-1">
          <!--begin:logo-->
          <a class="navbar-brand" href="index.html">
            <img src="Content/assan/assets/img/cemet/cemet.png" alt="" class="img-fluid navbar-brand-sticky">
            <img src="Content/assan/assets/img/cemet/cemet.png" alt="" class="img-fluid navbar-brand-transparent">
          </a>
          <!--end:logo-->

          <!--begin:navbar-no-collapse-items-->
          <!--end:navbar-no-collapse-items-->

          <!--begin:navbar-collapse-->
          <div class="collapse navbar-collapse" id="mainNavbarTheme">
            
            <!--begin:Navbar items-->
            <ul class="navbar-nav ms-auto me-lg-5">
              <li class="nav-item">
                  <a href="#home" class="nav-link">Inicio</a>
              </li>
              <li class="nav-item ms-lg-4">
                  <a href="#about" class="nav-link">Nuestros Servicios</a>
              </li>
              <li class="nav-item ms-lg-4">
                  <a href="#speakers" class="nav-link">Sobre Nosotros</a>
              </li>
              <li class="nav-item ms-lg-4">
                  <a href="#schedule" class="nav-link">Contáctanos</a>
              </li>
              <li class="nav-item ms-lg-4">
                  <a href="#pricing" class="nav-link">Registrar Solicitud</a>
              </li>
          </ul>
          <!--end:Navbar items-->

          </div>
          <!--end:navbar-collapse-->
        </div>

      </nav>
       <!--end:navbar-->
    </header>
    <!--end:header-->


    <!--begin:main content-->
    <main>
      <!--begin:main slider-->
      <section class="position-relative bg-dark overflow-hidden">
        <!-- Swiper slider -->
        <div class="swiper-container swiper-classic">
            <!-- Swiper wrapper -->
            <div class="swiper-wrapper">
                <!-- slide item -->
                <div class="swiper-slide" style="background-image:url('Content/assan/assets/img/cemet/slider0.jpeg')">
                    <div class="bg-dark position-absolute start-0 top-0 w-100 h-100 opacity-75"></div>
                    <div class="container-fluid text-white d-flex align-items-center h-100">
                        <div class="row pt-5 w-100">
                            <div class="col-xl-8 col-lg-10 mx-auto text-center">
                                <ul class="carousel-layers list-unstyled mb-0">
                                    <!--Slide heading-->
                                    <li data-carousel-layer="fade-start">
                                        <h2 class="display-1 mb-3">
                                          CENTRO DE METROLOGÍA Y ENSAYOS TÉCNICOS
                                        </h2>
                                    </li>
                                    <li data-carousel-layer="fade-end">
                                        <!--Slide subheading-->
                                        <p class="lead mb-4 mb-lg-5">
                                          LABORATORIO DE ENSAYO ACREDITADO POR EMA, A.C., CON NUMERO DE ACREDITACIÓN: Metal Mecánica: MM-0692-098/15 Eléctrica Electrónica: EE-0793-028/16
                                        </p>
                                    </li>
                                    <li data-carousel-layer="fade-start">
                                        <!--Slide action-->
                                        <a href="#" class="btn btn-primary btn-lg">
                                            Nuestros Servicios
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Slide 2-->
                <div class="swiper-slide" style="background-image:url('Content/assan/assets/img/cemet/slider2.jpeg')">
                    <div class="bg-dark position-absolute start-0 top-0 w-100 h-100 opacity-75"></div>
                    <div class="container-fluid text-white d-flex align-items-center h-100">
                        <div class="row pt-5 w-100">
                            <div class="col-xl-8 col-lg-10 mx-auto text-center">
                                <ul class="carousel-layers list-unstyled mb-0">
                                    <!--Slide heading-->
                                    <li data-carousel-layer="fade-start">
                                        <h2 class="display-1 mb-3">
                                          CENTRO DE METROLOGÍA Y ENSAYOS TÉCNICOS
                                        </h2>
                                    </li>
                                    <li data-carousel-layer="fade-end">
                                        <!--Slide subheading-->
                                        <p class="lead mb-4 mb-lg-5">
                                          CEMET es un laboratorio acreditado por la Entidad Mexicana de Acreditación A.C. (EMA) y aprobado por la Dirección General de Normas de la Secretaria de Economía, así como por la Comisión Nacional para el Uso Eficiente de la Energía.
                                        </p>
                                    </li>
                                    <li data-carousel-layer="fade-start">
                                        <!--Slide action-->
                                        <a href="#" class="btn btn-primary btn-lg">
                                            Sobre Nosotros
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Slide 3-->
                <div class="swiper-slide" style="background-image:url('Content/assan/assets/img/cemet/slider3.jpeg')">
                    <div class="bg-dark position-absolute start-0 top-0 w-100 h-100 opacity-75"></div>
                    <div class="container-fluid text-white d-flex align-items-center h-100">
                        <div class="row pt-5 w-100">
                            <div class="col-xl-8 col-lg-10 mx-auto text-center">
                                <ul class="carousel-layers list-unstyled mb-0">
                                    <li data-carousel-layer="fade-start">
                                        <!--Slide heading-->
                                        <h2 class="display-1 mb-3">
                                          CENTRO DE METROLOGÍA Y ENSAYOS TÉCNICOS
                                        </h2>
                                    </li>
                                    <li data-carousel-layer="fade-end">
                                        <!--Slide subheading-->
                                        <p class="lead mb-4 mb-lg-5">
                                          El Centro de Metrología y Ensayos Técnicos (CEMET), es un Laboratorio que ofrece servicio de pruebas físicas de calidad para determinar la seguridad de sus productos bajo los lineamientos de la norma NMX-EC-17025- IMNC-2018 (ISO/IEC 17025:2017).
                                        </p>
                                    </li>
                                    <li data-carousel-layer="fade-start">
                                        <!--Slide action-->
                                        <a href="#" class="btn btn-primary btn-lg">
                                            Contacto
                                        </a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Slider pagination -->
            <div class="swiper-pagination swiperClassic-pagination text-white"></div>
            <!-- Slider Arrow -->
            <div class="swiper-button-prev swiperClassic-button-prev bg-transparent width-5x height-5x text-white">
            </div>
            <!-- Slider Arrow -->
            <div class="swiper-button-next swiperClassic-button-next bg-transparent width-5x height-5x text-white">
            </div>
        </div>
    </section>
    <!--end:main slider-->


    <section class="position-relative bg-white border-bottom overflow-hidden" id="next">
      <div class="container py-9 py-lg-11">
          <div class="row align-items-center">
              <div class="col-lg-6 mb-5 mb-lg-0">
                  <h6 class="fst-italic font-serif mb-3" data-aos="fade-right" data-aos-duration="700">
                      Realise your potential </h6>
                  <h1 class="display-4 mb-4" data-aos="fade-left" data-aos-delay="100"
                      data-aos-duration="700">
                      ¿Quienes Somos?
                  </h1>
                  <p class="mb-5 w-lg-75" data-aos="fade-right" data-aos-delay="150" data-aos-duration="700">
                    El Centro de Metrología y Ensayos Técnicos (CEMET), es un
                    Laboratorio que ofrece servicio de pruebas físicas de calidad
                    para determinar la seguridad de sus productos bajo los
                    lineamientos de la norma NMX-EC-17025- IMNC-2018
                  </p>
                  <div data-aos="fade-up" data-aos-duration="700" data-aos-delay="200">
                      <a href="#" class="btn btn-primary btn-hover-arrow hover-lift"><span>Que ofrecemos</span></a>
                  </div>
              </div>
              <div class="col-lg-6 ms-auto position-relative">
                  <div class="rellax position-absolute top-0 mt-n3 end-0 width-16x h-auto" data-rellax-speed="-1" data-rellax-percentage=".9">
                      <img src="Content/assan/assets/img/vectors/pattern-dots3.svg" data-inject-svg
                      class=" fill-success w-100 h-auto" alt="">
                  </div>
                  <div class="position-relative ps-9 ps-lg-12 pb-9 pb-lg-12 pe-5 pt-5" data-aos="fade-right"
                      data-aos-delay="200" data-aos-duration="700">
                      <img src="Content/assan/assets/img/cemet/metro2.jpeg" alt=""
                          class="img-fluid rounded-4 shadow-lg position-relative">
                      <img src="Content/assan/assets/img/cemet/metrologia.jpeg" alt=""
                          class="img-fluid position-absolute shadow-lg rounded-4 bottom-0 start-0 w-lg-60 w-50">
                  </div>
              </div>
          </div>
      </div>
  </section>



      <!--begin: features icons-->
      <section class="position-relative border-bottom" id="next">
        <div class="container py-9 py-lg-11">
          <div class="row mb-9 mb-lg-11 justify-content-between align-items-end">
            <div class="col-lg-10 col-xl-8 mx-auto text-center">

              <!--begin:Section Heading-->
              <h2 class="display-5 mb-0" data-aos="fade-up">Nuestros Servicios
              </h2>
              <!--end:heading-->
            </div>
          </div>

          <div class="row pt-5">
            <!--Feature column-->
            <div class="col-12 col-lg-4 text-center" data-aos="fade-up" data-aos-delay="250">
              <!--begin:feature card-->
               <div class="position-relative card border-0 hover-shadow-xl hover-lift pt-0 p-4 rounded-4">
                   <div class="position-relative">
                       <!--Icon-->
                       <div class="mb-4 width-9x height-9x bg-danger text-white border border-4 border-white position-relative mt-n5 rounded-circle flex-center display-4 lh-1 fw-normal">
                           <i class="icon-Light-Bulb"></i>
                       </div>
                       <!--Heading-->
                       <h5 class="mb-3">Modern & Elegant</h5>
                       <!--text-->
                       <p class="mb-0">
                           Lorem ipsum is placeholder text commonly used in the graphic, print, and
                           publishing
                           industries for layouts and visual mockups.
                       </p>
                   </div>
               </div>
                <!--/end:feature card-->

           </div>

           <!--Feature column-->
           <div class="col-12 col-lg-4 text-center" data-aos="fade-up" data-aos-delay="250">
              <!--begin:feature card-->
               <div class="position-relative card border-0 hover-shadow-xl hover-lift pt-0 p-4 rounded-4">
                   <div class="position-relative">
                       <!--Icon-->
                       <div class="mb-4 width-9x height-9x bg-success text-white border border-4 border-white position-relative mt-n5 rounded-circle flex-center display-4 lh-1 fw-normal">
                           <i class="icon-People-onCloud"></i>
                       </div>
                       <!--Heading-->
                       <h5 class="mb-3">Built for Developers</h5>
                       <!--text-->
                       <p class="mb-0">
                           Lorem ipsum is placeholder text commonly used in the graphic, print, and
                           publishing
                           industries for layouts and visual mockups.
                       </p>
                   </div>
               </div>
                <!--/end:feature card-->

           </div>

          <!--Feature column-->
          <div class="col-12 col-lg-4 text-center" data-aos="fade-up" data-aos-delay="250">
             <!--begin:feature card-->
              <div class="position-relative card border-0 hover-shadow-xl hover-lift pt-0 p-4 rounded-4">
                  <div class="position-relative">
                      <!--Icon-->
                      <div class="mb-4 width-9x height-9x bg-primary text-white border border-4 border-white position-relative mt-n5 rounded-circle flex-center display-4 lh-1 fw-normal">
                          <i class="icon-Light-Bulb"></i>
                      </div>
                      <!--Heading-->
                      <h5 class="mb-3">Friendly Support</h5>
                      <!--text-->
                      <p class="mb-0">
                          Lorem ipsum is placeholder text commonly used in the graphic, print, and
                          publishing
                          industries for layouts and visual mockups.
                      </p>
                  </div>
              </div>
               <!--/end:feature card-->

          </div>
      </div>

        </div>
      </section>
      <!--end: features icons-->

      <!--begin: features image-->
      <section class="position-relative overflow-hidden">
        <div class="container py-9 py-lg-11 position-relative z-index-1">
          <div class="row align-items-center justify-content-between">
            <div class="order-last col-lg-6">

              <!--Subheading-->
              <div class="mb-4" data-aos="fade-up">
                 <!--Subheading-->
              <h6 class="mb-0 text-uppercase">¿POR QUÉ ELEGIRNOS?</h6>
              </div>
              <!--Section Heading-->
              <h2 class="mb-7 display-5 position-relative z-index-1" data-aos="fade-right">Designed for developers
              </h2>
              <div class="position-relative z-index-1">
                <!--Feature icon card-->
                <div class="d-flex mb-5" data-aos="fade-up" data-aos-delay="150">
                  <!--Feature icon-->
                  <div class="me-3">
                    <!--Icon-->
                    <i
                      class="bx bx-check lh-1 width-3x height-3x flex-center rounded-circle bg-light text-primary position-relative fs-4"></i>
                  </div>
                  <!--Feature text-->
                  <div>
                    <h5>
                      500+ Reusable components
                    </h5>
                    <p class="mb-0">
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ac turpis egestas maecenas pharetra convallis. 
                    </p>
                  </div>
                </div>
                <!--Feature icon card-->
                <div class="d-flex mb-5" data-aos="fade-up" data-aos-delay="200">
                  <!--Feature icon-->
                  <div class="me-3">
                    <!--Icon-->
                    <i
                      class="bx bx-check lh-1 width-3x height-3x flex-center rounded-circle bg-light text-primary position-relative fs-4"></i>

                  </div>

                  <!--Feature text-->
                  <div>
                    <h5>
                      Beautifully designed layouts
                    </h5>
                    <p class="mb-0">
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ac turpis egestas maecenas pharetra convallis. 
                    </p>
                  </div>
                </div>
                <!--Feature icon card-->
                <div class="d-flex mb-3" data-aos="fade-up" data-aos-delay="250">
                  <!--Feature icon-->
                  <div class="me-3">
                    <!--Icon-->
                    <i
                      class="bx bx-check lh-1 width-3x height-3x flex-center rounded-circle bg-light text-primary position-relative fs-4"></i>

                  </div>

                  <!--Feature text-->
                  <div>
                    <h5>
                      Clean & well coded
                    </h5>
                    <p class="mb-0">
                      Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ac turpis egestas maecenas pharetra convallis. 
                    </p>
                  </div>
                </div>
              </div>
              <div class="mt-5 text-end" data-aos="fade-up" data-aos-delay="250">
                <a href="#!" class="link-hover-underline text-body fw-bold">
                  <span>Learn more</span> <i class="bx bx-right-arrow-alt"></i>
                </a>
              </div>

            </div>
            <div class="col-lg-6 col-xl-5 col-md-10 me-lg-auto order-1 mb-7 mb-lg-0">
              <div class="position-relative" data-aos="fade-left" data-aos-delay="150">
                <div class="bg-warning position-absolute start-0 bottom-0 w-100 h-75 rounded-5"></div>

                <img src="Content/assan/assets/img/cemet/metro3.jpeg" alt="" class="img-fluid position-relative">
              </div>
            </div>
          </div>
        </div>
      </section>
      <!--end: features image-->



      <section class="position-relative">
        <div class="container py-9 py-lg-11">
            <div class="row">
                <div class="col-md-8 col-lg-7 mb-7 mb-md-0 me-auto">
                    <div class="position-relative">
                        <h1>
                          Contáctanos
                        </h1>
                        <p class="mb-3 w-lg-75">
                          Utilice el formulario de contacto si tiene preguntas sobre nuestros productos. Nuestro equipo de ventas estará encantado de ayudarle:
                        </p>
                        <div class="width-7x pt-1 bg-primary mb-5"></div>
                        <!-- Contacts Form -->
                        <form action="#" method="post" role="form" class="needs-validation mb-5 mb-lg-7"
                            novalidate>
                            <div class="row">
                                <!-- Input -->
                                <div class="col-sm-6 mb-3">
                                    <label class="form-label" for="name">Nombre</label>
                                    <input type="text" name="name" class="form-control" id="name"
                                        placeholder="John Doe" required>
                                </div>
                                <!-- End Input -->

                                <!-- Input -->
                                <div class="col-sm-6 mb-3">
                                    <label class="form-label" for="email">Correo electrónico</label>
                                    <input type="email" class="form-control" name="email" id="email"
                                        placeholder="john@gmail.com" id="email"
                                        aria-label="jackwayley@gmail.com" required>
                                    <div class="invalid-feedback">
                                        Please enter a valid email address
                                    </div>
                                </div>

                                <div class="w-100"></div>

                                <!-- Input -->

                                <!-- Services -->
                                <div class="col-sm-12 mb-3">
                                    <label class="form-label" for="subject">Teléfono</label>
                                    <input type="text" class="form-control" name="subject" id="subject"
                                        placeholder="Teléfono" required>
                                </div>
                                <!-- End Input -->
                            </div>

                            <!-- Message -->
                            <div class="mb-3">
                                <label for="message" class="form-label">Mensaje</label>
                                <textarea class="form-control" name="message" placeholder="Ingrese su mensaje"
                                    required></textarea>
                                <div class="invalid-feedback">
                                    Please enter a message in the textarea.
                                </div>
                            </div>

                            <div class="d-md-flex justify-content-between align-items-center">
                                <p class="small mb-4 text-muted mb-md-0">Nos pondremos en contacto con usted.</p>
                                <input type="submit" name="submit" value="Enviar mensaje" id="sendBtn"
                                    class="btn btn-lg btn-primary">
                            </div>
                        </form>
                        <!-- End Contacts Form -->

                        <!--Card-->
                        <div class="px-4 py-7 px-lg-5 py-lg-7 border border-2 rounded-3 position-relative"
                            data-aos="fade-up">
                            <div class="position-relative">

                                <h3 class="mb-4">¿Necesita atención al cliente?</h3>
                                <p class="w-lg-90 mb-5 lead">
                                  Si ya eres cliente nuestro, estaremos encantados de ayudarte en nuestro Servicio de Atención al Cliente.
                                </p>
                                <div class="width-6x pt-1 bg-success mb-5"></div>
                                <a href="#" class="btn btn-outline-primary btn-rise">
                                    <div class="btn-rise-bg bg-primary"></div>
                                    <div class="btn-rise-text">
                                        Atención al cliente
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div data-aos="fade-up">
                        <h4 class="mb-0">Contactos</h4>
                        <div class="border-top border-2 border-secondary mb-4 mt-2" data-aos="fade-up"></div>
                    </div>
                    <div data-aos="fade-up">
                        <h5>CEMET CDMX</h5>
                        <div class="position-relative">
                            <p><strong>NORTE 178, No 558, Col. PENSADOR MEXICANO</strong><br>VENUSTIANO CARRANZA,<br> CIUDAD DE MEXICO, CP 15510</p>
                            <p>Teléfono:&nbsp;(55) 88 695704
                              <br>Ing. Omar Castañeda Silva
                              <br>Gerente del Laboratorio
                              <br>Email: <a rel="noopener" href="#!">omarcs@cemet.com.mx</a>
                            </p>
                        </div>
                    </div>
                    <div class="border-top border-2 border-secondary my-4 my-lg-5" data-aos="fade-up"></div>
                    <div data-aos="fade-up">
                      <h5>CEMET CDMX</h5>
                      <div class="position-relative">
                          <p><strong>NORTE 178, No 558, Col. PENSADOR MEXICANO</strong><br>VENUSTIANO CARRANZA,<br> CIUDAD DE MEXICO, CP 15510</p>
                          <p>Teléfono:&nbsp;(55) 88 695704
                            <br>Lic. Lorena Lidé Libreros
                            <br>C. Coordinadora Administrativa/Calidad
                            <br>Email: <a rel="noopener" href="#!">lorenallc@cemet.com.mx</a>
                          </p>
                      </div>
                  </div>
                </div>
            </div>
        </div>
    </section>


    </main>
    <!--end:main content-->

    <!--begin:divider-->
    <svg class="position-relative start-0 bottom-0 text-dark flip-y" width="100%" height="36"
      xmlns="http://www.w3.org/2000/svg" viewBox="0 0 1440 152" fill="none" preserveAspectRatio="none">
      <path
        d="M126.597 138.74C99.8867 127.36 76.6479 109.164 59.2161 85.9798L0 3.05176e-05L1440 0C1440 0 1419.98 25.8404 1380.15 32.9584L211.382 150.811C182.549 154.283 153.308 150.12 126.597 138.74Z"
        fill="currentColor" />
    </svg>
    <!--end:divider-->


    <!--begin:Footer-->
    <footer id="footer" class="bg-dark footer text-white position-relative">
        <div class="container pt-9 pt-lg-11">
            <div class="row">
                <div class="col-md-12 col-lg-4 mb-5 h-100 me-auto">
                    <!--Title-->
                    <h2 class="display-6 mb-0 position-relative">
                        Work with us
                    </h2>
                    <div class="pt-3">
                        <a class="link-underline fs-5" href="mailto:mail@doamin.com">mail@domain.com</a>
                    </div>
                </div>
                <div class="col-sm-4 col-lg-2 mb-5 mb-md-0 ms-auto h-100">
                    <!--Title-->
                    <h6 class="small mb-3 mb-lg-4">Learn</h6>
                    <!--Nav-->
                    <ul class="nav flex-column mb-0">
                        <li class="nav-item"><a class="nav-link" href="#!">Design</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Digital</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Development</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Branding</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Graphics</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Process</a></li>
                    </ul>
                </div>
                <!--/.Col-->
                <div class="col-sm-4 col-lg-2 mb-5 h-100">
                    <!--Title-->
                    <h6 class="small mb-3 mb-lg-4">Resources</h6>
                    <!--Nav-->
                    <ul class="nav flex-column mb-0">
                        <li class="nav-item"><a class="nav-link" href="#!">Elements</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Pricing</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Features</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Blog</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Credits</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Updates</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Help center</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Events</a></li>
                    </ul>
                </div>
                <!--/.Col-->
                <div class="col-sm-4 col-lg-3 col-xl-2 mb-5 mb-sm-0 h-100">
                    <!--Title-->
                    <h6 class="small mb-3 mb-lg-4">Company</h6>
                    <!--Nav-->
                    <ul class="nav flex-column mb-0">
                        <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Awwards</a></li>
                        <li class="nav-item">
                            <a class="nav-link" href="#!">Careers
                                <span class="badge badge-pill ms-1 bg-primary">Hiring</span>
                            </a>
                        </li>
                        <li class="nav-item"><a class="nav-link" href="#!">Customers</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Affiliate</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Contact us</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Terms of use</a></li>
                        <li class="nav-item"><a class="nav-link" href="#!">Privacy policy</a></li>
                    </ul>
                </div>
                <!--/.Col-->
            </div>
            <hr class="mb-5 mt-0">
        </div> <!-- / .container -->
        <div class="pb-5">
            <div class="container">
                <div class="row justify-content-md-between align-items-center">
                    <div class="d-flex mb-3 mb-md-0 col-sm-6 col-md-4">
                        <!-- Social button -->
                        <a href="#!" class="d-inline-block mb-1 me-2 si rounded-pill si-hover-facebook">
                            <i class="bx bxl-facebook fs-5"></i>
                            <i class="bx bxl-facebook fs-5"></i>
                        </a>
                        <!-- Social button -->
                        <a href="#!" class="d-inline-block mb-1 me-2 si rounded-pill si-hover-twitter">
                            <i class="bx bxl-twitter fs-5"></i>
                            <i class="bx bxl-twitter fs-5"></i>
                        </a>
                        <!-- Social button -->
                        <a href="#!" class="d-inline-block mb-1 me-2 si rounded-pill si-hover-linkedin">
                            <i class="bx bxl-linkedin fs-5"></i>
                            <i class="bx bxl-linkedin fs-5"></i>
                        </a>
                        <!-- Social button -->
                        <a href="#!" class="d-inline-block mb-1 si rounded-pill si-hover-instagram">
                            <i class="bx bxl-instagram fs-5"></i>
                            <i class="bx bxl-instagram fs-5"></i>
                        </a>
                    </div>
                    <div class="col-sm-6 col-md-4 text-sm-end">
                        <span class="d-block lh-sm small text-muted">© Copyright
                            <script>
                                document.write(new Date().getFullYear())

                            </script>. Assan
                        </span>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <!--end:Footer-->


    <!-- begin:Back to Top button -->
    <a href="#" class="toTop">
      <i class="bx bxs-up-arrow"></i>
    </a>
    <!-- begin:Back to Top button -->


    <!-- scripts -->
    <script src="Content/assan/assets/js/theme.bundle.js"></script>

    <!--Mastert Slider start (Include jquery before master slider js)-->
    <script src="Content/assan/assets/vendor/node_modules/js/jquery.min.js"></script>
    <script src="Content/assan/assets/vendor/masterslider/jquery.easing.min.js"></script>
    <script src="Content/assan/assets/vendor/masterslider/masterslider.min.js"></script>
    <script>
      var slider = new MasterSlider();
      slider.setup('masterslider', {
        width: 1140,
        height: 660,
        minHeight: 400,
        space: 0,
        start: 1,
        grabCursor: false,
        layout: "fullwidth",
        wheel: false,
        autoplay: true,
        instantStartLayers: true,
        loop: true,
        view: "basic",
        instantStartLayers: true,
      });
      slider.control('arrows');

    </script>


    <!--Swiper slider-->
    <script src="Content/assan/assets/vendor/node_modules/js/swiper-bundle.min.js"></script>
    <script>
      //swiper-projects
      var swiperProjects = new Swiper(".swiper-projects", {
        autoHeight: true,
        spaceBetween: 16,
        centeredSlides:true,
        loop:true,
        breakpoints: {
          640: {
            slidesPerView: 1,
            spaceBetween: 16
          },
          768: {
            slidesPerView: 2,
            spaceBetween: 16
          },
          1024: {
            slidesPerView: 2,
            spaceBetween: 16
          }
        },
        pagination: {
          el: ".swiperProjects-pagination",
          clickable: true
        }
      });

      //swiper-testimonials
      var swiperAuto = new Swiper(".swiper-testimonials", {
        slidesPerView: "auto",
        loop: true,
        centeredSlides: true,
        spaceBetween: 0,
        grabCursor: true,
        pagination: {
          el: ".swiperAuto-pagination",
          clickable: true,
        },
        navigation: {
          nextEl: ".swiperAuto-button-next",
          prevEl: ".swiperAuto-button-prev",
        }
      });

    </script>
        <script>
          var swiperClassic = new Swiper(".swiper-classic", {
              slidesPerView: 1, spaceBetween: 0,
              loop: true, autoplay: { delay: 2500 },
              effect: "creative",
              creativeEffect: {
                  prev: {
                      shadow: true,
                      translate: ["-20%", 0, -1],
                  },
                  next: {
                      translate: ["100%", 0, 0],
                  },
              },
              pagination: {
                  el: ".swiperClassic-pagination",
                  clickable:true
              },
              navigation: { nextEl: ".swiperClassic-button-next", prevEl: ".swiperClassic-button-prev" }
          });
      </script>

  </body>

</html>
