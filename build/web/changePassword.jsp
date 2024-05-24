<%-- 
    Document   : changePassword
    Created on : May 24, 2024, 10:30:44 AM
    Author     : admin
--%>

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
                <div class="col-xl-3">
                    <!-- Profile picture card-->
                    <div class="card mb-4 mb-xl-0">
                        <div class="card-header">Ảnh đại diện</div>
                        <div class="card-body text-center">
                            <!-- Profile picture image-->
                            <img class="img-account-profile rounded-circle mb-2" src="images/${account.avarta}" alt="">
                        </div>
                    </div>
                </div>
                <div class="col-xl-9">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-header">Account Details</div>
                        <c:if test="${requestScope.error != null}">
                            <h2 style="color: red; text-align: center; margin-top: 30px;">${requestScope.error}</h2>
                        </c:if>
                        <div class="card-body">
                            <form action="changePassword" method="post">
                                <!-- Form Group (username)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                    <input class="form-control" id="inputEmailAddress" type="email" placeholder="Enter your email address" name="email" value="${account.email}" readonly="">
                                </div>
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputEmailAddress">Old Password</label>
                                    <input class="form-control" id="inputEmailAddress" type="password" placeholder="Nhập mật khẩu cũ" name="oldPassword" required>
                                </div>
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (phone number)-->
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputPhone">New Password</label>
                                        <input id="password-field" type="password" class="form-control" minlength="8" maxlength="20" name="password" placeholder="Nhập mật khẩu mới" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="small mb-1" for="inputPhone">Xác nhận Password</label>
                                        <input id="confirm-password-field" type="password" class="form-control" name="confirmPassword" placeholder="Xác nhận mật khẩu mới" required>
                                    </div>
                                </div>
                                <!-- Save changes button-->
                                <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="component/footer.jsp" %>
        
    </body>
</html>
