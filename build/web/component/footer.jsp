<%-- 
    Document   : footer
    Created on : May 22, 2024, 1:10:14 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="${pageContext.request.contextPath}/https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick-theme.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/nouislider.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
    </head>
    <body>
        <div id="newsletter" class="section">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <c:if test="${sessionScope.account == null}">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="newsletter">
                                <p>Đăng ký để nhận <strong>THÔNG BÁO</strong></p>
                                <form>
                                    <input class="input" type="email" placeholder="Nhập địa chỉ gmail của bạn">
                                    <button class="newsletter-btn"><i class="fa fa-envelope"></i> ĐĂNG KÝ</button>
                                </form>
                                <ul class="newsletter-follow">
                                    <li>
                                        <a href="#"><i class="fa fa-facebook"></i></a>
                                    </li>

                                    <li>
                                        <a href="#"><i class="fa fa-google"></i></a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </c:if>

                <!-- /row -->
            </div>
            <!-- /container -->
        </div>
        <footer id="footer">
            <!-- top footer -->
            <div class="section">
                <!-- container -->
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Giới thiệu</h3>
                                <p>Web bán các đồ điệnt tử phục vụ mọi người.</p>
                                <ul class="footer-links">
                                    <li><a href="#"><i class="fa fa-map-marker"></i>Thạch Thất, Hà Nội</a></li>
                                    <li><a href="#"><i class="fa fa-phone"></i>0357129704</a></li>
                                    <li><a href="#"><i class="fa fa-envelope-o"></i>Feds@gmail.com</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Phân loại</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Ưu đãi lớn</a></li>
                                    <li><a href="#">Laptops</a></li>
                                    <li><a href="#">Điện Thoại</a></li>
                                    <li><a href="#">Máy tính bảng</a></li>
                                    <li><a href="#">PC</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="clearfix visible-xs"></div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Thông tin</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Nhóm</a></li>
                                    <li><a href="#">Liên hệ</a></li>
                                    <li><a href="#">Chính sách bảo mật</a></li>
                                    <li><a href="#">Chính sách hoàn trả hàng</a></li>
                                    <li><a href="#">Điều khoản</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Dịch vụ</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Tài khoản của tôi</a></li>
                                    <li><a href="#">Xem giỏ hàng</a></li>
                                    <li><a href="#">Yêu thích</a></li>
                                    <li><a href="#">Theo dõi đơn hàng</a></li>
                                    <li><a href="#">Trợ giúp</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /top footer -->

            <!-- bottom footer -->
            <div id="bottom-footer" class="section">
                <div class="container">
                    <!-- row -->
                    <div class="row">
                        <div class="col-md-12 text-center">
                            <ul class="footer-payments">
                                <li><a href="#"><i class="fa fa-cc-visa"></i></a></li>
                                <li><a href="#"><i class="fa fa-credit-card"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-paypal"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-mastercard"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-discover"></i></a></li>
                                <li><a href="#"><i class="fa fa-cc-amex"></i></a></li>
                            </ul>
                            <span class="copyright">
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                <!--                                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Colorlib</a>-->
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </span>
                        </div>
                    </div>
                    <!-- /row -->
                </div>
                <!-- /container -->
            </div>
            <!-- /bottom footer -->
        </footer>
    </body>
</html>
