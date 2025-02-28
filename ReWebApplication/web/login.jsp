<%-- 
    Document   : login
    Created on : Feb 24, 2025, 11:16:57 AM
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
        <%@include file="header.jsp" %>
        <div class="login-container">
            <div class="login-form">
                <h2 class="form-title">Đăng nhập</h2>
                <form action="MainController" method="post">
                    <input type="hidden" name="action"  value="login"/>
                    
                    <div class="form-group">
                        <label for="userId">Tên đăng nhập</label>
                        <input type="text" id="userId" name="txtUserID" required/>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Mật khẩu</label>
                        <input type="password" id="password" name="txtPasswordD" required/>
                    </div>
                    
                    <button type="submit" class="submit-btn">Đăng nhập</button>
                    
                    <%
                        String message = request.getAttribute("message")+"";
                    %>
                    <%=message.equals("null")?"":message%>
                </form>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>       
    </body>
</html>
