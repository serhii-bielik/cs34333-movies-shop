<%-- 
    Document   : movie
    Created on : Jun 17, 2018, 2:16:48 PM
    Author     : Serhii Bielik
--%>
<%@page import="cart.ShoppingCart"%>
<%@page import="entities.Reviews"%>
<%@page import="entities.Movies"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row row-offcanvas row-offcanvas-right">
    <div class="col-xs-12 col-sm-9">
        <h1>${movie.title}</h1>     
        <div class="row">
            <div class="col-md-4 text-center">
                <img class="image-responsive" src="<%=request.getContextPath()%>/${movie.poster}" alt="${movie.title}">
            </div>
            <div class="col-md-8">
                <p>${movie.description}</p>
                <p>Category: <a href="category?${category.id}">${category.name}</a></p>                
                <h5>Price: $${movie.price}</h5>
                <h5>Rating: ${movie.rating}</h5>
                <form action="/add-to-cart" method="post">
                        <input type="hidden"
                               name="movieId"
                               value="${movie.id}">
                        <button type="submit" name="submit" class="btn btn-success" 
                               ><i class='fa fa-cart-plus'></i> Add To Cart</button>
                </form>
            </div>
        </div>
            <hr>
        <h2>User's Reviews</h2>
        <% if(((Movies)request.getAttribute("movie")).getReviewsCollection().size() > 0) { %>
            <% for (Reviews r : ((Movies)request.getAttribute("movie")).getReviewsCollection()) { %>
                  <% if (r.getIsApproved()) { %>
                    <blockquote class="blockquote">
                            <p><strong><%= r.getTitle() %></strong></p>
                            <p><%= r.getBody() %></p>
                            <footer class="blockquote-footer"><%= r.getUserId().getUsername() %> (Rating: <%= r.getRating() %>)</footer>
                        </blockquote>
                  <% } %>
            <% } %>
        <% } else { %>
        <p>There are no reviews yet.</p>
        <% } %>
        <hr>
        <h2>Write Review</h2>
        <% if(request.getAttribute("user") != null) { %>
            <form method="post" action="add-review" class="max-w">
                <div class="form-group">
                  <label for="title">Title:</label>
                  <input type="text" class="form-control" name="title" id="title">
                </div>
                <div class="form-group">
                  <label for="review">Review:</label>
                  <textarea type="text" class="form-control" name="review" rows="5" id="review"></textarea>
                </div>
                <div class="form-group">
                    <label for="rating">Rating:</label>
                    <select class="form-control" name="rating" id="rating">
                        <option value="10">10</option>
                        <option value="9">9</option>
                        <option value="8">8</option>
                        <option value="7">7</option>
                        <option value="6">6</option>
                        <option value="5">5</option>
                        <option value="4">4</option>
                        <option value="3">3</option>
                        <option value="2">2</option>
                        <option value="1">1</option>
                    </select>
                </div>
                <input type="hidden"
                               name="movieId"
                               value="${movie.id}">
                <button type="submit" class="btn btn-default">Submit Review</button>
              </form>
        <% } else { %>
        <p>You have to login for posting reviews.</p>
        <% } %>
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

