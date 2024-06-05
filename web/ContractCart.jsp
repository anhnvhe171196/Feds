<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <title>Checkout</title>
        <style>
            body {
                background-color: #f8f9fa;
            }

            .card-header {
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
                margin-bottom: 0;
            }

            .card-body small {
                color: #6c757d;
            }
        </style>
    </head>
    <body>
        
        <div class="container mt-5">
            <div class="row">
                <div class="col-md-7">
                    <div class="card">
                        <div class="card-header">
                            Thanh Toán
                        </div>
                        <div class="card-body">
                            <div class="btn-group btn-group-toggle w-100" data-toggle="buttons">
                                <label class="btn btn-outline-primary active">
                                    <input type="radio" name="options" id="home-delivery" autocomplete="off" checked> Giao Hàng
                                </label>
                                <label class="btn btn-outline-primary">
                                    <input type="radio" name="options" id="order-collect" autocomplete="off"> Tiếp tục mua sắm 
                                </label>
                            </div>
                        </div>
                    </div>

                    <div class="card mt-3">
                        <div class="card-header">
                            Địa chỉ giao hàng
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="firstName">Tên</label>
                                        <input type="text" class="form-control" id="firstName" placeholder="Tên">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="lastName">Họ</label>
                                        <input type="text" class="form-control" id="lastName" placeholder="Họ">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="email">Email</label>
                                    <input type="email" class="form-control" id="email" placeholder="Email">
                                </div>
                                <div class="form-group">
                                    <label for="phone">Số điện thoại</label>
                                    <input type="tel" class="form-control" id="phone" placeholder="Số điện thoại">
                                </div>
                                <div class="form-group">
                                    <label for="address">Địa chỉ</label>
                                    <input type="text" class="form-control" id="address" placeholder="Địa chỉ">
                                </div>
                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="floor">Tầng</label>
                                        <input type="text" class="form-control" id="floor" placeholder="Tầng">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <label for="zip">Mã bưu điện</label>
                                        <input type="text" class="form-control" id="zip" placeholder="Mã bưu điện">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="city">Thành phố</label>
                                    <input type="text" class="form-control" id="city" placeholder="Thành phố">
                                </div>
                                <div class="form-check mb-2">
                                    <input class="form-check-input" type="checkbox" id="sameAddress" checked>
                                    <label class="form-check-label" for="sameAddress">
                                        Cùng địa chỉ giao hàng
                                    </label>
                                </div>
                                <div class="form-group">
                                    <label for="loyaltyCard">Nhập số thẻ khách hàng thân thiết (tùy chọn)</label>
                                    <input type="text" class="form-control" id="loyaltyCard" placeholder="Số thẻ khách hàng thân thiết">
                                </div>
                                <div class="form-group">
                                    <small>
                                        * Chính sách bảo mật Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nulla at volutpat diam ut venenatis tellus in metus. Morbi tincidunt ornare massa eget egestas purus viverra accumsan.
                                    </small>
                                </div>
                            </form>
                        </div>
                    </div>

                    <div class="card mt-3">
                        <div class="card-header">
                            Thanh toán
                        </div>
                        <div class="card-body">
                            <form>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="paymentOptions" id="debitCard" checked>
                                    <label class="form-check-label" for="debitCard">
                                        Thẻ ghi nợ
                                    </label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="paymentOptions" id="blik">
                                    <label class="form-check-label" for="blik">
                                        BLIK / Chuyển khoản nhanh / Trả góp
                                    </label>
                                </div>
                                <div class="form-check mb-3">
                                    <input class="form-check-input" type="checkbox" id="termsConditions">
                                    <label class="form-check-label" for="termsConditions">
                                        Tôi chấp nhận các điều khoản và điều kiện
                                    </label>
                                </div>
                                <button type="submit" class="btn btn-primary btn-block">ĐẶT HÀNG VÀ THANH TOÁN</button>
                            </form>
                        </div>
                    </div>
                </div>

                <div class="col-md-5">
                    <div class="card">
                        <div class="card-header">
                            Tóm tắt đơn hàng
                        </div>
                        <div class="card-body">
                            <div class="media mb-3">
                                <img src="https://via.placeholder.com/64" class="mr-3" alt="Product Image">
                                <div class="media-body">
                                    <h6 class="mt-0">Áo thun cơ bản</h6>
                                    <p>Trắng, Vừa</p>
                                    <h6>$49.00</h6>
                                </div>
                            </div>
                            <div class="media mb-3">
                                <img src="https://via.placeholder.com/64" class="mr-3" alt="Product Image">
                                <div class="media-body">
                                    <h6 class="mt-0">Áo thun cơ bản</h6>
                                    <p>Đen, Vừa</p>
                                    <h6>$98.00</h6>
                                </div>
                            </div>
                            <div class="media mb-3">
                                <img src="https://via.placeholder.com/64" class="mr-3" alt="Product Image">
                                <div class="media-body">
                                    <h6 class="mt-0">Giày Platform</h6>
                                    <p>Xanh Navy, 4.5</p>
                                    <h6>$129.00</h6>
                                </div>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>Tổng phụ</p>
                                <p>$276.00</p>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>Phí giao hàng</p>
                                <p>$9.99</p>
                            </div>
                            <div class="d-flex justify-content-between">
                                <p>Thuế (23%)</p>
                                <p>$65.77</p>
                            </div>
                            <hr>
                            <div class="d-flex justify-content-between">
                                <h5>Tổng cộng</h5>
                                <h5>$285.99</h5>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    </body>
</html>
