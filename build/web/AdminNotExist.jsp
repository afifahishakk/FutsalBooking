<%-- 
    Document   : admin not exist
    Created on : Dec 21, 2018, 1:21:43 AM
    Author     : USER
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="css/admin-login.css" />
        <title>User Not Exist</title>
        
    </head>
    
    <body>
        <h1 align = "center" ><font color="red"> User Not Found</font></h1>   
     <h1 align = "center"> Admin Login</h1>  
       <div class="login">
     <form method="post" action="/Project IP 2.0/Admin/LoginAdminServlet">
    <input type="text" placeholder="Username" id="username" name = "username">  
  <input type="password" placeholder="password" id="password" name="password">  
  <a href="#" class="forgot">forgot password?</a>
  <input type="submit" value="Sign In"></form>
</div>
<div class="shadow"></div>

    </body>
</html>
