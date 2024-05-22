<%-- 
    Document   : navbar
    Created on : May 22, 2024, 1:08:28 PM
    Author     : admin
--%>

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
        <nav id="navigation">
            <!-- container -->
            <div class="container">
                <!-- responsive-nav -->
                <div id="responsive-nav">
                    <!-- NAV -->
                    <ul class="main-nav nav navbar-nav">
                        <li class="active"><a href="#">Home</a></li>
                        <li><a href="FilterPostList?cate">Điện Thoại</a></li>
                        <li><a href="FilterPostList">Laptops</a></li>
                        <li><a href="#">Máy Lạnh</a></li>
                        <li><a href="#">Tivi</a></li>
                        <li><a href="#">Đồng Hồ Thông Minh</a></li>
                        <li><a href="#">Phụ Kiện</a></li>
                        <li><a href="#">PC</a></li>
                        <li><a href="#">Máy Tính Bảng</a></li>
                        <li><a href="#">Hàng Gia Dụng</a></li>                       
                        <li><a href="#">Hàng Cũ</a></li>
                    </ul>
                    <!-- /NAV -->
                </div>
                <!-- /responsive-nav -->
            </div>
            <!-- /container -->
        </nav>
    </body>
</html>
