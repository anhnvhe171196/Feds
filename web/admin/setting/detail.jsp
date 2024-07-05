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

        <title>Dashboard</title>

        <!-- Custom fonts for this template-->
        <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link
            href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
            rel="stylesheet">

        <!-- Custom styles for this template-->
        <link href="../css/sb-admin-2.min.css" rel="stylesheet">

    </head>

    <body id="page-top">

        <!-- Page Wrapper -->
        <div id="wrapper">

            <!-- Sidebar -->
            <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

                <!-- Sidebar - Brand -->
                <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../../home">
                    <div class="sidebar-brand-icon rotate-n-15">
                        <i class="fas fa-laugh-wink"></i>
                    </div>
                    <div class="sidebar-brand-text mx-3">Feds Admin</div>
                </a>

                <!-- Divider -->
                <hr class="sidebar-divider my-0">

                <!-- Nav Item - Dashboard -->
                <li class="nav-item">
                    <a class="nav-link" href="../dashboard">
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
                <li class="nav-item">
                    <a class="nav-link" href="../users">
                        <i class="fas fa-fw fa-table"></i>
                        <span>User List</span></a>
                </li>

                <!-- Nav Item - Tables -->
                <li class="nav-item active">
                    <a class="nav-link" href="../setting">
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
                                         src="../img/undraw_profile.svg">
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
                            <h1>Update Role Permissions</h1>
                            <form id="role-permission-form">
                                <div class="form-group">
                                    <label for="role-id"><strong>Role ID</strong></label>
                                    <input type="text" id="role-id" name="role-id" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="role-name"><strong>Role Name</strong></label>
                                    <input type="text" id="role-name" name="role-name" readonly>
                                </div>
                                <div class="form-group">
                                    <label for="permission-view">View</label>
                                    <select id="permission-view" name="permission-view">
                                        <option value="active">Active</option>
                                        <option value="disable">Disable</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="permission-buy">Buy</label>
                                    <select id="permission-buy" name="permission-buy">
                                        <option value="active">Active</option>
                                        <option value="disable">Disable</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="permission-feedback">Feedback</label>
                                    <select id="permission-feedback" name="permission-feedback">
                                        <option value="active">Active</option>
                                        <option value="disable">Disable</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="permission-sell">Sell</label>
                                    <select id="permission-sell" name="permission-sell">
                                        <option value="active">Active</option>
                                        <option value="disable">Disable</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="permission-edit">Edit</label>
                                    <select id="permission-edit" name="permission-edit">
                                        <option value="active">Active</option>
                                        <option value="disable">Disable</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="permission-delete">Delete</label>
                                    <select id="permission-delete" name="permission-delete">
                                        <option value="active">Active</option>
                                        <option value="disable">Disable</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label for="permission-create">Create</label>
                                    <select id="permission-create" name="permission-create">
                                        <option value="active">Active</option>
                                        <option value="disable">Disable</option>
                                    </select>
                                </div>
                                <button type="submit">Update Permissions</button>
                            </form>
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
                        <a class="btn btn-primary" href="../../userLogout">Logout</a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Bootstrap core JavaScript-->
        <script src="../vendor/jquery/jquery.min.js"></script>
        <script src="../vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

        <!-- Core plugin JavaScript-->
        <script src="../vendor/jquery-easing/jquery.easing.min.js"></script>

        <!-- Custom scripts for all pages-->
        <script src="../js/sb-admin-2.min.js"></script>
        <script>
            setTimeout(async () => {
                const Resp = await fetch("detail", {
                    method: 'POST',
                    headers: {
                        Accept: 'application/json',
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: window.location.search.replace("?", "")
                });
                const data = await Resp.json();
                //console.log(data);
                document.getElementById("role-id").value = data["ID"];
                document.getElementById("role-name").value = data["Name"];
                document.getElementById("permission-view").selectedIndex = data["View"] ? 0 : 1;
                document.getElementById("permission-buy").selectedIndex = data["Buy"] ? 0 : 1;
                document.getElementById("permission-feedback").selectedIndex = data["Feedback"] ? 0 : 1;
                document.getElementById("permission-sell").selectedIndex = data["Sell"] ? 0 : 1;
                document.getElementById("permission-edit").selectedIndex = data["Edit"] ? 0 : 1;
                document.getElementById("permission-delete").selectedIndex = data["Delete"] ? 0 : 1;
                document.getElementById("permission-create").selectedIndex = data["Create"] ? 0 : 1;
            }, 0);
            document.getElementById('role-permission-form').onsubmit = async (event) => {
                event.preventDefault();
                let id = document.getElementById("role-id").value;
                let view = document.getElementById("permission-view");
                let buy = document.getElementById("permission-buy");
                let feedback = document.getElementById("permission-feedback");
                let sell = document.getElementById("permission-sell");
                let edit = document.getElementById("permission-edit");
                let del = document.getElementById("permission-delete");
                let create = document.getElementById("permission-create");
                const Resp = await fetch("detail", {
                    method: 'POST',
                    headers: {
                        Accept: 'application/json',
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: "id="+id+"&update=1&view="+view.selectedIndex+"&buy="+buy.selectedIndex+"&feedback="+feedback.selectedIndex+"&sell="+sell.selectedIndex+"&edit="+edit.selectedIndex+"&delete="+del.selectedIndex+"&create="+create.selectedIndex
                });
                const data = await Resp.json();
                alert(data["status"]);
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
    </body>

</html>