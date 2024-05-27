<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Login V18</title>
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
                    <form class="login100-form validate-form" action="register" method="post" onsubmit="return validatePasswords()">
                        <div>
                            <img src="images/logo.jpg" alt="Feds Logo" style="max-width: 100px; max-height: 100px; display: block; margin: 0 auto; border-radius: 30%;">
                        </div>
                        <span class="login100-form-title p-b-43">
                            Welcome to FedShop
                        </span>
                        <c:if test="${requestScope.error != null}">
                            <h2 style="color: red; text-align: center; margin-bottom: 25px">${requestScope.error}</h2>
                        </c:if>

                        <div class="form-group">
                            <input type="text" class="form-control" name="username" required>
                            <label for="username" class="form-label">Username</label>
                        </div>

                        <div class="form-group password-group">
                            <div class="form-group">
                                <input id="password-field" type="password" class="form-control" minlength="8" maxlength="20" name="password" required>
                                <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                <label for="password" class="form-label">Password</label>
                            </div>
                            <div>&nbsp;&nbsp;&nbsp;</div>
                            <div class="form-group">
                                <input id="confirm-password-field" type="password" class="form-control" name="confirmPassword" required>
                                <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
                                <label for="confirmPassword" class="form-label">Confirm Password</label>
                            </div>
                        </div>
                        <div style="color: #00000063 ;margin-bottom: 20px; margin-top: -25px; font-size: 13px;">Mật khẩu từ 8 - 20 kí tự</div>
                        <div id="error-container" class="error-container"></div>

                        <div class="form-group">
                            <input id="email" type="email" class="form-control" name="email" required>
                            <label for="email" class="form-label">Email</label>
                        </div>

                        <div class="form-group">
                            <input id="phone-number" class="form-control" name="phoneNumber" pattern="[0]{1}[3,5,7,8,9]{1}[0-9]{8}" required>
                            <label for="phoneNumber" class="form-label">Phone Number</label>
                            <small style="color: #00000063">Format: 09XXXXXXXX</small>
                        </div>
                        <div class="form-group">
                            <button type="submit" class="form-control btn btn-primary submit px-3">Register</button>
                        </div>
                        <p class="w-100 text-center">&mdash; Have account? &mdash;</p>
                        <div class="form-group">
                            <button id="signInButton" class="form-control btn btn-primary1 submit px-3" style="border: 2px solid #00000034;">Sign in</button>
                        </div>
                        <div class="text-center p-t-10 p-b-20">
                            <span class="txt2">
                                or sign up using
                            </span>
                        </div>

                        <div class="login100-form-social flex-c-m">
                            <a href="#" class="login100-form-social-item flex-c-m bg1 m-r-5">
                                <i class="fa fa-facebook-f" aria-hidden="true"></i>
                            </a>
                            <p>&nbsp;&nbsp;&nbsp;</p>
                            <a href="https://accounts.google.com/o/oauth2/auth?scope=email profile openid&redirect_uri=http://localhost:9999/Feds/registerGoogle&response_type=code&client_id=110538104080-crjqoltjgupbigij7mm6mdi8imco1k14.apps.googleusercontent.com&approval_prompt=force" class="login100-form-social-item1 flex-c-m m-r-5" style="background-image: url('images/Glogo.png');">
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

                            // Sign in button redirect
                            document.getElementById('signInButton').addEventListener('click', function () {
                                window.location.href = 'login';
                            });
                        });

                        function validatePasswords() {
                            var password = document.getElementById("password-field").value;
                            var confirmPassword = document.getElementById("confirm-password-field").value;

                            var errorMessageElement = document.getElementById("confirm-pass-error");
                            var errorContainer = document.getElementById("error-container");

                            if (password !== confirmPassword) {
                                if (!errorMessageElement) {
                                    errorMessageElement = document.createElement("p");
                                    errorMessageElement.id = "confirm-pass-error";
                                    errorMessageElement.className = "error-message";
                                    errorContainer.appendChild(errorMessageElement);
                                }
                                errorMessageElement.textContent = "Passwords do not match! Please re-enter your password.";
                                errorMessageElement.style.color = "red";
                                return false;
                            } else {
                                if (errorMessageElement) {
                                    errorMessageElement.style.display = "none";
                                }
                                return true;
                            }
                        }
        </script>

    </body>

</html>
