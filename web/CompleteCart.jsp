<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
    <head>
<!--        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">

         Bootstrap 
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css"/>

         Slick 
        <link type="text/css" rel="stylesheet" href="css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="css/slick-theme.css"/>

         nouislider 
        <link type="text/css" rel="stylesheet" href="css/nouislider.min.css"/>

         Font Awesome Icon 
        <link rel="stylesheet" href="css/font-awesome.min.css">

         Custom stlylesheet 
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        <link rel="stylesheet" href="css/home.css" type="text/css">
        <title>Complete Cart</title>-->
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
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

        <div class="container mt-4">
            <div class="row justify-content-center">
                <div class="col-md-12">
                    <div class="card card-small">
                        <div class="card-header" style="text-align: center; background-color: #D10024; color: #fff; font-size: 16px; height: 35px">
                            ĐẶT HÀNG THÀNH CÔNG
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
                                    <p class="form-control" id="thanhpho">${billinfo.province}</p>
                                </div>
                                <div class="form-group">
                                    <label for="huyen">Quận, Huyện:</label>
                                    <p class="form-control" id="huyen">${billinfo.district}</p>
                                </div>
                                <div class="form-group">
                                    <label for="xa">Phường, Xã:</label>
                                    <p class="form-control" id="xa">${billinfo.country}</p>
                                </div>
                                <div class="form-group">
                                    <label for="address">Địa chỉ:</label>
                                    <p class="form-control" id="address">${billinfo.address}</p>
                                </div>
                                <div class="form-group">
                                    <label for="date">Ngày đặt hàng:</label>
                                    <p class="form-control" id="date">${billinfo.date}</p>

                                </div>
                                <div class="form-group">
                                    <small>
                                        * Sản phẩm sẽ được giao trong khoảng 1-2 ngày
                                    </small>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="card card-small mt-2">
                        <div class="card-header">
                            Phương thức thanh toán
                        </div>
                        <div class="card-body">
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paymentMethod" id="tienmat" value="tienmat" 
                                       ${billinfo.getOrder().getPayment() == 'tienmat' ? 'checked' : ''} disabled>
                                <label style="margin-left: 20px;" class="form-check-label" for="tienmat">
                                    Tiền mặt
                                </label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="paymentMethod" id="VNPay" value="VNPay"
                                       ${billinfo.getOrder().getPayment() == 'VNPay' ? 'checked' : ''} disabled>
                                <label style="margin-left: 20px;" class="form-check-label" for="VNPay">
                                    Chuyển khoản/VNPay
                                </label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="card card-small mt-2">
                        <div class="card-header">
                            Thông tin thanh toán
                        </div>
                        <div class="card-body">
                            <c:forEach items="${sessionScope.orderinfo1}" var="p">

                                <div class="media mb-2">


                                    <img src="images/${p.product1.product_img}" class="mr-3" style="height: 100px; width: 100px" alt="Product Image">
                                    <div class="media-body">
                                        <h6 class="mt-0">${p.product1.product_name}</h6>
                                        <p>${p.order.getOrder_quantity()} ${p.product1.detail.color}</p>
                                        <h7><fmt:formatNumber value="${p.product1.price.getPrice() * p.order.getOrder_quantity()}" pattern="#,###" />VNĐ </h7>
                                    </div>

                                </div>
                            </c:forEach>

                            <div class="d-flex justify-content-between">
                                <h5>Total</h5>
                                <h5><fmt:formatNumber value="${sessionScope.orderinfo1.get(0).getTotal_price()}" pattern="#,###" />VNĐ</h5>
                            </div>
                            <div class="form-group">
                                <label for="status">Trạng thái đơn hàng:</label>
                                <p class="form-control" id="status">${sessionScope.orderinfo1.get(0).getStatus()}</p>
                            </div>
                        </div>   
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="d-flex justify-content-end mt-2" style="width: 73%">
                        <a href="viewmyorder?userid=${userid}"><button class="btn btn-red ml-2"style="width: 130px">Xem đơn hàng</button></a>
                        <a href="home"><button class="btn btn-red ml-2" style="width: 130px">Về trang chủ</button></a>
                        <form action="cancelcart" method="post" class="">
                            <button id="cancelChangeAddressButton" type="submit" class="btn btn-red ml-2"style="width: 130px">Thay đổi địa chỉ</button>
                            <input type="hidden" name="billid" value="${sessionScope.orderinfo1.get(0).getBill_id()}"/>
                        </form> 
                        <form action="cancelcart" method="get" class="">
                            <button id="cancelOrderButton" type="submit" class="btn btn-red ml-2"style="width: 130px">Hủy đơn hàng</button>
                            <input type="hidden" name="billid" value="${sessionScope.orderinfo1.get(0).getBill_id() }"/>

                        </form> 
                    </div>
                </div>
            </div>
        </div>
        <%@include file="component/footer.jsp" %>
        <script>
            document.addEventListener("DOMContentLoaded", function () {
                var orderStatus = "${sessionScope.orderinfo1.get(0).getStatus()}";
                if (orderStatus === "Đã Hủy") {
                    document.getElementById("cancelOrderButton").disabled = true;
                }
                if (orderStatus === "Đã Hủy") {
                    document.getElementById("cancelChangeAddressButton").disabled = true;
                }
            });
        </script>
    </body>  

</html>





