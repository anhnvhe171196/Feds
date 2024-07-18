<%-- 
    Document   : ProductList
    Created on : May 27, 2024, 10:22:22 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="vn.fpt.edu.models.Product, java.util.ArrayList, vn.fpt.edu.models.Category, vn.fpt.edu.models.Brand" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Shopping Website - Product List</title>
<!--        <style>
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
        </style>-->

        <style>
            
.add-to-cart-btn {
  position: relative;
  border: 2px solid transparent;
  height: 40px;
  padding: 0 30px;
  background-color: #ef233c;
  color: #FFF;
  text-transform: uppercase;
  font-weight: 700;
  border-radius: 40px;
  -webkit-transition: 0.2s all;
  transition: 0.2s all;
}

.add-to-cart-btn>i {
  position: absolute;
  left: 0;
  top: 0;
  width: 40px;
  height: 40px;
  line-height: 38px;
  color: #D10024;
  opacity: 0;
  visibility: hidden;
}

.add-to-cart-btn:hover {
  background-color: #FFF;
  color: #D10024;
  border-color: #D10024;
  padding: 0px 30px 0px 50px;
}

.add-to-cart-btn:hover>i {
  opacity: 1;
  visibility: visible;
}
            .product-info:hover {
                border: 2px solid darkslategray;
            }
            
.product-img {
    overflow: hidden;
    transition: 0.5s;
    border-radius: 10px 10px 0 0;
}

.product-img img {
    transition: 0.5s;
}

