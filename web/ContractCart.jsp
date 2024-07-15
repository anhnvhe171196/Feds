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
        <title>Checkout</title>
        <style>
            body {
                background-color: #f8f9fa;
            }

            .card-header {
                height: 40px;
                font-weight: bold;
                background-color: #fff;
            }

            .btn-group-toggle .btn {
                border-radius: 0;
            }

            .form-check-input:checked {
                background-color: #007bff;
                border-color: #007bff;
            }

            .form-check-label {
                margin-bottom: 20px;
                margin-right: 20px;
            }

            .card-body small {
                color: #6c757d;

            }
            .css_select_div{
                text-align: center;
            }
            .css_select{
                display: inline-table;
                width: 28%;
                padding: 5px;
                margin: 5px 2%;
                margin-bottom: 15px;
                border: solid 1px #686868;
                border-radius: 5px;
                /*                float: left;*/
            }
        </style>


    </head>
    <body>

        <%@include file="component/header.jsp" %>

        <div class="container mt-5">
            <div class="row">
                <div class="col-md-7">
                    <div class="card">
                        <div class="card-header">
                            HÓA ĐƠN 
                        </div>
                        <div class="card-body">
                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                <label  class="btn btn-outline-primary active" style="background-color: #D10024; border-color: #D10024">                                   
                                    <a href="cart" style="color: white">
                                        <input type="radio" name="options" id="home-delivery" autocomplete="off" checked> Trở lại giỏ hàng 
                                    </a>
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="card mt-3">
                        <div class="card-header">
                            THÔNG TIN KHÁCH HÀNG
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="form-group">
                                    <label for="name">Tên</label>
                                    <p class="form-control" id="name">${user.getUser_name()}</p>
                                </div>

                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <p class="form-control" id="email">${user.getEmail()}</p>
                                </div>
                                <div class="form-group">
                                    <label for="phone">Số điện thoại</label>
                                    <p class="form-control" id="phone">${user.getPhone_number()}</p>
                                </div>

                                <div class="form-group">
                                    <small>
                                        * Thông tin khách hàng được bảo mật 
                                    </small>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="card mt-3">
                        <form action="addBill" id="frmCreateOrder" method="post">
                            <div class="card-header">
                                THÔNG TIN NHẬN HÀNG
                            </div>
                            <div class="card-body">
                                <!--                                <form>-->
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="floor">Tên</label>
                                        <p class="form-control" id="name">${user.getUser_name()}</p>
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="zip">Số điện thoại</label>
                                        <p class="form-control" id="phone">${user.getPhone_number()}</p>
                                    </div>
                                </div>

                                <div class="css_select_div ">
                                    <select class="css_select" id="tinh"  title="Chọn Tỉnh Thành" required>
                                        <option value="0">Tỉnh Thành</option>
                                    </select> 
                                    <select class="css_select" id="quan"  title="Chọn Quận Huyện" required>
                                        <option value="0">Quận Huyện</option>
                                    </select> 
                                    <select class="css_select" id="phuong"  title="Chọn Phường Xã" required>
                                        <option value="0">Phường Xã</option>
                                    </select>                                   
                                </div>


                                <div class="form-group">
                                    <label for="address">Địa chỉ</label>
                                    <input type="text" class="form-control" id="address" name="address" placeholder="Địa chỉ" required>
                                </div>

                                <div class="form-group">
                                    <small>
                                        * Thời gian giao hàng khoảng từ 1-2 ngày
                                    </small>
                                </div>
                                <!--                                </form>-->
                            </div>



                            <!--                            <div class="card mt-3">-->
                            <div class="card-header">
                                PHƯƠNG THỨC THANH TOÁN 
                            </div>
                            <div class="card-body">
                                <!--                                    <form>-->
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="paymentOptions" id="tienmat" value="tienmat" checked>
                                    <label style="margin-left: 20px;" class="form-check-label" for="tienmat">
                                        Tiền mặt 
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="paymentOptions" id="VNPay" value="VNPay" >
                                    <label class="form-check-label" for="VNPay" style="margin-left: 20px;"> 
                                        Chuyển khoản/ VNPay
                                    </label>
                                </div>

                                <!--                                    </form>-->
                            </div>
                            <!--                            </div>-->

                            <input type="hidden" name="tinh" id="hidden_tinh" >
                            <input type="hidden" name="quan" id="hidden_quan">
                            <input type="hidden" name="phuong" id="hidden_phuong">
                            <input type="number" name="amount" value="${requestScope.cart.getTotalMoney() - (requestScope.cart.getTotalMoney() * 2/100)}" hidden>
                            <input name="bankCode" value="" hidden>
                            <button type="submit" class="btn btn-primary btn-block" style="background-color: #D10024; border-color: #D10024">ĐẶT HÀNG VÀ THANH TOÁN</button>

                        </form>
