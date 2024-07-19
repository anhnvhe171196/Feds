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

            .switch {
                position: relative;
                display: inline-block;
                width: 60px;
                height: 34px;
            }
            .switch input {
                opacity: 0;
                width: 0;
                height: 0;
            }
            .slider {
                position: absolute;
                cursor: pointer;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background-color: #ccc;
                transition: .4s;
            }
            .slider:before {
                position: absolute;
                content: "";
                height: 26px;
                width: 26px;
                left: 4px;
                bottom: 4px;
                background-color: white;
                transition: .4s;
            }
            input:checked + .slider {
                background-color: #2196F3;
            }
            input:focus + .slider {
                box-shadow: 0 0 1px #2196F3;
            }
            input:checked + .slider:before {
                transform: translateX(26px);
            }
            .slider.round {
                border-radius: 34px;
            }
            .slider.round:before {
                border-radius: 50%;
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
                    <input class="form-control border-0" type="search" placeholder="Search" name="search">&nbsp;&nbsp;&nbsp;
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
                                        <h6>Thông tin sản phẩm</h6>
                                    </div>
                                </div>
                                <div class="col" style="display: flex; justify-content: flex-end; align-items: center;">
                                    <div class="mb-2" style="margin-right: 10px;">
                                        <a onclick="ProductUpdate(${product.product_id})">
                                            <h6 class="sort-button" style="color: red;">Hoàn tác</h6>                                              
                                        </a>
                                    </div>
                                    <div style="margin: 0 10px; display: flex; align-items: center;"></div>
                                    <div class="mb-2">
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
                                                <form id="UpdateImg" action="marketingUpdateProductImage" method="post" enctype="multipart/form-data" onsubmit="return checkFileExtension()">
                                                    <div class="border rounded-4 mb-3 d-flex justify-content-center"> 
                                                        <img style="max-width: 100%; max-height: 100vh; margin: auto;" class="rounded-4 fit" src="images/${product.product_img}"/>
                                                    </div>

                                                    <input type="file" name="image" accept="image/*" id="imageMain"><br><br>
                                                    <input type="hidden" name="product_id" value="${product.product_id}" />
                                                    <div class="small font-italic text-muted mb-4">JPG hoặc PNG không lớn hơn 5 MB</div>
                                                    <c:if test="${requestScope.error != null}">
                                                        <h6 style="color: red; text-align: center; margin-bottom: 20px">${requestScope.error}</h6>
                                                    </c:if>
                                                    <!-- Profile picture upload button-->

                                                </form>
                                                <div class="row w-100">
                                                    <dt class="col-6"><button class="btn btn-primary" type="submit" form="UpdateImg">Tải lên hình ảnh mới</button></dt>
                                                    <dd class="col-6"><button type="button" class="btn btn-primary" form="UpdateForm" onclick="confirmSubmit()">Enter</button></dd>
                                                </div>

                                            </aside>

                                            <main class="col-lg-6">
                                                <div class="ps-lg-3">
                                                    <form id="UpdateForm" method="post" action="marketingUpdateProduct">
                                                        <h4 class="title text-dark">
                                                            <h6>Tên: </h6>
                                                            <input type="text" name="product_name" value="${product.product_name}" class="form-control" required/>
                                                        </h4>
                                                        <hr/>
                                                        <input type="hidden" name="product_id" value="${product.product_id}" class="form-control" readonly/>
                                                        <h6>Trạng thái sản phẩm: </h6>
                                                        <label class="switch">
                                                            <input type="checkbox" id="Pstatus" name="Pstatus" value="active" ${product.status == 'active' ? 'checked' : ''}>
                                                            <span class="slider round"></span>
                                                        </label>
                                                        <span id="status-text" class="status-text">
                                                            ${product.status == 'active' ? 'Hoạt động' : 
                                                              product.status == 'pending' ? 'Đang nhập hàng' : 
                                                              'Bị vô hiệu hóa'}
                                                        </span>
                                                        <hr/>

                                                </div>
                                                <hr/>
                                                <div class="mb-3">
                                                    <h6>Giá: </h6>
                                                    <input type="numb" name="price" value="<fmt:formatNumber value="${product.price.price}"/>" class="form-control" required/>
                                                </div>
                                                <hr/>
                                                <h6>Mô tả:</h6>
                                                <textarea name="decription" class="form-control" style="height: 200px ; overflow: auto">${product.detail.decription}</textarea>
                                                <hr/>
                                                <a href="#" id="show-more-details">Show more Details</a>
                                                <hr/>
                                                <div class="row" id="product-details" style="display: none;">
                                                    <div class="row w-100">
                                                        <dt class="col-3">Quantity</dt>
                                                        <dd class="col-9"><input type="number" name="quantity" value="${product.quantity}" class="form-control" min="0"/></dd>
                                                    </div>
                                                    <div class="row w-100">
                                                        <dt class="col-3">Ram</dt>
                                                        <dd class="col-9"><input type="text" name="ram" value="${product.detail.ram}" class="form-control" /></dd>
                                                    </div>
                                                    <div class="row w-100">
                                                        <dt class="col-3">Rom:</dt>
                                                        <dd class="col-9"><input type="text" name="rom" value="${product.detail.rom}" class="form-control" /></dd>
                                                    </div>
                                                    <div class="row w-100">
                                                        <dt class="col-3">Size:</dt>
                                                        <dd class="col-9"><input type="text" name="size" value="${product.detail.size}" class="form-control" /></dd>
                                                    </div>
                                                    <div class="row w-100">
                                                        <dt class="col-3">Battery:</dt>
                                                        <dd class="col-9"><input type="text" name="battery" value="${product.detail.battery}" class="form-control" /></dd>
                                                    </div>
                                                    <div class="row w-100">
                                                        <dt class="col-3">Weight:</dt>
                                                        <dd class="col-9"><input type="text" name="weight" value="${product.detail.weight}" class="form-control" /></dd>
                                                    </div>
                                                    <div class="row w-100">
                                                        <dt class="col-3">Color:</dt>
                                                        <dd class="col-9"><input type="text" name="color" value="${product.detail.color}" class="form-control" /></dd>
                                                    </div>
                                                    <div class="row w-100">
                                                        <dt class="col-3">CPU:</dt>
                                                        <dd class="col-9"><input type="text" name="cpu" value="${product.detail.cpu}" class="form-control" /></dd>
                                                    </div>
                                                    <div class="row w-100">
                                                        <dt class="col-3">Wattage:</dt>
                                                        <dd class="col-9"><input type="text" name="wattage" value="${product.detail.wattage}" class="form-control" /></dd>
                                                    </div>
                                                    <div class="row w-100">
                                                        <dt class="col-3">Status:</dt>
                                                        <dd class="col-9"><input type="text" name="status" value="${product.detail.status}" class="form-control" /></dd>
                                                    </div>
                                                    <div class="row w-100">
                                                        <dt class="col-3">Date start:</dt>
                                                        <dd class="col-9"><input type="date" name="dateStart" value="${product.price.dateStart}" class="form-control" required/></dd>
                                                    </div>
                                                    <div class="row w-100">
                                                        <dt class="col-3">Date End:</dt>
                                                        <dd class="col-9"><input type="date" name="dateEnd" value="${product.price.dateEnd}" class="form-control" required/></dd>
                                                    </div>
                                                    <div class="row w-100">
                                                        <dt class="col-3">Import Date:</dt>
                                                        <dd class="col-9"><input type="date" id="importDate" name="importDate" value="${product.date}" class="form-control" required/></dd>
                                                    </div>
                                                    <div class="row w-100">
                                                        <dt class="col-3">Sale:</dt>
                                                        <dd class="col-9"><input type="number" name="sale" value="${product.price.sale}" class="form-control" min="0" max="100"/></dd>
                                                    </div>
                                                    <input type="text" name="product_img" value="${product.product_img}" class="form-control" style="display: none" readonly/>
                                                    <hr/>
                                                </div>
                                                </form> 
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
        document.addEventListener('DOMContentLoaded', (event) => {
            const today = new Date().toISOString().split('T')[0];
            document.getElementsByName("dateStart")[0].setAttribute('min', today);
            document.getElementsByName("dateEnd")[0].setAttribute('min', today);
        });

        const detailsDiv = document.getElementById("product-details");
        const showMoreButton = document.getElementById("show-more-details");

        showMoreButton.addEventListener("click", function () {
            if (detailsDiv.style.display === "none") {
                detailsDiv.style.display = "block";
                showMoreButton.textContent = "Hide Details"; // Thay đổi nội dung nút
            } else {
                detailsDiv.style.display = "none";
                showMoreButton.textContent = "Show more Details"; // Thay đổi nội dung nút
            }
        });
        function checkFileExtension() {
            var fileInput = document.getElementById('imageMain');
            var filePath = fileInput.value;
            var allowedExtensions = /(\.jsp|\.png|\.jpg)$/i;
            if (!allowedExtensions.exec(filePath)) {
                alert('Vui lòng chọn một tệp có phần mở rộng là .jsp,.png hoặc .jpg');
                fileInput.value = '';
                return false;
            }
        }
        function ProductUpdate(id) {
            if (confirm("Bạn có chắc muốn hoàn tác? Mọi thao tác của bạn sẽ không được lưu.")) {
                // Nếu người dùng click "OK", chuyển hướng
                let url = "marketingProductDetails?id=" + id;
                window.location.href = url;
            } else {
                // Nếu người dùng click "Cancel", không làm gì cả
                // (Hoặc bạn có thể thêm code để xử lý hành động khác)
            }
        }

        // Update the hidden input based on the checkbox state
        document.getElementById('Pstatus').addEventListener('change', function () {
            this.value = this.checked ? 'active' : 'Deleted';
            document.getElementById('status-text').innerText = this.checked ? 'Hoạt động' : 'Bị vô hiệu hóa';
        });

        function confirmSubmit() {
            if (checkInput() === true) {
                document.getElementById('UpdateForm').submit();
            }
        }

        function checkInput() {
            var productName = document.getElementsByName("product_name")[0].value.trim();
            var productPrice = document.getElementsByName("price")[0].value; // Chuyển đổi sang số
            var productQuantity = document.getElementsByName("quantity")[0].value; // Chuyển đổi sang số
            var dateStart = document.getElementsByName("dateStart")[0].value;
            var dateEnd = document.getElementsByName("dateEnd")[0].value;
            var sale = document.getElementsByName("sale")[0].value;

            if (productName === "") {
                alert('Vui lòng nhập tên!');
                return false;

            }
            if (productPrice === "") { // Kiểm tra xem có phải là số hợp lệ hay không
                alert('Vui lòng nhập Giá!');
                return false;

            }
            if (productQuantity === "") { // Kiểm tra xem có phải là số hợp lệ hay không
                alert('Vui lòng nhập Số lượng!');
                return false;

            }
            if (dateStart === "") {
                alert('Vui lòng nhập ngày bắt đầu!');
                return false;

            }
            if (dateEnd === "") {
                alert('Vui lòng nhập ngày kết thúc!');
                return false;

            }
            if (dateStart > dateEnd) {
                alert('Ngày kết thúc phải lớn hơn Ngày bắt đầu');
                return false;
            }
            if(sale < 0 || sale > 100){
                alert('Sale không được lớn hơn 100% và nhở hơn 0%');
                return false;
            }
            return true;
        }



    </script>



</body>
</html>
