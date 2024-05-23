<%-- 
    Document   : roleProfile
    Created on : May 23, 2024, 11:01:45 AM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/roleProfile.css"/>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="${pageContext.request.contextPath}/https://fonts.googleapis.com/css?family=Montserrat:400,500,700" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/slick-theme.css"/>
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/nouislider.min.css"/>
        <link rel="stylesheet" href="${pageContext.request.contextPath}/css/font-awesome.min.css">
        <link type="text/css" rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/home.css" type="text/css">
    </head>
    <body>
        <!-- /HEADER -->
        <%@include file="component/header.jsp"%>
        <!-- /HEADER -->

        <div class="container bootdey flex-grow-1 container-p-y">

            <div class="media align-items-center py-3 mb-3">
                <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="d-block ui-w-100 rounded-circle">
                <div class="media-body ml-4">
                    <h4 class="font-weight-bold mb-0">John Doe <span class="text-muted font-weight-normal">@johndoe</span></h4>
                    <div class="text-muted mb-2">ID: 3425433</div>
                    
                </div>
            </div>

            <div class="card mb-4">
                <div class="card-body">
                    <table class="table user-view-table m-0">
                        <tbody>
                            <tr>
                                <td>Registered:</td>
                                <td>01/23/2017</td>
                            </tr>
                            <tr>
                                <td>Latest activity:</td>
                                <td>01/23/2018 (14 days ago)</td>
                            </tr>
                            <tr>
                                <td>Verified:</td>
                                <td><span class="fa fa-check text-primary"></span>&nbsp; Yes</td>
                            </tr>
                            <tr>
                                <td>Role:</td>
                                <td>User</td>
                            </tr>
                            <tr>
                                <td>Status:</td>
                                <td><span class="badge badge-outline-success">Active</span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <hr class="border-light m-0">
                <div class="table-responsive">
                    <table class="table card-table m-0">
                        <tbody>
                            <tr>
                                <th>Module Permission</th>
                                <th>Read</th>
                                <th>Write</th>
                                <th>Create</th>
                                <th>Delete</th>
                            </tr>
                            <tr>
                                <td>Users</td>
                                <td><span class="fa fa-check text-primary"></span></td>
                                <td><span class="fa fa-times text-light"></span></td>
                                <td><span class="fa fa-times text-light"></span></td>
                                <td><span class="fa fa-times text-light"></span></td>
                            </tr>
                            <tr>
                                <td>Articles</td>
                                <td><span class="fa fa-check text-primary"></span></td>
                                <td><span class="fa fa-check text-primary"></span></td>
                                <td><span class="fa fa-check text-primary"></span></td>
                                <td><span class="fa fa-times text-light"></span></td>
                            </tr>
                            <tr>
                                <td>Staff</td>
                                <td><span class="fa fa-times text-light"></span></td>
                                <td><span class="fa fa-times text-light"></span></td>
                                <td><span class="fa fa-times text-light"></span></td>
                                <td><span class="fa fa-times text-light"></span></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div class="card">
                <div class="row no-gutters row-bordered">
                    <div class="d-flex col-md align-items-center">
                        <a href="javascript:void(0)" class="card-body d-block text-body">
                            <div class="text-muted small line-height-1">Posts</div>
                            <div class="text-xlarge">125</div>
                        </a>
                    </div>
                    <div class="d-flex col-md align-items-center">
                        <a href="javascript:void(0)" class="card-body d-block text-body">
                            <div class="text-muted small line-height-1">Followers</div>
                            <div class="text-xlarge">534</div>
                        </a>
                    </div>
                    <div class="d-flex col-md align-items-center">
                        <a href="javascript:void(0)" class="card-body d-block text-body">
                            <div class="text-muted small line-height-1">Following</div>
                            <div class="text-xlarge">236</div>
                        </a>
                    </div>
                </div>
                <hr class="border-light m-0">
                <div class="card-body">

                    <table class="table user-view-table m-0">
                        <tbody>
                            <tr>
                                <td>Username:</td>
                                <td>nmaxwell</td>
                            </tr>
                            <tr>
                                <td>Name:</td>
                                <td>Nelle Maxwell</td>
                            </tr>
                            <tr>
                                <td>E-mail:</td>
                                <td>nmaxwell@mail.com</td>
                            </tr>
                            <tr>
                                <td>Company:</td>
                                <td>Company Ltd.</td>
                            </tr>
                        </tbody>
                    </table>

                    <h6 class="mt-4 mb-3">Social links</h6>

                    <table class="table user-view-table m-0">
                        <tbody>
                            <tr>
                                <td>Twitter:</td>
                                <td><a href="javascript:void(0)">https://twitter.com/user</a></td>
                            </tr>
                            <tr>
                                <td>Facebook:</td>
                                <td><a href="javascript:void(0)">https://www.facebook.com/user</a></td>
                            </tr>
                            <tr>
                                <td>Instagram:</td>
                                <td><a href="javascript:void(0)">https://www.instagram.com/user</a></td>
                            </tr>
                        </tbody>
                    </table>

                    <h6 class="mt-4 mb-3">Personal info</h6>

                    <table class="table user-view-table m-0">
                        <tbody>
                            <tr>
                                <td>Birthday:</td>
                                <td>May 3, 1995</td>
                            </tr>
                            <tr>
                                <td>Country:</td>
                                <td>Canada</td>
                            </tr>
                            <tr>
                                <td>Languages:</td>
                                <td>English</td>
                            </tr>
                        </tbody>
                    </table>

                    <h6 class="mt-4 mb-3">Contacts</h6>

                    <table class="table user-view-table m-0">
                        <tbody>
                            <tr>
                                <td>Phone:</td>
                                <td>+0 (123) 456 7891</td>
                            </tr>
                        </tbody>
                    </table>

                    <h6 class="mt-4 mb-3">Interests</h6>

                    <table class="table user-view-table m-0">
                        <tbody>
                            <tr>
                                <td>Favorite music:</td>
                                <td>
                                    Rock,
                                    Alternative,
                                    Electro,
                                    Drum &amp; Bass,
                                    Dance
                                </td>
                            </tr>
                            <tr>
                                <td>Favorite movies:</td>
                                <td>
                                    The Green Mile,
                                    Pulp Fiction,
                                    Back to the Future,
                                    WALL·E,
                                    Django Unchained,
                                    The Truman Show,
                                    Home Alone,
                                    Seven Pounds
                                </td>
                            </tr>
                        </tbody>
                    </table>

                </div>
            </div>

        </div>
        <%@include file="component/footer.jsp" %>
    </body>
</html>
