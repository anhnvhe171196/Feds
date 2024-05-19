<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>Login V18</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!--===============================================================================================-->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/images/icons/favicon.ico" />
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/bootstrap/css/bootstrap.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/animate/animate.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/css-hamburgers/hamburgers.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/animsition/css/animsition.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/select2/select2.min.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/vendor/daterangepicker/daterangepicker.css">
    <!--===============================================================================================-->
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/util.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/main.css">
    <!--===============================================================================================-->
</head>

<body style="background-color: #666666;">

    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <form class="login100-form validate-form" action="${pageContext.request.contextPath}/forgotpass" method="post">
                    <div>
                        <img src="${pageContext.request.contextPath}/images/FedsLogo.png" alt="Feds Logo" style="max-width: 100px; max-height: 100px; display: block; margin: 0 auto; border-radius: 30%;">
                    </div>
                    <span class="login100-form-title p-b-43">
                        Welcome to FedShop
                    </span>

                    <!--Logo-->

                    <div class="form-group">
                        <input id="email" name="email" class="form-control" required>
                        <label for="email" class="form-label">Email</label>
                    </div>

                    <div class="form-group">
                        <button type="submit" class="form-control btn btn-primary submit px-3">Send request</button>
                    </div>
                    <div>
                        <a href="${pageContext.request.contextPath}/Login.jsp" class="txt1">
                            Back to Login
                        </a>
                    </div>
                </form>

                <div class="login100-more" style="background-image: url('${pageContext.request.contextPath}/images/bg.jpg');">
                </div>
            </div>
        </div>
    </div>

    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/vendor/jquery/jquery-3.2.1.min.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/vendor/animsition/js/animsition.min.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/popper.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/vendor/select2/select2.min.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/vendor/daterangepicker/moment.min.js"></script>
    <script src="${pageContext.request.contextPath}/vendor/daterangepicker/daterangepicker.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/vendor/countdowntime/countdowntime.js"></script>
    <!--===============================================================================================-->
    <script src="${pageContext.request.contextPath}/js/main.js"></script>

</body>

</html>
