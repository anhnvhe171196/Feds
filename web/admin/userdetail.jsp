<%-- 
    Document   : detail
    Created on : Jun 28, 2024, 1:08:32 AM
    Author     : TGDD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>User Detail</title>

        <!-- Custom fonts for this template-->
        <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="css/sb-admin-2.min.css" rel="stylesheet">

        <style>
        body .detail-div {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .container.detail-div {
            max-width: 600px;
            margin: auto;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
        }
        .avatar {
            text-align: center;
        }
        .avatar img {
            border-radius: 50%;
            width: 150px;
            height: 150px;
        }
        .details {
            margin-top: 20px;
        }
        .details label {
            font-weight: bold;
        }
        .details p {
            margin: 5px 0 15px 0;
        }
        .details select {
            margin: 5px 0 15px 0;
        }
    </style>
    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="dashboard">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Feds Admin</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="dashboard">
                        <i class="fas fa-fw fa-tachometer-alt"></i>
                        <span>Dashboard</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider">

                <!-- Heading -->
                <div class="sidebar-heading">
                    Data List
                </div>

                <!-- Nav Item - Tables -->
                <li class="nav-item active">
                    <a class="nav-link" href="users">
                        <i class="fas fa-fw fa-table"></i>
                        <span>User List</span></a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item ">
                    <a class="nav-link" href="setting">
                        <i class="fas fa-fw fa-table"></i>
                        <span>Settings</span></a>
                </li>

                <!-- Divider -->
                <hr class="sidebar-divider d-none d-md-block">

                <!-- Sidebar Toggler (Sidebar) -->
                <div class="text-center d-none d-md-inline">
                    <button class="rounded-circle border-0" id="sidebarToggle"></button>
                </div>

            </ul>
            <!-- End of Sidebar -->

            <!-- Content Wrapper -->
            <div id="content-wrapper" class="d-flex flex-column">

                <!-- Main Content -->
                <div id="content">

                    <!-- Topbar -->
                    <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                        <!-- Sidebar Toggle (Topbar) -->
                        <form class="form-inline">
                            <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                                <i class="fa fa-bars"></i>
                            </button>
                        </form>

                        <!-- Topbar Navbar -->
                        <ul class="navbar-nav ml-auto">

                            <!-- Nav Item - User Information -->
                            <li class="nav-item dropdown no-arrow">
                                <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                   data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <span class="mr-2 d-none d-lg-inline text-gray-600 small">Admin</span>
                                    <img class="img-profile rounded-circle"
                                         src="img/undraw_profile.svg">
                                </a>
                                <!-- Dropdown - User Information -->
                                <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                     aria-labelledby="userDropdown">
                                    <a class="dropdown-item" href="#" data-toggle="modal" data-target="#logoutModal">
                                        <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                        Logout
                                    </a>
                                </div>
                            </li>

                        </ul>

                    </nav>
                    <!-- End of Topbar -->

                    <!-- Begin Page Content -->
                    <div class="container-fluid">

                        <!-- Page Heading -->
                        <h1 class="h3 mb-4 text-gray-800">Setting Detail</h1>
                        <div class="container detail-content">
        <div class="container detail-div">
    <div class="avatar">
        <img id='avatar' src="${pageContext.request.contextPath}/images/9-anh-dai-dien-trang-inkythuatso-03-15-27-03.jpg" alt="User Avatar" onerror="this.onerror=null;this.src='${pageContext.request.contextPath}/images/9-anh-dai-dien-trang-inkythuatso-03-15-27-03.jpg';">
    </div>
    <div class="details">
        <div class="detail-item">
            <label>User ID:</label>
            <p id="user_id">2</p>
        </div>
        <div class="detail-item">
            <label>Username:</label>
            <p id="user_name">3</p>
        </div>
        <div class="detail-item">
            <label>Email:</label>
            <p id="email">3</p>
        </div>
        <div class="detail-item">
            <label>Phone Number:</label>
            <p id="phone_number">4</p>
        </div>
        <div class="detail-item">
            <label>Role:</label>
            <select id='role'>
            </select>
        </div>
        <div class="detail-item">
            <label>Banned:</label>
            <select id='banned'>
                <option value='true' selected="">Yes</option>
                <option value='false'>No</option>
            </select>
        </div>
        <div class="detail-item">
            <label>Gender:</label>
            <p id="gender">Male</p>
        </div>
    </div>
        <button class='btn-success' style='background-color: #ef233c; border-color: #000000;' id='update-user'>UPDATE USER DETAIL</button>
        <button class="btn-success" onclick="AddNew()" style='margin-top: 10px'>Add New User</button>
</div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->

                <!-- Footer -->
                <footer class="sticky-footer bg-white">
                    <div class="container my-auto">
                        <div class="copyright text-center my-auto">
                            <span>Copyright &copy; Your Website 2020</span>
                        </div>
                    </div>
                </footer>
                <!-- End of Footer -->

            </div>
            <!-- End of Content Wrapper -->

        </div>
        <!-- End of Page Wrapper -->

        <!-- Scroll to Top Button-->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <!-- Logout Modal-->
        <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                        <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">×</span>
                        </button>
                    </div>
                    <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                    <div class="modal-footer">
                        <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                        <a class="btn btn-primary" href="../userLogout">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="vendor/jquery/jquery.min.js"></script>
        <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="js/sb-admin-2.min.js"></script>
        <script>
                            function AddNew() {
                                var modal = document.getElementById("myModal");
    var span = document.getElementsByClassName("modelClose")[0];
    span.onclick = function() {
        modal.style.display = "none";
    }
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
                                modal.style.display = "block";
                                setTimeout(async () => {
                                    const resp = await fetch("users",{
        method: 'POST',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'roles=1'
    });
    const data = await resp.json();
    document.getElementById('addRole').innerHTML = "";
    for(let i = 0; i < data["list"].length; i++) {
        let dat = data["list"][i];
        document.getElementById('addRole').innerHTML += '<option value="'+dat["ID"]+'" '+(dat["ID"] == 5 ? "selected" : "")+' '+(dat["ID"] == 1 ? "disabled" : "")+'>'+dat["Name"]+'</option>';
    }
                                }, 1);
                            }
            setTimeout(async () => {
                const UserRep = await fetch("detail", {
                    method: 'POST',
                    headers: {
                        Accept: 'application/json',
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: window.location.search.replace("?","")
                });
                const UserData = await UserRep.json();
                console.log(UserData);
                document.getElementById("avatar").src = UserData["Avatar"];
                document.getElementById("user_id").innerHTML = UserData["ID"];
                document.getElementById("user_name").innerHTML = UserData["Name"];
                document.getElementById("email").innerHTML = UserData["Email"];
                document.getElementById("phone_number").innerHTML = UserData["Mobile"];
                document.getElementById("gender").innerHTML = UserData["Gender"];
                document.getElementById("banned").selectedIndex = UserData["isBanned"] ? 0 : 1;
                const Resp = await fetch("detail", {
                    method: 'POST',
                    headers: {
                        Accept: 'application/json',
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: 'roles=1'
                });
                const data = await Resp.json();
    document.getElementById('role').innerHTML = "";
    for(let i = 0; i < data["list"].length; i++) {
        let dat = data["list"][i];
        document.getElementsByTagName('select')[0].innerHTML += '<option value="'+dat["ID"]+'" '+(dat["ID"] == UserData["Role"] ? "selected" : "")+' '+(dat["ID"] == 1 ? "disabled" : "")+'>'+dat["Name"]+'</option>';
    }
            }, 0);
            document.getElementById('update-user').onclick = async (event) => {
                event.preventDefault();
                window.location.href = "detail"+window.location.search+"&banned="+document.getElementById('banned').options[document.getElementById('banned').selectedIndex].value+"&role="+document.getElementById('role').options[document.getElementById('role').selectedIndex].value
            };
        </script>
        <style>
            .detail-content {
                font-family: Arial, sans-serif;
                background-color: #f4f4f4;
                margin: 0;
                padding: 0;
            }

            .container.detail-content {
                max-width: 600px;
                margin: 50px auto;
                padding: 20px;
                background-color: #fff;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
                border-radius: 5px;
            }

            .detail-content h1 {
                text-align: center;
                color: #333;
            }

            .detail-content .form-group {
                margin-bottom: 15px;
            }

            .detail-content label {
                display: block;
                margin-bottom: 5px;
                color: #333;
            }

            .detail-content input[type="text"],
            .detail-content select {
                width: 100%;
                padding: 8px;
                box-sizing: border-box;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            .detail-content button {
                display: block;
                width: 100%;
                padding: 10px;
                background-color: #28a745;
                color: #fff;
                border: none;
                border-radius: 4px;
                font-size: 16px;
                cursor: pointer;
            }

            .detail-content button:hover {
                background-color: #218838;
            }
        </style>
    
    <div id="myModal" class="myModal">

  <!-- Modal content -->
  <div class="modalContent">
    <span class="modelClose">&times;</span>
    <form id="modalForm" method="post">
        <input type="hidden" name="add" value="1">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required>

        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>

        <label for="phone">Phone Number</label>
        <input type="tel" id="phone" name="phone" required>
        
        <label>Gender</label>
        <br>
        <input type="radio" name="gender" value="Male" required> <span style="margin-right: 20px">Male</span>
        <input type="radio" name="gender" value="Female" required> <span>Female</span>
        <br>
        
        <label for="phone" style="margin-top: 8px">Role: </label>
        <select id='addRole' name="role">
            <!--5 selected-->
            <!--1 disabled-->
            
        </select>

        <button type="submit">Submit</button>
    </form>
  </div>
    <style>
        /* Modal container */
        .myModal {
            display: none; 
            position: fixed; 
            z-index: 4; 
            left: 0;
            top: 0;
            width: 100%; 
            height: 100%; 
            overflow: auto; 
            background-color: rgb(0,0,0); 
            background-color: rgba(0,0,0,0.4); 
            padding-top: 60px; 
        }

        /* Modal content */
        .myModal .modalContent {
            background-color: #fefefe;
            margin: 5% auto; 
            padding: 20px;
            border: 1px solid #888;
            width: 80%; 
        }

        /* Close button */
        .myModal .modelClose {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .myModal .modelClose:hover,
        .myModal .modelClose:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Input styles */
        .myModal input[type=text], .myModal input[type=password], .myModal input[type=email], .myModal input[type=tel] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        /* Button styles */
        .myModal button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        .myModal button:hover {
            opacity: 0.8;
        }
    </style>
    </body>

</html>