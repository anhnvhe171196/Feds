

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.text.SimpleDateFormat, java.util.HashMap, java.util.ArrayList, vn.fpt.edu.models.Category, java.sql.Date" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="styles.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <%
        ArrayList<Category> cates = (ArrayList)request.getAttribute("cates");
    %>
    <%@include file="../component/header.jsp" %>
    <div class="dashboard">
        <header>
            <h1>Admin Dashboard</h1>
        </header>
        <section class="stats">
            <div class="card">
                <h2>Orders</h2>
                <p>Success: <span id="orders-success">0</span></p>
                <p>Cancelled: <span id="orders-cancelled">0</span></p>
                <p>Submitted: <span id="orders-submitted">0</span></p>
            </div>
            <div class="card">
                <h2>Revenues</h2>
                <p>Total: <span id="revenues-total">$0.00</span></p>
                <p>By <select id="revenues-category-select"><option selected disabled>Product Categories</option><%for(int i = 0; i < cates.size(); i++) { Category c = cates.get(i);%><option value="<%=c.getCategory_id()%>"><%=c.getCategory_name()%></option><% } %></select>: <span id="revenues-categories">0đ</span></p>
            </div>
            <div class="card">
                <h2>Customers</h2>
                <p>Newly Registered: <span id="customers-registered">0</span></p>
                <p>Newly Bought: <span id="customers-bought">0</span></p>
            </div>
            <div class="card">
                <h2>Feedback</h2>
                <p>Average Star: <span id="feedback-average">0</span></p>
                <p>By <select id="feedback-category-select"><option selected disabled>Product Categories</option><%for(int i = 0; i < cates.size(); i++) { Category c = cates.get(i);%><option value="<%=c.getCategory_id()%>"><%=c.getCategory_name()%></option><% } %></select>: <span id="feedback-categories">0</span></p>
            </div>
        </section>
        <section class="charts">
            <div class="chart-container">
                <h2>Order Trends</h2>
                <label for="start-date">Start Date:</label>
                <input type="date" id="start-date">
                <label for="end-date">End Date:</label>
                <input type="date" id="end-date">
                <button id="update-chart">Update Chart</button>
                <canvas id="ordersTrendChart"></canvas>
            </div>
        </section>
    </div>
    <script>
        document.getElementById("end-date").max = new Date().toISOString().split("T")[0];
        document.getElementById("start-date").max = new Date().toISOString().split("T")[0];
    // Dummy data for demonstration
const ordersData = {
    success: <%=request.getAttribute("doneOrder")%>,
    cancelled: <%=request.getAttribute("cancelOrder")%>,
    submitted: <%=request.getAttribute("submitOrder")%>,
};
<%
    HashMap<Integer, Integer> revCate = (HashMap)request.getAttribute("RevenueCate");
%>
const revenuesData = {
    total: <%=request.getAttribute("Revenues")%>,
    categories: {
        <% Object[] key = revCate.keySet().toArray();
            for(int i = 0; i < revCate.size(); i++) { int c = (int)key[i];%>
                    <%=c%>: <%=revCate.get(c)%>,
        <% } %>
    }
};

const customersData = {
    registered: <%=request.getAttribute("newlyRegistered")%>,
    bought: <%=request.getAttribute("newlyBought")%>,
};

<%
    HashMap<Integer, Float> feedCate = (HashMap)request.getAttribute("FeedbackCate");
%>
const feedbackData = {
    average: <%=request.getAttribute("Feedback")%>,
    categories: {
        <% Object[] fkey = feedCate.keySet().toArray();
            for(int i = 0; i < feedCate.size(); i++) { int c = (int)fkey[i];%>
                    <%=c%>: <%=feedCate.get(c)%>,
        <% } %>
    }
};

<%
    HashMap<Date, Integer> trendAll = (HashMap)request.getAttribute("trendAll");
    HashMap<Date, Integer> trendDone = (HashMap)request.getAttribute("trendDone");
    Object[] tkey = trendAll.keySet().toArray();
    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
%>
// Trend data (dummy)
const trendData = {
    <% for(int i = 0; i < tkey.length; i++) {
        Date d = (Date)tkey[i];
    %>
    "<%=format.format(d)%>": { success: <%=trendDone.containsKey(d) ? trendDone.get(d) : 0%>, all: <%=trendAll.get(d)%> },
    <% } %>
};

    </script>
    <script src="scripts.js"></script>
</body>
</html>