<%-- 
    Document   : userlist
    Created on : Jun 4, 2024, 12:54:50 AM
    Author     : TGDD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.ArrayList, vn.fpt.edu.models.User, vn.fpt.edu.models.Role" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User List</title>
        
    </head>
    <body>
    <%@include file="../component/header.jsp" %>
    <%@include file="../component/navbar.jsp" %>
                        <br>
    <div class="container">
                <div>
                    <div class="aside">
                        <form>
                        <%String search = request.getParameter("search");
                        String searchBy = request.getParameter("searchBy");
                        %>
                        <input type="text" placeholder="Search" name="search" style="width: 40%; min-height: 20px" <%=search != null ? "value=\""+search+"\"" : ""%>>
                            <input type="submit" value="Search" style="margin-left: 10px; width: 10%; min-height: 20px;">
                            <select name="searchBy" style="width: 20%; min-height: 20px;">
                                <option value="name" <%=searchBy == null || searchBy.equals("name") ? "selected" : ""%>>Search By Fullname</option>
                                <option value="email" <%=searchBy != null && searchBy.equals("email") ? "selected" : ""%>>Search By Email</option>
                                <option value="mobile" <%=searchBy != null && searchBy.equals("mobile") ? "selected" : ""%>>Search By Mobile</option>
                            </select>
                        </form>
                        <hr>
                        <h3 style="display: inline">List of users</h3>
                        <%String sort = request.getParameter("Sort");%>
                        <select name="sortBy" style="width: 15%; min-height: 20px; margin-left: 10px" onchange="Sort(this)">
                            <option value="id" <%=sort == null ? "selected" : (sort.equals("id") ? "selected" : "")%>>Sort By ID</option>
                                <option value="name" <%=sort != null && sort.equals("name") ? "selected" : ""%>>Sort By Fullname</option>
                                <option value="email" <%=sort != null && sort.equals("email") ? "selected" : ""%>>Sort By Email</option>
                                <option value="mobile" <%=sort != null && sort.equals("mobile") ? "selected" : ""%>>Sort By Mobile</option>
                                <option value="role" <%=sort != null && sort.equals("role") ? "selected" : ""%>>Sort By Role</option>
                            </select>
                        <button class="btn-success" onclick="AddNew()">Add New User</button>
                        <script>
                            function Sort(sel) {
                                window.location.href = "users?Sort="+sel.options[sel.selectedIndex].value + "<%=search != null ? "&search="+search+"&searchBy="+searchBy : ""%>";
                            }
                            function AddNew() {
                                var modal = document.getElementById("myModal");
    var span = document.getElementsByClassName("close")[0];
    span.onclick = function() {
        modal.style.display = "none";
    }
    window.onclick = function(event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }
                                modal.style.display = "block";
                            }
                        </script>
                        <div class="transaction-table text-center">
                            <div class="table-responsive">
                                <table class="table table-striped table-bordered table-condensed table-hover">
                                    <thead>
                                        <tr>
                                            <th style='font-family: "Open Sans", sans-serif; font-weight: bold; color: black'>STT</th>
                                            <th style='font-family: "Open Sans", sans-serif; font-weight: bold; color: black'>ID</th>
                                            <th style='font-family: "Open Sans", sans-serif; font-weight: bold; color: black'>Fullname</th>
                                            <th style='font-family: "Open Sans", sans-serif; font-weight: bold; color: black'>Email</th>
                                            <th style='font-family: "Open Sans", sans-serif; font-weight: bold; color: black'>Gender</th>
                                            <th style='font-family: "Open Sans", sans-serif; font-weight: bold; color: black'>Mobile</th>
                                            <th style='font-family: "Open Sans", sans-serif; font-weight: bold; color: black'>Role</th>
                                            <th style='font-family: "Open Sans", sans-serif; font-weight: bold; color: black'>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <% ArrayList<User> arr = (ArrayList)request.getAttribute("users");
                                            for(int i = 0; i < arr.size(); i++) {
                                                User u = arr.get(i);
                                        %>
                                            <tr>
                                            <td>
                                                <%=i+1%>
                                            </td>
                                            <td>
                                                <%=u.getUser_Id()%>
                                            </td>
                                            <td>
                                                <%=u.getUser_name()%>
                                            </td>
                                            <td>
                                                <%=u.getEmail()%>
                                            </td>
                                            <td>
                                                <%=u.isGender() ? "Female" : "Male"%>
                                            </td>
                                            <td>
                                                <%=u.getPhone_number()%>
                                            </td>
                                            <td>
                                                <%=u.getRole().getRoleName()%>
                                            </td>
                                            <td>
                                                <button class="btn-success" onclick="window.location.href='detail?id=<%=u.getUser_Id()%>'">View</button>
                                                <button class="btn-<%=u.isBanned() ? "success" : "danger"%>" onclick="window.location.href='users?id=<%=u.getUser_Id()%>&ban=<%=u.isBanned() ? "false" : "true"%>'"><%=u.isBanned() ? "Unban" : "Ban"%></button>
                                            </td>
                                        </tr> 
                                            <%}%>
                                    </tbody>
                                </table>
                                    <%if(arr.size() == 0) {%>
                                <div class="text-center mt-20 col-md-12"><span style="color: red; ">Không có dữ liệu</span></div>
                                <%}%>
                                <div class="clearfix">
                                    <div class="hint-text">Showing <b id="from"><%=arr.size()%></b> out of <b id="max"><%=request.getAttribute("total")%></b> entries</div>
                                    <ul class="pagination">
                                        <%
                                            int p = (int)request.getAttribute("page");
                                            int max = (int)request.getAttribute("max");
                                        %>
                                        <li class="page-item disabled"><a <%=p > 1 ? "href=\"users?page="+(p-1)+"\""+(search != null ? "&search="+search+"&searchBy="+searchBy : "")+(sort != null ? "&Sort="+sort : "") : ""%> id='Previous'>Previous</a></li>
                                        <%for(int i = 1; i <= max; i++) {%>
                                        <li class="page-item <%=p == i ? "active" : ""%>"><a class="page-link" href="users?page=<%=i%><%=search != null ? "&search="+search+"&searchBy="+searchBy : ""%><%=sort != null ? "&Sort="+sort : ""%>"><%=i%></a></li>
                                        <%}%>
                                        <li class="page-item disabled"><a <%=p < max ? "href=\"users?page="+(p+1)+"\""+(search != null ? "&search="+search+"&searchBy="+searchBy : "")+(sort != null ? "&Sort="+sort : "") : ""%> id='Next' class="page-link">Next</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div></div>
