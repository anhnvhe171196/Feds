<%-- 
    Document   : SalesManagement
    Created on : May 20, 2024, 4:34:57 PM
    Author     : rimok
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="entities.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>OrderProcessor</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="OPlib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="OPlib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min_OP.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/OrderProcessor.css" rel="stylesheet">
    </head>
    <body>
        <c:choose>
            <c:when test="${sessionScope.account != null && sessionScope.account.getRole_id() >= 1 && sessionScope.account.getRole_id() <= 4}">
                <div class="container-xxl position-relative bg-white d-flex p-0">
                    <!-- Sidebar Start -->
                    <div class="sidebar pe-4 pb-3">
                        <nav class="navbar bg-light navbar-light">
                            <a href="index.html" class="navbar-brand mx-4 mb-3">
                                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>Marketing</h3>
                            </a>
                            <div class="d-flex align-items-center ms-4 mb-4">
                                <div class="position-relative">
                                    <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                    <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                                </div>
                                <div class="ms-3">
                                    <h6 class="mb-0">${sessionScope.account.getUser_name()}</h6>

                                    <span>Marketing</span>
                                </div>
                            </div>
                            <div class="navbar-nav w-100">
                                <a href="OrderProcessor.jsp" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                                <a href="#" class="nav-item nav-link active"><i class="fa fa-table me-2"></i>Tables</a>
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Pages</a>
                                    <div class="dropdown-menu bg-transparent border-0">
                                        <a href="login.jsp" class="dropdown-item">Sign In</a>
                                        <a href="register.jsp" class="dropdown-item">Sign Up</a>
                                        <a href="404.html" class="dropdown-item">404 Error</a>
                                        <a href="blank.html" class="dropdown-item">Blank Page</a>
                                    </div>
                                </div>
                            </div>
                        </nav>
                    </div>
                    <!-- Sidebar End -->


                    <!-- Content Start -->
                    <div class="content">
                        <!-- Navbar Start -->
                        <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                            <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                                <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                            </a>
                            <a href="#" class="sidebar-toggler flex-shrink-0">
                                <i class="fa fa-bars"></i>
                            </a>
                            <form class="d-none d-md-flex ms-4">
                                <input class="form-control border-0" type="search" placeholder="Search">
                            </form>
                            <div class="navbar-nav align-items-center ms-auto">
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                        <i class="fa fa-envelope me-lg-2"></i>
                                        <span class="d-none d-lg-inline-flex">Message</span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">

                                        <hr class="dropdown-divider">
                                        <a href="#" class="dropdown-item text-center">See all message</a>
                                    </div>
                                </div>
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                        <i class="fa fa-bell me-lg-2"></i>
                                        <span class="d-none d-lg-inline-flex">Notificatin</span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">

                                        <hr class="dropdown-divider">
                                        <a href="#" class="dropdown-item text-center">See all notifications</a>
                                    </div>
                                </div>
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                        <img class="rounded-circle me-lg-2" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <span class="d-none d-lg-inline-flex">${sessionScope.account.getUser_name()}</span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                        <a href="roleProfile.jsp" class="dropdown-item">My Profile</a>
                                        <a href="#" class="dropdown-item">Settings</a>
                                        <a href="login.jsp" class="dropdown-item">Log Out</a>
                                    </div>
                                </div>
                            </div>
                        </nav>
                        <!-- Navbar End -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="row g-4">
                                <div class="col-sm-12">
                                    <div class="bg-light rounded h-100 p-4">
                                        <h6 class="mb-4">Products list</h6>
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">First Name</th>
                                                    <th scope="col">Last Name</th>
                                                    <th scope="col">Email</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-6">
                                    <div class="bg-light rounded h-100 p-4">
                                        <h6 class="mb-4">Accented Table</h6>
                                        <table class="table table-striped">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">First Name</th>
                                                    <th scope="col">Last Name</th>
                                                    <th scope="col">Email</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-6">
                                    <div class="bg-light rounded h-100 p-4">
                                        <h6 class="mb-4">Hoverable Table</h6>
                                        <table class="table table-hover">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">First Name</th>
                                                    <th scope="col">Last Name</th>
                                                    <th scope="col">Email</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-6">
                                    <div class="bg-light rounded h-100 p-4">
                                        <h6 class="mb-4">Color Table</h6>
                                        <table class="table table-dark">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">First Name</th>
                                                    <th scope="col">Last Name</th>
                                                    <th scope="col">Email</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-6">
                                    <div class="bg-light rounded h-100 p-4">
                                        <h6 class="mb-4">Bordered Table</h6>
                                        <table class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">First Name</th>
                                                    <th scope="col">Last Name</th>
                                                    <th scope="col">Email</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                                <div class="col-sm-12 col-xl-6">
                                    <div class="bg-light rounded h-100 p-4">
                                        <h6 class="mb-4">Table Without Border</h6>
                                        <table class="table table-borderless">
                                            <thead>
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">First Name</th>
                                                    <th scope="col">Last Name</th>
                                                    <th scope="col">Email</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                
                                        </table>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="bg-light rounded h-100 p-4">
                                        <h6 class="mb-4">Responsive Table</h6>
                                        <div class="table-responsive">
                                            <table class="table">
                                                <thead>
                                                    <tr>
                                                        <th scope="col">#</th>
                                                        <th scope="col">First Name</th>
                                                        <th scope="col">Last Name</th>
                                                        <th scope="col">Email</th>
                                                        <th scope="col">Country</th>
                                                        <th scope="col">ZIP</th>
                                                        <th scope="col">Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>



                        <!-- Back to Top -->
                        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div id="notfound">
                        <div class="notfound" style="text-align: center">
                            <div class="notfound-404">
                                <h1 style="font-family: 'Montserrat', sans-serif;
                                    font-size: 230px;
                                    margin: 0px;
                                    font-weight: 900;
                                    position: absolute;
                                    left: 50%;
                                    -webkit-transform: translateX(-50%);
                                    -ms-transform: translateX(-50%);
                                    transform: translateX(-50%);
                                    background: url('images/bg_2.jpg') no-repeat;
                                    -webkit-background-clip: text;
                                    -webkit-text-fill-color: transparent;
                                    background-size: cover;">Oops!</h1>
                            </div>
                            <div style="margin-top: 150px;padding: 272px;">
                                <h2 style=" font-family: 'Montserrat', sans-serif;
                                    color: #000;
                                    font-size: 24px;
                                    font-weight: 700;
                                    text-transform: uppercase;
                                    margin-top: 0;">Looks like you don't have access!</h2>
                                <p style="font-family: 'Montserrat', sans-serif;
                                   color: #000;
                                   font-size: 14px;
                                   font-weight: 400;
                                   margin-bottom: 20px;
                                   margin-top: 0px;">The page you are looking for might have been removed had its name changed or is temporarily unavailable.</p>
                                <a style="font-family: 'Montserrat', sans-serif;
                                   font-size: 14px;
                                   text-decoration: none;
                                   text-transform: uppercase;
                                   background: #0046d5;
                                   display: inline-block;
                                   padding: 15px 30px;
                                   border-radius: 40px;
                                   color: #fff;
                                   font-weight: 700;
                                   -webkit-box-shadow: 0px 4px 15px -5px #0046d5;
                                   box-shadow: 0px 4px 15px -5px #0046d5;" href="home">Go To Homepage</a>
                            </div>
                        </div>

                    </div>
                </c:otherwise>
            </c:choose>


            <!-- JavaScript Libraries -->
            <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
            <script src="OPlib/chart/chart.min.js"></script>
            <script src="OPlib/easing/easing.min.js"></script>
            <script src="OPlib/waypoints/waypoints.min.js"></script>
            <script src="OPlib/owlcarousel/owl.carousel.min.js"></script>
            <script src="OPlib/tempusdominus/js/moment.min.js"></script>
            <script src="OPlib/tempusdominus/js/moment-timezone.min.js"></script>
            <script src="OPlib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

            <!-- Template Javascript -->
            <script src="js/main.js"></script>
    </body>
</html>
