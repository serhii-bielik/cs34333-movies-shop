<%-- 
    Document   : signup
    Created on : Jun 16, 2018, 1:37:22 PM
    Author     : Serhii Bielik
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<h1>Create account</h1>
<form action="/signup" method="post" class="max-w">
  <div class="form-group">
    <label for="username">Username:</label>
    <input type="text" name="username" class="form-control" id="username">
  </div>
  <div class="form-group">
    <label for="email">Email address:</label>
    <input type="email" name="email" class="form-control" id="email">
  </div>
  <div class="form-group">
    <label for="pwd">Password:</label>
    <input type="password" name="password" class="form-control" id="pwd">
  </div>
  <button type="submit" class="btn btn-default">Submit</button>
</form>
