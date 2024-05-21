<%-- 
    Document   : test
    Created on : May 21, 2024, 1:01:08 AM
    Author     : Trong
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <table class="table text-start align-middle table-bordered table-hover mb-0">
            <thead>
                <tr class="text-dark">
                    <th scope="col"><input class="form-check-input" type="checkbox"></th>
                    <th scope="col">Ngày</th>
                    <th scope="col">Mã Đơn</th>
                    <th scope="col">Người mua</th>
                    <th scope="col">Giá </th>
                    <th scope="col">Trạng thái</th>
                    <th scope="col">Hoạt động</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${requestScope.billList}" var="c">
                <h1>${c.date}</h1>
                </c:forEach>
            

        </tbody>
    </table>
</body>
</html>
