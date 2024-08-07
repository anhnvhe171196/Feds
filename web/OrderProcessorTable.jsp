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
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Sản phẩm</a>
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
                <form class="d-none d-md-flex ms-4" action="marketingProductList" method="get"> 
                    <input class="form-control border-0" type="search" placeholder="Search" name="search" value="${sessionScope.search}">&nbsp;&nbsp;&nbsp;
                    <button type="submit" class="btn btn-primary" >Enter</button> 
                </form> 
                <div class="navbar-nav align-items-center ms-auto">
                    
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                            <img class="rounded-circle me-lg-2" src="images/${sessionScope.account.avarta}" alt="" style="width: 40px; height: 40px;">
                            <span class="d-none d-lg-inline-flex">${sessionScope.account.user_name}</span>
                        </a>
                        <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                            <a href="userProfile" class="dropdown-item">Hồ sơ cá nhân</a>
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
                                        <h6>Danh sách sản phẩm</h6>
                                    </div>
                                </div>
                                <div class="col" style="display: flex; justify-content: flex-end; align-items: center;">
                                    <div class="mb-4" style="margin-right: 10px;">
                                        <a onclick="AddProduct()">
                                            <img  src="images/icons/AddIcon.png" alt="Thêm sản phẩm" style="width: 40px; height: 40px;">                                             
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">
                                            <a href="#" onclick="sortById()">
                                                <button type="button" class="sort-button">ID</button>
                                            </a>
                                        </th>
                                        <th scope="col" style="color: #009CFF;">Ảnh</th>
                                        <th scope="col">
                                            <a href="#" onclick="sortByName()">
                                                <button type="button" class="sort-button">Tên sản phẩm</button>
                                            </a>
                                        </th>
                                        <th scope="col" style="color: #009CFF;">Hãng</th>
                                        <th scope="col">
                                            <a href="#" onclick="sortByQuantity()">
                                                <button type="button" class="sort-button">Số lượng</button>
                                            </a>
                                        </th>
                                        <th scope="col">
                                            <a href="#" onclick="sortByPrice()">
                                                <button type="button" class="sort-button">Giá gốc</button>
                                            </a>
                                        </th>
                                        <th scope="col">
                                            <a href="#" onclick="sortByDateStart()">
                                                <button type="button" class="sort-button">Bắt đầu sale</button>
                                            </a>
                                        </th>
                                        <th scope="col">
                                            <a href="#" onclick="sortByDateEnd()">
                                                <button type="button" class="sort-button">Kết thúc sale</button>
                                            </a>
                                        </th>
                                        <th scope="col">
                                            <a href="#" onclick="sortByDateEnd()">
                                                <button type="button" class="sort-button">Sale</button>
                                            </a>
                                        </th>
                                        <th scope="col">
                                            <a href="#" >
                                                <button type="button" class="sort-button">Status</button>
                                            </a>
                                        </th>
                                        <th scope="col" style="color: red;" class="Update1">
                                            Chỉnh Sửa
                                        </th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${products}" var="product">
                                        <tr>
                                            <td scope="col" onclick="ProductDetail(${product.product_id})">${product.product_id}</th>
                                            <td scope="col" onclick="ProductDetail(${product.product_id})"><img src="images/${product.product_img}" style="max-height: 50px"></th>
                                            <td scope="col"  style="max-width: 200px; word-wrap: break-word;" onclick="ProductDetail(${product.product_id})">${product.product_name}</th>
                                            <td scope="col" onclick="ProductDetail(${product.product_id})">${product.brand.brandName}</th>
                                            <td scope="col" onclick="ProductDetail(${product.product_id})">${product.quantity}</th>
                                            <td scope="col" onclick="ProductDetail(${product.product_id})"><fmt:formatNumber value="${product.price.price}" pattern="#,##0 VND" /></th>
                                            <td scope="col" onclick="ProductDetail(${product.product_id})">
                                                <c:choose>
                                                    <c:when test="${empty product.price.dateStart}">
                                                        Null
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${product.price.dateStart}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td scope="col" onclick="ProductDetail(${product.product_id})">
                                                <c:choose>
                                                    <c:when test="${empty product.price.dateEnd}">
                                                        Null
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${product.price.dateEnd}
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td scope="col" onclick="ProductDetail(${product.product_id})">
                                                <c:choose>
                                                    <c:when test="${empty product.price.sale}">
                                                        0%
                                                    </c:when>
                                                    <c:otherwise>
                                                        ${product.price.sale}%
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                            <td scope="col" onclick="ProductDetail(${product.product_id})" >
                                                <c:choose>
                                                    <c:when test="${product.status eq 'active'}">
                                                        <label style="color: springgreen">${product.status}</label>
                                                    </c:when>
                                                    <c:when test="${product.status eq 'pending'}">
                                                        <label style="color: gold">${product.status}</label>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <label style="color: red">${product.status}</label>
                                                    </c:otherwise>
                                                </c:choose>
                                                </th>
                                            <td scope="col" class="Update">
                                                <a href="#" onclick="ProductUpdate(${product.product_id})">
                                                    &nbsp;&nbsp;&nbsp;&nbsp;<img  src="images/icons/EditsIcon.png" alt="Sửa sản phẩm" style="width: 25px; height: 25px;">                                    
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>

                                </tbody>
                            </table>


                            <div class="d-flex justify-content-center">
                                <c:if test="${endPage > 1}">
                                    <nav aria-label="Page navigation">
                                        <ul class="pagination">
                                            <!-- Previous Button -->
                                            <c:if test="${index > 1}">
                                                <li class="page-item">
                                                    <a class="page-link" href="marketingProductList?index=${index - 1}&sortBy=${sessionScope.sortBy}&sortOrder=${sessionScope.sortOrder}&search=${sessionScope.search}" aria-label="Previous">
                                                        <span aria-hidden="true">«</span>
                                                    </a>
                                                </li>
                                            </c:if>

                                            <!-- First Page Button -->
                                            <li class="page-item ${index == 1 ? 'active' : ''}">
                                                <a class="page-link" href="marketingProductList?index=1&sortBy=${sessionScope.sortBy}&sortOrder=${sessionScope.sortOrder}&search=${sessionScope.search}">1</a>
                                            </li>

                                            <!-- Page Number Buttons -->
                                            <c:if test="${index > 3}">
                                                <li class="page-item disabled">
                                                    <span class="page-link">...</span>
                                                </li>
                                            </c:if>

                                            <c:forEach begin="2" end="${endPage-1}" var="i">
                                                <c:if test="${i >= index - 1 && i <= index + 1}">
                                                    <li class="page-item ${i == index ? 'active' : ''}">
                                                        <a class="page-link" href="marketingProductList?index=${i}&sortBy=${sessionScope.sortBy}&sortOrder=${sessionScope.sortOrder}&search=${sessionScope.search}">${i}</a>
                                                    </li>
                                                </c:if>
                                            </c:forEach>

                                            <c:if test="${index < endPage - 2}">
                                                <li class="page-item disabled">
                                                    <span class="page-link">...</span>
                                                </li>
                                            </c:if>

                                            <!-- Last Page Button -->
                                            <li class="page-item ${index == endPage ? 'active' : ''}">
                                                <a class="page-link" href="marketingProductList?index=${endPage}&sortBy=${sessionScope.sortBy}&sortOrder=${sessionScope.sortOrder}&search=${sessionScope.search}">${endPage}</a>
                                            </li>

                                            <!-- Next Button -->
                                            <c:if test="${index < endPage}">
                                                <li class="page-item">
                                                    <a class="page-link" href="marketingProductList?index=${index + 1}&sortBy=${sessionScope.sortBy}&sortOrder=${sessionScope.sortOrder}&search=${sessionScope.search}" aria-label="Next">
                                                        <span aria-hidden="true">»</span>
                                                    </a>
                                                </li>
                                            </c:if>
                                        </ul>
                                    </nav>
                                </c:if>
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
            let a = parseInt(localStorage.getItem('a')) || 0;
            function sortByName() {
                let url = "marketingProductList?index=${index}&sortBy=name";
                if (a === 0) {
                    url = url + "&sortOrder=asc";
                } else {
                    url = url + "&sortOrder=desc";
                }
                url = url + "&search=${sessionScope.search}";
                a = (a + 1) % 2;
                localStorage.setItem('a', a);
                window.location.href = url;
            }
            function sortById() {

                let url = "marketingProductList?index=${index}&sortBy=id";
                if (a === 0) {
                    url = url + "&sortOrder=asc";
                } else {
                    url = url + "&sortOrder=desc";
                }
                url = url + "&search=${sessionScope.search}";
                a = (a + 1) % 2;
                localStorage.setItem('a', a);
                window.location.href = url;
            }
            function sortByPrice() {
                let url = "marketingProductList?index=${index}&sortBy=price";
                if (a === 0) {
                    url = url + "&sortOrder=asc";
                } else {
                    url = url + "&sortOrder=desc";
                }
                url = url + "&search=${sessionScope.search}";
                a = (a + 1) % 2;
                localStorage.setItem('a', a);
                window.location.href = url;
            }
            function sortByQuantity() {
                let url = "marketingProductList?index=${index}&sortBy=quantity";
                if (a === 0) {
                    url = url + "&sortOrder=asc";
                } else {
                    url = url + "&sortOrder=desc";
                }
                url = url + "&search=${sessionScope.search}";
                a = (a + 1) % 2;
                localStorage.setItem('a', a);
                window.location.href = url;
            }
            function sortByDateStart() {
                let url = "marketingProductList?index=${index}&sortBy=datestart";
                if (a === 0) {
                    url = url + "&sortOrder=asc";
                } else {
                    url = url + "&sortOrder=desc";
                }
                url = url + "&search=${sessionScope.search}";
                a = (a + 1) % 2;
                localStorage.setItem('a', a);
                window.location.href = url;
            }
            function sortByDateEnd() {
                let url = "marketingProductList?index=${index}&sortBy=dateend";
                if (a === 0) {
                    url = url + "&sortOrder=asc";
                } else {
                    url = url + "&sortOrder=desc";
                }
                url = url + "&search=${sessionScope.search}";
                a = (a + 1) % 2;
                localStorage.setItem('a', a);
                window.location.href = url;
            }

            function ProductDetail(id) {
                let url = "marketingProductDetails?id=" + id;

                window.location.href = url;
            }
            function ProductUpdate(id) {
                let url = "marketingProductUpdate?id=" + id;

                window.location.href = url;
            }
            function AddProduct() {
                let url = "marketingAddProduct";

                window.location.href = url;
            }
        </script>

    </body>
</html>
