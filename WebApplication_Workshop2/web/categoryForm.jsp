<%-- 
    Document   : categoryForm
    Created on : Mar 15, 2025, 9:10:39 AM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"
        <title>Exam Categories</title>
    </head>
    <body>
        <%jsp:include page="header.jsp"%>
        
        <div class="page-content">
            <%if (InstructionUtils.isAdmin(session)){%>
            
            <div class="form-container">
                
            </div> 
            <h1>Exam Information</h1>
            <c:if test="${not emty requestScope.success}">
                <div class="success-message"></div>
            </c:if>
        </div>
    </body>
</html>
