<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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
            .container1 {
                display: flex;
                flex-direction: column;
                gap: 20px;
                padding: 20px;
                max-width: 970px; /* Adjust the max-width to make it narrower */
                margin: auto;
            }

            .item {
                border: 1px solid #ccc;
                border-radius: 12px;
                padding: 20px;
                box-shadow: 5px 4px 9px rgba(0, 0, 0, 0.1);
                background-color: #fff;
                font-size: 14px;
            }

            .item-header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 15px;
            }

            .shop-name {
                display: flex;
                gap: 10px;
                align-items: center;
                font-weight: 700;
            }

            .shop-name button {
                background-color: #D10024;
                color: #FFF;
                border: none;
                padding: 5px 10px;
                cursor: pointer;
                font-size: 14px;
                font-weight: 700;
                border-radius: 5px;
            }

            .order-status {
                display: flex;
                gap: 10px;
                font-size: 14px;
                color: #888;
            }

            .item-content {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }

            .item-image img {
                max-width: 150px;
                max-height: 150px;
                margin-right: 20px;
            }

            .item-details {
                flex-grow: 1;
            }

            .item-details h3 {
                font-size: 16px;
                margin: 0 0 10px 0;
            }

            .item-details p {
                margin: 5px 0;
            }

            .item-price {
                display: flex;
                gap: 10px;
                align-items: center;
            }

            .original-price {
                text-decoration: line-through;
                color: #888;
                font-size: 14px;
            }

            .discounted-price {
                color: red;
                font-weight: bold;
                font-size: 16px;
            }

            .total-price {
                font-weight: bold;
                margin-top: 10px;
                font-size: 16px;
                text-align: right;
            }

            .item-footer {
                display: flex;
                justify-content: flex-end;
                gap: 10px;
            }

            .item-footer  {
                background-color: #FFF;
                color: black;
                border: none;
                padding: 10px 20px;
                cursor: pointer;
                font-size: 13px;
                font-weight: 450;
            }

            .buy-again {
                background-color: #D10024;
                border: #D10024;
                color: #FFF;
                font-weight: 700;
                border-radius: 5px;
            }
        </style>

    </head>
    <body>


        <%@include file="component/header.jsp" %>

        <div class="container1">
            <c:if test="${sessionScope.billinfo != null}">
                <c:forEach items="${sessionScope.billinfo}" var="b">
                    <div class="item">

                        <div class="item-header">
                            <div class="shop-name">
                                <span>Feds Shop</span>
                                <!--                        <button>Chat</button>-->
                                <a href="home"><button>Xem shop</button></a>
                            </div>
                            <div class="order-status">
                                <span>Trạng thái đơn hàng:</span>
                                <span>${b.getStatus()}</span>
                            </div>
                        </div>
                        <div class="item-content">
                            <div class="item-image">
                                <img src="images/${b.product1.getProduct_img()}" alt="Product Image">
                            </div>
                            <div class="item-details">
                                <h3>${b.product1.getProduct_name()}</h3>
                                <p>Phân loại hàng: ${b.product1.detail.getColor()}</p>
                                <p>x ${b.order.getOrder_quantity()}</p>
                                <div class="item-price">
                                    <p class="">Ngày đặt hàng: ${b.getDate()}</p>

                                </div>
                                <div class="total-price">Tổng số tiền: <fmt:formatNumber value="${b.getTotal_price()}" pattern="#,###" />VNĐ</div>
                            </div>
                        </div>
                        <div class="item-footer">
                            <a href="cart?billid=${b.getBill_id()}"><button class="buy-again">Mua Lần Nữa</button></a>
                            <a href="viewMyOrderDetail?billid=${b.getBill_id()}"><button class="view-order">Xem Chi Tiết Đơn Hàng</button></a>
                            <!--                        <button class="view-shop">Xem Đánh Giá Shop</button>-->
                        </div>

                    </div>
                </c:forEach>
            </c:if>
            <c:if test="${sessionScope.billinfo == null}">
                <h1 style="    text-align: center;
                    color: red;
                    margin: 100px;">Bạn chưa mua bắt kì sản phẩm nào</h1>
            </c:if>
        </div>



        <%@include file="component/footer.jsp" %>
    </body>
</html>
