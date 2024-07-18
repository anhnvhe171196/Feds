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

        <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="lib/tempusdominus/css/tempusdominus-bootstrap-4.min.css" rel="stylesheet" />

        <!-- Customized Bootstrap Stylesheet -->

        <link href="css/bootstrap.minsale.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/OrderProcessor.css" rel="stylesheet">
        <link href="css/stylesale.css" rel="stylesheet">
        <style>
            #trendcategory-canvas {
                width: 100%;
                display: block;
                max-width: 70%;
                height: 50%;
                margin: auto;
            }
        </style>
        <script>
            function validateForm(formId) {
                let isValid = true;
                let form = document.getElementById(formId);
                let inputs = form.querySelectorAll('input');

                inputs.forEach(input => {
                    if (input.type !== 'hidden' && input.value.trim() === '') {
                        isValid = false;
                        input.classList.add('is-invalid'); // Add invalid class for highlighting
                    } else {
                        input.classList.remove('is-invalid'); // Remove invalid class if field is not empty
                    }
                });

                if (!isValid) {
                    alert('Vui lòng điền đầy đủ các trường.');
                }

                return isValid;
            }
        </script>
        <style>
            .is-invalid {
                border-color: red;
            }
        </style>
    </head>

    <body>

        <div class="container-xxl position-relative bg-white d-flex p-0">
            <!-- Spinner Start -->
            <!--            <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
                            <div class="spinner-border text-primary" style="width: 3rem; height: 3rem;" role="status">
                                <span class="sr-only">Loading...</span>
                            </div>
                        </div>-->
            <!-- Spinner End -->


            <!-- Sidebar Start -->
            <div class="sidebar pe-4 pb-3">
                <nav class="navbar bg-light navbar-light">
                    <a href="home" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>Marketing</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <img class="rounded-circle" src="images/${sessionScope.account.avarta}" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">${sessionScope.account.user_name}</h6>
                            <span>Marketing</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="marketingDashBoard" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                    </div>
                    <div class="navbar-nav w-100">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="far fa-file-alt me-2"></i>Dánh sách</a>
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
                <form class="d-none d-md-flex ms-4">
                    <input class="form-control border-0" type="search" placeholder="Tìm kiếm">
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


            <!-- Sale & Revenue Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-4">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Số bài đánh giá hôm nay</p>
                                <h6 class="mb-0">${numOfFeedbacks}</h6>
                            </div>
                        </div>
                    </div>


                    <div class="col-sm-6 col-xl-4">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-pie fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Tổng số bài đánh giá</p>
                                <h6 class="mb-0">${sumOfFeedbacks}</h6>

                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-4">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Số Lượng người dùng</p>
                                <h6 class="mb-0">${numOfUser}</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <div class="col-sm-6 col-xl-4">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Số đơn hàng hôm nay</p>
                                <h6 class="mb-0">${numOfBills}</h6>
                            </div>
                        </div>
                    </div>


                    <div class="col-sm-6 col-xl-4">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-pie fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Tổng số sản phẩm hiện có</p>
                                <h6 class="mb-0">${numOfProducts}</h6>

                            </div>
                        </div>
                    </div>

                    <div class="col-sm-6 col-xl-4">
                        <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                            <i class="fa fa-chart-line fa-3x text-primary"></i>
                            <div class="ms-3">
                                <p class="mb-2">Số sản phẩm đã bán</p>
                                <h6 class="mb-0">${NumOfProductsSold}</h6>
                            </div>
                        </div>
                    </div>
                </div>
            </div>                                
            <!-- Sale & Revenue End -->


            <!-- Top Trends Product  Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="row g-4">
                    <form action="marketingDashBoard" method="post" id="form1" onsubmit="return validateForm('form1');">
                        <div class="col-sm-12 col-xl-12">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Xu Hướng mua hàng</h6>
                                    <input type="text" name="Action" value="product" class="form-control" style="display: none" readonly/>
                                    <div class="d-flex">
                                        <div class="me-2">
                                            <label for="quantity" class="form-label">Số lượng sản phẩm:</label>
                                            <input type="number" id="quantity" class="form-control" name="quantity" value="${sessionScope.quantity}" min="1">
                                        </div>
                                        <div class="me-2">
                                            <label for="start-date-sales" class="form-label">Ngày bắt đầu:</label>
                                            <input type="date" id="start-date-sales" class="form-control" value="${sessionScope.startdate}" name="startdate">
                                        </div>
                                        <div class="me-2">
                                            <label for="end-date-sales" class="form-label">Ngày kết thúc:</label>
                                            <input type="date" id="end-date-sales" class="form-control" value="${sessionScope.enddate}" name="enddate">
                                        </div>
                                        <div>
                                            <button id="show-sales" class="btn btn-primary mt-4">Xem</button>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <canvas id="marketingDashBoard"></canvas>
                                </div>
                            </div>
                        </div>
                    </form>
                    <div class="col-sm-12 col-xl-6">
                        <form action="marketingDashBoard" method="post" id="form2" onsubmit="return validateForm('form2');">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Thanh toán hàng đầu:</h6>
                                    <input type="text" name="Action" value="user" class="form-control" style="display: none" readonly/>
                                    <div class="d-flex">
                                        <div class="me-2">
                                            <label for="quantity" class="form-label">Số lượng Người dùng:</label>
                                            <input type="number" id="Uquantity" class="form-control" name="Uquantity" value="${sessionScope.Uquantity}" min="1" max="${numOfUser}">
                                        </div>
                                        <div>
                                            <button id="show-sales-form2" class="btn btn-primary mt-4">Xem</button>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <canvas id="marketingDashBoard1"></canvas>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-sm-12 col-xl-6">
                        <form action="marketingDashBoard" method="post" id="form3" onsubmit="return validateForm('form3');">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Số lượng sản phẩm</h6>
                                    <input type="text" name="Action" value="category" class="form-control" style="display: none" readonly/>
                                    <div class="d-flex">
                                        <div>
                                            <button id="show-sales-category" class="btn btn-primary mt-4">Xem</button>
                                        </div>
                                    </div>
                                </div>
                                <div>
                                    <canvas id="marketingDashBoard2"></canvas>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Top Trends Product  End -->


            <!-- Footer Start -->
            <div class="container-fluid pt-4 px-4">
                <div class="bg-light rounded-top p-4">
                    <div class="row">
                        <div class="col-12 col-sm-6 text-center text-sm-start">
                            &copy; <a href="#">Feds</a>, All Right Reserved. 
                        </div>

                    </div>
                </div>
            </div>
            <!-- Footer End -->
        </div>
        <!-- Content End -->


        <!-- Back to Top -->
        <a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"><i class="bi bi-arrow-up"></i></a>
    </div>

    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/chart/chart.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/tempusdominus/js/moment.min.js"></script>
    <script src="lib/tempusdominus/js/moment-timezone.min.js"></script>
    <script src="lib/tempusdominus/js/tempusdominus-bootstrap-4.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>


    <script src="https://cdn.jsdelivr.net/npm/chart.js@4.4.2/dist/chart.umd.min.js"></script>

    <script>
                            var ProductNames = [];
                            var ProductQuans = [];
        <c:forEach items="${sessionScope.ProductName}" var="val" varStatus="loop">
                            ProductNames.push("${val}");
        </c:forEach>

        <c:forEach items="${sessionScope.ProductQuan}" var="val" varStatus="loop">
                            ProductQuans.push(${val});
        </c:forEach>
                            var ctx = document.getElementById('marketingDashBoard').getContext('2d');
                            var myChart = new Chart(ctx, {
                                type: 'bar',
                                data: {
                                    labels: ProductNames,
                                    datasets: [{
                                            label: 'Số sản phẩm bán được',
                                            data: ProductQuans,
                                            borderWidth: 1
                                        }]
                                },
                                options: {
                                    indexAxis: 'y',
                                    scales: {
                                        x: {
                                            beginAtZero: true
                                        }
                                    },
                                    plugins: {
                                        legend: {
                                            display: false // Ẩn legend
                                        }
                                    },
                                    text: {
                                        color: 'black', // Màu chữ
                                        align: 'center', // Căn chỉnh chữ
                                        font: {
                                            size: 12 // Kích thước chữ
                                        }
                                    }
                                }
                            });
    </script>
    <script>
        var UserNames = [];
        var UserPayment = [];
        <c:forEach items="${sessionScope.username}" var="val" varStatus="loop">
        UserNames.push("${val}");
        </c:forEach>

        <c:forEach items="${sessionScope.userPayment}" var="val" varStatus="loop">
        UserPayment.push(${val});
        </c:forEach>
        var ctx = document.getElementById('marketingDashBoard1').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: UserNames,
                datasets: [{
                        label: 'Tổng số tiền',
                        data: UserPayment,
                        borderWidth: 1
                    }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                },
                plugins: {
                    legend: {
                        display: false // Ẩn legend
                    }
                },
                text: {
                    color: 'black', // Màu chữ
                    align: 'center', // Căn chỉnh chữ
                    font: {
                        size: 12 // Kích thước chữ
                    }
                }
            }
        });
    </script>
    <script>
        var Categories = [];
        var ProductCounts = [];
        <c:forEach items="${sessionScope.CName}" var="val" varStatus="loop">
        Categories.push("${val}");
        </c:forEach>

        <c:forEach items="${sessionScope.ProductCount}" var="val" varStatus="loop">
        ProductCounts.push(${val});
        </c:forEach>

        var combinedData = Categories.map((category, index) => ({category, count: ProductCounts[index]}));


        combinedData.sort((a, b) => b.count - a.count);


        Categories = combinedData.map(item => item.category);
        ProductCounts = combinedData.map(item => item.count);


        myChart.data.labels = Categories;
        myChart.data.datasets[0].data = ProductCounts;
        myChart.update();
        var ctx = document.getElementById('marketingDashBoard2').getContext('2d');
        var myChart = new Chart(ctx, {
            type: 'doughnut',
            data: {
                labels: Categories,
                datasets: [{
                        label: 'Tổng sản phẩm',
                        data: ProductCounts,
                        borderWidth: 1,
                    }]
            },
            options: {
                scales: {
                    y: {
                        beginAtZero: true
                    }
                },
                plugins: {
                    legend: {
                        display: true, // Hiển thị legend
                        position: 'top' // Ẩn legend
                    }
                },
                text: {
                    color: 'black', // Màu chữ
                    align: 'center', // Căn chỉnh chữ
                    font: {
                        size: 12 // Kích thước chữ
                    }
                }
            }
        });
    </script>

    <script>
        $('.sidebar-toggler').click(function () {
            $('.sidebar, .content').toggleClass("open");
            return false;
        });
    </script>
</body>

</html>
