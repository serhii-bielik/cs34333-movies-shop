<%-- 
    Document   : cart
    Created on : Jun 17, 2018, 7:33:36 PM
    Author     : Serhii Bielik
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page import="cart.ShoppingCart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="row row-offcanvas row-offcanvas-right">
    <div class="col-xs-12 col-sm-9">
        <c:if test="${empty cart || cart.numberOfItems == 0}">
            <p>Your cart is empty</p>
        </c:if>  
        <c:if test="${!empty cart && cart.numberOfItems != 0}">
            <table class="table table-striped table-hover">
                <thead>
                    <tr>
                        <th>Movie</th>
                        <th>Title</th>
                        <th>Price</th>
                        <th>Quantity</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach var="cartItem" items="${cart.items}" varStatus="iter">
                    <c:set var="product" value="${cartItem.product}"/>

                    <tr>
                        <td>
                            <img src="${product.poster}"
                                 alt="${product.title}">
                        </td>

                        <td>${product.title}</td>

                        <td>
                            $${cartItem.total}
                            <br>
                            <span class="smallText">( $${product.price} / unit )</span>
                        </td>

                        <td>
                            <form action="update-cart" method="post">
                                <input type="hidden"
                                       name="productId"
                                       value="${product.id}">
                                <input type="text"
                                       maxlength="2"
                                       size="2"
                                       value="${cartItem.quantity}"
                                       name="quantity"
                                       style="margin:5px">
                                <button class="btn btn-xs btn-success" type="submit"
                                        name="submit"
                                        value="update"><i class="fa fa-refresh"></i> Update</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>

    <div class="col-xs-6 col-sm-3 sidebar-offcanvas" id="sidebar">
        <div class="list-group" style="margin-bottom: 25px">
            <p>Movies in the cart: <strong><%= session.getAttribute("cart") != null ? ((ShoppingCart) session.getAttribute("cart")).getNumberOfItems() : 0%></strong><br>
                Total: <strong>$<%= session.getAttribute("cart") != null ? ((ShoppingCart) session.getAttribute("cart")).getSubtotal() : 0%></strong></p>

            <p><a style="margin-bottom: 5px; width: 200px;" class="btn btn-success" href="/home" class="bubble hMargin"><i class="fa fa-shopping-bag"></i> Continue Shopping</a>
            <c:if test="${!empty cart && cart.numberOfItems != 0}">
                <a style="width: 200px;" class="btn btn-success" href="checkout" class="bubble hMargin"><i class="fa fa-paypal"></i> Checkout</a>
            </c:if></p>
            <c:if test="${!empty cart && cart.numberOfItems != 0}">
                <p><a style="width: 200px;" class="btn btn-warning" href="view-cart?clear=true" class="bubble hMargin"><i class="fa fa-trash"></i> Clear Cart</a></p>
            </c:if>
        </div>
        <div class="list-group">
            <c:forEach var="category" items="${categories}">
                <a class="list-group-item" href="category?${category.id}">${category.name}</a>                
            </c:forEach>
        </div>
    </div>
</div>


