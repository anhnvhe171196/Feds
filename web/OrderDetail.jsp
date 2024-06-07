<%-- 
    Document   : index_sale
    Created on : May 20, 2024, 9:14:06 PM
    Author     : Trong
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>ORDER DETAIL FOR SALER</title>
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
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/5.3.0/css/bootstrap.min.css" rel="stylesheet">
        <!-- Customized Bootstrap Stylesheet -->
        <link href="css/bootstrap.minsale.css" rel="stylesheet">

        <!-- Template Stylesheet -->
        <link href="css/stylesale.css" rel="stylesheet">
        <style>
            #dropdownMenuButton {
                display: block;
                color: #757575;
                background-color: #fff;
                background-clip: padding-box;
                border-radius: 5px;
                border: 10px black;
            }
            .btn-sm1 {
                padding: 0.3rem 0.3rem; /* Điều chỉnh padding cho nút */
                font-size: 0.8rem; /* Điều chỉnh kích thước font cho nút */
                line-height: 1; /* Điều chỉnh chiều cao dòng cho nút */
            }

            .dropdown-menu .dropdown-item {
                border-bottom: 1px solid #ddd;
                transition: border-color 0.3s ease;
            }

            .dropdown-menu .dropdown-item:hover {
                border-color: #333;
            }

            #clock{
                margin-left: 20px;
                font-weight: 600;
                color: rgb(0, 0, 0);
                font-size: 13px;
            }
            .print-file{
                background: #bfbeef!important;
                color: #03009a!important;
                width: 139px;
                height: 35px;
                border-radius: 7px;
                font-size: 16px;

            }
        </style>
    </head>

    <body onload="time()">
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
                    <a href="/Feds/saleDashboard" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>ORDER DETAIL</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <img class="rounded-circle" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">Jhon Doe</h6>
                            <span>Admin</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="/Feds/saleDashboard" class="nav-item nav-link "><i class="fa fa-tachometer-alt me-2"></i>Dashboard</a>
                        <a href="/Feds/orderListBillController" class="nav-item nav-link active"><i class="fa fa-th me-2"></i>Order List</a>
                        <a href="#" class="nav-item nav-link"><i class="fa fa-th me-2"></i>Feedback List</a> 
                    </div>
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
            <div id="clock"></div>
            <div class="navbar-nav align-items-center ms-auto">


                <div class="nav-item dropdown">
                    <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">
                        <img class="rounded-circle me-lg-2" src="img/user.jpg" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex">John Doe</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="#" class="dropdown-item">My Profile</a>
                        <a href="#" class="dropdown-item">Settings</a>
                        <a href="#" class="dropdown-item">Log Out</a>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->

        <!-- Recent Sales Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light text-center rounded p-4">

                <div class="d-flex align-items-center justify-content-between mb-4">
                    <div class="d-none d-md-flex ms-4" method="GET" action="">
                        <input id="searchBox" class="form-control border-0" type="search" name="value" placeholder="Tìm kiếm" value="${sessionScope.value}">
                    </div>


                    <form action="billDetailBillController" method="post" style="margin-left: 760px">
                        <input type="hidden" name="id" value="${sessionScope.idBill}"/>
                        <select name="status" onchange="this.form.submit()" class="border-0" style="width: 170px; color: #000000ad; padding: 6px 0px; border-radius: 5px; padding-left: 7px;"/>
                        <option ${sessionScope.status == "Chờ Xử Lý"?"selected":""} value="Chờ Xử Lý">Chờ Xử Lý</option>
                        <option ${sessionScope.status == "Đang Xử Lý"?"selected":""} value="Đang Xử Lý">Đang Xử Lý</option>
                        <option ${sessionScope.status == "Đang Giao Hàng"?"selected":""} value="Đang Giao Hàng">Đang Giao Hàng</option>
                        <option ${sessionScope.status == "Hoàn Thành"?"selected":""} value="Hoàn Thành">Hoàn Thành</option>
                        <option ${sessionScope.status == "Hủy"?"selected":""} value="Hủy">Hủy</option>
                        </select>
                    </form>

                    <div class="col-sm-2">
                        <a class="btn btn-delete btn-sm print-file" type="button" title="In" onclick="myApp.printTable()"><i
                                class="fas fa-print"></i> In dữ liệu</a>
                    </div>
                </div>


            </div>
            <div class="table-responsive">
                <table class="table text-start align-middle table-bordered table-hover mb-0" id="sampleTable">
                    <thead>
                        <tr class="text-dark">
                            <th scope="col">Mã Đơn</th>
                            <th scope="col">Tên Sản Phẩm</th>
                            <th scope="col">Ảnh Sản Phẩm</th>
                            <th scope="col">Giá Sản Phẩm</th>
                            <th scope="col">RAM</th>
                            <th scope="col">ROM</th>
                            <th scope="col" width="200px">Size</th>
                            <th scope="col">Màu</th>

                        </tr>
                    </thead>
                    <tbody>

                        <c:forEach items="${sessionScope.listBillOrder}" var="b"> 
                            <tr>
                                <td>${b.bill_id}</td>
                                <td>${b.product_name}</td>
                                <td><img src="images/${b.product_img}" alt="" width="150px"></td>
                                <td><fmt:formatNumber value="${b.price}" pattern="#,###"/> VNĐ</td>
                                <c:if test="${b.ram == null}">
                                    <td></td>
                                </c:if>
                                <c:if test="${b.ram != null}">
                                    <td>${b.ram}</td>
                                </c:if>
                                <c:if test="${b.rom == null}">
                                    <td></td>
                                </c:if>
                                <c:if test="${b.rom != null}">
                                    <td>${b.rom}</td>
                                </c:if>
                                <c:if test="${b.size == null}">
                                    <td></td>
                                </c:if>
                                <c:if test="${b.size != null}">
                                    <td>${b.size}</td>
                                </c:if>
                                <c:if test="${b.color == null}">
                                    <td></td>
                                </c:if>
                                <c:if test="${b.color != null}">
                                    <td>${b.color}</td>
                                </c:if>
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
                    &copy; <a href="/Feds/home">F Electronic Shop.</a>
                </div>
                <div class="col-12 col-sm-6 text-center text-sm-end">
                    <!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
                    Designed By <a href="#">...</a>
                    </br>
                    Distributed By <a class="border-bottom" href="#" target="_blank">...</a>
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
<script src="js/mainsale.js"></script>
<script>
                            $('#sampleTable').DataTable();
                            function time() {
                                var today = new Date();
                                var weekday = ["Chủ Nhật", "Thứ Hai", "Thứ Ba", "Thứ Tư", "Thứ Năm", "Thứ Sáu", "Thứ Bảy"];
                                var day = weekday[today.getDay()];
                                var dd = today.getDate();
                                var mm = today.getMonth() + 1;
                                var yyyy = today.getFullYear();
                                var h = today.getHours();
                                var m = today.getMinutes();
                                var s = today.getSeconds();
                                m = checkTime(m);
                                s = checkTime(s);
                                var nowTime = h + " giờ " + m + " phút " + s + " giây";
                                if (dd < 10)
                                    dd = '0' + dd;
                                if (mm < 10)
                                    mm = '0' + mm;
                                var todayString = day + ', ' + dd + '/' + mm + '/' + yyyy;
                                var tmp = '<span class="date"> ' + todayString + ' - ' + nowTime + '</span>';
                                document.getElementById("clock").innerHTML = tmp;
                                setTimeout(time, 1000);
                            }

                            function checkTime(i) {
                                if (i < 10)
                                    i = "0" + i;
                                return i;
                            }


</script>

<script>
    var myApp = new function () {
        this.printTable = function () {
            var tab = document.getElementById('sampleTable');
            var win = window.open('', '', 'height=700,width=700');
            win.document.write(tab.outerHTML);
            win.document.close();
            win.print();
        };
    };

</script>

<script>
    document.getElementById('searchBox').addEventListener('keydown', function (event) {
        if (event.key === 'Enter') {
            event.preventDefault();
            var query = this.value;
            if (query) {
                window.location.href = '/Feds/billDetailBillController/action=search?value=' + encodeURIComponent(query);
            }
        }
    });
</script>
</body>

</html>