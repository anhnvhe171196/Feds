

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="vn.fpt.edu.models.User"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Settings</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <style>
        td.active {
            color: green;
            font-weight: bold
        }
        td.disable {
            color: red;
            font-weight: bold
        }
    </style>

</head>

<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="../home">
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
            <li class="nav-item">
                <a class="nav-link" href="users">
                    <i class="fas fa-fw fa-table"></i>
                    <span>User List</span></a>
            </li>

            <!-- Nav Item - Tables -->
            <li class="nav-item active">
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
                                    src="../images/<%=((User)session.getAttribute("account")).getAvarta()%>">
                            </a>
                            <!-- Dropdown - User Information -->
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="../home" >
                                    <i class="fas fa-home fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Back To Home
                                </a>
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

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">Settings List</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <!-- Real Table -->
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
  <div class="row">
    <div class="col-sm-12 col-md-6"></div>
    <div class="col-sm-12 col-md-6">
      <div id="dataTable_filter" class="dataTables_filter">
        <label>Search: <input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
        </label>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-12">
      <table class="table table-bordered dataTable no-footer" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
        <thead>
          <tr role="row">
            <!-- sorting_asc -->
            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-sort="ascending" aria-label="Role Id: activate to sort column descending" style="width: 34.2px;">Role Id</th>
            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Role Name: activate to sort column ascending" style="width: 44.2px;">Role Name</th>
            <th class="" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Xem: activate to sort column ascending" style="width: 34.2px;">Xem</th>
            <th class="" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Mua: activate to sort column ascending" style="width: 32.2px;">Mua</th>
            <th class="" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Feedback: activate to sort column ascending" style="width: 70.2px;">Feedback</th>
            <th class="" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Bán: activate to sort column ascending" style="width: 29.2px;">Bán</th>
            <th class="" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Sửa: activate to sort column ascending" style="width: 28.2px;">Sửa</th>
            <th class="" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Xóa: activate to sort column ascending" style="width: 29.2px;">Xóa</th>
            <th class="" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Tạo: activate to sort column ascending" style="width: 28.2px;">Tạo</th>
          </tr>
        </thead>
        <tbody>
        </tbody>
      </table>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-12 col-md-5">
      <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing 0 to 0 of 0 entries</div>
    </div>
    <div class="col-sm-12 col-md-7">
      <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
        <ul class="pagination">
          <li class="paginate_button page-item previous disabled" id="dataTable_previous">
            <a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
          </li>
          <li class="paginate_button page-item next disabled" id="dataTable_next">
            <a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">Next</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
                                <!-- Real Table -->
                                <!--
                                <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4 no-footer">
  <div class="row">
    <div class="col-sm-12 col-md-6"></div>
    <div class="col-sm-12 col-md-6">
      <div id="dataTable_filter" class="dataTables_filter">
        <label>Search: <input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable">
        </label>
      </div>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-12">
      <table class="table table-bordered dataTable no-footer" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
        <thead>
          <tr role="row">
            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Role Id: activate to sort column ascending" style="width: 34.2px;">Role Id</th>
            <th class="sorting sorting_desc" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Role Name: activate to sort column ascending" style="width: 44.2px;" aria-sort="descending">Role Name</th>
            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Xem: activate to sort column ascending" style="width: 34.2px;">Xem</th>
            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Mua: activate to sort column ascending" style="width: 32.2px;">Mua</th>
            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Feedback: activate to sort column ascending" style="width: 70.2px;">Feedback</th>
            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Bán: activate to sort column ascending" style="width: 29.2px;">Bán</th>
            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Sửa: activate to sort column ascending" style="width: 28.2px;">Sửa</th>
            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Xóa: activate to sort column ascending" style="width: 29.2px;">Xóa</th>
            <th class="sorting" tabindex="0" aria-controls="dataTable" rowspan="1" colspan="1" aria-label="Tạo: activate to sort column ascending" style="width: 28.2px;">Tạo</th>
          </tr>
        </thead>
        <tbody>
          <tr class="odd">
            <td class="">Role Id</td>
            <td class="sorting_1">Role Name</td>
            <td>Xem</td>
            <td>Mua</td>
            <td>Feedback</td>
            <td>Bán</td>
            <td>Sửa</td>
            <td>Xóa</td>
            <td>Tạo</td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
  <div class="row">
    <div class="col-sm-12 col-md-5">
      <div class="dataTables_info" id="dataTable_info" role="status" aria-live="polite">Showing 1 to 1 of 1 entries</div>
    </div>
    <div class="col-sm-12 col-md-7">
      <div class="dataTables_paginate paging_simple_numbers" id="dataTable_paginate">
        <ul class="pagination">
          <li class="paginate_button page-item previous disabled" id="dataTable_previous">
            <a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a>
          </li>
          <li class="paginate_button page-item active">
            <a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">1</a>
          </li>
          <li class="paginate_button page-item next disabled" id="dataTable_next">
            <a href="#" aria-controls="dataTable" data-dt-idx="2" tabindex="0" class="page-link">Next</a>
          </li>
        </ul>
      </div>
    </div>
  </div>