<!--                        <form action="vnpay" id="frmCreateOrder" method="post" class="checkout">
                            <div class="woocommerce">
                                <div id="customer_details" class="col2-set">
                                    <div class="col-1" style="margin: 0px 30px 0px 0px">
                                        <h3>Receiver information</h3>
                                        <div class="woocommerce-billing-fields">
                                            <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">First Name 
                                                </label>
                                                <input type="text" value="${ckDetail.getFirstname()}" id="firstname" name="firstname" class="input-text" required>
                                            </p>
                                            <p id="billing_last_name_field" class="form-row form-row-last validate-required">
                                                <label class="" for="billing_last_name">Last Name 
                                                </label>
                                                <input type="text" value="${ckDetail.getLastname()}" id="lastname" name="lastname" class="input-text" required>
                                            </p>
                                            <p id="billing_phone_field" class="form-row form-row-last validate-required validate-phone">
                                                <label class="" for="billing_phone">Phone <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="${ckDetail.getMobile()}" placeholder="Mobile" id="mobile" name="mobile" class="input-text " required>
                                            </p>
                                            <p id="order_comments_field" class="form-row notes">
                                                <label class="" for="order_comments">Order Notes</label>
                                                <textarea cols="5" rows="2" placeholder="Notes about your order, e.g. special notes for delivery." id="order_comments" class="input-text " name="content"></textarea>
                                            </p>
                                            <div class="clear"></div>
                                        </div>
                                    </div>

                                    <div class="col-1">
                                        <h3>Delivery information</h3>
                                        <div class="address-field">
                                            <p id="billing_address_1_field" class="form-row form-row-wide address-field validate-required">
                                                <label class="" for="billing_address_1">Address <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="${ckDetail.getLine1()}" placeholder="Street" id="line1" name="line1" class="input-text " required>
                                            </p>
                                            <p id="billing_address_2_field" class="form-row form-row-wide address-field">
                                                <input type="text" value="${ckDetail.getLine2()}" placeholder="Town" id="line2" name="line2" class="input-text ">
                                            </p>
                                            <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">City</label>
                                                <input type="text" id="city" name="city" placeholder="City" value="${ckDetail.getCity()}" class="input-text " required>
                                            </p>
                                            <p id="billing_city_field" class="form-row form-row-wide address-field validate-required" data-o_class="form-row form-row-wide address-field validate-required">
                                                <label class="" for="billing_city">Province/State <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="${ckDetail.getProvince()}" placeholder="Province/State" id="province" name="province" class="input-text " required>
                                            </p>
                                            <div class="clear"></div>
                                        </div>
                                    </div>
                                </div>

                                <h3 id="order_review_heading">Payment details</h3>
                                <div id="order_review" style="position: relative">
                                    <table class="shop_table">
                                        <tbody>
                                            <c:forEach items="${oiList}" var="item">
                                                <tr class="cart_item">
                                                    <td class="product-name">
                                                        ${item.getProName()} <strong class="product-quantity">× ${item.getQuantity()}</strong> </td>
                                                    <td class="product-total">
                                                        <span class="amount">
                                                            <fmt:setLocale value = "vi_VN"/>
                                                            <fmt:formatNumber value ="${item.getOrderItemTotal()}" type = "currency"/>
                                                        </span> 
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr class="discount">
                                                <th>Discount</th>
                                                <td><span class="amount">1%</span</td>
                                            </tr>
                                            <tr class="cart-subtotal">
                                                <th>Subtotal</th>
                                                <td>
                                                    <span class="amount">
                                                        <fmt:setLocale value = "vi_VN"/>
                                                        <fmt:formatNumber value = "0" type = "currency"/>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr class="tax">
                                                <th>Tax</th>
                                                <td>
                                                    <span class="amount">
                                                        <fmt:setLocale value = "vi_VN"/>
                                                        <fmt:formatNumber value = "1" type = "currency"/>
                                                    </span
                                                </td>
                                            </tr>
                                            <tr class="shipping">
                                                <th>Shipping</th>
                                                <td>
                                                    <span class="amount">
                                                        <fmt:setLocale value = "vi_VN"/>
                                                        <fmt:formatNumber value = "2" type = "currency"/>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr class="order-grandTotal">
                                                <th>Grand Total</th>
                                                <td>
                                                    <strong>
                                                        <span class="amount">
                                                            <fmt:setLocale value = "vi_VN"/>
                                                            <fmt:formatNumber value = "230000" type = "currency"/>
                                                            <input type='number' name="amount" value="230000" hidden>
                                                        </span>
                                                    </strong>
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>

                                    <div id="payment">
                                        <ul class="payment_methods methods">
                                            <li class="payment_method_cheque">
                                                <input type="radio" data-order_button_text="" value="cash" name="paymentMethod" class="input-radio" id="payment_method_cheque">
                                                <label for="payment_method_cheque">Cash </label>
                                            </li>
                                            <li class="payment_method_paypal">
                                                <input name="bankCode" value="" hidden>
                                                <input type="radio" data-order_button_text="" value="vnpay" name=   "paymentMethod" class="input-radio" id="payment_method_paypal">
                                                <label for="payment_method_paypal">VNPAY </label>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="form-row place-order">
                                        <a style="padding: 10px 20px; margin-right: 20px; border: 1px solid darkorange; text-transform: uppercase" href="order/drop&${ckDetail.getOrderId()}" id="drop_order" class="button alt">Drop order</a>
                                        <button type="submit" onclick="submitCheckout()" id="place_order" class="button alt" ${(ckDetail.getCountryId() == "")?'disabled':''}>Place order</button>
                                        <input value="${ckDetail.getOrderId()}" name="orderId" hidden>
                                    </div>
                                </div>
                            </div> 
                        </form> -->
                    </div>
                </div>

                <div class="col-md-5">
                    <div class="card">
                        <div class="card-header">
                            ĐƠN HÀNG CỦA BẠN 
                        </div>
                        <div class="card-body">

                            <c:set var="o" value="${requestScope.cart}"/>
                            <c:forEach items="${o.items}" var="i"> 
                                <div class="media mb-3">


                                    <img src="images/${i.product.getProduct_img()}" class="mr-3" style="height: 100px; width: 100px" alt="Product Image">
                                    <div class="media-body">
                                        <h6 class="mt-0">${i.product.getProduct_name()}</h6>
                                        <p>${i.quantity} ${i.product.getProductdetail().getColor()} ${i.product.getProductdetail().getBattery()}</p>
                                        <h6><fmt:formatNumber value="${i.price * i.quantity}" pattern="#,###" />VNĐ </h6>
                                    </div>
                                </div>
                            </c:forEach>

                            <div class="d-flex justify-content-between">
                                <p>Tổng tiền</p>
                                <p><fmt:formatNumber value="${o.getTotalMoney()}" pattern="#,###" />VNĐ</p>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>Phí giao hàng</p>
                                <p>Miễn phí</p>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>Giảm giá (0%)</p>
                                <p><fmt:formatNumber value="${o.getTotalMoney() * 0/100}" pattern="#,###" />VNĐ</p>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <h5>Tổng cộng</h5>
                                <h5><fmt:formatNumber value="${o.getTotalMoney() - (o.getTotalMoney() * 0/100)}" pattern="#,###" />VNĐ</h5>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="component/footer.jsp" %>
        <script src="https://pay.vnpay.vn/lib/vnpay/vnpay.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script src="https://esgoo.net/scripts/jquery.js"></script>
        <script>
                                            $(document).ready(function () {
                                                // Fetch provinces
                                                $.getJSON('https://esgoo.net/api-tinhthanh/1/0.htm', function (data_tinh) {
                                                    if (data_tinh.error == 0) {
                                                        $.each(data_tinh.data, function (key_tinh, val_tinh) {
                                                            $("#tinh").append('<option value="' + val_tinh.id + '">' + val_tinh.full_name + '</option>');
                                                        });
                                                        $("#tinh").change(function (e) {
                                                            var idtinh = $(this).val();
                                                            $("#hidden_tinh").val($("#tinh option:selected").text());
                                                            // Fetch districts
                                                            $.getJSON('https://esgoo.net/api-tinhthanh/2/' + idtinh + '.htm', function (data_quan) {
                                                                if (data_quan.error == 0) {
                                                                    $("#quan").html('<option value="0">Quận Huyện</option>');
                                                                    $("#phuong").html('<option value="0">Phường Xã</option>');
                                                                    $.each(data_quan.data, function (key_quan, val_quan) {
                                                                        $("#quan").append('<option value="' + val_quan.id + '">' + val_quan.full_name + '</option>');
                                                                    });
                                                                    // Fetch wards
                                                                    $("#quan").change(function (e) {
                                                                        var idquan = $(this).val();
                                                                        $("#hidden_quan").val($("#quan option:selected").text());
                                                                        $.getJSON('https://esgoo.net/api-tinhthanh/3/' + idquan + '.htm', function (data_phuong) {
                                                                            if (data_phuong.error == 0) {
                                                                                $("#phuong").html('<option value="0">Phường Xã</option>');
                                                                                $.each(data_phuong.data, function (key_phuong, val_phuong) {
                                                                                    $("#phuong").append('<option value="' + val_phuong.id + '">' + val_phuong.full_name + '</option>');
                                                                                });
                                                                                $("#phuong").change(function (e) {
                                                                                    $("#hidden_phuong").val($("#phuong option:selected").text());
                                                                                });
                                                                            }
                                                                        });
                                                                    });
                                                                }
                                                            });
                                                        });
                                                    }
                                                });
                                            });
        </script>
        <script type="text/javascript">
                                                function submitCheckout() {
                                                    var a = document.getElementById("firstname").value;
                                                    var b = document.getElementById("lastname").value;
                                                    var c = document.getElementById("mobile").value;
                                                    var d = document.getElementById("line1").value;
                                                    var e = document.getElementById("city").value;
                                                    var f = document.getElementById("province").value;
                                                    if (a !== "" && b !== "" && c !== "" && d !== "" && e !== "" && f !== "") {
                                                        var postData = $("#frmCreateOrder").serialize();
                                                        var submitUrl = $("#frmCreateOrder").attr("action");
                                                        $.ajax({
                                                            type: "POST",
                                                            url: submitUrl,
                                                            data: postData,
                                                            dataType: 'JSON',
                                                            success: function (x) {
                                                                if (x.code === '00') {
                                                                    if (window.vnpay) {
                                                                        vnpay.open({width: 768, height: 600, url: x.data});
                                                                    } else {
                                                                        location.href = x.data;
                                                                    }
                                                                    return false;
                                                                } else {
                                                                    alert(x.Message);
                                                                }
                                                            }
                                                        });
                                                    }
                                                    return false;
                                                }
        </script>     
