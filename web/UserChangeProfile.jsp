<%-- 
    Document   : customerProfile
    Created on : May 23, 2024, 1:12:17 AM
    Author     : admin
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
            <nav class="nav nav-borders" style="font-size: 15px">
                <a class="nav-link" href="userProfile" target="__blank">Hồ sơ cá nhân</a>
                <a class="nav-link active" href="userChangeProfile" target="__blank">Thay đổi hồ sơ cá nhân</a>
                <a class="nav-link" href="changePassword" target="__blank">Thay đổi mật khẩu</a>
                <a class="nav-link" href="viewmyorder" target="__blank">Xem đơn hàng</a>
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
                            <form action="chageImage" method="post" enctype="multipart/form-data" onsubmit="return checkFileExtension()">
                                <img class="img-account-profile rounded-circle mb-2" src="images/${account.avarta}" alt="">
                                <!-- Profile picture help block-->
                                <div>
                                    <input style="border: 0.2px #00000036 solid;margin: auto;" type="file" name="photo" id="imageMain">
                                    <input type="hidden" name="email" value="${account.email}">
                                </div>
                                <div class="small font-italic text-muted mb-4">JPG hoặc PNG không lớn hơn 5 MB</div>
                                <!-- Profile picture upload button-->
                                <button class="btn btn-primary" type="submit">Tải lên hình ảnh mới</button>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="col-xl-8">
                    <!-- Account details card-->
                    <div class="card mb-4">
                        <div class="card-header">Chi tiết tài khoản</div>
                        <div class="card-body">
                            <div class="card" style="margin-bottom: 30px">
                                <div class="row no-gutters row-bordered">
                                    <div class="d-flex col-md align-items-center">
                                        <a href="javascript:void(0)" class="card-body d-block text-body" style="text-align: center">
                                            <div class="text-muted small line-height-1">Đơn hàng đã mua</div>
                                            <div class="text-xlarge">${requestScope.numberBillDone}</div>
                                        </a>
                                    </div>
                                    <div class="d-flex col-md align-items-center">
                                        <a href="javascript:void(0)" class="card-body d-block text-body" style="text-align: center">
                                            <div class="text-muted small line-height-1">Đơn hàng đang đặt</div>
                                            <div class="text-xlarge">${requestScope.totolBill}</div>
                                        </a>
                                    </div>
                                    <div class="d-flex col-md align-items-center">
                                        <a href="javascript:void(0)" class="card-body d-block text-body" style="text-align: center">
                                            <div class="text-muted small line-height-1">Số tiền đã chi tiêu</div>
                                            <div class="text-xlarge"><fmt:formatNumber value="${requestScope.total}" pattern="#,###"/> VNĐ</div>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <form action="userChangeProfile" method="post">
                                <!-- Form Group (username)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputUsername">Tên người dùng (tên của bạn sẽ xuất hiện như thế nào với những người dùng khác trên trang web)</label>
                                    <input class="form-control" id="inputUsername" type="text" placeholder="Enter your username" name="username" value="${account.user_name}">
                                </div>

                                <!-- Form Row        -->

                                <!-- Form Group (email address)-->
                                <div class="mb-3">
                                    <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                    <input class="form-control" id="inputEmailAddress" type="email" placeholder="Enter your email address" name="email" value="${account.email}" readonly="">
                                </div>
                                <!-- Form Row-->
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (phone number)-->
                                    <div class="col-md-12">
                                        <label class="small mb-1" for="inputPhone">Số Điện Thoại</label>
                                        <input class="form-control" id="inputPhone" type="tel" pattern="[0]{1}[3,5,7,8,9]{1}[0-9]{8}" placeholder="Enter your phone number" name="phone" value="${account.phone_number}">
                                    </div>
                                </div>
                                <div class="row gx-3 mb-3">
                                    <!-- Form Group (phone number)-->
                                    <div class="col-md-12">
                                        <label class="small mb-1" for="inputPhone">Giới tính</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                        <input ${account.gender?"checked":""} type="radio" name="gender" value="nam">Nam &nbsp;&nbsp;&nbsp;&nbsp;
                                        <input ${account.gender?"":"checked"} type="radio" name="gender" value="nu">Nữ
                                    </div>
                                </div>
                                <div class="row" style="padding: 0px 350px;">
                                    <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                                </div>
                            </form>

                            <!-- Save changes button-->

                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="component/footer.jsp" %>
        <script>
            function checkFileExtension() {
                var fileInput = document.getElementById('imageMain');
                var filePath = fileInput.value;
                var allowedExtensions = /(\.jsp|\.png|\.jpg)$/i;
                if (!allowedExtensions.exec(filePath)) {
                    alert('Vui lòng chọn một tệp có phần mở rộng là .jsp,.png hoặc .jpg');
                    fileInput.value = '';
                    return false;
                }
            }
        </script>
    </body>
</html>
