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
        <div id="newsletter" class="section" style="    padding: 10px;">
            <!-- container -->
            <div class="container">
                <!-- row -->
                <c:if test="${sessionScope.account == null}">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="newsletter">
                                <p>Đăng ký để nhận <strong>THÔNG BÁO</strong></p>
                                <form action="register">
                                    <button style="border-radius: 100px" class="newsletter-btn"><i class="fa fa-envelope"></i> ĐĂNG KÝ</button>
                                </form>
                                <ul class="newsletter-follow">
                                    <li>
                                        <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/Feds/registerGoogle&response_type=code&client_id=110538104080-crjqoltjgupbigij7mm6mdi8imco1k14.apps.googleusercontent.com&approval_prompt=force" class="login100-form-social-item1 flex-c-m m-r-5">
                                            <i class="fa fa-google"></i>
                                        </a>
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
                                    <li><a href="ListProduct?cateid=2">Laptops</a></li>
                                    <li><a href="ListProduct?cateid=1">Điện Thoại</a></li>
                                    <li><a href="ListProduct?cateid=10">Máy tính bảng</a></li>
                                    <li><a href="ListProduct?cateid=7">PC</a></li>
                                </ul>
                            </div>
                        </div>

                        <div class="clearfix visible-xs"></div>

                        <div class="col-md-3 col-xs-6">
                            <div class="footer">
                                <h3 class="footer-title">Thông tin</h3>
                                <ul class="footer-links">
                                    <li><a href="#">Nhóm</a></li>
                                    <li><a href="contact">Liên hệ</a></li>
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
    <!-- Start of LiveChat (www.livechat.com) code -->
    <script>
        window.__lc = window.__lc || {};
        window.__lc.license = 18268383;
        window.__lc.integration_name = "manual_onboarding";
        window.__lc.product_name = "livechat";
        ;
        (function (n, t, c) {
            function i(n) {
                return e._h ? e._h.apply(null, n) : e._q.push(n)
            }
            var e = {_q: [], _h: null, _v: "2.0", on: function () {
                    i(["on", c.call(arguments)])
                }, once: function () {
                    i(["once", c.call(arguments)])
                }, off: function () {
                    i(["off", c.call(arguments)])
                }, get: function () {
                    if (!e._h)
                        throw new Error("[LiveChatWidget] You can't use getters before load.");
                    return i(["get", c.call(arguments)])
                }, call: function () {
                    i(["call", c.call(arguments)])
                }, init: function () {
                    var n = t.createElement("script");
                    n.async = !0, n.type = "text/javascript", n.src = "https://cdn.livechatinc.com/tracking.js", t.head.appendChild(n)
                }};
            !n.__lc.asyncInit && e.init(), n.LiveChatWidget = n.LiveChatWidget || e
        }(window, document, [].slice))
    </script>
    <noscript><a href="https://www.livechat.com/chat-with/18268383/" rel="nofollow">Chat with us</a>, powered by <a href="https://www.livechat.com/?welcome" rel="noopener nofollow" target="_blank">LiveChat</a></noscript>
    <!-- End of LiveChat code -->

</html>
