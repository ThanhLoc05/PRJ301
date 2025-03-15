<%-- 
    Document   : login
    Created on : Mar 15, 2025, 8:27:41 AM
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
        <%@include file="header.jsp"%>
        <div class="login-container">
            <div class="login-form">
                <h2 class="form-title">Đăng nhập</h2>
                <form action="MainController" method="post">
                    <input type="hidden" name="action" value="login"/>
                    
                    <div class="form-group">
                        <label for="useName">Tên đăng nhập</label>
                        <input tye="text" id="userName" name="txtUserName" required/>
                    </div>
                    
                    <div class="form-group">
                        <label for="password">Mật khẩu</label>
                        <input type="password" id="password" name="txtPassword" required/>
                    </div>
                    
                    <button type="submit" class="submit-btn">Đăng nhập</button>
                </form>
                ${requestScope.message=null?"":requestScope.message}
            </div>
                <%@include file="footer.jsp" %>
                <jsp:include page="footer.jsp"/>
        </div>
    </body>
</html>
