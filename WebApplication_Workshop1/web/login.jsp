<%-- 
    Document   : login
    Created on : Mar 2, 2025, 7:32:02 PM
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
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="login"/>
            Tên Đăng Nhập <input type="text" id="userName" name="txtUserName" required/>
            Mật Khẩu <input type="password" id="password" name="txtPassword" required/>
            <button type="submit" class="submit-btn">Đăng Nhập</button>
            <%
                String message = request.getAttribute("message")+"";
            %>
            <%=message.equals("null")?"":message%>
        </form>
            
    </body>
</html>
