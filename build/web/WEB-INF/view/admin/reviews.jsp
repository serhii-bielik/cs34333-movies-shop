<%-- 
    Document   : reviews
    Created on : Jun 17, 2018, 4:41:03 PM
    Author     : Serhii Bielik
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="java.util.List"%>
<%@page import="entities.Reviews"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row row-offcanvas row-offcanvas-right">
    <div class="col-xs-12 col-sm-9">
        <h1>Reviews Administration</h1>     
        
        <% if(request.getAttribute("reviews") != null) { %>
            <% for (Reviews r : (List<Reviews>)request.getAttribute("reviews")){ %>
                <blockquote class="blockquote">
                    <p><strong><%= r.getTitle() %></strong> (Status: <%= r.getIsApproved() ? "Approved" : "Pending" %>)</p>
                        <p><%= r.getBody() %></p>
                        <footer class="blockquote-footer"><%= r.getUserId().getUsername() %> (Rating: <%= r.getRating() %>)</footer>
                        <a class="btn btn-sm btn-success" href="/approve-review?<%= r.getId()%>">Approve</a> 
                        <a class="btn btn-sm btn-danger" href="/delete-review?<%= r.getId()%>">Delete</a> 
                </blockquote>
                <hr>
            <% } %>
        <% } else { %>
            <p>There are no reviews yet.</p>
        <% } %>
    </div>
    
    <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
        <div class="list-group">
            <c:forEach var="category" items="${categories}">
                <a class="list-group-item" href="category?${category.id}">${category.name}</a>                
            </c:forEach>
        </div>
    </div>
</div>
