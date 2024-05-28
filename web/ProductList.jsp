<%-- 
    Document   : ProductList
    Created on : May 27, 2024, 10:22:22 PM
    Author     : TGDD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="vn.fpt.edu.models.Product, java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Shopping Website - Product List</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        .product-list {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            margin-top: 20px;
        }
        .product-item {
            background-color: #fff;
            border: 1px solid #ddd;
            border-radius: 5px;
            width: 30%;
            margin-bottom: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            transition: transform 0.3s;
        }
        .product-item:hover {
            transform: scale(1.05);
        }
        .product-img {
            max-width: 100%;
            border-bottom: 1px solid #ddd;
        }
        .product-info {
            padding: 15px;
            text-align: center;
        }
        .product-title {
            font-size: 1.2em;
            margin: 10px 0;
        }
        .product-description {
            font-size: 0.9em;
            color: #555;
            margin: 10px 0;
        }
        .product-price {
            font-size: 1.1em;
            color: #000;
            margin: 10px 0;
        }
        .add-to-cart {
            display: inline-block;
            padding: 10px 15px;
            background-color: #28a745;
            color: #fff;
            text-decoration: none;
            border-radius: 5px;
            margin-top: 10px;
        }
        .add-to-cart:hover {
            background-color: #218838;
        }
    </style>
</head>
<body>
    <%@include file="component/header.jsp" %>
    <%@include file="component/navbar.jsp" %>
    <br>
        <div class="container">
            <div class="row text-center">
                <%
                    int p = (int)request.getAttribute("p");
                    String search = request.getParameter("search");
                    String cateid = request.getParameter("cateid");
                    ArrayList<Product> products = (ArrayList)request.getAttribute("List");
                    int max = (int)request.getAttribute("max");
                %>
                <%
                for (int i = 0; i < products.size(); i++) {
                    Product product = products.get(i);
                %>
                <div class="col-sm-4" style='height: 350px;'>
                    <div class="thumbnail">
                        <a href="product?pid=<%=product.getProduct_id()%>">
                            <img src="images/<%=product.getProduct_img()%>" alt="Product"
                             style="height: 150px; max-width: 180px">
                        <%
                        String prodName = product.getProduct_name();
                        prodName = prodName.substring(0, Math.min(prodName.length(), 20));
                        if(prodName.length() != product.getProduct_name().length()) {
                            prodName += "...";
                        }
                        %>
                        <p class="productname"><%=prodName%>
                        </p>
                        </a>
                        <%
                        String description = product.getDescription();
                        if(description.length() > 44) {
                            description = description.substring(0, Math.min(description.length(), 41));
                            description += "...";
                        }
                        %>
                        <p class="productinfo"><%=description%>
                        </p>
                        <p class="price">
                            <%=product.getPriceString()%>
                        </p>
                        <form method="post">
                            <button type="submit"
                                    formaction="AddtoCart?pid=<%=product.getProduct_id()%>&pqty=1"
                                    class="btn btn-success">Add to Cart</button>
                            &nbsp;&nbsp;&nbsp;
                            <button type="submit"
                                    formaction="AddtoCart?pid=<%=product.getProduct_id()%>&pqty=1&buy=true"
                                    class="btn btn-primary">Buy & Feedback</button>
                        </form>
                        <br />
                    </div>
                </div>

                <%
                }
                %>
                
            </div>
                <style>
                    ._JmL__ {
    margin-top: 2.5rem;
}
.shopee-page-controller {
    display: flex;
    justify-content: center;
}
.shopee-page-controller {
    margin: 1.25rem 0 3.75rem;
}
.shopee-button-no-outline, .shopee-icon-button, .shopee-image-button {
    align-items: center;
    border: 0;
    cursor: pointer;
    display: flex;
    font-size: .875rem;
    font-weight: 300;
    justify-content: center;
    letter-spacing: 0;
    line-height: 1;
    outline: none;
    transition: background-color .1s cubic-bezier(.4,0,.6,1);
}
.shopee-icon-button {
    background-color: transparent;
    border: 1px solid rgba(0, 0, 0, .54);
    padding: 0;
}
.shopee-page-controller .shopee-icon-button--disabled {
    pointer-events: none;
}
.shopee-page-controller .shopee-icon-button--left {
    margin-right: .9375rem;
    text-align: right;
}

