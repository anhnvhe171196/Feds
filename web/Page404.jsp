<%-- 
    Document   : loi404
    Created on : Mar 10, 2024, 6:36:23 PM
    Author     : admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700,900" rel="stylesheet">

        <style>
            body {
                font-family: 'Montserrat', sans-serif;
                margin: 0;
                padding: 0;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background-color: #f5f5f5;
            }
            .container {
                text-align: center;
                padding: 50px;
                background-color: #fff;
                box-shadow: 0px 4px 15px -5px #0046d5;
                border-radius: 10px;
            }
            .title {
                color: #000;
                font-size: 24px;
                font-weight: 700;
                text-transform: uppercase;
                margin-top: 0;
            }
            .message {
                color: #000;
                font-size: 14px;
                font-weight: 400;
                margin: 20px 0;
            }
            .messageError {
                color: red;
                font-size: 30px;
                font-weight: 400;
                margin: 20px 0;
            }
            .button {
                font-size: 14px;
                text-decoration: none;
                text-transform: uppercase;
                background: #0046d5;
                display: inline-block;
                padding: 15px 30px;
                border-radius: 40px;
                color: #fff;
                font-weight: 700;
                box-shadow: 0px 4px 15px -5px #0046d5;
                margin-top: 20px;
            }
        </style>
    </head>

    <body>

        <div id="notfound">
            <div class="notfound" style="text-align: center">
                <div class="notfound-404">
                    <h1 style="font-family: 'Montserrat', sans-serif;
                        font-size: 230px;
                        margin: 0px;
                        font-weight: 900;
                        position: absolute;
                        left: 50%;
                        -webkit-transform: translateX(-50%);
                        -ms-transform: translateX(-50%);
                        transform: translateX(-50%);
                        background: url('images/bg_2.jpg') no-repeat;
                        -webkit-background-clip: text;
                        -webkit-text-fill-color: transparent;
                        background-size: cover;">Oops!</h1>
                </div>
                <div style="margin-top: 150px;padding: 272px;">
                    <h2 class="title">404 - Page not found</h2>
                    <c:choose>
                    <c:when test="${not empty error}">
                        <p class="messageError">${error}</p>
                        <a class="button" href="javascript:history.back()">Quay lại</a>
                    </c:when>
                    <c:otherwise>
                        <p class="message"><The page you are looking for might have been removed had its name changed or is temporarily unavailable.</p>
                        <a class="button" href="home">Go To Homepage</a>
                    </c:otherwise>
                    </c:choose>

                </div>
            </div>

        </div>

    </body>

</html>
