<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title></title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!--===============================================================================================-->
        <link rel="icon" type="image/png" href="images/icons/favicon.ico" />
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="fonts/Linearicons-Free-v1.0.0/icon-font.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/css-hamburgers/hamburgers.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/select2/select2.min.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="vendor/daterangepicker/daterangepicker.css">
        <!--===============================================================================================-->
        <link rel="stylesheet" type="text/css" href="css/util.css">
        <link rel="stylesheet" type="text/css" href="css/main.css">
        <!--===============================================================================================-->
    </head>

    <body style="background-color: #666666;">

        <div class="limiter">
            <div class="container-login100">
                <div class="wrap-login100">
                    <form class="login100-form validate-form" action="login" method="post" id="form">
                        <div>
                            <a href="home"><img src="images/logo_2.jpg" alt="Feds Logo" style="max-width: 100px; max-height: 100px; display: block; margin: 0 auto; border-radius: 40%;"></a>
                        </div>
                        <span class="login100-form-title p-b-43">
                            Welcome to FedShop
                        </span>
                        <c:if test="${requestScope.error != null}">
                            <h2 style="color: red; text-align: center; margin-bottom: 20px">${requestScope.error}</h2>
                        </c:if>
                        <div class="form-group">
                            <input type="email" class="form-control" name="email" required>
                            <label for="email" class="form-label">Email</label>
                        </div>

                        <div class="form-group">
                            <input id="password-field" type="password" class="form-control" name="password" required>
                            <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                            <label for="password" class="form-label">Mật khẩu</label>
                        </div>

                        <div class="flex-sb-m w-full p-t-3 p-b-32">
                            <div class="contact100-form-checkbox">
                                
                            </div>

                            <div>
                                <a href="forgotpass" class="txt1">
                                    Quên Mật khẩu?
                                </a>
                            </div>
                        </div>
                        <div class="row">
                            <div style="margin: 0px auto; margin-bottom: 10px; margin-top: -10px">
                                <div class="g-recaptcha" data-sitekey="6LfqJ-IpAAAAAIE1FmOTv0MrScNQmJTpUaIWQoOC"></div>
                                <div id="error" style="color: red"></div>
                            </div>
                        </div>
                        <div class="form-group">
                            <input type="submit" class="form-control btn btn-primary submit px-3">
                        </div>

                        <p class="w-100 text-center">&mdash; Bạn chưa có tài khoản? &mdash;</p>
                        <div class="form-group" style="text-align: center;background-color: white; border-radius: 100px; border: 1px black groove;">
                            <a href="register"><div style="display: inline-block;font-weight: 400;white-space: nowrap;vertical-align: middle; padding: 10px 0px "> Đăng kí</div></a>
                        </div>

                        <div class="text-center p-t-10 p-b-20">
                            <span class="txt2">
                                Đăng nhập bằng google
                            </span>
                        </div>

                        <div class="login100-form-social flex-c-m">
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/Feds/loginGoogle&response_type=code&client_id=110538104080-crjqoltjgupbigij7mm6mdi8imco1k14.apps.googleusercontent.com&approval_prompt=force" class="login100-form-social-item1 flex-c-m m-r-5" style="background-image: url('images/Glogo.png');">
                                <i aria-hidden="true"></i>
                            </a>
                        </div>
                    </form>

                    <div class="login100-more" style="background-image: url('images/bg.jpg');">
                    </div>
                </div>
            </div>
        </div>

        <!--===============================================================================================-->
        <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/animsition/js/animsition.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/bootstrap/js/popper.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/select2/select2.min.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/daterangepicker/moment.min.js"></script>
        <script src="vendor/daterangepicker/daterangepicker.js"></script>
        <!--===============================================================================================-->
        <script src="vendor/countdowntime/countdowntime.js"></script>
        <!--===============================================================================================-->
        <script src="js/main.js"></script>

        <script>
            document.addEventListener('DOMContentLoaded', function () {
                // Toggle password visibility
                document.querySelector('.toggle-password').addEventListener('click', function () {
                    var passwordField = document.querySelector('#password-field');
                    var type = passwordField.getAttribute('type') === 'password' ? 'text' : 'password';
                    passwordField.setAttribute('type', type);
                    this.classList.toggle('fa-eye-slash');
                });

                // Register button redirect
                document.getElementById('registerButton').addEventListener('click', function () {
                    window.location.href = 'register';
                });
            });

        </script>
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
            window.onload = function () {
                let isValid = false;
                const form = document.getElementById("form");
                const error = document.getElementById("error");

                form.addEventListener("submit", function (event) {
                    event.preventDefault();
                    const response = grecaptcha.getResponse();
                    if (response) {
                        form.submit();
                    } else {
                        error.innerHTML = "Please check";
                    }
                });
            }
        </script>
    </body>

</html>
