<%-- 
    Document   : customerProfile
    Created on : May 23, 2024, 1:12:17 AM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/customerProfile.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick-theme.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/nouislider.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
        <link rel="stylesheet" href="css/home.css" type="text/css">
    </head>
    <body>
        <%@include file="component/header.jsp"%>
        <!-- /HEADER -->

        <div class="container-xl px-4 mt-4" style="margin-bottom: 60px; margin-top: 60px !important;">
            <nav class="nav nav-borders">
                <a class="nav-link" href="customerProfile" target="__blank">Hồ sơ</a>
                <a class="nav-link" href="changePassword" target="__blank">Thay đổi mật khẩu</a>
            </nav>
            <!-- Account page navigation-->
            <c:set value="${sessionScope.account}" var="account"/>
            <div class="row" >
                <div class="col-xl-4">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Ảnh đại diện</div>
                        <div class="card-body text-center">
                            <!-- Profile picture image-->

                            <img class="img-account-profile rounded-circle mb-2" src="images/${account.avarta}" alt="">
                            <!-- Profile picture help block-->
                            <div class="small font-italic text-muted mb-4">JPG hoặc PNG không lớn hơn 5 MB</div>
                            <!-- Profile picture upload button-->
                            <button class="btn btn-primary" type="button">Tải lên hình ảnh mới</button>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-header">Account Details</div>
                        <div class="card-body">
                            <form>
                                <!-- Form Group (username)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputUsername">Tên người dùng (tên của bạn sẽ xuất hiện như thế nào với những người dùng khác trên trang web)</label>
                                    <input class="form-control" id="inputUsername" type="text" placeholder="Enter your username" value="${account.user_name}">
                                </div>

                                <!-- Form Row        -->

                                <!-- Form Group (email address)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                    <input class="form-control" id="inputEmailAddress" type="email" placeholder="Enter your email address" value="${account.email}">
                                </div>
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (phone number)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputPhone">Số Điện Thoại</label>
                                        <input class="form-control" id="inputPhone" type="tel" placeholder="Enter your phone number" value="${account.phone_number}">
                                    </div>
                                </div>
                                <!-- Save changes button-->
                                <button class="btn btn-primary" type="button">Lưu thay đổi</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="component/footer.jsp" %>
    </body>
</html>