</div>
                                -->
                            </div>
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
                    <a class="btn btn-primary" href="${pageContext.request.contextPath}/userLogout">Logout</a>
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

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>
    <script>
        let currentPage = 1;
        let total = 0;
        let searchCount = -1;
        let search = "";
        let sort = "";
        let type = "";
        let tbody = document.getElementsByTagName("tbody")[0];
        let RoleHeader = document.querySelectorAll('th[class=sorting]');
        document.querySelector('input').addEventListener("keypress", function(event) {
            if (event.key === "Enter") {
                event.preventDefault();
                if(this.value.length > 0) {
                    //searchCount = 0;
                    RoleHeader[0].classList.remove("sorting_asc");
                    RoleHeader[0].classList.remove("sorting_desc");
                    RoleHeader[1].classList.remove("sorting_asc");
                    RoleHeader[1].classList.remove("sorting_desc");
                    sort = "";
                    type = "";
                    search = this.value;
                    setTimeout(async () => {
    const settings = {
        method: 'POST',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'search='+search+'&searchCount=1'
    };
            const resp = await fetch("setting", settings);
            const json = await resp.json();
            searchCount = json["Total"];
            const info = document.getElementById('dataTable_info');
            if(searchCount == 0) {
                tbody.innerHTML = '<tr class="odd"><td valign="top" colspan="6" class="dataTables_empty">No matching records found</td></tr>';
                info.innerHTML = "Showing 0 to 0 of 0 entries  (filtered from "+total+" total entries)";
            } else {
                info.innerHTML = "Showing 1 to "+(9 > searchCount ? searchCount : 9)+" of "+searchCount+" entries (filtered from "+total+" total entries)";
                const max = Math.round(searchCount / 9) + (Math.round(searchCount / 9) > (searchCount / 9.0) ? 0 : 1);
                const page = document.querySelector('ul[class=pagination]');
                page.innerHTML = '<li class="paginate_button page-item previous disabled" id="dataTable_previous"><a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item next" id="dataTable_next"><a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">Next</a></li>';
                currentPage = 1;
               if(max <= 1) {
                    page.children[1].classList.add("disabled");
                }
                let temp = page.children[1];
                page.removeChild(temp);
                for(let i = 1; i <= max; i++) {
                    page.innerHTML += '<li class="paginate_button page-item '+( i===1 ? 'active' : '')+'" id="dataTable_'+i+'"><a href="#" aria-controls="dataTable" data-dt-idx="" tabindex="0" class="page-link">'+i+'</a></li>';
                }
                page.appendChild(temp);
                const listPage = document.getElementsByClassName('page-item');
                for(let i = 0; i < listPage.length; i++) {
                    listPage[i].onclick = function() {
                        if(this.classList.contains('disabled')) {
                            return;
                        }
                        if(this.classList.contains('previous') ) {
                            if(currentPage === max) {
                                document.getElementById('dataTable_next').classList.remove('disabled');
                            }
                            document.getElementById('dataTable_'+currentPage).classList.remove('active');
                            currentPage -= 1;
                            document.getElementById('dataTable_'+currentPage).classList.add('active');
                            if(currentPage === 1) {
                                this.classList.add('disabled');
                            }
                            UpdatePage();
                            return;
                        }
                        if(this.classList.contains('next') ) {
                            if(currentPage === 1) {
                                document.getElementById('dataTable_previous').classList.remove('disabled');
                            }
                            document.getElementById('dataTable_'+currentPage).classList.remove('active');
                            currentPage += 1;
                            document.getElementById('dataTable_'+currentPage).classList.add('active');
                            if(currentPage === max) {
                                this.classList.add('disabled');
                            }
                            UpdatePage();
                            return;
                        }
                        if(this.classList.contains('active') ) {
                            return;
                        }
                        document.getElementById('dataTable_'+currentPage).classList.remove('active');
                        if(currentPage === 1) {
                            document.getElementById('dataTable_previous').classList.remove('disabled');
                        }
                        if(currentPage === max) {
                            document.getElementById('dataTable_next').classList.remove('disabled');
                        }
                        currentPage = parseInt(this.children[0].innerHTML);
                        if(currentPage === 1) {
                            document.getElementById('dataTable_previous').classList.add('disabled');
                        }
                        if(currentPage === max) {
                            document.getElementById('dataTable_next').classList.add('disabled');
                        }
                        this.classList.add('active');
                        UpdatePage();
                    }
                }
                const listResp = await fetch("setting", {
        method: 'POST',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'search='+search+"&page=1"
    });
                    const data = await listResp.json();
                    console.log(data);
                    tbody.innerHTML = "";
                    for(let i = 0; i < data["list"].length; i++) {
                            let setting = data["list"][i];
                            tbody.innerHTML += '<tr class="'+(i%2==0?'odd':'even')+'"><td>'+setting["ID"]+'</td><td><a href="setting/detail?id='+setting["ID"]+'">'+setting["Name"]+'</a></td><td class="'+(setting["View"] ? 'active' : 'disable')+'">'+(setting["View"] ? 'active' : 'disable')+'</td><td class="'+(setting["Buy"] ? 'active' : 'disable')+'">'+(setting["Buy"] ? 'active' : 'disable')+'</td><td class="'+(setting["Feedback"] ? 'active' : 'disable')+'">'+(setting["Feedback"] ? 'active' : 'disable')+'</td><td class="'+(setting["Sell"] ? 'active' : 'disable')+'">'+(setting["Sell"] ? 'active' : 'disable')+'</td><td class="'+(setting["Edit"] ? 'active' : 'disable')+'">'+(setting["Edit"] ? 'active' : 'disable')+'</td><td class="'+(setting["Delete"] ? 'active' : 'disable')+'">'+(setting["Delete"] ? 'active' : 'disable')+'</td><td class="'+(setting["Create"] ? 'active' : 'disable')+'">'+(setting["Create"] ? 'active' : 'disable')+'</td></tr>';
                        }
            }
                    }, 0);
                }
                if(this.value.length === 0 && searchCount !== -1) {
                    RoleHeader[0].classList.remove("sorting_asc");
                    RoleHeader[0].classList.remove("sorting_desc");
                    RoleHeader[1].classList.remove("sorting_asc");
                    RoleHeader[1].classList.remove("sorting_desc");
                    sort = "";
                    type = "";
                    searchCount = -1;
                    search = "";
                    loadTable();
                }
            }
        });
        function loadTable() {
            setTimeout(async () => {
    const settings = {
        method: 'POST',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'AllCount=1'
    };
            const resp = await fetch("setting", settings);
            const json = await resp.json();
            console.log(json);
            total = json["Total"];
            if(total === 0) {
                tbody.innerHTML = '<tr class="odd"><td valign="top" colspan="9" class="dataTables_empty">No data available in table</td></tr>';
            } else {
                const max = Math.round(total / 9) + (Math.round(total / 9) > (total / 9.0) ? 0 : 1);
                const page = document.querySelector('ul[class=pagination]');
                const info = document.getElementById('dataTable_info');
                info.innerHTML = "Showing 1 to "+(total >= 9 ? 9 : total)+" of "+total+" entries";
                page.innerHTML = '<li class="paginate_button page-item previous disabled" id="dataTable_previous"><a href="#" aria-controls="dataTable" data-dt-idx="0" tabindex="0" class="page-link">Previous</a></li><li class="paginate_button page-item next" id="dataTable_next"><a href="#" aria-controls="dataTable" data-dt-idx="1" tabindex="0" class="page-link">Next</a></li>';
               if(max <= 1) {
                    page.children[1].classList.add("disabled");
                }
                let temp = page.children[1];
                page.removeChild(temp);
                for(let i = 1; i <= max; i++) {
                    page.innerHTML += '<li class="paginate_button page-item '+( i===1 ? 'active' : '')+'" id="dataTable_'+i+'"><a href="#" aria-controls="dataTable" data-dt-idx="" tabindex="0" class="page-link">'+i+'</a></li>';
                }
                page.appendChild(temp);
                const listPage = document.getElementsByClassName('page-item');
                for(let i = 0; i < listPage.length; i++) {
                    listPage[i].onclick = function() {
                        if(this.classList.contains('disabled')) {
                            return;
                        }
                        if(this.classList.contains('previous') ) {
                            if(currentPage === max) {
                                document.getElementById('dataTable_next').classList.remove('disabled');
                            }
                            document.getElementById('dataTable_'+currentPage).classList.remove('active');
                            currentPage -= 1;
                            document.getElementById('dataTable_'+currentPage).classList.add('active');
                            if(currentPage === 1) {
                                this.classList.add('disabled');
                            }
                            UpdatePage();
                            return;
                        }
                        if(this.classList.contains('next') ) {
                            if(currentPage === 1) {
                                document.getElementById('dataTable_previous').classList.remove('disabled');
                            }
                            document.getElementById('dataTable_'+currentPage).classList.remove('active');
                            currentPage += 1;
                            document.getElementById('dataTable_'+currentPage).classList.add('active');
                            if(currentPage === max) {
                                this.classList.add('disabled');
                            }
                            UpdatePage();
                            return;
                        }
                        if(this.classList.contains('active') ) {
                            return;
                        }
                        document.getElementById('dataTable_'+currentPage).classList.remove('active');
                        if(currentPage === 1) {
                            document.getElementById('dataTable_previous').classList.remove('disabled');
                        }
                        if(currentPage === max) {
                            document.getElementById('dataTable_next').classList.remove('disabled');
                        }
                        currentPage = parseInt(this.children[0].innerHTML);
                        if(currentPage === 1) {
                            document.getElementById('dataTable_previous').classList.add('disabled');
                        }
                        if(currentPage === max) {
                            document.getElementById('dataTable_next').classList.add('disabled');
                        }
                        this.classList.add('active');
                        UpdatePage();
                    }
                }
                    const listResp = await fetch("setting", {
        method: 'POST',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'get=1&page=1'
    });
                    const data = await listResp.json();
                    tbody.innerHTML = "";
                    for(let i = 0; i < data["list"].length; i++) {
                            let setting = data["list"][i];
                            tbody.innerHTML += '<tr class="'+(i%2==0?'odd':'even')+'"><td>'+setting["ID"]+'</td><td><a href="setting/detail?id='+setting["ID"]+'">'+setting["Name"]+'</a></td><td class="'+(setting["View"] ? 'active' : 'disable')+'">'+(setting["View"] ? 'active' : 'disable')+'</td><td class="'+(setting["Buy"] ? 'active' : 'disable')+'">'+(setting["Buy"] ? 'active' : 'disable')+'</td><td class="'+(setting["Feedback"] ? 'active' : 'disable')+'">'+(setting["Feedback"] ? 'active' : 'disable')+'</td><td class="'+(setting["Sell"] ? 'active' : 'disable')+'">'+(setting["Sell"] ? 'active' : 'disable')+'</td><td class="'+(setting["Edit"] ? 'active' : 'disable')+'">'+(setting["Edit"] ? 'active' : 'disable')+'</td><td class="'+(setting["Delete"] ? 'active' : 'disable')+'">'+(setting["Delete"] ? 'active' : 'disable')+'</td><td class="'+(setting["Create"] ? 'active' : 'disable')+'">'+(setting["Create"] ? 'active' : 'disable')+'</td></tr>';
                        }
            
            }
        }, 0);
        }
        function UpdatePage() {
            //console.log("test");
            setTimeout(async () => {
                const info = document.getElementById('dataTable_info');
                if(searchCount === -1) {
                info.innerHTML = "Showing "+((currentPage-1)*9+1)+" to "+(total >= ((currentPage-1)*9+9) ? ((currentPage-1)*9+9) : total)+" of "+total+" entries";
                    const listResp = await fetch("setting", {
        method: 'POST',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'get=1&page='+currentPage+(sort.length > 0 ? "&sort="+sort+"&type="+type : "")
    });
                    const data = await listResp.json();
                    tbody.innerHTML = "";
                    for(let i = 0; i < data["list"].length; i++) {
                            let setting = data["list"][i];
                            tbody.innerHTML += '<tr class="'+(i%2==0?'odd':'even')+'"><td>'+setting["ID"]+'</td><td><a href="#">'+setting["Name"]+'</a></td><td class="'+(setting["View"] ? 'active' : 'disable')+'">'+(setting["View"] ? 'active' : 'disable')+'</td><td class="'+(setting["Buy"] ? 'active' : 'disable')+'">'+(setting["Buy"] ? 'active' : 'disable')+'</td><td class="'+(setting["Feedback"] ? 'active' : 'disable')+'">'+(setting["Feedback"] ? 'active' : 'disable')+'</td><td class="'+(setting["Sell"] ? 'active' : 'disable')+'">'+(setting["Sell"] ? 'active' : 'disable')+'</td><td class="'+(setting["Edit"] ? 'active' : 'disable')+'">'+(setting["Edit"] ? 'active' : 'disable')+'</td><td class="'+(setting["Delete"] ? 'active' : 'disable')+'">'+(setting["Delete"] ? 'active' : 'disable')+'</td><td class="'+(setting["Create"] ? 'active' : 'disable')+'">'+(setting["Create"] ? 'active' : 'disable')+'</td></tr>';
                        }
                }
                else {
                info.innerHTML = "Showing "+((currentPage-1)*9+1)+" to "+(searchCount >= ((currentPage-1)*9+9) ? ((currentPage-1)*9+9) : searchCount)+" of "+searchCount+" entries (filtered from "+total+" total entries)";
                    const listResp = await fetch("setting", {
        method: 'POST',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'search='+search+'&page='+currentPage+(sort.length > 0 ? "&sort="+sort+"&type="+type : "")
    });
                    const data = await listResp.json();
                    tbody.innerHTML = "";
                    for(let i = 0; i < data["list"].length; i++) {
                            let setting = data["list"][i];
                            tbody.innerHTML += '<tr class="'+(i%2==0?'odd':'even')+'"><td>'+setting["ID"]+'</td><td><a href="setting/detail?id='+setting["ID"]+'">'+setting["Name"]+'</a></td><td class="'+(setting["View"] ? 'active' : 'disable')+'">'+(setting["View"] ? 'active' : 'disable')+'</td><td class="'+(setting["Buy"] ? 'active' : 'disable')+'">'+(setting["Buy"] ? 'active' : 'disable')+'</td><td class="'+(setting["Feedback"] ? 'active' : 'disable')+'">'+(setting["Feedback"] ? 'active' : 'disable')+'</td><td class="'+(setting["Sell"] ? 'active' : 'disable')+'">'+(setting["Sell"] ? 'active' : 'disable')+'</td><td class="'+(setting["Edit"] ? 'active' : 'disable')+'">'+(setting["Edit"] ? 'active' : 'disable')+'</td><td class="'+(setting["Delete"] ? 'active' : 'disable')+'">'+(setting["Delete"] ? 'active' : 'disable')+'</td><td class="'+(setting["Create"] ? 'active' : 'disable')+'">'+(setting["Create"] ? 'active' : 'disable')+'</td></tr>';
                        }
                }
            }, 0);
        }
        //SORTING
        RoleHeader[0].onclick = async () => {
            let curr = RoleHeader[0];
            if(RoleHeader[1].classList.contains("sorting_asc") || RoleHeader[1].classList.contains("sorting_desc")) {
                RoleHeader[1].classList.remove("sorting_asc");
                RoleHeader[1].classList.remove("sorting_desc");
            }
            sort = "Role_Id";
            if(curr.className === 'sorting') {
                curr.classList.add("sorting_asc");
                type = "ASC";
            } else if(curr.classList.contains("sorting_asc")) {
                curr.classList.remove("sorting_asc");
                curr.classList.add("sorting_desc");
                type = "DESC";
            } else if(curr.classList.contains("sorting_desc")) {
                curr.classList.remove("sorting_desc");
                curr.classList.add("sorting_asc");
                type = "ASC";
            }
            currentPage = 1;
            UpdatePage();
        };
        RoleHeader[1].onclick = async () => {
            let curr = RoleHeader[1];
            if(RoleHeader[0].classList.contains("sorting_asc") || RoleHeader[0].classList.contains("sorting_desc")) {
                RoleHeader[0].classList.remove("sorting_asc");
                RoleHeader[0].classList.remove("sorting_desc");
            }
            sort = "Role_Name";
            if(curr.className === 'sorting') {
                curr.classList.add("sorting_asc");
                type = "ASC";
            } else if(curr.classList.contains("sorting_asc")) {
                curr.classList.remove("sorting_asc");
                curr.classList.add("sorting_desc");
                type = "DESC";
            } else if(curr.classList.contains("sorting_desc")) {
                curr.classList.remove("sorting_desc");
                curr.classList.add("sorting_asc");
                type = "ASC";
            }
            currentPage = 1;
            UpdatePage();
        }
        loadTable();
    </script>

</body>

</html>