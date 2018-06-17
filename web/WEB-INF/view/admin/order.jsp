<%-- 
    Document   : order
    Created on : Jun 17, 2018, 9:57:13 PM
    Author     : Serhii Bielik
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:set var="status" value="${order.statusId}"/>
<div class="row row-offcanvas row-offcanvas-right">
    <div class="col-xs-12 col-sm-9">
        <h1>Order #${order.id}</h1> 
        <p>
            Order Date: <strong>${order.orderDate}</strong><br>
            Total: <strong>$${order.price}</strong><br>
            Status: <strong>${status.title}</strong><br>
        </p>
        <c:if test="${empty order || order.orderItemsCollection.size() == 0}">
            <p>Order is empty</p>
        </c:if>  
        <c:if test="${!empty order && order.orderItemsCollection.size() != 0}">
            <h4>Ordered Movies</h4>
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${order.orderItemsCollection}" varStatus="iter">
                        <c:set var="movie" value="${item.movieId}"/>

                        <tr>
                            <td>
                                ${movie.title}
                            </td>

                            <td>${item.quantity}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <form method="post" action="status-order" class="max-w">
                <div class="form-group">
                    <label for="rating">Status:</label>
                    <select class="form-control" name="statusId" id="rating">
                        <option value="1">New</option>
                        <option value="2">Payed</option>
                        <option value="3">Packed</option>
                        <option value="4">Delivered</option>
                        <option value="5">Canceled</option>
                    </select>
                </div>
                <input type="hidden"
                       name="orderId"
                       value="${order.id}">
                <button type="submit" class="btn btn-xs btn-warning" href=""><i class="fa fa-refresh"></i> Update Status</button>
            </form>
                       <p style="padding-top: 10px;"><a class="btn btn-xs btn-danger" href="delete-order?${order.id}"><i class="fa fa-trash"></i> Delete</a></p>

        </c:if>
    </div>

    <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
        <div class="list-group">
            <c:forEach var="category" items="${categories}">
                <a class="list-group-item" href="category?${category.id}">${category.name}</a>                
            </c:forEach>
        </div>
    </div>
</div>
