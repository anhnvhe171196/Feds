<%-- 
    Document   : userdetail
    Created on : Jun 5, 2024, 3:56:45 PM
    Author     : TGDD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="vn.fpt.edu.models.User, java.util.ArrayList, vn.fpt.edu.models.Role" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Detail</title>
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
    <body>
    <%@include file="../component/header.jsp" %>
    <%@include file="../component/navbar.jsp" %>
    <br>
    <%
        User u = (User)request.getAttribute("currUser");
    %>
    <div class="container">
        <button class="btn-success" onclick="AddNew()" style="margin: 0; left: 54%; top: 77%; position: absolute; -ms-transform: translateY(-50%); transform: translateY(-50%);">Add New User</button>
        <script>
            
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
    </div>
        <div class="container detail-div">
    <div class="avatar">
        <img src="${pageContext.request.contextPath}/images/<%=u.getAvarta()%>" alt="User Avatar">
    </div>
    <div class="details">
        <div class="detail-item">
            <label>User ID:</label>
            <p id="user_id"><%=u.getUser_Id()%></p>
        </div>
        <div class="detail-item">
            <label>Username:</label>
            <p id="user_name"><%=u.getUser_name()%></p>
        </div>
        <div class="detail-item">
            <label>Email:</label>
            <p id="email"><%=u.getEmail()%></p>
        </div>
        <div class="detail-item">
            <label>Phone Number:</label>
            <p id="phone_number"><%=u.getPhone_number()%></p>
        </div>
        <div class="detail-item">
            <label>Role:</label><br>
    <%
        ArrayList<Role> arr = (ArrayList)request.getAttribute("roles");
    %>
            <select id='role'>
                <% for(int i = 0; i < arr.size(); i++) {
                    Role r = arr.get(i);
                %>
                <option <%=r.getId() == 1 ? "disabled" : ""%> value='<%=r.getId()%>' <%=(r.getId() == u.getRole().getId() ? "selected" : "")%>><%=r.getRoleName()%></option>
                <% } %>
            </select>
        </div>
        <div class="detail-item">
            <label>Banned:</label><br>
            <select id='banned'>
                <option value='<%=u.isBanned()%>' selected=""><%=u.isBanned() ? "Yes" : "No"%></option>
                <option value='<%=!u.isBanned()%>'><%=!u.isBanned() ? "Yes" : "No"%></option>
            </select>
        </div>
        <div class="detail-item">
            <label>Gender:</label>
            <p id="gender"><%=u.isGender() ? "Female" : "Male"%></p>
        </div>
    </div>
        <button class='btn-success' style='background-color: #ef233c; border-color: #000000;' onclick="Update()">UPDATE USER DETAIL</button>
        <script>
            function Update() {
                let banned = document.getElementById("banned");
                let role = document.getElementById("role");
                window.location.href = window.location.pathname+window.location.search+"&banned="+banned.options[banned.selectedIndex].value+"&role="+role.options[role.selectedIndex].value;
            }
        </script>
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
        
        <label for="phone" style="margin-top: 8px">Role</label>
        <select name="role">
            <% for(int i = 0; i < arr.size(); i++) {
                Role r = arr.get(i);
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
