<%-- 
    Document   : login
    Created on : Jun 16, 2018, 1:37:11 PM
    Author     : WD
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1>Login</h1>
<form method="post" class="max-w">
  <div class="form-group">
    <label for="email">Email address:</label>
    <input type="email" class="form-control" name="email" id="email">
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" class="form-control" name="password" id="pwd">
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
</form>