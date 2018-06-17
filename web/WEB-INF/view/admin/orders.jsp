<%-- 
    Document   : orders
    Created on : Jun 17, 2018, 4:41:14 PM
    Author     : Serhii Bielik
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row row-offcanvas row-offcanvas-right">
    <div class="col-xs-12 col-sm-9">        
        <h1>Orders Administration</h1>      
        
        <c:if test="${empty orders || orders.size() == 0}">
            <p>There are no orders</p>
        </c:if>  
        <c:if test="${!empty orders && orders.size() != 0}">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Order #</th>
                        <th>Date</th>
                        <th>Price</th>
                        <th>Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="order" items="${orders}" varStatus="iter">
                    <c:set var="status" value="${order.statusId}"/>

                    <tr>
                        <td>
                            ${order.id}
                        </td>

                        <td>${order.orderDate}</td>

                        <td>
                            $${order.price}
                        </td>
                        
                        <td>
                            ${status.title}
                        </td>

                        <td>
                            <a class="btn btn-xs btn-success" href="order?${order.id}"><i class="fa fa-info"></i> Information</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
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