.product-img img:hover {
    transform: scale(1.3);
}
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
    </head>
    <body>
        <%@include file="component/header.jsp" %>
        <%@include file="component/navbar.jsp" %>
        <br>
        <div class="container">
            <div class="row">
                <div id="aside" class="col-md-3">
                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Categories</h3>
                        <div class="checkbox-filter">
                            <% String[] cateId = request.getParameterValues("cateid") == null ? new String[0] : request.getParameterValues("cateid");
                                ArrayList<Category> cates = (ArrayList)session.getAttribute("cates");
                                for(int i = 0; i < cates.size(); i++) {
                                    boolean checked = false;
                                    for(int j = 0; j < cateId.length; j++) {
                                        if(String.valueOf(cates.get(i).getCategory_id()).equals(cateId[j])) {
                                            checked = true;
                                        }
                                    }
                            %>
                            <div class="input-checkbox">
                                <input type="checkbox" name="cateid" value="<%=cates.get(i).getCategory_id()%>" id="category-<%=i+1%>" <%=checked ? "checked" : ""%>>
                                <label for="category-<%=i+1%>">
                                    <span></span>
                                    <%=cates.get(i).getCategory_name()%>
                                </label>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Price (VND)</h3>
                        <div class="price-filter">
                            <div class="input-number price-min">
                                <%String min = request.getParameter("min");%>
                                <%String maxp = request.getParameter("max");%>
                                <input id="price-min" type="number" value="<%=min != null ? min : 0%>">
                            </div>
                            <span>-</span>
                            <div class="input-number price-max">
                                <input id="price-max" type="number" <%=maxp != null ? "value=\""+maxp+"\"" : ""%>>
                            </div>
                        </div>
                    </div>
                    <!-- /aside Widget -->

                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">Brand</h3>
                        <div class="checkbox-filter">
                            <%  String[] brandId = request.getParameterValues("brandid") == null ? new String[0] : request.getParameterValues("brandid");
                                ArrayList<Brand> brands = (ArrayList)request.getAttribute("brands");
                                int relatedBrand = (int)request.getAttribute("relatedBrand");
                                int bsize = (relatedBrand == 0 ? brands.size() : relatedBrand);
                                if(bsize > 9) {
                                    bsize = 9;
                                }
                                for(int i = 0; i < brands.size(); i++) { //Giới Hạn 9 brand
//                                                                    for(int i = 0; i < brands.size(); i++) { //Toàn Bộ Brand
                                    boolean checked = false;
                                    for(int j = 0; j < brandId.length; j++) {
                                        if(String.valueOf(brands.get(i).getBrandName()).equals(brandId[j])) {
                                            checked = true;
                                        }
                                    }
                            %>
                            <div class="input-checkbox <%=i > bsize ? "hidden" : ""%>" <%=i > bsize ? "type=\"hidden\"" : ""%>>
                                <input type="checkbox" name="brandid" value="<%=brands.get(i).getBrandName()%>" id="brand-<%=i+1%>" <%=checked ? "checked" : ""%>>
                                <label for="brand-<%=i+1%>">
                                    <span></span>
                                    <%=brands.get(i).getBrandName()%>
                                </label>
                            </div>
                            <% } %>
                            <%if(bsize < brands.size()) {%>
                            <div class="input-checkbox">
                                <label onclick="show(this)">
                                    Show More...
                                </label>
                            </div>
                            <script>
                                function show(label) {
                                    if(label.innerHTML.includes("Show More...")) {
                                        label.innerHTML = "Show Less";
                                        let hiddens = document.querySelectorAll("div[type=hidden]");
                                        for(let i = 0; i < hiddens.length; i++) {
                                            hiddens[i].className = "input-checkbox";
                                            hiddens[i].setAttribute("type", "unhidden");
                                        }
                                    } else {
                                        label.innerHTML = "Show More...";
                                        let hiddens = document.querySelectorAll("div[type=unhidden]");
                                        for(let i = 0; i < hiddens.length; i++) {
                                            hiddens[i].className = "input-checkbox hidden";
                                            hiddens[i].setAttribute("type", "hidden");
                                        }
                                    }
                                }
                            </script>
                            <% } %>
                        </div>
                    </div>
                    <!-- /aside Widget -->
                    <br>
                    <button style="position: relative; border: 2px solid transparent; height: 40px; padding: 0 30px; background-color: #ef233c; color: #FFF; text-transform: uppercase; font-weight: 700; border-radius: 40px; -webkit-transition: 0.2s all; transition: 0.2s all;" id="filters">Filter</button>
                    <br>
                    
                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">NEW PRODUCTS</h3>
                        <% ArrayList<Product> newProd = (ArrayList)request.getAttribute("newProduct");%>
                        <div>
                            <%for(int i = 0; i < newProd.size(); i++) {
                                Product p = newProd.get(i);
                            %>
                            <div style="border: 1px solid #ddd; margin-bottom: 5px; height:  75px">
                                <a href="product?pid=<%=p.getProduct_id()%>" target="_blank">
                                    <img src="images/<%=p.getProduct_img()%>" alt="Product" style="max-height: 75px; max-width: 75px">
                                    
                                    <span class="productname"><%=p.getProduct_name().length() > 20 ? p.getProduct_name().substring(0, 17) + "..." : p.getProduct_name()%></span>
                                    <span style="position: absolute; left: 33%; color: gray; margin-top: 40px;"><%=p.getPriceString()%></span>
                                </a>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    <!-- /aside Widget -->
                    <!-- aside Widget -->
                    <div class="aside">
                        <h3 class="aside-title">POPULAR PRODUCTS</h3>
                        <% ArrayList<Product> PopProd = (ArrayList)request.getAttribute("PopProduct");%>
                        <div>
                            <%for(int i = 0; i < PopProd.size(); i++) {
                                Product p = PopProd.get(i);
                            %>
                            <div style="border: 1px solid #ddd; margin-bottom: 5px; height:  75px">
                                <a href="product?pid=<%=p.getProduct_id()%>" target="_blank">
                                    <img src="images/<%=p.getProduct_img()%>" alt="Product" style="max-height: 75px; max-width: 75px">
                                    
                                    <span class="productname"><%=p.getProduct_name().length() > 20 ? p.getProduct_name().substring(0, 17) + "..." : p.getProduct_name()%></span>
                                    <span style="position: absolute; left: 33%; color: gray; margin-top: 40px;"><%=p.getPriceString()%></span>
                                </a>
                            </div>
                            <% } %>
                        </div>
                    </div>
                    <!-- /aside Widget -->
                </div>
                <script>
                    let allcate = document.querySelectorAll("input[type=checkbox][name=cateid]");
                    for (let i = 0; i < allcate.length; i++) {
                        allcate[i].onchange = function () {
                            if (this.checked) {
                                if (this.getAttribute('checked') == null) {
                                    this.setAttribute('checked', '')
                                }
                            } else {
                                if (this.getAttribute('checked') != null) {
                                    this.removeAttribute('checked');
                                }
                            }
                        }
                    }
                    let allbrand = document.querySelectorAll("input[type=checkbox][name=brandid]");
                    for (let i = 0; i < allbrand.length; i++) {
                        allbrand[i].onchange = function () {
                            if (this.checked) {
                                if (this.getAttribute('checked') == null) {
                                    this.setAttribute('checked', '')
                                }
                            } else {
                                if (this.getAttribute('checked') != null) {
                                    this.removeAttribute('checked');
                                }
                            }
                        }
                    }
                    document.getElementById("filters").onclick = function () {
                        let cateids = document.querySelectorAll("input[type=checkbox][name=cateid][checked]");
                        let brandids = document.querySelectorAll("input[type=checkbox][name=brandid][checked]");
                        const urlParams = new URLSearchParams(window.location.search);
                        let str = "ListProduct";
                        let check = false;
                        if (urlParams.has('search')) {
                            str += "?search=" + urlParams.get('search');
                            check = true;
                            for (let i = 0; i < cateids.length; i++) {
                                str += "&cateid=" + cateids[i].value;
                            }
                            for (let i = 0; i < brandids.length; i++) {
                                str += "&brandid=" + brandids[i].value;
                            }
                        } else {
                            str += "?";
                            for (let i = 0; i < cateids.length; i++) {
                                if (check) {
                                    str += "&cateid=" + cateids[i].value;
                                } else {
                                    str += "cateid=" + cateids[i].value;
                                    check = true;
                                }
                            }
                            for (let i = 0; i < brandids.length; i++) {
                                if (check) {
                                    str += "&brandid=" + brandids[i].value;
                                } else {
                                    str += "brandid=" + brandids[i].value;
                                    check = true;
                                }
                            }
                        }
                        let min = document.getElementById("price-min");
                        let max = document.getElementById("price-max");
                        if (min.value < 0) {
                            alert("Giá tiền không thể bé hơn 0");
                            return;
                        } else {
                            if (min.value.length == 0) {
                                min.value = 0;
                            }
                            if (check) {
                                str += "&min=" + min.value;
                            } else {
                                str += "min=" + min.value;
                            }
                        }
                        if (max.value.length > 0) {
                            if (max.value < min.value) {
                                alert("Giá tối đa không thể bé hơn giá tối thiểu");
                                return;
                            } else {
                                str += "&max=" + max.value;
                            }
                        }
                        window.location.href = str;
                    }
                </script>
                <div id="body" class="col-md-9">
                    <div class="row text-center">
                        <%
                            int p = (int)request.getAttribute("p");
                            String search = request.getParameter("search");
                            ArrayList<Product> products = (ArrayList)request.getAttribute("List");
                            int max = (int)request.getAttribute("max");
                        %>
                        <%
                        for (int i = 0; i < products.size(); i++) {
                            Product product = products.get(i);
                        %>
                        <div class="col-sm-4" style='height: 350px; margin-top: 10px;'>
                            <div class="thumbnail product-info">
                                <a href="product?pid=<%=product.getProduct_id()%>" >
                                    <div class="product-img" >
                                    <img  src="images/<%=product.getProduct_img()%>" alt="Product"
                                         style="height: 150px; max-width: 180px">
                                    </div>
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
                                <!--<form action="productListAddToCart" method="get">
                                    <input type="text" hidden="" name="max" value="2000000">
                                    <input type="type" hidden="" name="pid" value="<%=product.getProduct_id()%>">-->
                                    <button onclick="AddToCart(<%=product.getProduct_id()%>)" class="add-to-cart-btn"><i class="fa fa-shopping-cart"></i> add to cart</button>
                                    <!--<button type="submit"
                                            formaction="AddtoCart?pid=<%=product.getProduct_id()%>&pqty=1&buy=true"
                                            class="btn btn-primary">Buy & Feedback</button>-->
                                <!--</form>-->
                                <br />
                            </div>
                        </div>

                        <%
                        }
                        %>

                                            <script>
                                                function AddToCart(id) {
                                                    setTimeout(async () => {
                                    const resp = await fetch("addtoCartProductListController", {
        method: 'POST',
        headers: {
            Accept: 'application/json',
            'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: 'pid='+id
    });
    const size = await resp.json();
    document.getElementsByClassName("qty")[0].innerHTML = size["Size"];
    
                                                    }, 0);
                                                }
                                            </script>
                    </div>
                    <div class="_JmL__">
                        <nav aria-label="" class="shopee-page-controller" role="navigation">
                            <a aria-disabled="true" aria-label="" class="shopee-icon-button shopee-icon-button--left <%=p == 1 ? "shopee-icon-button--disabled" : ""%>" href="ListProduct?<%=search != null ? "search="+search+"&" : ""%><%for(int i =0; i < cateId.length; i++) {%><%="cateid="+cateId[i]+"&"%><%}%><%for(int i =0; i < brandId.length; i++) {%><%="brandid="+brandId[i]+"&"%><%}%><%=min != null ? "min="+min+"&" : ""%><%=maxp != null ? "max="+maxp+"&" : ""%>page=<%=p-1%>">
                                <svg enable-background="new 0 0 11 11" viewBox="0 0 11 11" x="0" y="0" class="shopee-svg-icon icon-arrow-left">
                                <g>
                                <path d="m8.5 11c-.1 0-.2 0-.3-.1l-6-5c-.1-.1-.2-.3-.2-.4s.1-.3.2-.4l6-5c .2-.2.5-.1.7.1s.1.5-.1.7l-5.5 4.6 5.5 4.6c.2.2.2.5.1.7-.1.1-.3.2-.4.2z"></path>
                                </g>
                                </svg>
                            </a>
                            <%for(int i = (p - 2 > 1 ? p - 2 : 1); i <= (p - 2 > 1 ? (max > p+3 ? p+3 : max) : (max > 5 ? 5 : max)); i++) {%>
                            <a aria-label="" <%= i == p ? "class=\"shopee-button-solid shopee-button-solid--primary\"" : "class=\"shopee-button-no-outline\""%> href="ListProduct?<%=search  != null ? "search="+search +"&" : ""%><%for(int k =0; k < cateId.length; k++) {%><%="cateid="+cateId[k]+"&"%><%}%><%for(int k =0; k < brandId.length; k++) {%><%="brandid="+brandId[k]+"&"%><%}%><%=min != null ? "min="+min+"&" : ""%><%=maxp != null ? "max="+maxp+"&" : ""%>page=<%=i%>" <%= i == p ? "style=\"background-color: rgb(238, 77, 45);\"" : ""%>><%=i%></a>
                            <% } %>
                            <%if(max > 5) {%> 
                            <a class="shopee-button-no-outline shopee-button-no-outline--non-click">...</a>
                            <% }%>
                            <a aria-disabled="false" aria-label="" class="shopee-icon-button shopee-icon-button--right <%=p == max ? "shopee-icon-button--disabled" : ""%>" href="ListProduct?<%=search  != null ? "search="+search +"&" : ""%><%for(int i =0; i < cateId.length; i++) {%><%="cateid="+cateId[i]+"&"%><%}%><%for(int i =0; i < brandId.length; i++) {%><%="brandid="+brandId[i]+"&"%><%}%><%=min != null ? "min="+min+"&" : ""%><%=maxp != null ? "max="+maxp+"&" : ""%>page=<%=p+1%>">
                                <svg enable-background="new 0 0 11 11" viewBox="0 0 11 11" x="0" y="0" class="shopee-svg-icon icon-arrow-right">
                                <path d="m2.5 11c .1 0 .2 0 .3-.1l6-5c .1-.1.2-.3.2-.4s-.1-.3-.2-.4l-6-5c-.2-.2-.5-.1-.7.1s-.1.5.1.7l5.5 4.6-5.5 4.6c-.2.2-.2.5-.1.7.1.1.3.2.4.2z"></path>
                                </svg>
                            </a>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="component/footer.jsp" %>
    </body>
</html>
