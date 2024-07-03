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
                                            <h6>Thêm sản phẩm</h6>
                                        </div>
                                    </div>
                                    <div class="col" style="display: flex; justify-content: flex-end; align-items: center;">
                                        <div class="mb-2" style="margin-right: 10px;">
                                            <a onclick="Back()">
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
                                        <form id="AddForm" method="post" action="marketingAddProduct" enctype="multipart/form-data" >
                                            <div class="container">
                                                <div class="row gx-5">
                                                    <aside class="col-lg-6">
                                                        <div class="row w-100">
                                                            <input type="file" name="image" accept="image/*" id="imageMain">
                                                            <dd class="col-6"><button type="button" class="btn btn-primary" form="AddForm" onclick="confirmSubmit()" >Enter</button></dd>
                                                        </div>

                                                    </aside>

                                                    <main class="col-lg-6">
                                                        <div class="ps-lg-3">
                                                            <h4 class="title text-dark">

                                                                <h5 class="title text-dark">Tên sản phẩm:</h5>
                                                                <input type="text" name="product_name" placeholder="Nhập tên sản phẩm" class="form-control" required/>
                                                                <label style="color: red; display: none;" id="productNameError">*Vui lòng nhập Tên sản phẩm</label>
                                                            </h4>
                                                            <hr/>
                                                            <div class="mb-3">
                                                                <h6 class="title text-dark" >Giá:</h6>                                                                
                                                                <input type="text" name="price" placeholder="Vui lòng nhập giá > 0" class="form-control" required/>
                                                                <label style="color: red; display: none;" id="productPriceError">*Vui lòng nhập Giá</label>

                                                            </div>
                                                            <hr/>
                                                            <div class="mb-3">
                                                                <h6 class="title text-dark" >Quantity:</h6>                                                                
                                                                <input type="number" name="quantity" placeholder="Vui lòng nhập Số lượng > 0" class="form-control" min="1" required />
                                                                <label style="color: red; display: none;" id="productQuantityError">*Vui lòng nhập Số lượng</label>
                                                            </div>
                                                            <hr/>
                                                            <h6>Mô tả:</h6>
                                                            <textarea name="decription" class="form-control">${product.detail.decription}</textarea>
                                                            <hr/>
                                                            <div class="mb-3">
                                                                <h6 class="title text-dark" >Danh mục:</h6>
                                                                <select name="category_id" id="category" class="form-control">
                                                                    <c:forEach items="${categories}" var="category">
                                                                        <option value="${category.category_id}">${category.category_name}</option>
                                                                    </c:forEach>
                                                                </select>                                                                   
                                                            </div>
                                                            <hr/>
                                                            <div class="mb-3">
                                                                <h6 class="title text-dark" >Nhà cung cấp:</h6>                                                                
                                                                <select name="brandId" id="brand" class="form-control">
                                                                    <c:forEach items="${brands}" var="brands">
                                                                        <option value="${brands.brandId}">${brands.brandName}</option>
                                                                    </c:forEach>
                                                                </select> 
                                                            </div>
                                                            <hr/>
                                                            <div class="mb-3">
                                                                <h6 class="title text-dark" >Ngày bắt đầu:</h6>                                                                
                                                                <input type="date" name="dateStart"  class="form-control" />
                                                                <label style="color: red; display: none;" id="dateStartError">*Vui lòng chọn Ngày bắt đầu</label>
                                                            </div>
                                                            <hr/>
                                                            <div class="mb-3">
                                                                <h6 class="title text-dark" >Ngày kết thúc:</h6>                                                                
                                                                <input type="date" name="dateEnd"  class="form-control" />
                                                                <label style="color: red; display: none;" id="dateEndError">*Vui lòng chọn Ngày kết thúc</label>
                                                            </div>
                                                                                                                        <hr/>

                                                            <a href="#" id="show-more-details">Show more Details</a>
                                                            <hr/>
                                                            <div class="row" id="product-details" style="display: none;">                                                                
                                                                <div class="row w-100">
                                                                    <dt class="col-3">Ram</dt>
                                                                    <dd class="col-9"><input type="text" name="ram" class="form-control" /></dd>
                                                                </div>
                                                                <div class="row w-100">
                                                                    <dt class="col-3">Rom:</dt>
                                                                    <dd class="col-9"><input type="text" name="rom"  class="form-control" /></dd>
                                                                </div>
                                                                <div class="row w-100">
                                                                    <dt class="col-3">Size:</dt>
                                                                    <dd class="col-9"><input type="text" name="size"  class="form-control" /></dd>
                                                                </div>
                                                                <div class="row w-100">
                                                                    <dt class="col-3">Battery:</dt>
                                                                    <dd class="col-9"><input type="text" name="battery"  class="form-control" /></dd>
                                                                </div>
                                                                <div class="row w-100">
                                                                    <dt class="col-3">Weight:</dt>
                                                                    <dd class="col-9"><input type="text" name="weight"  class="form-control" /></dd>
                                                                </div>
                                                                <div class="row w-100">
                                                                    <dt class="col-3">Color:</dt>
                                                                    <dd class="col-9"><input type="text" name="color"  class="form-control" /></dd>
                                                                </div>
                                                                <div class="row w-100">
                                                                    <dt class="col-3">CPU:</dt>
                                                                    <dd class="col-9"><input type="text" name="cpu"  class="form-control" /></dd>
                                                                </div>
                                                                <div class="row w-100">
                                                                    <dt class="col-3">Wattage:</dt>
                                                                    <dd class="col-9"><input type="text" name="wattage"  class="form-control" /></dd>
                                                                </div>
                                                                <div class="row w-100">
                                                                    <dt class="col-3">Status:</dt>
                                                                    <dd class="col-9"><input type="text" name="status"  class="form-control" /></dd>
                                                                </div>
                                                                <!--                                                                <input type="text" name="product_img"  class="form-control" style="display: none" readonly/>-->
                                                                <input type="text" name="userId" value="${sessionScope.account.user_Id}" class="form-control" style="display: none" readonly/>

                                                                <hr/>
                                                            </div>

                                                        </div>
                                                    </main>

                                                </div>
                                            </div>
                                        </form>
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
                    return true;
                }
                function ProductUpdate(id) {
                    if (confirm("Bạn có chắc muốn hoàn tác? Mọi thao tác của bạn sẽ không được lưu!")) {
                        // Nếu người dùng click "OK", chuyển hướng
                        let url = "marketingProductDetails?id=" + id;
                        window.location.href = url;
                    } else {
                        // Nếu người dùng click "Cancel", không làm gì cả
                        // (Hoặc bạn có thể thêm code để xử lý hành động khác)
                    }
                }
                function Back() {
                    if (confirm("Bạn có chắc muốn hoàn tác? Mọi thao tác của bạn sẽ không được lưu!")) {
                        // Nếu người dùng click "OK", chuyển hướng
                        let url = "marketingProductList";
                        window.location.href = url;
                    } else {
                        // Nếu người dùng click "Cancel", không làm gì cả
                        // (Hoặc bạn có thể thêm code để xử lý hành động khác)
                    }
                }
                function confirmSubmit() {
                    if (checkFileExtension()) {
                        if (checkInput()) {
                            document.getElementById('AddForm').submit();
                        }
                    }
                }

                function checkInput() {
                    var productName = document.getElementsByName("product_name")[0].value.trim();
                    var productPrice = document.getElementsByName("price")[0].value.trim();
                    var productQuantity = document.getElementsByName("quantity")[0].value.trim();
                    var dateStart = document.getElementsByName("dateStart")[0].value;
                    var dateEnd = document.getElementsByName("dateEnd")[0].value;

                    if (productName === "") {
                        document.getElementById("productNameError").style.display = "block";
                    } else {
                        document.getElementById("productNameError").style.display = "none";
                    }
                    if (productPrice === "") {
                        document.getElementById("productPriceError").style.display = "block";
                    } else {
                        document.getElementById("productPriceError").style.display = "none";
                    }
                    if (productQuantity === "") {
                        document.getElementById("productQuantityError").style.display = "block";
                    } else {
                        document.getElementById("productQuantityError").style.display = "none";
                    }
                    if (dateStart === "") {
                        document.getElementById("dateStartError").style.display = "block";
                    } else {
                        document.getElementById("dateStartError").style.display = "none";
                    }

                    if (dateEnd === "") {
                        document.getElementById("dateEndError").style.display = "block";
                    } else {
                        document.getElementById("dateEndError").style.display = "none";
                    }
                }


            </script>


    </body>
</html>
