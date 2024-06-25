<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

        <!-- Bootstrap -->
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

        <!-- Slick -->
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

        <!-- nouislider -->
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

        <!-- Font Awesome Icon -->
        <link rel="stylesheet" href="css/font-awesome.min.css">

        <!-- Custom stlylesheet -->
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/home.css" type="text/css">
        <title>Change Delivery Address</title>
        <style>
            body {
                background-color: #f8f9fa;
            }

            .card-header {
                height: 30px; /* Reduced height */
                font-weight: bold;
                background-color: #fff;
                font-size: 14px; /* Reduced font size */
                padding: 0.5rem 1rem; /* Adjusted padding */
            }

            .card-body small {
                color: #6c757d;
                font-size: 12px; /* Reduced font size */
            }

            .form-group label {
                font-size: 14px; /* Reduced font size */
            }

            .form-control {
                font-size: 14px; /* Reduced font size */
                padding: 0.5rem 0.75rem; /* Adjusted padding */
            }

            .form-check-label {
                font-size: 14px; /* Reduced font size */
                margin-bottom: 10px;
            }

            .form-check-input {
                margin-top: 0.1rem; /* Adjusted margin */
            }

            .btn {
                font-size: 14px; /* Reduced font size */
                padding: 0.5rem 0.75rem; /* Adjusted padding */
            }

            .media-body h6 {
                font-size: 14px; /* Reduced font size */
            }

            .media-body p {
                font-size: 12px; /* Reduced font size */
                margin-bottom: 0.5rem; /* Adjusted margin */
            }

            .media-body h6:last-child {
                font-size: 14px; /* Reduced font size */
            }

            .d-flex p, .d-flex h5 {
                font-size: 14px; /* Reduced font size */

            }

            .btn-red {
                background-color: #D10024;
                color: white;
                border: none;
                padding: 0.5rem 1rem;
                margin: 0.5rem 0;
            }

            .card-small {
                width: 65%; /* Adjust this percentage to make the card smaller or larger */
                margin: auto; /* Center the card */
            }

            .form-control {
                font-size: 14px; /* Reduced font size */
                padding: 0.5rem 0.75rem; /* Adjusted padding */
            }

        </style>
    </head>
    <body>
        <%@include file="component/header.jsp" %>

        <!--        <div class="container mt-4">
                    <div class="row justify-content-center">
                        <div class="col-md-12">
                            <div class="card card-small">
                                <div class="card-header" style="text-align: center; background-color: #D10024; color: #fff; font-size: 16px; height: 35px">
                                    THAY ĐỔI ĐỊA CHỈ GIAO HÀNG
                                </div>
                            </div>
        
                            <div class="card card-small mt-2">
                                <div class="card-header">
                                    Địa chỉ giao hàng
                                </div>
                                <div class="card-body">
                                    <form>
                                        <div class="form-group">
                                            <label for="name">Tên khách hàng:</label>
                                            <p class="form-control" id="name">${billinfo.user.user_name}</p>
                                        </div>
                                        <div class="form-group">
                                            <label for="email">Địa chỉ Email:</label>
                                            <p class="form-control" id="email">${billinfo.user.email}</p>
                                        </div>
                                        <div class="form-group">
                                            <label for="phone">Số điện thoại:</label>
                                            <p class="form-control" id="phone">${billinfo.user.phone_number}</p>
                                        </div>
        
                                        <div class="form-group">
                                            <label for="thanhpho">Thành phố, Tỉnh:</label>
                                            <input type="text" class="form-control" id="thanhpho" name="thanhpho" placeholder="Thành phố">
                                        </div>
                                        <div class="form-group">
                                            <label for="huyen">Quận, Huyện:</label>
                                            <input type="text" class="form-control" id="huyen" name="huyen" placeholder="Huyện">
                                        </div>
                                        <div class="form-group">
                                            <label for="xa">Phường, Xã:</label>
                                            <input type="text" class="form-control" id="xa" name="xa" placeholder="Xã">
                                        </div>
                                        <div class="form-group">
                                            <label for="address">Địa chỉ:</label>
                                            <input type="text" class="form-control" id="address" name="diachi" placeholder="Địa chỉ">
                                        </div>
                                        <div class="form-group">
                                            <label for="date">Ngày đặt hàng:</label>
                                            <p class="form-control" id="date">${billinfo.date}</p>
        
                                        </div>
                                        <div class="form-group">
                                            <small>
                                                * Vui lòng nhập chính xác thông tin 
                                            </small>
                                        </div>
                                    </form>
                                </div>
                            </div>
        
                        </div>
        
        
                        <div class="col-md-12">
                            <div class="d-flex justify-content-end mt-2" style="width: 56%">
        
                                <form action="changedelivery" method="post" class="">
                                    <button type="submit" class="btn btn-red ml-2"style="width: 130px">Cập Nhật</button>
                                    <input type="hidden" name="billid" value="${sessionScope.orderinfo1.get(0).getBill_id() }"/>
        
                                </form> 
                            </div>
                        </div>
                    </div>
                </div>-->
        <div class="container mt-4">
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <div class="card card-small">
                        <div class="card-header" style="text-align: center; background-color: #D10024; color: #fff; font-size: 16px; height: 35px">
                            THAY ĐỔI ĐỊA CHỈ GIAO HÀNG
                        </div>
                    </div>

                    <div class="card card-small mt-2">
                        <div class="card-header">
                            Địa chỉ giao hàng
                        </div>
                        <div class="card-body">
                            <form action="changedelivery" method="post">
                                <div class="form-group">
                                    <label for="name">Tên khách hàng:</label>
                                    <p class="form-control" id="name">${billinfo.user.user_name}</p>
                                </div>
                                <div class="form-group">
                                    <label for="email">Địa chỉ Email:</label>
                                    <p class="form-control" id="email">${billinfo.user.email}</p>
                                </div>
                                <div class="form-group">
                                    <label for="phone">Số điện thoại:</label>
                                    <p class="form-control" id="phone">${billinfo.user.phone_number}</p>
                                </div>

                                <div class="form-group">
                                    <label for="thanhpho">Thành phố, Tỉnh:</label>
                                    <input type="text" class="form-control" id="thanhpho" name="thanhpho" placeholder="Thành phố" required>
                                </div>
                                <div class="form-group">
                                    <label for="huyen">Quận, Huyện:</label>
                                    <input type="text" class="form-control" id="huyen" name="huyen" placeholder="Huyện" required>
                                </div>
                                <div class="form-group">
                                    <label for="xa">Phường, Xã:</label>
                                    <input type="text" class="form-control" id="xa" name="xa" placeholder="Xã" required>
                                </div>
                                <div class="form-group">
                                    <label for="address">Địa chỉ:</label>
                                    <input type="text" class="form-control" id="address" name="diachi" placeholder="Địa chỉ" required>
                                </div>
                                <div class="form-group">
                                    <label for="date">Ngày đặt hàng:</label>
                                    <p class="form-control" id="date">${billinfo.date}</p>
                                </div>
                                <div class="form-group">
                                    <small>
                                        * Vui lòng nhập chính xác thông tin 
                                    </small>
                                </div>
                                <div class="d-flex justify-content-end mt-2" style="width: 59%">
                                    <input type="hidden" name="billid" value="${sessionScope.orderinfo1.get(0).getBill_id() }"/>
                                    <button type="submit" class="btn btn-red ml-2" style="width: 130px; display: flex; align-items: center; justify-content: center;">
                                        Cập Nhật
                                    </button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="component/footer.jsp" %>

    </body>  

</html>





