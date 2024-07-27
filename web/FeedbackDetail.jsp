<%-- 
    Document   : fb_detail
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
        <title>FEEDBACK DETAIL FOR SALER</title>
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
            .feedback-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 20px;
            }

            .feedback-item {
                display: flex;
                align-items: center;
                width: 100%;
                max-width: 1000px;
                background-color: #f8f9fa;
                padding: 20px;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                margin-bottom: 20px;
            }

            .feedback-item img {
                max-width: 350px;
                height: auto;
                border-radius: 10px;
                margin-right: 20px;
            }

            .feedback-info {
                display: flex;
                flex-direction: column;
                flex-grow: 1;   
            }

            .info-row {
                display: flex;
                margin-bottom: 10px;
            }

            .info-row h6 {
                margin: 0;
                font-size: 16px;
                width: 200px;
            }

            .info-row p {
                margin: 0;
                font-size: 16px;
                flex-grow: 1;
            }

            .feedback-comment {
                width: 100%;
                margin-top: 20px;
            }

            .feedback-comment h6 {
                font-size: 16px;
                margin-bottom: 10px;
            }

            .feedback-comment textarea {
                width: 100%;
                height: 150px;
                font-size: 16px;
                padding: 10px;
                border-radius: 5px;
                border: 1px solid #ddd;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            .update-status {
                display: flex;
                justify-content: flex-end;
                margin-top: 20px;
            }

            .update-status button {
                background: #bfbeef;
                color: #03009a;
                width: 139px;
                height: 35px;
                border-radius: 7px;
                font-size: 16px;
                border: none;
                cursor: pointer;
                transition: background 0.3s ease;
            }

            .update-status button:hover {
                background: #9f9fed;
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
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>FB DETAIL</h3>
                    </a>
                    <div class="d-flex align-items-center ms-4 mb-4">
                        <div class="position-relative">
                            <img class="rounded-circle" src="images/${sessionScope.account.avarta}" alt="" style="width: 40px; height: 40px;">
                            <div class="bg-success rounded-circle border border-2 border-white position-absolute end-0 bottom-0 p-1"></div>
                        </div>
                        <div class="ms-3">
                            <h6 class="mb-0">${sessionScope.account.user_name}</h6>
                            <span>Saler</span>
                        </div>
                    </div>
                    <div class="navbar-nav w-100">
                        <a href="/Feds/saleDashboard" class="nav-item nav-link "><i class="fa fa-tachometer-alt me-2"></i>Tổng quát</a>
                        <a href="/Feds/orderListBillController" class="nav-item nav-link "><i class="fa fa-table me-2"></i>Đơn hàng</a>
                        <a href="/Feds/feedbackListFeedbackController" class="nav-item nav-link active"><i class="fa fa-th me-2"></i>Đánh giá</a> 
                        <a href="/Feds/contactListContactController" class="nav-item nav-link"><i class="far fa-file-alt me-2 "></i>Liên hệ</a> 
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
                        <img class="rounded-circle me-lg-2" src="images/${sessionScope.account.avarta}" alt="" style="width: 40px; height: 40px;">
                        <span class="d-none d-lg-inline-flex">${sessionScope.account.user_name}</span>
                    </a>
                    <div class="dropdown-menu dropdown-menu-end bg-light border-0 rounded-0 rounded-bottom m-0">
                        <a href="userProfile" class="dropdown-item">My Profile</a>
                        <a href="home" class="dropdown-item">Home Page</a>
                        <c:choose>
                            <c:when test="${ not empty sessionScope.account}"><a href="${pageContext.request.contextPath}/userLogout" class="dropdown-item">Logout</a></c:when>
                            <c:otherwise><a href="${pageContext.request.contextPath}/login" class="dropdown-item">Logout</a></c:otherwise>
                        </c:choose>
                    </div>
                </div>
            </div>
        </nav>
        <!-- Navbar End -->

        <!-- Recent Sales Start -->
        <div class="container-fluid pt-4 px-4">
            <div class="bg-light text-center rounded" style="margin-top: 20px; margin-bottom: 20px">

                <div class="d-flex align-items-center justify-content-between mb-4" >


                    <div style="margin-right: 20px; margin-top: 1rem"><a class="btn btn-outline-success m-2" style="width: 100px" href="/Feds/feedbackListFeedbackController">Quay lại</a></div>
                </div>




                <!-- Feedback Details Start -->

                <div class="feedback-container">
                    <c:forEach items="${sessionScope.feedbackDetail}" var="fbd">
                        <div class="feedback-item">
                            <img src="imgFeedBack/${fbd.img}" alt="Feedback Image">
                            <div class="feedback-info" style="margin-left:150px">
                                <div class="info-row" > 
                                    <h6>Ngày đánh giá:</h6>
                                    <p>${fbd.date}</p>
                                </div>
                                <div class="info-row">
                                    <h6>Tên Sản Phẩm:</h6>
                                    <p>${fbd.product_name}</p>
                                </div>
                                <div class="info-row">
                                    <h6>Khách hàng:</h6>
                                    <p>${fbd.userName}</p>
                                </div>
                                <div class="info-row">
                                    <h6>Thông tin khách hàng:</h6>
                                    <p>${fbd.phone_number}<br>${fbd.email}</p>
                                </div>
                                <div class="feedback-comment">
                                    <h6>Nội dung đánh giá:</h6>
                                    <textarea readonly>${fbd.comment}</textarea>
                                </div>
                                <form action="feedbackDetailFeedbackController" method="post" style=" display: flex; align-items: center;">
                                <div style="margin-right: 5px; margin-left: 15px; margin-top: 1rem; color: #00000030; font-weight: bold; margin-right: 20px">Trạng thái:</div>
                                <input type="hidden" style="margin-left: 5px" name="id" value="${sessionScope.feedbackId}"/>
                                <select name="status" onchange="this.form.submit()" class="border-0" style="width: 100px; color: #000000ad; padding: 6px 0px; border-radius: 5px; padding-left: 7px; margin-top: 1rem"/>
                                <option ${sessionScope.status == "Hiện"?"selected":""} value="Hiện">Hiện</option>
                                <option ${sessionScope.status == "Ẩn"?"selected":""} value="Ẩn">Ẩn</option>
                                </select>
                            </form>
                            </div>
                            
                        </div>


                    </c:forEach>
                </div>

                <!-- Feedback Details End -->

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
                var table = document.getElementById('sampleTable');
                var rows = table.getElementsByTagName('tr');
                var productId = null;

                // Loop through the table rows to find the product ID in the first column
                for (var i = 1; i < rows.length; i++) {
                    var firstCell = rows[i].getElementsByTagName('td')[0];
                    if (firstCell) {
                        productId = firstCell.innerText;
                        break;
                    }
                }

                if (productId) {
                    window.location.href = '/Feds/billDetailBillController?action=search&value=' + encodeURIComponent(query) + '&id=' + encodeURIComponent(productId);
                }
            }
        }
    });
</script>
</body>

</html>