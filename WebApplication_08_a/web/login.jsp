<%-- 
    Document   : login
    Created on : Feb 13, 2025, 10:56:15 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="MainContoller" method="post">
            <input type="hidden" name="action" value="login"/>
            UserID<input type="text" name="txtUserID"/><br/>
            Password<input type="passwrd" name="txtPassword"/><br/>
            <input type="submit" value="Login"/>
        </form>
    </body>
</html>
