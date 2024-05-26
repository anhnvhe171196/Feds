<%-- 
    Document   : header
    Created on : May 22, 2024, 1:03:52 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick-theme.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/nouislider.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>


    </head>
    <body>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <header>
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="#"><i class="fa fa-phone"></i> 0357129704</a></li>
                        <li><a href="#"><i class="fa fa-envelope-o"></i> Feds@gmail.com</a></li>
                        <li><a href="#"><i class="fa fa-map-marker"></i>Thạch Thất, Hà Nội</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <!--<li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>-->
                        <div class="menu-container">
                            <c:if test="${sessionScope.account == null}">
                                <a href="login">
                                    <i class="fa fa-user-o"></i>
                                </a>
                                <a href="login"><button class="menu-button" style="background-color: red">Login</button></a>
                            </c:if>
                            <c:if test="${sessionScope.account != null}">
                                <a class="fa" href="userProfile"><img style="width: 23px;border-radius: 20px;" src="images/${sessionScope.account.avarta}" alt="alt"/></a>
                                <li>
                                    <div class="menu-container">
                                        <button class="menu-button" style="background-color: red">My Account</button>
                                        <div class="menu">
                                            <ul>
                                                <li><a href="userProfile">Hồ sơ cá nhân</a></li>
                                                <li><a href="userChangeProfile">Thay đổi hồ sơ cá nhân</a></li>
                                                    <c:if test="${sessionScope.account != null && sessionScope.account.getRole_id() == 4}">
                                                    <li><a href="MarketingDashBoard">Marketing Management</a></li>
                                                    </c:if>

                                                <li><a href="changePassword">Thay đổi mật khẩu</a></li>
                                                <li><a href="userLogout">Đăng xuất</a></li>
                                            </ul>
                                        </div>
                                    </div>
                                </li>

                            </c:if>

                        </div>
                        </li>

                        </a>
                        </li>
                    </ul>
                </div>
            </div>
            <!-- /TOP HEADER -->

            <!-- MAIN HEADER -->
            <div id="header">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <!-- LOGO -->
                        <div class="col-md-2">  
                            <div class="header-logo">
                                <a href="home" class="logo">
                                    <img style="width: 50%;border-radius: 100px;" src="images/logo.jpg" alt="alt"/>
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="row col-md-7">
                            <div class="header-search">

                                <form class="col-md-4">
                                    <select class="input-select" name="cateid"  style="    width: 216px;">
                                        <option value="" selected>Loại Sản Phẩm</option>
                                        <c:forEach items="${sessionScope.cates}" var="cate">

                                            <option type ="submit" href="PostList?cateid=${cate.getCategory_id()}">${cate.getCategory_name()}</option>
                                        </c:forEach>
                                    </select>
                                </form>                                    
                                <form method="get" class="col-md-8" action="ListCategory">
                                    <input name="search" class="input" placeholder="Search here" style="width: 200px">
                                    <button type="submit" class="search-btn">Search</button>
                                </form>


                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Wishlist -->
                                <div>
                                    <a href="#">
                                        <i class="fa fa-heart-o"></i>
                                        <span>Your Wishlist</span>
                                        <div class="qty">2</div>
                                    </a>
                                </div>
                                <!-- /Wishlist -->

                                <!-- Cart -->
                                <div class="dropdown">
                                    <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Your Cart</span>
                                        <div class="qty">3</div>
                                    </a>
                                    <div class="cart-dropdown">
                                        <div class="cart-list">
                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="${pageContext.request.contextPath}/./img/product01.png" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                                    <h4 class="product-price"><span class="qty">1x</span>$980.00</h4>
                                                </div>
                                                <button class="delete"><i class="fa fa-close"></i></button>
                                            </div>

                                            <div class="product-widget">
                                                <div class="product-img">
                                                    <img src="./img/product02.png" alt="">
                                                </div>
                                                <div class="product-body">
                                                    <h3 class="product-name"><a href="#">product name goes here</a></h3>
                                                    <h4 class="product-price"><span class="qty">3x</span>$980.00</h4>
                                                </div>
                                                <button class="delete"><i class="fa fa-close"></i></button>
                                            </div>
                                        </div>
                                        <div class="cart-summary">
                                            <small>3 Item(s) selected</small>
                                            <h5>SUBTOTAL: $2940.00</h5>
                                        </div>
                                        <div class="cart-btns">
                                            <a href="#">View Cart</a>
                                            <a href="#">Checkout  <i class="fa fa-arrow-circle-right"></i></a>
                                        </div>
                                    </div>
                                </div>
                                <!-- /Cart -->

                                <!-- Menu Toogle -->
                                <div class="menu-toggle">
                                    <a href="#">
                                        <i class="fa fa-bars"></i>
                                        <span>Menu</span>
                                    </a>
                                </div>
                                <!-- /Menu Toogle -->
                            </div>
                        </div>
                        <!-- /ACCOUNT -->
                    </div>
                    <!-- row -->
                </div>
                <!-- container -->
            </div>
            <!-- /MAIN HEADER -->

            <script src="js/jquery.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/slick.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/nouislider.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery.zoom.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/main.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery.magnific-popup.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery.slicknav.js"></script>
            <script src="${pageContext.request.contextPath}/js/owl.carousel.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/jquery.nice-select.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/mixitup.min.js"></script>
            <script src="${pageContext.request.contextPath}/js/home.js"></script>

        </header>

    </body>
</html>
