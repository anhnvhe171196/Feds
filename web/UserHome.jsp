<%-- 
    Document   : home
    Created on : May 20, 2024, 9:40:45 PM
    Author     : admin
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
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
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="images/shop01.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Laptop<br>Mới nhất </h3>
                                <a href="ListProduct?cateid=2" class="cta-btn">Mua ngay <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="images/shop03.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Phụ Kiện<br>Đa dạng</h3>
                                <a href="ListProduct?cateid=6" class="cta-btn">Mua ngay <i class="fa fa-arrow-circle-right"></i></a>
                            </div>
                        </div>
                    </div>
                    <!-- /shop -->

                    <!-- shop -->
                    <div class="col-md-4 col-xs-6">
                        <div class="shop">
                            <div class="shop-img">
                                <img src="images/shop02.png" alt="">
                            </div>
                            <div class="shop-body">
                                <h3>Hàng Cũ<br>Giá rẻ</h3>
                                <a href="ListProduct?cateid=9" class="cta-btn">Mua ngay <i class="fa fa-arrow-circle-right"></i></a>
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
                            <h3 class="title">Sản Phẩm Mới</h3>
                            
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
                                        <c:forEach items="${sessionScope.newproduct}" var="np" varStatus="status">

                                            <c:if test="${status.index < 10}">

                                                <div class="product">
                                                    <div class="product-img" style="height: 250px">
                                                        <img src="images/${np.getProduct_img()}" alt="">
                                                        <div class="product-label">
                                                            <span class="new">Mới</span>
                                                        </div>
                                                    </div>
                                                    <div class="product-body">
                                                        <p class="product-category">${np.getCategory_name()}</p>
                                                        <h3 class="product-name" style="height: 50px"><a href="product?pid=${np.getProduct_id()}">${np.getProduct_name()}</a></h3>



                                                        <h4 class="product-price"><fmt:formatNumber value="${np.getPrice()}" pattern="#,###" />VNĐ <del class="product-old-price"> </del></h4>

                                                        <div class="product-rating">
                                                            <!--                                                        <i class="fa fa-star"></i>
                                                                                                                    <i class="fa fa-star"></i>
                                                                                                                    <i class="fa fa-star"></i>
                                                                                                                    <i class="fa fa-star"></i>
                                                                                                                    <i class="fa fa-star"></i>-->
                                                        </div>
                                                        <div class="product-btns">

                                                            <button class="quick-view"><a href="product?pid=${np.getProduct_id()}"><i class="fa fa-eye"></i></a><span class="tooltipp">Xem ngay</span></button>
                                                        </div>
                                                    </div>
                                                    <div class="add-to-cart">
                                                        <form method="post">
                                                            <button type="submit" formaction="addToCart?pid=${np.getProduct_id()}" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm Vào giỏ hàng</button>
                                                        </form>                                               
                                                    </div>
                                                </div>
                                                <!-- /product -->
                                            </c:if>
                                        </c:forEach>
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
        <div id="hot-deal" class="section" style="background-image: url(./images/hotdeal.png)">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <div class="col-md-12">
                        <div class="hot-deal">
                            <ul class="hot-deal-countdown">
                                <li>
                                    <div>
                                        <h3>02</h3>
                                        <span>Ngày</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>10</h3>
                                        <span>Giờ</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>34</h3>
                                        <span>Phút</span>
                                    </div>
                                </li>
                                <li>
                                    <div>
                                        <h3>60</h3>
                                        <span>Giây</span>
                                    </div>
                                </li>
                            </ul>
                            <h2 class="text-uppercase">Sản phẩm ưu đãi lớn</h2>
                            <p>Bộ sưu tập mới giảm đến 50%</p>
                            <a class="primary-btn cta-btn" href="#">Mua ngay</a>
                        </div>
                    </div>
                </div>
                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
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
                            <h3 class="title">Sản phẩm bán chạy nhất</h3>
                            <div class="section-nav">
                                <ul class="section-tab-nav tab-nav">
                                    <!--                                    <li class="active"><a data-toggle="tab" href="#tab2">Laptops</a></li>
                                                                        <li><a data-toggle="tab" href="#tab2">Smartphones</a></li>
                                                                        <li><a data-toggle="tab" href="#tab2">Cameras</a></li>
                                                                        <li><a data-toggle="tab" href="#tab2">Accessories</a></li>-->
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
                                <div id="tab2" class="tab-pane fade in active">
                                    <div class="products-slick" data-nav="#slick-nav-2">
                                        <!-- product -->
                                        <c:forEach items="${sessionScope.list}" var="l" varStatus="status">


                                            <div class="product">

                                                <div class="product-img" style="height: 270px" onclick="ProductDetail(${l.getProduct_id()})">
                                                    <img src="images/${l.getProduct_img()}" alt="">
                                                    <div class="product-label">
                                                        <!--                                                            <span class="sale">-30%</span>-->
                                                        <span class="new">HOT</span>
                                                    </div>
                                                </div>
                                                <div class="product-body"  onclick="ProductDetail(${l.getProduct_id()})">
                                                    <p class="product-category">${l.getCategory_name()}</p>
                                                    <h3 class="product-name" style="height: 50px"> <a href="product?pid=${l.getProduct_id()}">${l.getProduct_name()}</a></h3>


                                                    <h4 class="product-price"><fmt:formatNumber value="${l.getPrice()}" pattern="#,###" />VNĐ <del class="product-old-price"> </del></h4>

                                                    <div class="product-rating">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="product-btns">
                                                        
                                                        <button class="quick-view"><a href="product?pid=${np.getProduct_id()}"><i class="fa fa-eye"></i></a><span class="tooltipp">Xem ngay</span></button>
                                                    </div>
                                                </div>
                                                <div class="add-to-cart">
                                                    <form method="post">
                                                        <button type="submit" formaction="addToCart?pid=${l.getProduct_id()}" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> Thêm Vào giỏ hàng</button>
                                                    </form>                                             
                                                </div>
                                            </div>

                                        </c:forEach>
                                        <!-- /product -->


                                        <!-- /product -->
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
                            <h4 class="title">Điện Thoại & Máy tính bảng</h4>
                            <div class="section-nav">
                                <div id="slick-nav-3" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-3">
                            <div>
                                <c:forEach items="${sessionScope.phone}" var="p" varStatus="status">
                                    <c:if test="${status.index < 5}">
                                        <!-- product widget -->
                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="images/${p.getProduct_img()}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">${p.getCategory_name()}</p>
                                                <h3 class="product-name"><a href="product?pid=${p.getProduct_id()}">${p.getProduct_name()}</a></h3>



                                                <h4 class="product-price"><fmt:formatNumber value="${p.getPrice()}" pattern="#,###"/> VNĐ </h4>

                                            </div>
                                        </div>
                                        <!-- /product widget -->
                                    </c:if>
                                </c:forEach>                               
                            </div>

                            <div>
                                <c:forEach items="${sessionScope.mtb}" var="mtb" varStatus="status">
                                    <c:if test="${status.index< 5}">
                                        <!-- product widget -->
                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="images/${mtb.getProduct_img()}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">${mtb.getCategory_name()}</p>
                                                <h3 class="product-name"><a href="product?pid=${mtb.getProduct_id()}">${mtb.getProduct_name()}</a></h3>
                                                <h4 class="product-price"><fmt:formatNumber value="${mtb.getPrice()}" pattern="#,###"/>VNĐ </h4>
                                            </div>
                                        </div>
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">TiVi & Máy LẠNH</h4>
                            <div class="section-nav">
                                <div id="slick-nav-4" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-4">
                            <div>
                                <c:forEach items="${sessionScope.tivi}" var="t" varStatus="status">
                                    <c:if test="${status.index< 5}">
                                        <!-- product widget -->
                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="images/${t.getProduct_img()}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">${t.getCategory_name()}</p>
                                                <h3 class="product-name"><a href="product?pid=${t.getProduct_id()}"></a>${t.getProduct_name()}</h3>



                                                <h4 class="product-price"><fmt:formatNumber value="${t.getPrice()}" pattern="#,###"/> VNĐ</h4>

                                            </div>
                                        </div>
                                        <!-- /product widget -->  
                                    </c:if>
                                </c:forEach>
                            </div>

                            <div>
                                <c:forEach items="${sessionScope.ml}" var="ml" varStatus="status">
                                    <c:if test="${status.index< 5}">
                                        <!-- product widget -->
                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="images/${ml.getProduct_img()}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">${ml.getCategory_name()}</p>
                                                <h3 class="product-name"><a href="product?pid=${ml.getProduct_id()}">${ml.getProduct_name()}</a></h3>
                                                <h4 class="product-price"><fmt:formatNumber value="${ml.getPrice()}" pattern="#,###"/>VNĐ </h4>
                                            </div>
                                        </div>
                                        <!-- /product widget -->   
                                    </c:if>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                    <div class="clearfix visible-sm visible-xs"></div>

                    <div class="col-md-4 col-xs-6">
                        <div class="section-title">
                            <h4 class="title">Hàng Gia Dụng & Hàng Cũ</h4>
                            <div class="section-nav">
                                <div id="slick-nav-5" class="products-slick-nav"></div>
                            </div>
                        </div>

                        <div class="products-widget-slick" data-nav="#slick-nav-5">
                            <div>
                                <c:forEach items="${sessionScope.hdd}" var="hdd" varStatus="status">
                                    <c:if test="${status.index < 5}">
                                        <!-- product widget -->
                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="images/${hdd.getProduct_img()}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">${hdd.getCategory_name()}</p>
                                                <h3 class="product-name"><a href="product?pid=${hdd.getProduct_id()}">${hdd.getProduct_name()}</a></h3>
                                                <h4 class="product-price"><fmt:formatNumber value="${hdd.getPrice()}" pattern="#,###"/>VNĐ </h4>
                                            </div>
                                        </div>
                                        <!-- /product widget -->  
                                    </c:if>
                                </c:forEach>
                            </div>

                            <div>
                                <c:forEach items="${sessionScope.hc}" var="hc" varStatus="status">
                                    <c:if test="${status.index < 5}">
                                        <!-- product widget -->
                                        <div class="product-widget">
                                            <div class="product-img">
                                                <img src="images/${hc.getProduct_img()}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">${hc.getCategory_name()}</p>
                                                <h3 class="product-name"><a href="product?pid=${hc.getProduct_id()}">${hc.getProduct_name()}</a></h3>
                                                <h4 class="product-price"><fmt:formatNumber value="${hc.getPrice()}" pattern="#,###"/>VNĐ </h4>
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

        <!-- /SECTION -->

        <!-- NEWSLETTER -->

        <!-- /NEWSLETTER -->

        <!-- FOOTER -->
        <%@include file="component/footer.jsp" %>
        <!-- /FOOTER -->

        <!-- jQuery Plugins -->
        <script src="js1/jquery.min.js"></script>
        <script src="js1/bootstrap.min.js"></script>
        <script src="js1/slick.min.js"></script>
        <script src="js1/nouislider.min.js"></script>
        <script src="js1/jquery.zoom.min.js"></script>
        <script src="js1/main.js"></script>


    </body>
</html>
<script>
    function buy(Product_id) {

    }
    function ProductDetail(id) {
                let url = "product?pid=" + id;

                window.location.href = url;
            }
</script>