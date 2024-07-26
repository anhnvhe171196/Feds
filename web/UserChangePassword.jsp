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
            <nav class="nav nav-borders" style="font-size: 15px">
                <a class="nav-link" href="userProfile" target="__blank">Hồ sơ cá nhân</a>
                <a class="nav-link" href="userChangeProfile" target="__blank">Thay đổi hồ sơ cá nhân</a>
                <a class="nav-link active" href="changePassword" target="__blank">Thay đổi mật khẩu</a>
                <a class="nav-link" href="viewmyorder" target="__blank">Xem đơn hàng</a>
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
                            <!-- Form Group (username)-->

                            <div class="col-md-12">
                                <div id="product-tab" style="margin-top: 0">
                                    <!-- product tab nav -->
                                    <ul class="tab-nav" style="margin: 0">
                                        <li class="active"><a data-toggle="tab" href="#tab1">Bằng số điện thoại</a></li>
                                        <li><a data-toggle="tab" href="#tab3">Bằng mật khẩu cũ</a></li>
                                    </ul>
                                    <!-- /product tab nav -->
                                    <!-- product tab content -->
                                    <div class="tab-content">
                                        <div id="tab1" class="tab-pane fade in active">
                                            <c:if test="${account.phone_number != null}">
                                                <form id="phoneVerificationForm" action="verifyPhoneController">
                                                    <div class="mb-3">
                                                        <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                                        <input class="form-control" id="inputEmailAddress" type="email" placeholder="Enter your email address" name="email" value="${account.email}" readonly="">
                                                    </div>
                                                    <div class="row gx-3 mb-3">
                                                        <!-- Form Group (phone number)-->
                                                        <div class="col-md-6">
                                                            <label class="small mb-1" for="inputPhone">Số điện thoại</label>
                                                            <input id="password-field" type="text" class="form-control" minlength="8" maxlength="20" name="mobile" value="${account.phone_number}" readonly="">
                                                        </div>

                                                    </div>
                                                    <!-- Save changes button-->
                                                    <button class="btn btn-primary" type="button" onclick="submitForm()">Lấy mã xác nhận</button>

                                                </form>
                                            </c:if>
                                            <c:if test="${account.phone_number == null}">
                                                <h1 style="text-align: center; color: red; margin: 100px">Bạn chưa có số điện thoại vui lòng nhập số điện thoại</h1>
                                            </c:if>
                                        </div>

                                        <div id="tab3" class="tab-pane fade in">
                                            <form action="changePassword" method="post">
                                                <div class="mb-3">
                                                    <label class="small mb-1" for="inputEmailAddress">Email address</label>
                                                    <input class="form-control" id="inputEmailAddress" type="email" placeholder="Enter your email address" name="email" value="${account.email}" readonly="">
                                                </div>
                                                <div class="mb-3">
                                                    <label class="small mb-1" for="inputEmailAddress">Mật khẩu cũ</label>
                                                    <input class="form-control" id="inputEmailAddress" type="password" placeholder="Nhập mật khẩu cũ" name="oldPassword" required>
                                                </div>
                                                <!-- Form Row-->
                                                <div class="row gx-3 mb-3">
                                                    <!-- Form Group (phone number)-->
                                                    <div class="col-md-6">
                                                        <label class="small mb-1" for="inputPhone">Mật khẩu mới</label>
                                                        <input id="password-field" type="password" class="form-control" minlength="8" maxlength="20" name="password" placeholder="Nhập mật khẩu mới" required>
                                                    </div>
                                                    <div class="col-md-6">
                                                        <label class="small mb-1" for="inputPhone">Xác nhận mật khẩu mới</label>
                                                        <input id="confirm-password-field" type="password" class="form-control" name="confirmPassword" placeholder="Xác nhận mật khẩu mới" required>
                                                    </div>
                                                </div>
                                                <!-- Save changes button-->
                                                <button class="btn btn-primary" type="submit">Lưu thay đổi</button>
                                            </form>
                                        </div>
                                    </div>
                                    <!-- /product tab content  -->
                                </div>
                            </div>


                        </div>
                    </div>
                </div>
            </div>
        </div>

        <%@include file="component/footer.jsp" %>
        <script src="js1/jquery.min.js"></script>
        <script src="js1/bootstrap.min.js"></script>
        <script src="js1/slick.min.js"></script>
        <script src="js1/nouislider.min.js"></script>
        <script src="js1/jquery.zoom.min.js"></script>
        <script src="js1/main.js"></script>
        <script>
                                                        function submitForm() {
                                                            // Lấy thông tin form
                                                            var form = $('#phoneVerificationForm');
                                                            var formData = form.serialize();

                                                            // Gửi AJAX request
                                                            $.ajax({
                                                                url: form.attr('action'),
                                                                type: 'GET',
                                                                data: formData,
                                                                success: function (response) {
                                                                    // Xử lý khi thành công
                                                                    $('#emailModal').modal('show');
                                                                },
                                                                error: function (xhr, status, error) {
                                                                    // Xử lý khi có lỗi
                                                                    console.error('Error:', error);
                                                                }
                                                            });
                                                        }
        </script>
        <!-- Button trigger modal -->
        <div class="modal fade" id="emailModal" tabindex="-1" aria-labelledby="emailModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="emailModalLabel">Đổi mật khẩu</h5>
                    </div>
                    <form action="verifyPhoneController" method="post">
                        <div class="modal-body">
                            <div class="row gx-3 mb-3">
                                <div class="col-md-12">
                                    <label class="small mb-1" for="inputFirstName">Mã xác nhận</label>
                                    <input type="hidden" value="${account.phone_number}" name="mobile">
                                    <input class="form-control" id="inputFirstName" type="text" placeholder="Nhập mã xác nhận từ số điện thoại của bạn" name="verify" required>
                                </div>
                            </div>
                            <div class="row gx-3 mb-3">
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputFirstName">Mật khẩu mới</label>
                                    <input id="password-field" type="password" class="form-control" minlength="8" maxlength="20" name="password" placeholder="Nhập mật khẩu mới" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="small mb-1" for="inputFirstName">Xác nhận mật khẩu</label>
                                    <input id="confirm-password-field" type="password" class="form-control" name="confirmPassword" placeholder="Xác nhận mật khẩu mới" required>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="submit" class="btn btn-primary">Xác nhận</button>
                        </div>
                    </form>
                </div>
            </div>  
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-z7KtEPOlBst76BUE91AyV2Zhkhqz/qWuifpbLk72s3gWRCCj/NxDsE4/lBdWI5Lg" crossorigin="anonymous"></script>
    </body>
</html>



