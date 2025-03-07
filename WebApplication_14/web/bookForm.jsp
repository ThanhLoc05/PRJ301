<%-- 
    Document   : bookForm
    Created on : Feb 27, 2025, 11:12:25 AM
    Author     : acer
--%>

<%@page import="utils.AuthUtils"%>
<%@page import="dto.UserDTO"%>
<%@page import="dto.BookDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="page-content">
            <c:set var="isLoggedIn" value="<%=AuthUtils.isLoggedIn(session)%>">
            <c:set var="isAdmin" value="<%=AuthUtils.isAdmin(session)%>">
                <c:if test="${isAdmin}">
            <div class="form-container">
                <h1>Book Information</h1>
                <form action="MainController" method="post">
                    <input type="hidden" name="action" value="add"/>

                    <div class="form-group">
                        <label for="txtBookID">Book ID:</label>
                        <input type="text" id="txtBookID" name="txtBookID" value="${book.bookID}"/>
                        <c:if test="${not empty requestScope.txtBookID_error}">
                        <div class="error-message">${requestScope.txtBookID_error}</div>
                        </c:if>>
                    </div>

                    <div class="form-group">
                        <label for="txtTitle">Title:</label>
                        <input type="text" id="txtTitle" name="txtTitle" value="${book.title}"/>
                        <c:if test="${not empty requestScope.txtTitle_error}">
                            <div class="error-message">${requestScope.txtTitle_errro}</div>
                        </c:if>>
                    </div>

                    <div class="form-group">
                        <label for="txtAuthor">Author:</label>
                        <input type="text" id="txtAuthor" name="txtAuthor" value="${book.author}"/>
                    </div>

                    <div class="form-group">
                        <label for="txtPublishYear">Publish Year:</label>
                        <input type="number" id="txtPublishYear" name="txtPublishYear" value="${book.publishYear}"/>
                    </div>

                    <div class="form-group">
                        <label for="txtPrice">Price:</label>
                        <input type="number" id="txtPrice" name="txtPrice" value="${book.price}"/>
                    </div>

                    <div class="form-group">
                        <label for="txtQuantity">Quantity:</label>
                        <input type="number" id="txtQuantity" name="txtQuantity" value="${book.quantity}"/>
                        <c:if test="${not empty requestScope.txtQuantity_error}">
                        <div class="error-message"><${requestScope.txtQuantity_error}></div>
                        </c:if>>
                    </div>

                    <div class="button-group">
                        <input type="submit" value="Save" />
                        <input type="reset" value="Reset"/>
                    </div>
                </form>
                
                <a href="MainController?action=search" class="back-link">Back to Book List</a>
            </div>
                </c:if>
            <c:if test="${!isLoggedIn}">
            <div class="form-container error-container">
                <h1>403 Error</h1>
                <p>You do not have permission to access this content!</p>
                <a href="MainController?action=search" class="back-link">Back to Book List</a>
            </div>
            </c:if>>
            
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