.shopee-page-controller .shopee-icon-button {
    border: 0;
    color: rgba(0, 0, 0, .4);
    height: 1.875rem;
    min-width: 2.5rem;
    outline: 0;
    overflow: visible;
    position: relative;
}
.shopee-page-controller .shopee-button-solid {
    color: #fff;
}
.shopee-page-controller .shopee-button-no-outline, .shopee-page-controller .shopee-button-solid {
    font-size: 1.25rem;
    height: 1.875rem;
    margin-left: .9375rem;
    margin-right: .9375rem;
    min-width: 2.5rem;
    padding: 0;
    text-align: center;
}
.shopee-button-solid--primary {
    background: #ee4d2d;
    outline: 0;
    overflow: visible;
    position: relative;
}
.shopee-button-solid {
    align-items: center;
    background: rgba(0, 0, 0, .54);
    border: 0;
    border-radius: 2px;
    box-shadow: 0 1px 1px 0 rgba(0, 0, 0, .09);
    color: #fff;
    cursor: pointer;
    display: flex;
    font-size: .875rem;
    font-weight: 300;
    justify-content: center;
    letter-spacing: 0;
    line-height: 1;
    outline: none;
    position: relative;
    transition: background-color .1s cubic-bezier(.4,0,.6,1);
    transition: opacity .2s ease;
    -webkit-user-select: none;
    -moz-user-select: none;
    user-select: none;
}
.shopee-page-controller .shopee-button-no-outline--non-click {
    cursor: auto;
}
.shopee-page-controller .shopee-icon-button--right {
    margin-left: .9375rem;
    text-align: left;
}
                </style>
                <div class="_JmL__">
  <nav aria-label="" class="shopee-page-controller" role="navigation">
    <a aria-disabled="true" aria-label="" class="shopee-icon-button shopee-icon-button--left <%=p == 1 ? "shopee-icon-button--disabled" : ""%>" href="ListProduct?<%=search != null ? "search="+search+"&" : ""%><%=cateid != null ? "cateid="+cateid+"&" : ""%>page=<%=p-1%>">
      <svg enable-background="new 0 0 11 11" viewBox="0 0 11 11" x="0" y="0" class="shopee-svg-icon icon-arrow-left">
        <g>
          <path d="m8.5 11c-.1 0-.2 0-.3-.1l-6-5c-.1-.1-.2-.3-.2-.4s.1-.3.2-.4l6-5c .2-.2.5-.1.7.1s.1.5-.1.7l-5.5 4.6 5.5 4.6c.2.2.2.5.1.7-.1.1-.3.2-.4.2z"></path>
        </g>
      </svg>
    </a>
      <%for(int i = (p - 2 > 1 ? p - 2 : 1); i <= (p - 2 > 1 ? (max > p+3 ? p+3 : max) : (max > 5 ? 5 : max)); i++) {%>
        <a aria-label="" <%= i == p ? "class=\"shopee-button-solid shopee-button-solid--primary\"" : "class=\"shopee-button-no-outline\""%> href="ListProduct?<%=search  != null ? "search="+search +"&" : ""%><%=cateid != null ? "cateid="+cateid+"&" : ""%>page=<%=i%>" <%= i == p ? "style=\"background-color: rgb(238, 77, 45);\"" : ""%>><%=i%></a>
      <% } %>
      <%if(max > 5) {%> 
    <a class="shopee-button-no-outline shopee-button-no-outline--non-click">...</a>
    <% }%>
    <a aria-disabled="false" aria-label="" class="shopee-icon-button shopee-icon-button--right <%=p == max ? "shopee-icon-button--disabled" : ""%>" href="ListProduct?<%=search  != null ? "search="+search +"&" : ""%><%=cateid != null ? "cateid="+cateid+"&" : ""%>page=<%=p+1%>">
      <svg enable-background="new 0 0 11 11" viewBox="0 0 11 11" x="0" y="0" class="shopee-svg-icon icon-arrow-right">
        <path d="m2.5 11c .1 0 .2 0 .3-.1l6-5c .1-.1.2-.3.2-.4s-.1-.3-.2-.4l-6-5c-.2-.2-.5-.1-.7.1s-.1.5.1.7l5.5 4.6-5.5 4.6c-.2.2-.2.5-.1.7.1.1.3.2.4.2z"></path>
      </svg>
    </a>
  </nav>
</div>
        </div>
    <%@include file="component/footer.jsp" %>
</body>
</html>