<!--        <form action="vnpay" id="frmCreateOrder" method="post" class="checkout">
                            <div class="woocommerce">
                                <div id="customer_details" class="col2-set">
                                    <div class="col-1" style="margin: 0px 30px 0px 0px">
                                        <h3>Receiver information</h3>
                                        <div class="woocommerce-billing-fields">
                                            <p id="billing_first_name_field" class="form-row form-row-first validate-required">
                                                <label class="" for="billing_first_name">First Name 
                                                </label>
                                                <input type="text" value="${ckDetail.getFirstname()}" id="firstname" name="firstname" class="input-text" required>
                                            </p>
                                            <p id="billing_last_name_field" class="form-row form-row-last validate-required">
                                                <label class="" for="billing_last_name">Last Name 
                                                </label>
                                                <input type="text" value="${ckDetail.getLastname()}" id="lastname" name="lastname" class="input-text" required>
                                            </p>
                                            <p id="billing_phone_field" class="form-row form-row-last validate-required validate-phone">
                                                <label class="" for="billing_phone">Phone <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="${ckDetail.getMobile()}" placeholder="Mobile" id="mobile" name="mobile" class="input-text " required>
                                            </p>
                                            <p id="order_comments_field" class="form-row notes">
                                                <label class="" for="order_comments">Order Notes</label>
                                                <textarea cols="5" rows="2" placeholder="Notes about your order, e.g. special notes for delivery." id="order_comments" class="input-text " name="content"></textarea>
                                            </p>
                                            <div class="clear"></div>
                                        </div>
                                    </div>

                                    <div class="col-1">
                                        <h3>Delivery information</h3>
                                        <div class="address-field">
                                            <p id="billing_address_1_field" class="form-row form-row-wide address-field validate-required">
                                                <label class="" for="billing_address_1">Address <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="${ckDetail.getLine1()}" placeholder="Street" id="line1" name="line1" class="input-text " required>
                                            </p>
                                            <p id="billing_address_2_field" class="form-row form-row-wide address-field">
                                                <input type="text" value="${ckDetail.getLine2()}" placeholder="Town" id="line2" name="line2" class="input-text ">
                                            </p>
                                            <p id="billing_state_field" class="form-row form-row-first address-field validate-state" data-o_class="form-row form-row-first address-field validate-state">
                                                <label class="" for="billing_state">City</label>
                                                <input type="text" id="city" name="city" placeholder="City" value="${ckDetail.getCity()}" class="input-text " required>
                                            </p>
                                            <p id="billing_city_field" class="form-row form-row-wide address-field validate-required" data-o_class="form-row form-row-wide address-field validate-required">
                                                <label class="" for="billing_city">Province/State <abbr title="required" class="required">*</abbr>
                                                </label>
                                                <input type="text" value="${ckDetail.getProvince()}" placeholder="Province/State" id="province" name="province" class="input-text " required>
                                            </p>
                                            <div class="clear"></div>
                                        </div>
                                    </div>
                                </div>

                                <h3 id="order_review_heading">Payment details</h3>
                                <div id="order_review" style="position: relative">
                                    <table class="shop_table">
                                        <tbody>
                                            <c:forEach items="${oiList}" var="item">
                                                <tr class="cart_item">
                                                    <td class="product-name">
                                                        ${item.getProName()} <strong class="product-quantity">× ${item.getQuantity()}</strong> </td>
                                                    <td class="product-total">
                                                        <span class="amount">
                                                            <fmt:setLocale value = "vi_VN"/>
                                                            <fmt:formatNumber value ="${item.getOrderItemTotal()}" type = "currency"/>
                                                        </span> 
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                        <tfoot>
                                            <tr class="discount">
                                                <th>Discount</th>
                                                <td><span class="amount">1%</span</td>
                                            </tr>
                                            <tr class="cart-subtotal">
                                                <th>Subtotal</th>
                                                <td>
                                                    <span class="amount">
                                                        <fmt:setLocale value = "vi_VN"/>
                                                        <fmt:formatNumber value = "0" type = "currency"/>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr class="tax">
                                                <th>Tax</th>
                                                <td>
                                                    <span class="amount">
                                                        <fmt:setLocale value = "vi_VN"/>
                                                        <fmt:formatNumber value = "1" type = "currency"/>
                                                    </span
                                                </td>
                                            </tr>
                                            <tr class="shipping">
                                                <th>Shipping</th>
                                                <td>
                                                    <span class="amount">
                                                        <fmt:setLocale value = "vi_VN"/>
                                                        <fmt:formatNumber value = "2" type = "currency"/>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr class="order-grandTotal">
                                                <th>Grand Total</th>
                                                <td>
                                                    <strong>
                                                        <span class="amount">
                                                            <fmt:setLocale value = "vi_VN"/>
                                                            <fmt:formatNumber value = "230000" type = "currency"/>
                                                            <input type='number' name="amount" value="230000" hidden>
                                                        </span>
                                                    </strong>
                                                </td>
                                            </tr>
                                        </tfoot>
                                    </table>

                                    <div id="payment">
                                        <ul class="payment_methods methods">
                                            <li class="payment_method_cheque">
                                                <input type="radio" data-order_button_text="" value="cash" name="paymentMethod" class="input-radio" id="payment_method_cheque">
                                                <label for="payment_method_cheque">Cash </label>
                                            </li>
                                            <li class="payment_method_paypal">
                                                <input name="bankCode" value="" hidden>
                                                <input type="radio" data-order_button_text="" value="vnpay" name=   "paymentMethod" class="input-radio" id="payment_method_paypal">
                                                <label for="payment_method_paypal">VNPAY </label>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="form-row place-order">
                                        <a style="padding: 10px 20px; margin-right: 20px; border: 1px solid darkorange; text-transform: uppercase" href="order/drop&${ckDetail.getOrderId()}" id="drop_order" class="button alt">Drop order</a>
                                        <button type="submit" onclick="submitCheckout()" id="place_order" class="button alt" ${(ckDetail.getCountryId() == "")?'disabled':''}>Place order</button>
                                        <input value="${ckDetail.getOrderId()}" name="orderId" hidden>
                                    </div>
                                </div>
                            </div> 
                        </form>      -->
    </body>
</html>
