<%-- 
    Document   : roleProfile
    Created on : May 23, 2024, 11:01:45 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/roleProfile.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick-theme.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/nouislider.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/home.css" type="text/css">
    </head>
    <body>
        <!-- /HEADER -->
        <%@include file="component/header.jsp"%>
        <!-- /HEADER -->
        <div class="container bootdey flex-grow-1 container-p-y" style="margin-top: 20px">

            <div class="media align-items-center py-3 mb-3">
                <img src="images/${sessionScope.account.avarta}" style="margin-left: 15px;" alt="" class="d-block ui-w-100 rounded-circle">
                <div class="media-body ml-4">
                    <h4 class="font-weight-bold mb-0">${sessionScope.account.user_name}</h4>
                </div>
            </div>
            <nav class="nav nav-borders" style="font-size: 15px">
                <a class="nav-link active" href="userProfile" target="__blank">Hồ sơ cá nhân</a>
                <a class="nav-link" href="userChangeProfile" target="__blank">Thay đổi hồ sơ cá nhân</a>
                <a class="nav-link" href="changePassword" target="__blank">Thay đổi mật khẩu</a>
            </nav>
            <div class="card mb-4">
                <div class="card-body">
                    <h6 class="mt-4 mb-3">Vai trò</h6>
                    <table class="table user-view-table m-0">
                        <tbody>
                            <tr>
                                <td>Role:</td>
                                <td>${requestScope.roleName}</td>
                            </tr>
                            <tr>
                                <td>Xác Minh:</td>
                                <td><span class="fa fa-check text-primary"></span>&nbsp; Yes</td>
                            </tr>
                            <tr>
                                <td>Trạng thái:</td>
                                <td><span class="badge badge-outline-success">Active</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <hr class="border-light m-0">
                <div class="table-responsive">
                    <table class="table card-table m-0" style="text-align: center">
                        <tbody>
                            <tr>
                                <th style="text-align: center">Chức Năng</th>
                                <th style="text-align: center">Xem</th>
                                <th style="text-align: center">Mua</th>
                                <th style="text-align: center">FeedBack</th>
                                <th style="text-align: center">Bán</th>
                                <th style="text-align: center">Sửa</th>
                                <th style="text-align: center">Xóa</th>
                                <th style="text-align: center">Tạo</th>
                            </tr>
                            <c:if test="${account.role_id == 1}">
                                <tr>
                                    <td>Admin</td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                </tr>
                            </c:if> 
                            <c:if test="${account.role_id == 2}">
                                <tr>
                                    <td>Sale Manager</td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                </tr>
                            </c:if> 
                            <c:if test="${account.role_id == 3}">
                                <tr>
                                    <td>Sale</td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-times text-light"></span></td>
                                </tr>
                            </c:if> 
                            <c:if test="${account.role_id == 4}">
                                <tr>
                                    <td>Order Processor</td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-times text-light"></span></td>
                                    <td><span class="fa fa-times text-light"></span></td>
                                </tr>
                            </c:if> 
                            <c:if test="${account.role_id == 5}">
                                <tr>
                                    <td>Customer</td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-check text-primary"></span></td>
                                    <td><span class="fa fa-times text-light"></span></td>
                                    <td><span class="fa fa-times text-light"></span></td>
                                    <td><span class="fa fa-times text-light"></span></td>
                                    <td><span class="fa fa-times text-light"></span></td>
                                </tr>
                            </c:if> 
                        </tbody>
                    </table>
                </div>


                <div class="card-body">
                    <h6 class="mt-4 mb-3">Thông tin</h6>

                    <table class="table user-view-table m-0">
                        <tbody>
                            <tr>
                                <td>Username:</td>
                                <td>${sessionScope.account.user_name}</td>
                            </tr>
                            <tr>
                                <td>E-mail:</td>
                                <td>${sessionScope.account.email}</td>
                            </tr>
                            <tr>
                                <td>Công ty: </td>
                                <td>Fed Shop</td>
                            </tr>
                        </tbody>
                    </table>
                    <h6 class="mt-4 mb-3">Số điện thoại</h6>

                    <table class="table user-view-table m-0">
                        <tbody>
                            <tr>
                                <td>Số điện thoại:</td>
                                <td>${sessionScope.account.phone_number}</td>
                            </tr>
                        </tbody>
                    </table>
                    <h6 class="mt-4 mb-3">Thông tin Shop</h6>

                    <table class="table user-view-table m-0">
                        <tbody>
                            <tr>
                                <td>Email:</td>
                                <td>fedshop320@gmail.com</td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>

        </div>
        <%@include file="component/footer.jsp" %>
    </body>
</html>
