<%-- 
    Document   : SalesManagement
    Created on : May 20, 2024, 4:34:57 PM
    Author     : rimok
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="vn.fpt.edu.models.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <title>OrderProcessor</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="keywords">
        <meta content="" name="description">

        <!-- Favicon -->
        <link href="img/favicon.ico" rel="icon">

        <!-- Google Web Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Heebo:wght@400;500;600;700&display=swap" rel="stylesheet">

        <!-- Icon Font Stylesheet -->
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

        <!-- Libraries Stylesheet -->
        <link href="OPlib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="OPlib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.min_OP.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/OrderProcessor.css" rel="stylesheet">
        <style>
            /* Đặt mọi CSS ở đây */
            .sort-button {
                border: none; /* Loại bỏ viền */
                background-color: transparent; /* Xóa màu nền */
                cursor: pointer; /* Hiển thị con trỏ khi di chuột qua */
                padding: 0; /* Loại bỏ padding */
                margin: 0; /* Loại bỏ margin */
                font-family: inherit; /* Sử dụng font chung của trang */
                font-size: inherit; /* Sử dụng kích thước font chung của trang */
                color: inherit; /* Sử dụng màu chữ chung của trang */
                text-decoration: none; /* Gạch chân dưới chữ */
            }

            /* Hover effect */
            .sort-button:hover {
                text-decoration: none; /* Loại bỏ gạch chân khi di chuột qua */
            }

        </style>

    </head>
    <body>

        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!-- Spinner End -->

            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <a href="home" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>${sessionScope.account.role.roleName}</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <img class="rounded-circle" src="images/${sessionScope.account.avarta}" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">${sessionScope.account.user_name}</h6>

                            <span>${sessionScope.account.role.roleName}</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="marketingDashBoard" class="nav-item nav-link"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    </div>
                    <div class="navbar-nav w-100">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Người dùng</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="marketingProductList" class="dropdown-item">Sản phẩm</a>
                                <!--                                <a href="#" class="dropdown-item">Post list</a>
                                                                <a href="#" class="dropdown-item">Sliders List</a>-->
                                <a href="marketingCustomerList" class="dropdown-item">Người dùng</a>
                                <!--                                <a href="#" class="dropdown-item">Feedback list</a>-->
                            </div>
                        </div>
                    </div>
                </nav>
            </div>
        </div>

        <!-- Sidebar End -->


        <!-- Content Start -->
        <div class="content">
            <!-- Navbar Start -->
            <nav class="navbar navbar-expand bg-light navbar-light sticky-top px-4 py-0">
                <a href="index.html" class="navbar-brand d-flex d-lg-none me-4">
                    <h2 class="text-primary mb-0"><i class="fa fa-hashtag"></i></h2>
                </a>
                <a href="#" class="sidebar-toggler flex-shrink-0">
                    <i class="fa fa-bars"></i>
                </a>
                <form class="d-none d-md-flex ms-4" action="marketingCustomerList" method="get"> 
                    <input class="form-control border-0" type="search" placeholder="Search" name="search">&nbsp;&nbsp;
                    <select name="SearchBy" class="btn btn-primary">
                        <option value="User">Tên</option>
                        <option value="Email">Email</option>
                        <option value="Phone">Phone</option>
                    </select> &nbsp;&nbsp;
                    <button type="submit" class="btn btn-primary" >Enter</button> 
                </form> 
                <div class="navbar-nav align-items-center ms-auto">
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-envelope me-lg-2"></i>
                            <span class="d-none d-lg-inline-flex">Tin nhắn</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">

                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item text-center">Xem tất cả tin nhắn</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <i class="fa fa-bell me-lg-2"></i>
                            <span class="d-none d-lg-inline-flex">Thông báo</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">

                            <hr class="dropdown-divider">
                            <a href="#" class="dropdown-item text-center">Xem tất cả thông báo</a>
                        </div>
                    </div>
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="rounded-circle me-lg-2" src="images/${sessionScope.account.avarta}" alt="" style="width: 40px; height: 40px;">
                            <span class="d-none d-lg-inline-flex">${sessionScope.account.user_name}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="userProfile" class="dropdown-item">Hồ sơ cá nhân</a>
                            <a href="#" class="dropdown-item">Cài đặt</a>
                            <a href="home" class="dropdown-item">Trang chủ</a>
                            <c:choose>
                                <c:when test="${ not empty sessionScope.account}"><a href="${pageContext.request.contextPath}/userLogout" class="dropdown-item">Đăng xuất</a></c:when>
                                <c:otherwise><a href="${pageContext.request.contextPath}/login" class="dropdown-item">Đăng nhập</a></c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </nav>
            <!-- Navbar End -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-12">
                        <div class="bg-light rounded h-100 p-4">
                            <div class="row">
                                <div class="col">
                                    <div class="mb-4">
                                        <h6>Customer Details</h6>
                                    </div>
                                </div>
                                <div class="col" style="text-align: right;" >
                                    <div class="mb-4">
                                        <a onclick="history.back()">
                                            <h6 class="sort-button" style="color: #009CFF;">Back</h6>                                              
                                        </a>
                                    </div>
                                </div>
                            </div>

                            <div class="mb-3"> 
                                <section class="py-5">
                                    <div class="container">
                                        <div class="row gx-5">
                                            <aside class="col-lg-6">
                                                <div class="border rounded-4 mb-3 d-flex justify-content-center">
                                                    <img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-4 fit" src="images/${user.avarta}" onerror="this.onerror=null;this.src='images/9-anh-dai-dien-trang-inkythuatso-03-15-27-03.jpg';" />
                                                </div>

                                            </aside>
                                            <main class="col-lg-6">
                                                <div class="ps-lg-3">
                                                    <h4 class="title text-dark">
                                                        ${user.user_name} 
                                                    </h4>
                                                    ( #${user.user_Id} )


                                                    <hr/>

                                                    <div class="mb-3">
                                                        Tổng giá trị các đơn hàng:
                                                        <c:if test="${not empty totalPrice}">
                                                            <span class="h5" style="color: #1aa6ff"><fmt:formatNumber value="${totalPrice}" pattern="#,##0 VND" /></span>
                                                        </c:if>
                                                    </div>
                                                    <div class="mb-3">
                                                        Tổng số đơn hàng:
                                                        <span class="h5" style="color: #1aa6ff">${totalOrders}</span>
                                                    </div>
                                                    <div class="mb-3">
                                                        Tổng số đơn hàng đã thanh toán:
                                                        <span class="h5" style="color: #1aa6ff">${CompletedOrders}</span>
                                                    </div>

                                                    <hr/>
                                                    <a href="#" id="show-more-details">Mở rộng</a>
                                                    <hr/>



                                                    <div class="row" id="product-details" style="display: none;">
                                                        <c:if test="${not empty user.email}">
                                                            <div class="row w-100">
                                                                <dt class="col-3">Email:</dt>
                                                                <dd class="col-9">${user.email}</dd>
                                                            </div>
                                                        </c:if>

                                                        <c:if test="${not empty user.phone_number}">
                                                            <div class="row w-100">
                                                                <dt class="col-3">SDT:</dt>
                                                                <dd class="col-8">${user.phone_number}</dd>
                                                            </div>
                                                        </c:if>

                                                        <div class="row w-100">
                                                            <dt class="col-3">Giới tính:</dt>
                                                            <c:if test="${user.gender}">
                                                                <dd class="col-9" style="color: #0d6efd">Nam</dd>
                                                            </c:if>
                                                            <c:if test="${!user.gender}">
                                                                <dd class="col-9" style="color: palevioletred">Nữ</dd>
                                                            </c:if>
                                                        </div>

                                                        <c:if test="${not empty user.role.roleName}">
                                                            <div class="row w-100">
                                                                <dt class="col-3">Role:</dt>
                                                                <dd class="col-9">${user.role.roleName}</dd>
                                                            </div>
                                                        </c:if>


                                                        <div class="row w-100">
                                                            <dt class="col-3">Status:</dt>
                                                            <c:if test="${user.banned}">
                                                                <dd class="col-9" style="color: red">Banned</dd>
                                                            </c:if>
                                                            <c:if test="${!user.banned}" >
                                                                <dd class="col-9" style="color: springgreen">Active</dd>
                                                            </c:if>
                                                        </div>
                                                        <hr/>
                                                        <a href="#" id="show-more-details1">Hiển thị sản phẩm đã mua</a>
                                                        <hr/>

                                                        <div class="row" id="product-details1" style="display: none;">
                                                            <div class="row w-100">
                                                                <dt class="col-2">Bill Id</dt>
                                                                <dt class="col-4">Tên</dt>
                                                                <dt class="col-2">Số lượng</dt>
                                                                <dt class="col-3">Trạng thái</dt>
                                                            </div>

                                                            <c:set var="previousBillId" value="" />

                                                            <c:forEach items="${product}" var="product">
                                                                <c:if test="${not empty previousBillId and previousBillId != product.bill.getBill_id()}">
                                                                    <hr/>
                                                                </c:if>

                                                                <c:set var="previousBillId" value="${product.bill.getBill_id()}" />

                                                                <div class="row w-100" >
                                                                    <dd class="col-2">${product.bill.getBill_id()}</dd>
                                                                    <dd class="col-4" onclick="ProductDetail(${product.product.product_id})">${product.product.product_name}</dd>
                                                                    <dd class="col-2">${product.orderQuantity}</dd>
                                                                    <dd class="col-3" 
                                                                        style="<c:choose>
                                                                            <c:when test="${product.status == 'Hoàn Thành'}">
                                                                                color: springgreen;
                                                                            </c:when>
                                                                            <c:when test="${product.status == 'Chờ xử lý'}">
                                                                                color: gold;
                                                                            </c:when>
                                                                            <c:when test="${product.status == 'Đang Xử Lý'}">
                                                                                color: #FFA500;
                                                                            </c:when>
                                                                            <c:when test="${product.status == 'Đang Giao Hàng'}">
                                                                                color: #1E90FF;
                                                                            </c:when>
                                                                            <c:otherwise>
                                                                                color: red;
                                                                            </c:otherwise>
                                                                        </c:choose>">
                                                                        ${product.status}
                                                                    </dd>
                                                                </div>
                                                            </c:forEach>
                                                        </div>
                                                    </div>
                                                </div>
                                            </main>
                                        </div>
                                    </div>
                                </section>
                                <!-- content -->

                            </div>
                        </div>
                    </div>

                </div>
            </div>



            <!-- Back to Top -->
            <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
        </div>



        <!-- JavaScript Libraries -->
        <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
        <script src="OPlib/chart/chart.min.js"></script>
        <script src="OPlib/easing/easing.min.js"></script>
        <script src="OPlib/waypoints/waypoints.min.js"></script>
        <script src="OPlib/owlcarousel/owl.carousel.min.js"></script>
        <script src="OPlib/tempusdominus/js/moment.min.js"></script>
        <script src="OPlib/tempusdominus/js/moment-timezone.min.js"></script>
        <script src="OPlib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

        <!-- Template Javascript -->
        <script src="js/main.js"></script>
        <script>
                                            $('.sidebar-toggler').click(function () {
                                                $('.sidebar, .content').toggleClass("open");
                                                return false;
                                            });
        </script>
        <script>
            const detailsDiv = document.getElementById("product-details");
            const showMoreButton = document.getElementById("show-more-details");
            const detailsDiv1 = document.getElementById("product-details1");
            const showMoreButton1 = document.getElementById("show-more-details1");

            showMoreButton.addEventListener("click", function () {
                if (detailsDiv.style.display === "none") {
                    detailsDiv.style.display = "block";
                    showMoreButton.textContent = "Thu nhỏ"; // Thay đổi nội dung nút
                } else {
                    detailsDiv.style.display = "none";
                    showMoreButton.textContent = "Mở rộng"; // Thay đổi nội dung nút
                }
            });
            showMoreButton1.addEventListener("click", function () {
                if (detailsDiv1.style.display === "none") {
                    detailsDiv1.style.display = "block";
                    showMoreButton1.textContent = "Ẩn sản phẩm đã mua"; // Thay đổi nội dung nút
                } else {
                    detailsDiv1.style.display = "none";
                    showMoreButton1.textContent = "Hiển thị sản phẩm đã mua"; // Thay đổi nội dung nút
                }
            });
            function ProductDetail(id) {
                let url = "marketingProductDetails?id=" + id;

                window.location.href = url;
            }
        </script>


    </body>
</html>
