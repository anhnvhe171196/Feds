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
            <!--             Spinner Start -->
            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                    <span class="sr-only">Loading...</span>
                </div>
            </div>
            <!--             Spinner End -->

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
                    <input class="form-control border-0" type="search" placeholder="Search" name="search" value="${search}">&nbsp;&nbsp;
                    <select name="SearchBy" class="btn btn-primary">
                        <option value="User" <c:if test="${SearchBy == 'User'}">selected</c:if>>Tên</option>
                        <option value="Email" <c:if test="${SearchBy == 'Email'}">selected</c:if>>Email</option>
                        <option value="Phone" <c:if test="${SearchBy == 'Phone'}">selected</c:if>>Phone</option>
                        </select> &nbsp;&nbsp;
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
                            <h6 class="mb-4">Danh sách người dùng</h6>
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th scope="col">
                                            <a href="#" onclick="sortById()">
                                                <button type="button" class="sort-button">ID</button>
                                            </a>
                                        </th>
                                        <th scope="col" style="color: #009CFF;">Avatar</th>
                                        <th scope="col">
                                            <a href="#" onclick="sortByName()">
                                                <button type="button" class="sort-button">Tên người dùng</button>
                                            </a>
                                        </th>
                                        <th scope="col"  style="color: #009CFF;">
                                            <a href="#" onclick="sortByEmail()">
                                                <button type="button" class="sort-button">Email</button>
                                            </a>
                                        </th>
                                        <th scope="col">
                                            <a href="#" onclick="sortByPhone()">
                                                <button type="button" class="sort-button">Số điện thoại</button>
                                            </a>
                                        </th>
                                        <th scope="col">
                                            <a href="#" onclick="sortByGender()">
                                                <button type="button" class="sort-button">Giới tính</button>
                                            </a>
                                        </th>
                                        <th scope="col" style="color: #009CFF;">
                                            Role
                                        </th>
                                        <th scope="col" style="color: #009CFF;">
                                            Status
                                        </th>
                                        <th scope="col" style="color: #009CFF;">
                                            Thông tin
                                        </th>


                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${users}" var="users">
                                        <tr onclick="UserDetail(${users.user_Id})">
                                            <td scope="col">${users.user_Id}</td>
                                            <td scope="col">
                                                <img src="images/${users.avarta}" style="max-height: 50px" onerror="this.onerror=null;this.src='images/9-anh-dai-dien-trang-inkythuatso-03-15-27-03.jpg';">
                                                </th>
                                            <td scope="col"  style="max-width: 200px; word-wrap: break-word;">${users.user_name}</th>
                                            <td scope="col">${users.email}</th>
                                            <td scope="col">${users.phone_number}</th>
                                            <td scope="col">
                                                <c:if test="${users.gender}"><label style="color: #0d6efd" >Nam</label></c:if>
                                                <c:if test="${!users.gender}"><label style="color: palevioletred" >Nữ</label></c:if>
                                                    </th>
                                                <td scope="col">${users.role.roleName}</th>
                                            <td scope="col">
                                                <c:choose>
                                                    <c:when test="${users.banned}">
                                                        <span style="color: red">Banned</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <span style="color: springgreen">Active</span>
                                                    </c:otherwise>
                                                </c:choose>
                                                </th>
                                            <td scope="col">
                                                <a href="#" onclick="UserDetail(${users.user_Id})">
                                                    <button type="button" class="sort-button" id="openModalBtn">Chi tiết</button>
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
                                                    <a class="page-link" href="marketingCustomerList?index=${index - 1}&sortBy=${sessionScope.sortBy}&sortOrder=${sessionScope.sortOrder}&search=${sessionScope.search}&SearchBy=${sessionScope.SearchBy}" " aria-label="Previous">
                                                        <span aria-hidden="true">«</span>
                                                    </a>
                                                </li>
                                            </c:if>

                                            <!-- First Page Button -->
                                            <li class="page-item ${index == 1 ? 'active' : ''}">
                                                <a class="page-link" href="marketingCustomerList?index=1&sortBy=${sessionScope.sortBy}&sortOrder=${sessionScope.sortOrder}&search=${sessionScope.search}&SearchBy=${sessionScope.SearchBy}">1</a>
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
                                                        <a class="page-link" href="marketingCustomerList?index=${i}&sortBy=${sessionScope.sortBy}&sortOrder=${sessionScope.sortOrder}&search=${sessionScope.search}&SearchBy=${sessionScope.SearchBy}">${i}</a>
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
                                                <a class="page-link" href="marketingCustomerList?index=${endPage}&sortBy=${sessionScope.sortBy}&sortOrder=${sessionScope.sortOrder}&search=${sessionScope.search}&SearchBy=${sessionScope.SearchBy}">${endPage}</a>
                                            </li>

                                            <!-- Next Button -->
                                            <c:if test="${index < endPage}">
                                                <li class="page-item">
                                                    <a class="page-link" href="marketingCustomerList?index=${index + 1}&sortBy=${sessionScope.sortBy}&sortOrder=${sessionScope.sortOrder}&search=${sessionScope.search}&SearchBy=${sessionScope.SearchBy}" aria-label="Next">
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
                let url = "marketingCustomerList?index=${index}&sortBy=name";
                if (a === 0) {
                    url = url + "&sortOrder=asc";
                } else {
                    url = url + "&sortOrder=desc";
                }
                url = url + "&search=${sessionScope.search}&SearchBy=${sessionScope.SearchBy}";
                a = (a + 1) % 2;
                localStorage.setItem('a', a);
                window.location.href = url;
            }
            function sortById() {

                let url = "marketingCustomerList?index=${index}&sortBy=id";
                if (a === 0) {
                    url = url + "&sortOrder=asc";
                } else {
                    url = url + "&sortOrder=desc";
                }
                url = url + "&search=${sessionScope.search}&SearchBy=${sessionScope.SearchBy}";
                a = (a + 1) % 2;
                localStorage.setItem('a', a);
                window.location.href = url;
            }
            function sortByEmail() {
                let url = "marketingCustomerList?index=${index}&sortBy=email";
                if (a === 0) {
                    url = url + "&sortOrder=asc";
                } else {
                    url = url + "&sortOrder=desc";
                }
                url = url + "&search=${sessionScope.search}&SearchBy=${sessionScope.SearchBy}";
                a = (a + 1) % 2;
                localStorage.setItem('a', a);
                window.location.href = url;
            }
            function sortByGender() {
                let url = "marketingCustomerList?index=${index}&sortBy=gender";
                if (a === 0) {
                    url = url + "&sortOrder=asc";
                } else {
                    url = url + "&sortOrder=desc";
                }
                url = url + "&search=${sessionScope.search}&SearchBy=${sessionScope.SearchBy}";
                a = (a + 1) % 2;
                localStorage.setItem('a', a);
                window.location.href = url;
            }
            function sortByPhone() {
                let url = "marketingCustomerList?index=${index}&sortBy=phone";
                if (a === 0) {
                    url = url + "&sortOrder=asc";
                } else {
                    url = url + "&sortOrder=desc";
                }
                url = url + "&search=${sessionScope.search}&SearchBy=${sessionScope.SearchBy}";
                a = (a + 1) % 2;
                localStorage.setItem('a', a);
                window.location.href = url;
            }

            function UserDetail(id) {
                let url = "marketingCustomerDetail?id=" + id;

                window.location.href = url;
            }
        </script>

    </body>
</html>
