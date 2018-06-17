<%@page import="cart.ShoppingCart"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : index
    Created on : Jun 16, 2018, 8:25:33 PM
    Author     : Serhii Bielik
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="row row-offcanvas row-offcanvas-right">
    <div class="col-xs-12 col-sm-9">
        <% if (request.getAttribute("selectedCategory") == null) {%>
        <h1>Latest Movies</h1>
        <% } else {%>
        <h1>Latest Movies in <%= request.getAttribute("selectedCategory")%></h1>
        <% }%>
        <div class="row">            
            <c:forEach var="movie" items="${movies}"> 
                <div class="col-xs-6 col-md-4" style="margin-bottom:20px;">
                    <div class="card h-100">
                        <a href="movie?${movie.id}"><img class="card-img-top" src="<%=request.getContextPath()%>/${movie.poster}" alt="${movie.title}"></a>
                        <div class="card-body">
                            <h4 class="card-title">
                                <a href="movie?${movie.id}">${movie.title}</a>
                            </h4>
                            <p class="card-text">${movie.description}...</p>
                            <a href="movie?${movie.id}" class="btn btn-success">Read more <i class="fa fa-chevron-right"></i></a>
                        </div>
                    </div>
                </div>
            </c:forEach>            
        </div>
    </div>

    <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
        <div class="list-group" style="margin-bottom: 25px">
            <p>Movies in the cart: <strong><%= session.getAttribute("cart") != null ? ((ShoppingCart)session.getAttribute("cart")).getNumberOfItems() : 0 %></strong><br>
            Total: <strong>$<%= session.getAttribute("cart") != null ? ((ShoppingCart)session.getAttribute("cart")).getSubtotal(): 0 %></strong></p>
            <p><a href="/view-cart" class="btn btn-success">View Cart <i class="fa fa-shopping-cart"></i></a></p>
        </div>
        <div class="list-group">
            <c:forEach var="category" items="${categories}">
                <a class="list-group-item" href="category?${category.id}">${category.name}</a>                
            </c:forEach>
        </div>
    </div>
</div>