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
    </head>

    <body>
        <c:choose>
            <c:when test="${sessionScope.account != null && sessionScope.account.getRole_id() >= 1 && sessionScope.account.getRole_id() <= 4}">
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
                                <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>Marketing</h3>
                            </a>
                            <div class="d-flex align-items-center ms-4 mb-4">
                                <div class="position-relative">
                                    <!--                            <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">-->
                                    <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                                </div>
                                <div class="ms-3">
                                    <h6 class="mb-0">${sessionScope.account.user_name}</h6>
                                    <span>Order Process</span>
                                </div>
                            </div>
                            <div class="navbar-nav w-100">
                                <a href="marketingDashBoard" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                                <a href="OrderProcessorTable.jsp" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Order List</a></div>
                        </nav>
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
                                <input class="form-control border-0" type="search" placeholder="Search">
                            </form>
                            <div class="navbar-nav align-items-center ms-auto">
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                        <i class="fa fa-envelope me-lg-2"></i>
                                        <span class="d-none d-lg-inline-flex">Message</span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">

                                        <hr class="dropdown-divider">
                                        <a href="#" class="dropdown-item text-center">See all message</a>
                                    </div>
                                </div>
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                        <i class="fa fa-bell me-lg-2"></i>
                                        <span class="d-none d-lg-inline-flex">Notificatin</span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">

                                        <hr class="dropdown-divider">
                                        <a href="#" class="dropdown-item text-center">See all notifications</a>
                                    </div>
                                </div>
                                <div class="nav-item dropdown">
                                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                        <img class="rounded-circle me-lg-2" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                                        <span class="d-none d-lg-inline-flex">${sessionScope.account.user_name}</span>
                                    </a>
                                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                        <a href="userProfile" class="dropdown-item">My Profile</a>
                                        <a href="#" class="dropdown-item">Settings</a>
                                        <a href="#" class="dropdown-item">Log Out</a>
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
                                            <p class="mb-2">Số đơn hàng hôm nay</p>
                                            <h6 class="mb-0">${sessionScope.numOfBills}</h6>
                                        </div>
                                    </div>
                                </div>


                                <div class="col-sm-6 col-xl-4">
                                    <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                        <i class="fa fa-chart-pie fa-3x text-primary"></i>
                                        <div class="ms-3">
                                            <p class="mb-2">Tổng thu nhập hôm nay</p>
                                            <h6 class="mb-0"><fmt:formatNumber value="${sessionScope.sumOfDoneBills}" type="number" groupingUsed="true" /> VND</h6>

                                        </div>
                                    </div>
                                </div>


                                <div class="col-sm-6 col-xl-4">
                                    <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                        <i class="fa fa-chart-line fa-3x text-primary"></i>
                                        <div class="ms-3 w-100">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <p class="mb-0 xl-1">Tổng thu nhập</p>

                                                <select id="monthSelect" onchange="sendSelectedMonth()">
                                                    <option ${sessionScope.month==1?"selected":""} value="1">Tháng 1</option>
                                                    <option ${sessionScope.month==2?"selected":""} value="2">Tháng 2</option>
                                                    <option ${sessionScope.month==3?"selected":""} value="3">Tháng 3</option>
                                                    <option ${sessionScope.month==4?"selected":""} value="4">Tháng 4</option>
                                                    <option ${sessionScope.month==5?"selected":""} value="5">Tháng 5</option>
                                                    <option ${sessionScope.month==6?"selected":""} value="6">Tháng 6</option>
                                                    <option ${sessionScope.month==7?"selected":""} value="7">Tháng 7</option>
                                                    <option ${sessionScope.month==8?"selected":""} value="8">Tháng 8</option>
                                                    <option ${sessionScope.month==9?"selected":""} value="9">Tháng 9</option>
                                                    <option ${sessionScope.month==10?"selected":""} value="10">Tháng 10</option>
                                                    <option ${sessionScope.month==11?"selected":""} value="11">Tháng 11</option>
                                                    <option ${sessionScope.month==12?"selected":""} value="12">Tháng 12</option>
                                                </select>

                                            </div>
                                            <h6 class="mb-0" id="incomeDisplay"><fmt:formatNumber value="${sessionScope.sumOfBillByMonth}" type="number" groupingUsed="true" /></h6>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Sale & Revenue End -->


                        <!-- Top Trends Product  Start -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="row g-4">
                                <form action="marketingProduct" method="get" >
                                    <div class="col-sm-12 col-xl-12">
                                        <div class="bg-light text-center rounded p-4">
                                            <div class="d-flex align-items-center justify-content-between mb-4">
                                                <h6 class="mb-0">Top sản phẩm bán chạy</h6>
                                                <div class="d-flex">
                                                    <div class="me-2">
                                                        <label for="quantity" class="form-label">Số lượng sản phẩm:</label>
                                                        <input type="number" id="quantity" class="form-control" name="quantity" value="10" min="1">
                                                    </div>
                                                    <div class="me-2">
                                                        <label for="start-date-sales" class="form-label">Ngày bắt đầu:</label>
                                                        <input type="date" id="start-date-sales" class="form-control" name="startdate">
                                                    </div>
                                                    <div class="me-2">
                                                        <label for="end-date-sales" class="form-label">Ngày kết thúc:</label>
                                                        <input type="date" id="end-date-sales" class="form-control" name="enddate">
                                                    </div>
                                                    <div>
                                                        <button id="show-sales" class="btn btn-primary mt-4">Xem</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <canvas id="marketingProduct"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </form>    
                            </div>
                        </div>
                        <!-- Top Trends Product  End -->


                        <!-- Top Trend Category -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="row g-4">
                                <form action="trending" method="get">
                                    <div class="col-sm-12 col-xl-12">
                                        <div class="bg-light text-center rounded p-4">
                                            <div class="d-flex align-items-center justify-content-between mb-4">
                                                <h6 class="mb-0">Doanh thu</h6>
                                                <div class="d-flex">
                                                    <div class="me-2">
                                                        <label for="start-date-sales" class="form-label">Ngày bắt đầu:</label>
                                                        <input type="date" id="start-date-sales" class="form-control" name="startdate">
                                                    </div>
                                                    <div class="me-2">
                                                        <label for="end-date-sales" class="form-label">Ngày kết thúc:</label>
                                                        <input type="date" id="end-date-sales" class="form-control" name="enddate">
                                                    </div>
                                                    <div>
                                                        <button id="show-sales" class="btn btn-primary mt-4">Xem</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <canvas id="trending"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>

                        <!-- Top Trend Category End-->

                        <!-- Sum Revenue By Day Start -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="row g-4">
                                <form action="sum" method="get">
                                    <div class="col-sm-12 col-xl-12">
                                        <div class="bg-light text-center rounded p-4">
                                            <div class="d-flex align-items-center justify-content-between mb-4">
                                                <h6 class="mb-0">Doanh thu</h6>
                                                <div class="d-flex">

                                                    <div class="me-2">
                                                        <label for="start-date-priority" class="form-label">Ngày bắt đầu:</label>
                                                        <input type="date" id="start-date-priority" class="form-control" name="startdate">
                                                    </div>
                                                    <div class="me-2">
                                                        <label for="end-date-priority" class="form-label">Ngày kết thúc:</label>
                                                        <input type="date" id="end-date-priority" class="form-control" name="enddate">
                                                    </div>
                                                    <div>
                                                        <button id="show-priority" class="btn btn-primary mt-4">Xem</button>
                                                    </div>
                                                </div>
                                            </div>
                                            <div>
                                                <canvas id="2"></canvas>
                                            </div>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <!-- Sum Revenue By Day End -->


                        <!-- Bill Today Start -->
                        <div class="container-fluid pt-4 px-4">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Đơn hàng hôm nay</h6>
                                    <a href="/order_list.jsp">Tất cả</a>
                                </div>
                                <div class="table-responsive">
                                    <table class="table text-start align-middle table-bordered table-hover mb-0">
                                        <thead>
                                            <tr class="text-dark">
                                                <th scope="col">Ngày</th>
                                                <th scope="col">Mã Đơn</th>
                                                <th scope="col">Người mua</th>
                                                <th scope="col">Giá </th>
                                                <th scope="col">Trạng thái</th>
                                                <th scope="col">Hoạt động</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${sessionScope.billList}" var="b"> 
                                                <tr>
                                                    <td>${b.date}</td>
                                                    <td>${b.bill_id}</td>
                                                    <td>${b.user_name}</td>
                                                    <td><fmt:formatNumber value="${b.total_price}" type="number" groupingUsed="true" /></td>                       
                                                    <td>${b.status}</td>
                                                    <td><a class="btn btn-sm btn-primary" href="/orderDetail?action=&bill_id=">Xem đơn</a></td>
                                                </tr>
                                            </c:forEach>


                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- Bill Today End -->

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
            </c:when>
            <c:otherwise>
                <div id="notfound">
                    <div class="notfound" style="text-align: center">
                        <div class="notfound-404">
                            <h1 style="font-family: 'Montserrat', sans-serif;
                                font-size: 230px;
                                margin: 0px;
                                font-weight: 900;
                                position: absolute;
                                left: 50%;
                                -webkit-transform: translateX(-50%);
                                -ms-transform: translateX(-50%);
                                transform: translateX(-50%);
                                background: url('images/bg_2.jpg') no-repeat;
                                -webkit-background-clip: text;
                                -webkit-text-fill-color: transparent;
                                background-size: cover;">Oops!</h1>
                        </div>
                        <div style="margin-top: 150px;padding: 272px;">
                            <h2 style=" font-family: 'Montserrat', sans-serif;
                                color: #000;
                                font-size: 24px;
                                font-weight: 700;
                                text-transform: uppercase;
                                margin-top: 0;">Looks like you don't have access!</h2>
                            <p style="font-family: 'Montserrat', sans-serif;
                               color: #000;
                               font-size: 14px;
                               font-weight: 400;
                               margin-bottom: 20px;
                               margin-top: 0px;">The page you are looking for might have been removed had its name changed or is temporarily unavailable.</p>
                            <a style="font-family: 'Montserrat', sans-serif;
                               font-size: 14px;
                               text-decoration: none;
                               text-transform: uppercase;
                               background: #0046d5;
                               display: inline-block;
                               padding: 15px 30px;
                               border-radius: 40px;
                               color: #fff;
                               font-weight: 700;
                               -webkit-box-shadow: 0px 4px 15px -5px #0046d5;
                               box-shadow: 0px 4px 15px -5px #0046d5;" href="home">Go To Homepage</a>
                        </div>
                    </div>

                </div>
            </c:otherwise>
        </c:choose> 

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
                                                    var names = [];
                                                    var sums = [];
            <c:forEach items="${sessionScope.name}" var="val" varStatus="loop">
                                                    names.push("${val}");
            </c:forEach>

            <c:forEach items="${sessionScope.sum}" var="val" varStatus="loop">
                                                    sums.push(${val});
            </c:forEach>
                                                    var ctx = document.getElementById('marketingProduct').getContext('2d');
                                                    var myChart = new Chart(ctx, {
                                                        type: 'bar',
                                                        data: {
                                                            labels: names,
                                                            datasets: [{
                                                                    label: 'Số sản phẩm bán được',
                                                                    data: sums,
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
                                                                    size: 12, // Kích thước chữ
                                                                }
                                                            }
                                                        }
                                                    });
        </script>
        <script>
            var names1 = [];
            var sums1 = [];
            <c:forEach items="${sessionScope.name1}" var="val" varStatus="loop">
            names1.push("${val}");
            </c:forEach>

            <c:forEach items="${sessionScope.sum1}" var="val" varStatus="loop">
            sums1.push(${val});
            </c:forEach>
                                                    var ctx = document.getElementById('trending').getContext('2d');
                                                    var myChart = new Chart(ctx, {
                                                        type: 'bar',
                                                        data: {
                                                            labels: names1,
                                                            datasets: [{
                                                                    label: 'Số tiền thu được',
                                                                    data: sums1,
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
                                                                    size: 12, // Kích thước chữ
                                                                }
                                                            }
                                                        }
                                                    });
        </script>

        <script>
            var names2 = [];
            var sums2 = [];
            <c:forEach items="${sessionScope.name2}" var="val" varStatus="loop">
            names2.push("${val}");
            </c:forEach>

            <c:forEach items="${sessionScope.sum2}" var="val" varStatus="loop">
            sums2.push(${val});
            </c:forEach>
            var ctx = document.getElementById('trending').getContext('2d');
            var myChart = new Chart(ctx, {
                type: 'bar',
                data: {
                    labels: names2,
                    datasets: [{
                            label: 'Số lượng bán được:',
                            data: sums2,
                            borderWidth: 1
                        }]
                },
                options: {
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>

        <script>
            function sendSelectedMonth() {
                const selectedMonth = document.getElementById("monthSelect").value;
                window.location.href = `/Feds/marketingDashBoard?action=sumByMonth&month=` + selectedMonth;
            }

            document.getElementById('show-sales').addEventListener('click', function () {
                sendData('start-date-sales', 'end-date-sales', 'sales');
            });
            document.getElementById('show-priority').addEventListener('click', function () {
                sendData('start-date-priority', 'end-date-priority', 'priority');
            });
            document.getElementById('show-sales').addEventListener('click', function () {
                var startDate = document.getElementById('start-date-sales').value;
                var endDate = document.getElementById('end-date-sales').value;
                var url = `/Feds/marketingDashBoard?action=chart1&startdate=${startDate}&enddate=${endDate}`;
                window.location.href = url;
            });
        </script>
    </body>

</html>
