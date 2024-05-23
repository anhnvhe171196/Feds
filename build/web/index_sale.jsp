<%-- 
    Document   : index_sale
    Created on : May 20, 2024, 9:14:06 PM
    Author     : Trong
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>SALE DASHBOARD</title>
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
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/style.css" rel="stylesheet">

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
                    <a href="index.html" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>SALE</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <!--                            <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">-->
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">Trong</h6>
                            <span>Sale Man</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="index_sale.jsp" class="nav-item nav-link active"><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown"><i class="fa fa-laptop me-2"></i>Elements</a>
                            <div class="dropdown-menu bg-transparent border-0">
                                <a href="button.html" class="dropdown-item">Buttons</a>
                                <a href="typography.html" class="dropdown-item">Typography</a>
                                <a href="element.html" class="dropdown-item">Other Elements</a> 
                            </div>
                        </div>
                        <a href="widget.html" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Widgets</a>
                        <a href="form_sale.jsp" class="nav-item nav-link"><i class="fa fa-keyboard me-2"></i>Forms</a>
                        <a href="table.html" class="nav-item nav-link"><i class="fa fa-table me-2"></i>Tables</a>
                        <a href="chart.html" class="nav-item nav-link"><i class="fa fa-chart-bar me-2"></i>Charts</a>

                    </div>
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
                        <input class="form-control border-0" type="search" placeholder="Tìm kiếm">
                    </form>
                    <div class="navbar-nav align-items-center ms-auto">
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <i class="fa fa-bell me-lg-2"></i>
                                <span class="d-none d-lg-inline-flex">Thông báo</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">Profile updated</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">New user added</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item">
                                    <h6 class="fw-normal mb-0">Password changed</h6>
                                    <small>15 minutes ago</small>
                                </a>
                                <hr class="dropdown-divider">
                                <a href="#" class="dropdown-item text-center">See all notifications</a>
                            </div>
                        </div>
                        <div class="nav-item dropdown">
                            <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                                <!--                                <img class="rounded-circle me-lg-2" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">-->
                                <span class="d-none d-lg-inline-flex">John Doe</span>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                                <a href="#" class="dropdown-item">Thông tin cá nhân</a>
                                <a href="#" class="dropdown-item">Cài đặt</a>
                                <a href="#" class="dropdown-item">Đăng xuất</a>
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
                                    <h6 class="mb-0">${numOfBills}</h6>
                                </div>
                            </div>
                        </div>


                        <div class="col-sm-6 col-xl-4">
                            <div class="bg-light rounded d-flex align-items-center justify-content-between p-4">
                                <i class="fa fa-chart-pie fa-3x text-primary"></i>
                                <div class="ms-3">
                                    <p class="mb-2">Tổng thu nhập hôm nay</p>
                                    <h6 class="mb-0">${sumOfDoneBills} VND</h6>
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
                                                <option ${requestScope.month==1?"selected":""} value="1">Tháng 1</option>
                                                <option ${requestScope.month==2?"selected":""} value="2">Tháng 2</option>
                                                <option ${requestScope.month==3?"selected":""} value="3">Tháng 3</option>
                                                <option ${requestScope.month==4?"selected":""} value="4">Tháng 4</option>
                                                <option ${requestScope.month==5?"selected":""} value="5">Tháng 5</option>
                                                <option ${requestScope.month==6?"selected":""} value="6">Tháng 6</option>
                                                <option ${requestScope.month==7?"selected":""} value="7">Tháng 7</option>
                                                <option ${requestScope.month==8?"selected":""} value="8">Tháng 8</option>
                                                <option ${requestScope.month==9?"selected":""} value="9">Tháng 9</option>
                                                <option ${requestScope.month==10?"selected":""} value="10">Tháng 10</option>
                                                <option ${requestScope.month==11?"selected":""} value="11">Tháng 11</option>
                                                <option ${requestScope.month==12?"selected":""} value="12">Tháng 12</option>
                                            </select>
                                        
                                    </div>
                                    <h6 class="mb-0" id="incomeDisplay">${sumOfBillByMonth}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Sale & Revenue End -->


                <!-- Top Trends & Product Prioritize Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Sản phẩm bán chạy</h6>
                                    <a href="">Tất cả</a>
                                </div>
                                <canvas id="worldwide-sales"></canvas>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Đơn hàng ưu tiên</h6>
                                    <a href="">Tất cả</a>
                                </div>
                                <canvas id="salse-revenue"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Top Trends & Product Prioritize Start -->
                
                <!-- Product Prioritize Chart Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="row g-4">
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Sản phẩm bán chạy</h6>
                                    <a href="">Tất cả</a>
                                </div>
                                <canvas id="worldwide-sales"></canvas>
                            </div>
                        </div>
                        <div class="col-sm-12 col-xl-6">
                            <div class="bg-light text-center rounded p-4">
                                <div class="d-flex align-items-center justify-content-between mb-4">
                                    <h6 class="mb-0">Khách hàng thân </h6>
                                    <a href="">Tất cả</a>
                                </div>
                                <canvas id="salse-revenue"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- Product Prioritize Chart End -->


                <!-- Recent Sales Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light text-center rounded p-4">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <h6 class="mb-0">Đơn hàng mới</h6>
                            <a href="">Tất cả</a>
                        </div>
                        <div class="table-responsive">
                            <table class="table text-start align-middle table-bordered table-hover mb-0">
                                <thead>
                                    <tr class="text-dark">
                                        <th scope="col"><input class="form-check-input" type="checkbox"></th>
                                        <th scope="col">Ngày</th>
                                        <th scope="col">Mã Đơn</th>
                                        <th scope="col">Người mua</th>
                                        <th scope="col">Giá </th>
                                        <th scope="col">Trạng thái</th>
                                        <th scope="col">Hoạt động</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${billList}" var="b"> 
                                        <tr>
                                            <td><input class="form-check-input" type="checkbox"></td>
                                            <td>${b.date}</td>
                                            <td>${b.bill_id}</td>
                                            <td>${b.user_name}</td>
                                            <td>${b.total_price}</td>
                                            <td>${b.status}</td>
                                            <td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
                                        </tr>
                                    </c:forEach>


                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- Recent Sales End -->


                


                <!-- Footer Start -->
                <div class="container-fluid pt-4 px-4">
                    <div class="bg-light rounded-top p-4">
                        <div class="row">
                            <div class="col-12 col-sm-6 text-center text-sm-start">
                                &copy; <a href="#">Your Site Name</a>, All Right Reserved. 
                            </div>
                            <div class="col-12 col-sm-6 text-center text-sm-end">
                                <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                                Designed By <a href="https://htmlcodex.com">HTML Codex</a>
                                </br>
                                Distributed By <a class="border-bottom" href="https://themewagon.com" target="_blank">ThemeWagon</a>
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
        <script>


                                                function sendSelectedMonth() {
                                                    const selectedMonth = document.getElementById("monthSelect").value;
                                                    window.location.href = `/Feds/saleDashboard?action=sumByMonth&month=` + selectedMonth;
                                                }

                                                
        </script>
    </body>

</html>