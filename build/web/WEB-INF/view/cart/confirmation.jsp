<%-- 
    Document   : confirmation
    Created on : Jun 17, 2018, 7:34:44 PM
    Author     : Serhii Bielik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1><i class="fa fa-check"></i> Thank You</h1>
<p>Your oder id is <%= request.getAttribute("orderId") %>.</p>