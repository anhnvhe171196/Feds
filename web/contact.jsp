<%-- 
    Document   : checkout
    Created on : May 13, 2023, 5:36:47 PM
    Author     : Dell
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">

    <head>
        <title>Liên hệ Feds</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick-theme.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/nouislider.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/home.css"/>
        <link href='https://fonts.googleapis.com/css?family=Roboto:400,100,300,700' rel='stylesheet' type='text/css'>

        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

        <link rel="stylesheet" href="css_contact/style.css">
    </head>

    <body>
        <%@include file="component/header.jsp"%>
        <h1 style="    text-align: center;
            margin-top: 70px;
            color: red;
            font-size: 65px;
            ">Liên Hệ Fed Shop</h1>
        <section class="ftco-section">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-md-12">
                        <div class="wrapper">
                            <div class="row mb-5">
                                <div class="col-md-3">
                                    <div class="dbox w-100 text-center">
                                        <div class="icon d-flex align-items-center justify-content-center">
                                            <span class="fa fa-map-marker"></span>
                                        </div>
                                        <div class="text">
                                            <p><span>Địa chỉ:</span> Km29 Đại lộ Thăng Long, Thạch Hoà, Thạch Thất, Hà Nội
                                            </p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="dbox w-100 text-center">
                                        <div class="icon d-flex align-items-center justify-content-center">
                                            <span class="fa fa-phone"></span>
                                        </div>
                                        <div class="text">
                                            <p><span>Phone:</span> <a href="tel://0969792742">0969792742</a></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="dbox w-100 text-center">
                                        <div class="icon d-flex align-items-center justify-content-center">
                                            <span class="fa fa-paper-plane"></span>
                                        </div>
                                        <div class="text">
                                            <p><span>Email:</span> <a
                                                    href="mailto:hezz281103@gmail.com">hezz281103@gmail.com</a></p>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-3">
                                    <div class="dbox w-100 text-center">
                                        <div class="icon d-flex align-items-center justify-content-center">
                                            <span class="fa fa-globe"></span>
                                        </div>
                                        <div class="text">
                                            <p><span>Website</span> <a href="http://localhost:9999/Feds/home">Feds/home</a>
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row no-gutters">
                                <div class="col-md-7">
                                    <div class="contact-wrap w-100 p-md-5 p-4">
                                        <h3 class="mb-4">Liên Hệ</h3>
                                        <div id="form-message-warning" class="mb-4"></div>
                                        <div id="form-message-success" class="mb-4">
                                            Your message was sent, thank you!
                                        </div>
                                        <form action="contact" method="post">
                                            <div class="row">
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="label" for="name">Họ và tên</label>
                                                        <input type="text" class="form-control" name="name" id="Họ và tên" required
                                                               placeholder="Name">
                                                    </div>
                                                </div>
                                                <div class="col-md-6">
                                                    <div class="form-group">
                                                        <label class="label" for="email">Email</label>
                                                        <input type="email" class="form-control" name="email" id="email" required
                                                               placeholder="Email">
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="label" for="subject">Chủ đề</label>
                                                        <input type="text" class="form-control" name="subject" id="Subject" required
                                                               placeholder="Chủ đề">
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="label" for="subject">Số điện thoại</label>
                                                        <input type="text" class="form-control" name="sdt"
                                                               placeholder="Số điện thoại" pattern="[0]{1}[3,5,7,8,9]{1}[0-9]{8}" required>
                                                        <small style="color: #00000063">Format: 09XXXXXXXX</small>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <label class="label" for="#">Lời nhắn</label>
                                                        <textarea name="message" class="form-control" id="message" cols="30" required
                                                                  rows="4" placeholder="Lời nhắn"></textarea>
                                                    </div>
                                                </div>
                                                <div class="col-md-12">
                                                    <div class="form-group">
                                                        <input type="submit" value="Gửi" class="btn btn-primary">
                                                        <div class="submitting"></div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                                <div class="col-md-5 d-flex align-items-stretch">
                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d14900.394141001201!2d105.50432632149082!3d20.988686942113553!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x31345b74d5000dd9%3A0x78f00cc4a35484b9!2zSMOyYSBM4bqhYywgVGjhuqFjaCBUaOG6pXQsIEhhbm9pLCBWaWV0bmFt!5e0!3m2!1sen!2s!4v1718442750888!5m2!1sen!2s"
                                            width="600" height="565" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <%@include file="component/footer.jsp" %>
        <script src="js_contact/jquery.min.js"></script>
        <script src="js_contact/popper.js"></script>
        <script src="js_contact/bootstrap.min.js"></script>
        <script src="js_contact/jquery.validate.min.js"></script>
        <script src="js_contact/main.js"></script>
        <script src="js1/jquery.min.js"></script>
        <script src="js1/bootstrap.min.js"></script>
        <script src="js1/slick.min.js"></script>
        <script src="js1/nouislider.min.js"></script>
        <script src="js1/jquery.zoom.min.js"></script>
        <script src="js1/main.js"></script>
    </body>

</html>