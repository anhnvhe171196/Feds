
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
        <title>Home</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick-theme.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/nouislider.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css"/>

    </head>
    <body>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <header class="header">
            <!-- TOP HEADER -->
            <div id="top-header">
                <div class="container">
                    <ul class="header-links pull-left">
                        <li><a href="contact"><i class="fa fa-phone"></i> 0357129704</a></li>
                        <li><a href="contact"><i class="fa fa-envelope-o"></i> Feds@gmail.com</a></li>
                        <li><a href="contact"><i class="fa fa-map-marker"></i>Thạch Thất, Hà Nội</a></li>
                    </ul>
                    <ul class="header-links pull-right">
                        <!--<li><a href="#"><i class="fa fa-dollar"></i> USD</a></li>-->
                        <div class="menu-container">
                            <c:if test="${sessionScope.account == null}">
                                <a href="${pageContext.request.contextPath}/login">
                                    <i class="fa fa-user-o" style="color: red"></i>
                                </a>
                                <a href="${pageContext.request.contextPath}/login"><button class="menu-button" >Đăng nhập</button></a>
                            </c:if>
                            <c:if test="${sessionScope.account != null}">
                                <a class="fa" href="${pageContext.request.contextPath}/userProfile"><img style="width: 23px;border-radius: 20px;" src="${pageContext.request.contextPath}/images/${sessionScope.account.avarta}" alt="alt"/></a>
                                <li>
                                    <div class="menu-container">
                                        <button class="menu-button" style="font-weight: bold">My Account</button>
                                        <div class="menu">
                                            <ul>
                                                <li><a href="${pageContext.request.contextPath}/userProfile">Hồ sơ cá nhân</a></li>
                                                <li><a href="${pageContext.request.contextPath}/userChangeProfile">Thay đổi hồ sơ cá nhân</a></li>
                                                    <c:if test="${sessionScope.account != null && sessionScope.account.role.id == 4}">
                                                    <li><a href="${pageContext.request.contextPath}/marketingDashBoard">Marketing Management</a></li>
                                                    </c:if>
                                                    <c:if test="${sessionScope.account != null && sessionScope.account.role.id == 1}">
                                                    <li><a href="${pageContext.request.contextPath}/admin/dashboard">Admin Dashboard</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/marketingDashBoard">Marketing Dashboard</a></li>
                                                    <li><a href="${pageContext.request.contextPath}/saleDashboard">Sale Dashboard</a></li>
                                                    </c:if>
                                                    <c:if test="${sessionScope.account != null && sessionScope.account.role.id == 3}">
                                                    <li><a href="${pageContext.request.contextPath}/saleDashboard">Quản Lý Bán Hàng</a></li>
                                                    </c:if>
                                                <li><a href="viewmyorder">Lịch sử giao dịch</a></li>
                                                <li><a href="${pageContext.request.contextPath}/changePassword">Thay đổi mật khẩu</a></li>
                                                <li><a href="${pageContext.request.contextPath}/userLogout">Đăng xuất</a></li>
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
                                <a href="${pageContext.request.contextPath}/home" class="logo">
                                    <img style="width: 50%;border-radius: 100px;" src="${pageContext.request.contextPath}/images/logo_2.jpg" alt="alt"/>
                                </a>
                            </div>
                        </div>
                        <!-- /LOGO -->

                        <!-- SEARCH BAR -->
                        <div class="row col-md-7">
                            <div class="header-search">
                                <script>
                                    function ChangeCate(e) {

                                        window.location.href = "${pageContext.request.contextPath}/ListProduct?cateid=" + e.value + "<c:if test="${param.search != null}">&search=${param.search}</c:if>";
                                            }
                                    </script>
                                    <!--                                    <form class="col-md-4">
                                                                            <select class="input-select" name="cateid"  style="width: 216px;" onchange="ChangeCate(this)">
                                                                                <option selected>Loại Sản Phẩm</option>
                                <c:forEach items="${sessionScope.cates}" var="cate">

                                    <option value="${cate.getCategory_id()}">${cate.getCategory_name()}</option>
                                </c:forEach>
                            </select>
                        </form>                                    -->



                                <form class="col-md-4">
                                    <select class="input-select" name="cateid" style="width: 216px;" onchange="ChangeCate(this)">
                                        <c:choose>
                                            <c:when test="${empty param.cateid}">
                                                <option selected>Loại Sản Phẩm</option>
                                            </c:when>
                                            <c:otherwise>
                                                <option>Loại Sản Phẩm</option>
                                            </c:otherwise>
                                        </c:choose>
                                        <c:forEach items="${sessionScope.cates}" var="cate">
                                            <option value="${cate.getCategory_id()}"
                                                    <c:if test="${param.cateid == cate.getCategory_id()}">selected</c:if>>
                                                ${cate.getCategory_name()}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </form>


                                <form method="get" class="col-md-8" action="ListProduct">
                                    <input name="search" class="input" placeholder="Search here" style="width: 200px" value="<c:if test="${param.search != null}">${param.search}</c:if>">
                                    <c:if test="${param.cateid != null}">
                                        <input name="cateid" type="hidden" value="${param.cateid}">
                                    </c:if>
                                    <button type="submit" class="search-btn">Search</button>
                                </form>


                            </div>
                        </div>
                        <!-- /SEARCH BAR -->

                        <!-- ACCOUNT -->
                        <div class="col-md-3 clearfix">
                            <div class="header-ctn">
                                <!-- Wishlist -->
                                <!--                                <div>
                                                                    <a href="#">
                                                                        <i class="fa fa-heart-o"></i>
                                                                        <span>Yêu Thích</span>
                                                                        <div class="qty">2</div>
                                                                    </a>
                                                                </div>-->
                                <!-- /Wishlist -->

                                <!-- Cart -->
                                <div class="dropdown">
                                    <a href="cart" aria-expanded="true">
                                        <i class="fa fa-shopping-cart"></i>
                                        <span>Giỏ Hàng</span>
                                        <div class="qty">${sessionScope.size}</div>
                                    </a>
                                </div>
                                <!--                                <div class="dropdown">
                                                                    <a href="cart">
                                                                        <a class="dropdown-toggle" data-toggle="dropdown" aria-expanded="true">
                                                                        <i class="fa fa-shopping-cart"></i>
                                                                        <span>Giỏ Hàng</span>
                                                                        <div class="qty">${requestScope.size}</div>
                                                                    </a>
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
                                                                                    <img src="${pageContext.request.contextPath}/./img/product02.png" alt="">
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
                                                                </div>-->
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
            <script src="../js1/jquery.min.js"></script>
            <script src="../js1/bootstrap.min.js"></script>
            <script src="../js1/slick.min.js"></script>
            <script src="../js1/nouislider.min.js"></script>
            <script src="../js1/jquery.zoom.min.js"></script>
            <script src="../js1/main.js"></script>

        </header>

    </body>
</html>
