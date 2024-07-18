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
        <title>REPLY CUSTOMER CONTACT</title>
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
                    <a href="/Feds/feedbackListFeedbackController" class="navbar-brand mx-4 mb-3">
                        <h3 class="text-primary"><i class="fa fa-hashtag me-2"></i>FEEDBACK</h3>
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
                        <a href="/Feds/feedbackListFeedbackController" class="nav-item nav-link "><i class="fa fa-th me-2 "></i>Đánh giá</a> 
                        <a href="/Feds/contactListContactController" class="nav-item nav-link active"><i class="far fa-file-alt me-2"></i>Liên hệ</a> 
                    </div>
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
                <div class="bg-light text-center rounded p-4">
                    <div class="d-flex align-items-center justify-content-between mb-4">
                        <form class="d-none d-md-flex ms-4" method="GET" action="contactListContactController">
                            <input type="hidden" name="action" value="search">
                            <input class="form-control border-0" type="search" name="value" placeholder="Tìm kiếm" value="${requestScope.value}">
                        </form>

                            <h2 style="color: red">${requestScope.error}</h2>
                        <button class="btn btn-outline-primary m-2"><a href="/Feds/contactListContactController?action=showAll">Xem Tất Cả</a></button>
                    </div>


                    <div class="table-responsive">
                        <table class="table text-start align-middle table-bordered table-hover mb-0">
                            <thead>
                                <tr class="text-dark">
                                    <th scope="col" style="width: 150px">Ngày</th>
                                    <th scope="col" style="width: 100px">Người liên hệ</th>
                                    <th scope="col" style="width: 140px">Email</th>
                                    <th scope="col" style="width: 120px">Số điện thoại</th>
                                    <th scope="col" style="width: 140px">Chủ đề</th>
                                    <th scope="col" style="max-width: 400px">Nội dung</th>
                                    <th scope="col" style="width: 128px">Hành động</th>
                                </tr>
                            </thead>
                            <tbody>

                                <c:forEach items="${sessionScope.listContact}" var="list"> 
                                    <tr>
                                        <td>${list.date}</td>
                                        <c:if test="${list.username == null}">
                                            <td></td>
                                        </c:if>
                                        <c:if test="${list.username != null}">
                                            <td>${list.username}</td>
                                        </c:if>
                                        <td>${list.email}</td>
                                        <td>${list.phone}</td>
                                        <td>${list.suject}</td>
                                        <td>${list.message}</td>
                                        <td>
                                            <button type="button" class="btn btn-outline-primary m-2 btn-center" onclick="openEmailDialog('${list.email}', '${list.suject}', '${list.message}')">Gửi Email</button>
                                        </td>

                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <!-- Recent Sales End -->

            <!-- Pagination -->
            <div class="container-fluid pt-4 px-4">
                <nav aria-label="Page navigation">
                    <ul class="pagination justify-content-center">
                        <!-- First Button -->
                        <c:if test="${sessionScope.page > 1}">
                            <li class="page-item">
                                <a class="page-link" href="/Feds/contactListContactController?action=paging&page=1">Trang đầu</a>
                            </li>
                        </c:if>
                        <!-- Previous Button -->
                        <c:if test="${sessionScope.page > 1}">
                            <li class="page-item">
                                <a class="page-link" href="/Feds/contactListContactController?action=paging&page=${sessionScope.page - 1}">Trước</a>
                            </li>
                        </c:if>
                        <!-- Page Numbers Logic -->
                        <c:choose>
                            <c:when test="${sessionScope.page <= 2}">
                                <c:set var="start" value="1"/>
                                <c:set var="end" value="${totalPages < 3 ? totalPages : 3}"/>
                            </c:when>
                            <c:when test="${sessionScope.page >= totalPages - 1}">
                                <c:set var="start" value="${totalPages - 2 > 0 ? totalPages - 2 : 1}"/>
                                <c:set var="end" value="${totalPages}"/>
                            </c:when>
                            <c:otherwise>
                                <c:set var="start" value="${sessionScope.page - 1}"/>
                                <c:set var="end" value="${sessionScope.page + 1}"/>
                            </c:otherwise>
                        </c:choose>
                        <c:forEach var="i" begin="${start}" end="${end}">
                            <li class="page-item ${i == sessionScope.page ? 'active' : ''}">
                                <a class="page-link" href="/Feds/contactListContactController?action=paging&page=${i}">
                                    <button type="button" class="btn btn-primary btn-sm1">${i}</button>
                                </a>
                            </li>
                        </c:forEach>
                        <!-- Next Button -->
                        <c:if test="${sessionScope.page < totalPages}">
                            <li class="page-item">
                                <a class="page-link" href="/Feds/contactListContactController?action=paging&page=${sessionScope.page + 1}">Sau</a>
                            </li>
                        </c:if>
                        <!-- Last Button -->
                        <c:if test="${sessionScope.page < totalPages}">
                            <li class="page-item">
                                <a class="page-link" href="/Feds/contactListContactController?action=paging&page=${totalPages}">Trang cuối</a>
                            </li>
                        </c:if>
                    </ul>
                </nav>
            </div>


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
        function openEmailDialog(email, subject) {
            // Hiển thị dialog box
            $('#emailModal').modal('show');

            // Đổ dữ liệu vào modal
            document.getElementById('email').innerHTML = email;
            document.getElementById('subject').value = "Reply " + subject;
        }
    </script>
    <!-- Modal -->
    <div class="modal fade" id="emailModal" tabindex="-1" aria-labelledby="emailModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
            <div class="modal-content" style="width: 1000px">
                <form action="sendEmailContact" method="post">
                    <div class="modal-header">
                        <h5 class="modal-title" id="emailModalLabel">Trả lời liên hệ</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <p>Gửi email đến: <span id="email"></span></p>
                        <input type="hidden" id="email-hidden" name="email">
                        <div class="mb-3">
                            <label for="subject" class="form-label">Chủ đề: </label>
                            <input type="text" class="form-control" id="subject" name="subject">
                        </div>
                        <div class="mb-3">
                            <label for="message" class="form-label">Nội dung: </label>
                            <textarea class="form-control" id="message" name="message" rows="5"></textarea>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary">Send</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        document.addEventListener('DOMContentLoaded', function () {
            var emailElement = document.getElementById('email');
            var emailHiddenInput = document.getElementById('email-hidden');

            if (emailElement && emailHiddenInput) {
                emailElement.addEventListener('DOMSubtreeModified', function () {
                    emailHiddenInput.value = emailElement.textContent;
                });
            }
        });
    </script>
</body>

</html>