</div>
    <%@include file="../component/footer.jsp" %>
    <div id="myModal" class="modal">

  <!-- Modal content -->
  <div class="modal-content">
    <span class="close">&times;</span>
    <form id="modalForm" method="post">
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
        <%ArrayList<Role> roles = (ArrayList)request.getAttribute("roles");%>
        <select name="role">
            <% for(int i = 0; i < roles.size(); i++) {
                Role r = roles.get(i);
            %>
            <option value="<%=r.getId()%>" <%=r.getId() == 5 ? "selected" : ""%> <%=r.getId() == 1 ? "disabled" : ""%>><%=r.getRoleName()%></option>
            <% } %>
        </select>

        <button type="submit">Submit</button>
    </form>
  </div>

</div>
    <style>
        /* Modal container */
        .modal {
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
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto; 
            padding: 20px;
            border: 1px solid #888;
            width: 80%; 
        }

        /* Close button */
        .close {
            color: #aaa;
            float: right;
            font-size: 28px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }

        /* Input styles */
        .modal input[type=text], .modal input[type=password], .modal input[type=email], .modal input[type=tel] {
            width: 100%;
            padding: 12px 20px;
            margin: 8px 0;
            display: inline-block;
            border: 1px solid #ccc;
            box-sizing: border-box;
        }

        /* Button styles */
        .modal button {
            background-color: #4CAF50;
            color: white;
            padding: 14px 20px;
            margin: 8px 0;
            border: none;
            cursor: pointer;
            width: 100%;
        }

        .modal button:hover {
            opacity: 0.8;
        }
    </style>
    </body>
</html>
