<%-- 
    Document   : UserProductDetail
    Created on : May 28, 2024, 1:37:41 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib  prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        <%@include file="component/header.jsp"%>
        <!-- /HEADER -->

        <!-- NAVIGATION -->
        <%@include file = "component/navbar.jsp"%>
        <div class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <div class="row">
                    <!-- Product main img -->
                    <div class="col-md-7">
                        <div id="product-main-img">
                            <div class="product-preview">
                                <img src="images/${product.product.product_img}" alt="">
                            </div>
                        </div>
                    </div>
                    <!-- /Product main img -->


                    <!-- Product details -->
                    <div class="col-md-5" style="    margin-top: 100px;">
                        <div class="product-details">
                            <h2 class="product-name">${product.product.product_name}</h2>
                            <div>
                                <div class="product-rating">
                                    <c:forEach begin="1" end="${requestScope.rating}">
                                        <i class="fa fa-star"></i>
                                    </c:forEach>
                                    <c:if test="${requestScope.rating != 5}">
                                    <c:forEach begin="${requestScope.rating + 1}" end="5">
                                        <i class="fa fa-star-o"></i>
                                    </c:forEach>
                                    </c:if>
                                </div>
                                <a class="review-link" href="#">${requestScope.totalFeedback} Review(s) | Thêm đánh giá của bạn</a>
                            </div>
                            <div>
                                <c:if test="${price.sale > 0 && requestScope.check == 2}">
                                    <h3 class="product-price"><fmt:formatNumber value="${price.price - price.price * price.sale / 100}" pattern="#,###"/>VNĐ &nbsp;<del class="product-old-price"><fmt:formatNumber value="${price.price}" pattern="#,###"/>VNĐ</del></h3>
                                    <span class="product-available">Giảm giá ${price.sale}%</span>
                                </c:if>
                                <c:if test="${requestScope.check == 1 || price.sale < 1}">    
                                    <h3 class="product-price"><fmt:formatNumber value="${price.price}" pattern="#,###"/>VNĐ</h3>
                                </c:if>
                            </div>
                            <table> 
                                <c:if test="${product.ram!=null}">
                                    <tr>
                                        <td style="padding-right: 80px;padding-bottom: 5px;font-weight: bold;">RAM</td>
                                        <td>${product.ram}</td>
                                    </tr>
                                </c:if>
                                <c:if test="${product.rom!=null}">
                                    <tr>
                                        <td style="padding-right: 80px;padding-bottom: 5px;font-weight: bold;">ROM</td>
                                        <td>${product.rom}</td>
                                    </tr>
                                </c:if>
                                <c:if test="${product.size!=null}">
                                    <tr>
                                        <td style="padding-right: 80px;padding-bottom: 5px;font-weight: bold;">Size</td>
                                        <td>${product.size}</td>
                                    </tr>
                                </c:if>
                                <c:if test="${product.battery!=null}">
                                    <tr>
                                        <td style="padding-right: 80px;padding-bottom: 5px;font-weight: bold;">Battery</td>
                                        <td>${product.battery}</td>
                                    </tr>
                                </c:if>
                                <c:if test="${product.weight!=null}">
                                    <tr>
                                        <td style="padding-right: 80px;padding-bottom: 5px;font-weight: bold;" >Weight</td>
                                        <td>${product.weight}</td>
                                    </tr>
                                </c:if>
                                <c:if test="${product.color!=null}">
                                    <tr>
                                        <td style="padding-right: 80px;padding-bottom: 5px;font-weight: bold;">Color</td>
                                        <td>${product.color}</td>
                                    </tr>
                                </c:if>
                                <c:if test="${product.cpu!=null}">
                                    <tr>
                                        <td style="padding-right: 80px;padding-bottom: 5px;font-weight: bold;">CPU</td>
                                        <td>${product.cpu}</td>
                                    </tr>
                                </c:if>
                                <c:if test="${product.wattage!=null}">
                                    <tr>
                                        <td style="padding-right: 80px;padding-bottom: 5px;font-weight: bold;">Wattage</td>
                                        <td>${product.wattage}</td>
                                    </tr>
                                </c:if>
                                <c:if test="${product.status!=null}">
                                    <tr>
                                        <td style="padding-right: 80px;padding-bottom: 5px;font-weight: bold;">Status</td>
                                        <td>${product.status}</td>
                                    </tr>
                                </c:if>
                            </table>

                            <div class="add-to-cart">
                                <div class="qty-label">
                                    Số lượng:
                                    <div class="input-number">
                                        <input type="number" value="1" max="${requestScope.product.product.quantity}">
                                        <span class="qty-up">+</span>
                                        <span class="qty-down">-</span>
                                    </div>
                                </div>
                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                            </div>

                            <ul class="product-links">
                                <li>Category:</li>
                                <li><a href="ListProduct?cateid=${requestScope.product.product.brand.category.category_id}">${requestScope.product.product.brand.category.category_name}</a></li>
                                <li><a href="#">${requestScope.product.product.brand.brandName}</a></li>
                            </ul>

                        </div>
                    </div>
                </div>
                <!-- /Product details -->

                <!-- Product tab -->
                <div class="col-md-12">
                    <div id="product-tab">
                        <!-- product tab nav -->
                        <ul class="tab-nav">
                            <li class="active"><a data-toggle="tab" href="#tab1">Description</a></li>
                            <li><a data-toggle="tab" href="#tab3">Reviews (${requestScope.totalFeedback})</a></li>
                        </ul>
                        <!-- /product tab nav -->

                        <!-- product tab content -->
                        <div class="tab-content">
                            <!-- tab1  -->
                            <div id="tab1" class="tab-pane fade in active">
                                <div class="row">
                                    <div class="col-md-12">
                                        <p>${requestScope.product.decription}</p>
                                    </div>
                                </div>
                            </div>
                            <!-- /tab1  -->

                            <!-- tab3  -->
                            <div id="tab3" class="tab-pane fade in">
                                <div class="row">
                                    <!-- Rating -->
                                    <div class="col-md-3">
                                        <div id="rating">
                                            <div class="rating-avg">
                                                <span>4.5</span>
                                                <div class="rating-stars">
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star"></i>
                                                    <i class="fa fa-star-o"></i>
                                                </div>
                                            </div>
                                            <ul class="rating">
                                                <li>
                                                    <div class="rating-stars">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                    <div class="rating-progress">
                                                        <div style="width: 80%;"></div>
                                                    </div>
                                                    <span class="sum">3</span>
                                                </li>
                                                <li>
                                                    <div class="rating-stars">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <div class="rating-progress">
                                                        <div style="width: 60%;"></div>
                                                    </div>
                                                    <span class="sum">2</span>
                                                </li>
                                                <li>
                                                    <div class="rating-stars">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <div class="rating-progress">
                                                        <div></div>
                                                    </div>
                                                    <span class="sum">0</span>
                                                </li>
                                                <li>
                                                    <div class="rating-stars">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <div class="rating-progress">
                                                        <div></div>
                                                    </div>
                                                    <span class="sum">0</span>
                                                </li>
                                                <li>
                                                    <div class="rating-stars">
                                                        <i class="fa fa-star"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                        <i class="fa fa-star-o"></i>
                                                    </div>
                                                    <div class="rating-progress">
                                                        <div></div>
                                                    </div>
                                                    <span class="sum">0</span>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- /Rating -->

                                    <!-- Reviews -->
                                    <div class="col-md-6">
                                        <div id="reviews">
                                            <ul class="reviews">
                                                <li>
                                                    <div class="review-heading">
                                                        <h5 class="name">John</h5>
                                                        <p class="date">27 DEC 2018, 8:0 PM</p>
                                                        <div class="review-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o empty"></i>
                                                        </div>
                                                    </div>
                                                    <div class="review-body">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="review-heading">
                                                        <h5 class="name">John</h5>
                                                        <p class="date">27 DEC 2018, 8:0 PM</p>
                                                        <div class="review-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o empty"></i>
                                                        </div>
                                                    </div>
                                                    <div class="review-body">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                    </div>
                                                </li>
                                                <li>
                                                    <div class="review-heading">
                                                        <h5 class="name">John</h5>
                                                        <p class="date">27 DEC 2018, 8:0 PM</p>
                                                        <div class="review-rating">
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star"></i>
                                                            <i class="fa fa-star-o empty"></i>
                                                        </div>
                                                    </div>
                                                    <div class="review-body">
                                                        <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua</p>
                                                    </div>
                                                </li>
                                            </ul>
                                            <ul class="reviews-pagination">
                                                <li class="active">1</li>
                                                <li><a href="#">2</a></li>
                                                <li><a href="#">3</a></li>
                                                <li><a href="#">4</a></li>
                                                <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                                            </ul>
                                        </div>
                                    </div>
                                    <!-- /Reviews -->

                                    <!-- Review Form -->
                                    <div class="col-md-3">
                                        <div id="review-form">
                                            <form class="review-form">
                                                <input class="input" type="text" placeholder="Your Name">
                                                <input class="input" type="email" placeholder="Your Email">
                                                <textarea class="input" placeholder="Your Review"></textarea>
                                                <div class="input-rating">
                                                    <span>Your Rating: </span>
                                                    <div class="stars">
                                                        <input id="star5" name="rating" value="5" type="radio"><label for="star5"></label>
                                                        <input id="star4" name="rating" value="4" type="radio"><label for="star4"></label>
                                                        <input id="star3" name="rating" value="3" type="radio"><label for="star3"></label>
                                                        <input id="star2" name="rating" value="2" type="radio"><label for="star2"></label>
                                                        <input id="star1" name="rating" value="1" type="radio"><label for="star1"></label>
                                                    </div>
                                                </div>
                                                <button class="primary-btn">Submit</button>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- /Review Form -->
                                </div>
                            </div>
                            <!-- /tab3  -->
                        </div>
                        <!-- /product tab content  -->
                    </div>
                </div>
                <!-- /product tab -->
            </div>
            <!-- /row -->
        </div>
        <!-- /container -->

    </div>
    <div class="section">
        <!-- container -->
        <div class="container">
            <!-- row -->
            <div class="row">

                <div class="col-md-12">
                    <div class="section-title text-center">
                        <h3 class="title">Related Products</h3>
                    </div>
                </div>

                <!-- product -->
                <div class="col-md-12">
                    <div class="row">
                        <div class="products-tabs">
                            <!-- tab -->
                            <div id="tab1" class="tab-pane active">
                                <div class="products-slick" data-nav="#slick-nav-1">
                                    <c:forEach items="${requestScope.list}" var="pd">
                                        <div class="product">
                                            <div class="product-img">
                                                <img src="images/${pd.product.product_img}" alt="">
                                            </div>
                                            <div class="product-body">
                                                <p class="product-category">${pd.product.brand.brandName}</p>
                                                <h3 class="product-name"><a href="product?pid=${pd.product.product_id}">${pd.product.product_name}</a></h3>
                                                        <h4 class="product-price">
                                                        <fmt:formatNumber value="${pd.price}" pattern="#,###"/>VNĐ
                                                        </h4>
                                                <div class="product-rating">
                                                <c:forEach begin="1" end="${pd.rating}">
                                                    <i class="fa fa-star"></i>
                                                </c:forEach>
                                                <c:if test="${pd.rating != 5}">
                                                    <c:forEach begin="${pd.rating + 1}" end="5">
                                                        <i class="fa fa-star-o"></i>
                                                    </c:forEach>
                                                </c:if>
                                                </div>
                                                <div class="product-btns">
                                                    <button class="quick-view"><a href="product?pid=${pd.product.product_id}"><i class="fa fa-eye"></i></a><span class="tooltipp">quick view</span></button>
                                                </div>
                                            </div>
                                            <div class="add-to-cart">
                                                <button class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                                <div id="slick-nav-1" class="products-slick-nav"></div>
                            </div>
                            <!-- /tab -->
                        </div>
                    </div>
                </div>
                <!-- /product -->

            </div>
            <!-- /row -->
        </div>
    </div>
        <!-- /container -->
    <%@include file="component/footer.jsp" %>

    <script src="js1/jquery.min.js"></script>
    <script src="js1/bootstrap.min.js"></script>
    <script src="js1/slick.min.js"></script>
    <script src="js1/nouislider.min.js"></script>
    <script src="js1/jquery.zoom.min.js"></script>
    <script src="js1/main.js"></script>
</body>
</html>
