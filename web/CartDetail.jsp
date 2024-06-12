
<%@taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css" rel="stylesheet">
        <link href="/https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="/css/cartdetail.css"/>


        <title>Cart Detail</title>

    </head>

    <body>
        <!--        Header-->
        <%@include file="component/header.jsp" %>
        <!--        Header-->

        <!-- cart + summary -->
        <section class="bg-light my-5">
            <div class="container">
                <div class="row">
                    <!-- cart -->
                    <div class="col-lg-9">
                        <div class="card border shadow-0">
                            <div class="m-4">
                                <h4 class="card-title mb-4">ĐƠN HÀNG CỦA BẠN</h4>
                                <div class="row gy-3 mb-4">
                                    <c:set var="o" value="${requestScope.cart}"/>
                                    <c:forEach items="${o.items}" var="i">                     
                                        <div class="col-lg-5">
                                            <div class="me-lg-5">
                                                <div class="d-flex">
                                                    <img src="images/${i.product.getProduct_img()}" class="border rounded me-3" style="width: 96px; height: 96px;" />
                                                    <div class="">
                                                        
                                                        <a href="product?pid=${i.product.getProduct_id()}" class="nav-link" >${i.product.getProduct_name()}</a>
                                                        <p class="text-muted nav-link">${i.product.getProductdetail().getColor()}</p>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="col-lg-2 col-sm-6 col-6 d-flex flex-row flex-lg-column flex-xl-row text-nowrap">
                                            <div class="">
                                                <div class="col">
                                                    <a href="process?num=-1&pid=${i.product.getProduct_id()}">-</a><a  style="width: 100px;" class="border">${i.quantity}</a><a href="process?num=1&pid=${i.product.getProduct_id()}">+</a>
                                                </div>
                                            </div>
                                            <div class="">
                                                <text class="h6"> <fmt:formatNumber value="${i.price * i.quantity}" pattern="#,###" />VNĐ </text> <br />
                                                <small class="text-muted text-nowrap"><fmt:formatNumber value="${i.price}" pattern="#,###" />VNĐ / sản phẩm </small>
                                            </div>
                                        </div>
                                        <div class="col-lg col-sm-6 d-flex justify-content-sm-center justify-content-md-start justify-content-lg-center justify-content-xl-end mb-2">
                                            <div class="float-md-end">
                                                
<!--                                                <a href="#!" class="btn btn-light border px-2 icon-hover-primary"><i class="fas fa-heart fa-lg px-1 text-secondary"></i></a>-->
                                                <form action="process" method="post" class="btn btn-light  text-danger icon-hover-danger">
                                                    <input type="hidden" name="pid" value="${i.product.getProduct_id()}"/>
                                                    <input type="submit" class="" value="Xóa"/>
                                                </form>          
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>

                            </div>

                            <!--                            <div class="border-top pt-4 mx-4 mb-4">
                                                            <p><i class="fas fa-truck text-muted fa-lg"></i> Free Delivery within 1-2 weeks</p>
                                                            <p class="text-muted">
                                                                Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut
                                                                aliquip
                                                            </p>
                                                        </div>-->
                        </div>
                    </div>
                    <!-- cart -->
                    <!-- summary -->
                    <div class="col-lg-3">
                        <div class="card mb-3 border shadow-0">
                            <div class="card-body">
                                <form>
                                    <div class="form-group">
                                        <label class="form-label">Mã Giảm Giá</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control border" name="" placeholder="điền mã vào đây" />
                                            <button class="btn btn-light border">Áp dụng</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="card shadow-0 border">
                            <div class="card-body">
                                <div class="d-flex justify-content-between">
                                    <p class="mb-2">Tổng:</p>
                                    <p class="mb-2"><fmt:formatNumber value="${o.getTotalMoney()}" pattern="#,###" />VNĐ</p>
                                </div>
                                <div class="d-flex justify-content-between">
                                    <p class="mb-2">Giảm giá:</p>
                                    <p class="mb-2 text-success">0000</p>
                                </div>
                                <!--                                <div class="d-flex justify-content-between">
                                                                    <p class="mb-2">TAX:</p>
                                                                    <p class="mb-2">00000</p>
                                                                </div>-->
                                <hr />
                                <div class="d-flex justify-content-between">
                                    <p class="mb-2">Tổng tiền:</p>
                                    <p class="mb-2 fw-bold"><fmt:formatNumber value="${o.getTotalMoney()}" pattern="#,###" />VNĐ</p>
                                </div>

                                <div class="mt-3">
                                    <a href="contract" style="background-color: #D10024; border-color: #D10024" class="btn btn-success w-100 shadow-0 mb-2" "> MUA HÀNG </a>
                                    <a href="home" class="btn btn-light w-100 border mt-2"> Trở lại trang chủ </a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- summary -->
                </div>
            </div>
        </section>
        <!-- cart + summary -->
        <section>
            <div class="container my-5">
                <header class="mb-4">
                    <h4>SẢN PHẨM HOT</h4>
                </header>

                <div class="row">
                    <c:forEach items="${sessionScope.list}" var="l" varStatus="status">
                        <c:if test="${status.index < 4}">
                            <div class="col-lg-3 col-md-6 col-sm-6 mb-4">
                                <div class="card px-4 border shadow-0 mb-4 mb-lg-0">
                                    <div class="mask px-2" style="height: 50px;">
                                        <div class="d-flex justify-content-between">
                                            <h6><span class="badge bg-danger pt-1 mt-3 ms-2">Hot</span></h6>
<!--                                            <a href="#"><i class="fas fa-heart text-primary fa-lg float-end pt-3 m-2"></i></a>-->
                                        </div>
                                    </div>
                                    <a href="product?pid=${l.getProduct_id()}" class="">
                                        <img src="images/${l.getProduct_img()}" class="card-img-top rounded-2" style="height: 200px;" />
                                    </a>
                                    <div class="card-body d-flex flex-column pt-3 border-top">
                                        <a href="product?pid=${l.getProduct_id()}" class="nav-link" style="text-align: center;">${l.getProduct_name()}</a>
                                        <div class="price-wrap mb-2">
                                            <strong class=""><fmt:formatNumber value="${l.getPrice()}" pattern="#,###"/> VNĐ</strong>
                                            <del class="">$24.99</del>
                                        </div>
                                        <div class="card-footer d-flex align-items-end pt-3 px-0 pb-0 mt-auto">
                                            <a href="#" class="btn btn-outline-primary w-100">Thêm vào giỏ hàng</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>
                    </c:forEach>
                </div>
            </div>
        </section>
        <!-- Recommended -->

        <!-- Footer -->
        <%@include file="component/footer.jsp" %>
        <!-- Footer -->
    </body>
</html>
