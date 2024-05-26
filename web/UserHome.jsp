<%-- 
    Document   : home
    Created on : May 20, 2024, 9:40:45 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick-theme.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/nouislider.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
        <link rel="stylesheet" href="css/home.css" type="text/css">

    </head>
    <body>
        <!-- /HEADER -->
        <%@include file="component/header.jsp"%>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <%@include file = "component/navbar.jsp"%>
        <!-- /NAVIGATION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- shop -->
                    <div
                        <!--                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="${pageContext.request.contextPath}/./images/shop01.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Laptop<br>Mới nhất</h3>
                                <a href="#" class="cta-btn">Mua ngay <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="${pageContext.request.contextPath}/./images/shop03.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Phụ Kiện<br>Nổi bật</h3>
                                <a href="#" class="cta-btn">Mua ngay<i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="${pageContext.request.contextPath}/./images/shop02.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Hàng Cũ<br>Giá tốt</h3>
                                <a href="#" class="cta-btn">Mua ngay <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">Sản phẩm mới</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">

                                    <li class="active"><a data-toggle="tab" href="#tab1">Laptops</a></li>
                                    <li><a data-toggle="tab" href="#tab1">Điện Thoại</a></li>
                                    <li><a data-toggle="tab" href="#tab2">Máy Tính Bảng</a></li>
                                    <li><a data-toggle="tab" href="#tab3">PC</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab1" class="tab-pane active">
                                    <div class="products-slick" data-nav="#slick-nav-1">
                                        <!-- product -->
                                        <div class="product col-md-3">
                                            <div class="product-img">
                                                <img src="${pageContext.request.contextPath}/./images/product01.png" alt="">
                                                <div class="product-label">
                                                    <span class="sale">-30%</span>
                                                    <span class="new">Mới</span>
                                                </div>
                                            </div>
                                            <div class="product-body ">
                                                <p class="product-category">Laptops</p>
                                                <h3 class="product-name"><a href="#">Laptop ASUS VivoBook</a></h3>
                                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="product-btns">
                                                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Yêu Thích</span></button>
                                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                    <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem ngay</span></button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart">
                                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                            </div>
                                        </div>
                                        <!-- /product -->

                                        <!-- product -->
                                        <div class="product col-md-3">
                                            <div class="product-img">
                                                <img src="${pageContext.request.contextPath}/./images/product06.png" alt="">
                                                <div class="product-label">
                                                    <span class="sale">-30%</span>
                                                    <span class="new">Mới</span>
                                                </div>
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">Phụ Kiện</p>
                                                <h3 class="product-name"><a href="#">Tên sản phẩm</a></h3>
                                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                                <div class="product-btns">
                                                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Yêu Thích</span></button>
                                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                    <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">Xem ngay</span></button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart">
                                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i>Thêm vào giỏ hàng</button>
                                            </div>
                                        </div>
                                        <!-- /product -->

                                        <!-- product -->
                                        <div class="product col-md-3">
                                            <div class="product-img">
                                                <img src="${pageContext.request.contextPath}/./images/product03.png" alt="">
                                                <div class="product-label">
                                                    <span class="sale">-30%</span>
                                                    <span class="new">Mới</span>
                                                </div>
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">Category</p>
                                                <h3 class="product-name"><a href="#">Tên sản phẩm</a></h3>
                                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>

                                                </div>
                                                <div class="product-btns">
                                                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Yêu thích</span></button>
                                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                    <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">XEM ngay</span></button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart">
                                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                            </div>
                                        </div>
                                        <!-- /product -->

                                        <!-- product -->
                                        <div class="product col-md-3">
                                            <div class="product-img">
                                                <img src="${pageContext.request.contextPath}/./images/product08.png" alt="">
                                                <div class="product-label">
                                                    <span class="sale">-30%</span>
                                                    <span class="new">Mới</span>
                                                </div>
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">LAPTOPS</p>
                                                <h3 class="product-name"><a href="#">TÊN SẢN PHẨM</a></h3>
                                                <h4 class="product-price">$980.00 <del class="product-old-price">$990.00</del></h4>
                                                <div class="product-rating">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                </div>
                                                <div class="product-btns">
                                                    <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">Yêu thích</span></button>
                                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>
                                                    <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">xem ngay</span></button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart">
                                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> thêm vào giỏ hàng</button>
                                            </div>
                                        </div>
                                        <!-- /product -->


                                        <!-- /product -->
                                    </div>
                                    <div id="slick-nav-1" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- HOT DEAL SECTION -->

        <!-- /HOT DEAL SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">

                    <!-- section title -->
                    <div class="col-md-12">
                        <div class="section-title">
                            <h3 class="title">SẢN PHẨM BÁN CHẠY NHẤT</h3>
                            <!--                            <div class="section-nav">
                                                            <ul class="section-tab-nav tab-nav">
                                                                <li class="active"><a data-toggle="tab" href="#tab2">Tất cả</a></li>
                                                                <li><a data-toggle="tab" href="#tab2">Laptops</a></li>
                                                                <li><a data-toggle="tab" href="#tab2">Điện Thoại</a></li>
                                                                <li><a data-toggle="tab" href="#tab2">Máy tính bảng</a></li>
                                                                <li><a data-toggle="tab" href="#tab2">PC</a></li>
                                                            </ul>
                                                        </div>-->
                        </div>
                    </div>
                    <!-- /section title -->

                    <!-- Products tab & slick -->
                    <div class="col-md-12">
                        <div class="row">
                            <div class="products-tabs">
                                <!-- tab -->
                                <div id="tab2" class="tab-pane fade in active">
                                    <div class="products-slick" data-nav="#slick-nav-2">                                           
                                        <c:forEach items="${sessionScope.list}" var="l" varStatus="status">
                                            <c:if test="${status.index < 4}"> 
                                                <!-- product -->
                                                <div class="product col-md-3">
                                                    <div class="product-img" style="height: 250px;">
                                                        <img src="${pageContext.request.contextPath}/./images/${l.getProduct_img()}" alt="">
                                                        <div class="product-label">
                                                            <span class="sale">-30%</span>
                                                            <span class="new">Mới</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-body ">
                                                        <p class="product-category">${l.getCategory_name()}</p>
                                                        <h3 class="product-name"><a href="#">${l.getProduct_name()}</a></h3>
                                                        <h4 class="product-price">${l.getPrice()}<del class="product-old-price">$990.00</del></h4>
                                                        <div class="product-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                        </div>
                                                        <div class="product-btns">
                                                            <button class="add-to-wishlist"><i class="fa fa-heart-o"></i><span class="tooltipp">yêu thích </span></button>
                                                            <!--                                                    <button class="add-to-compare"><i class="fa fa-exchange"></i><span class="tooltipp">add to compare</span></button>-->
                                                            <button class="quick-view"><i class="fa fa-eye"></i><span class="tooltipp">xem ngay</span></button>
                                                        </div>
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm vào giỏ hàng</button>
                                                    </div>
                                                </div>
                                            </c:if>
                                        </c:forEach>
                                    </div>
                                    <div id="slick-nav-2" class="products-slick-nav"></div>
                                </div>
                                <!-- /tab -->
                            </div>
                        </div>
                    </div>
                    <!-- /Products tab & slick -->
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- SECTION -->
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Sản phẩm bán chạy</h4>
                            <div class="section-nav">
                                <div id="slick-nav-3" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-3">      
                            <div>
                                <c:forEach items="${sessionScope.list}" var="l" varStatus="status">
                                    <c:if test="${status.index < 4}">
                                        <!-- product widget -->
                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="${pageContext.request.contextPath}/./images/${l.getProduct_img()}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">${l.getCategory_name()}</p>
                                                <h3 class="product-name"><a href="#">${l.getProduct_name()}</a></h3>
                                                <h4 class="product-price">${l.getPrice()} <del class="product-old-price">$990.00</del></h4>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>

                        </div>
                    </div>

                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Điện Thoại giá rẻ</h4>
                            <div class="section-nav">
                                <div id="slick-nav-4" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-4">
                            <div>
                                <c:forEach items="${sessionScope.phone}" var="p" varStatus="status">
                                    <c:if test="${status.index < 4}">
                                <!-- product widget -->
                                <div class="product-widget">
                                    <div class="product-img">
                                        <img src="${pageContext.request.contextPath}/./images/${p.getProduct_img()}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">${p.getCategory_name()}</p>
                                        <h3 class="product-name"><a href="#">${p.getProduct_name()}</a></h3>
                                        <h4 class="product-price">${p.getPrice()} <del class="product-old-price">$990.00</del></h4>
                                    </div>
                                </div>
                                </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <div class="clearfix visible-sm visible-xs"></div>

                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">TIvi Cấu hình cao</h4>
                            <div class="section-nav">
                                <div id="slick-nav-5" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-5">
                            <div>
                                <c:forEach items="${sessionScope.tivi}" var="t" varStatus="status">
                                    <c:if test="${status.index < 4}">
                                <!-- product widget -->
                                <div class="product-widget">
                                    <div class="product-img">
                                        <img src="${pageContext.request.contextPath}/./images/${t.getProduct_img()}" alt="">
                                    </div>
                                    <div class="product-body">
                                        <p class="product-category">${t.getCategory_name()}</p>
                                        <h3 class="product-name"><a href="#">${t.getProduct_name()}</a></h3>
                                        <h4 class="product-price">${t.getPrice()} <del class="product-old-price">$990.00</del></h4>
                                    </div>
                                </div>
                                <!-- /product widget -->
                                </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <!-- /SECTION -->

        <!-- NEWSLETTER -->

        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <%@include file="component/footer.jsp" %>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/slick.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/nouislider.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/jquery.zoom.min.js"></script>
        <script src="${pageContext.request.contextPath}/js/main.js"></script>


    </body>
</html>
