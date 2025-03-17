<%-- 
    Document   : search
    Created on : Feb 17, 2025, 7:11:10 AM
    Author     : acer
--%>

<%@page import="utils.AuthUtils"%>
<%@page import="dto.BookDTO"%>
<%@page import="java.awt.print.Book"%>
<%@page import="java.util.List"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <body> 
        <%@include file="header.jsp" %>
        <div style="min-height: 500px; padding: 10px">
            <c:set var="isLoggedIn" value="<%=AuthUtils.isLoggedIn(session)%>"/>
            <c:set var="isAdmin" value="<%=AuthUtils.isAdmin(session)%>"/>


            <c:if test="${isLoggedIn}">
                <c:set var="searchTerm" value="${requestScope.searchTerm==null?'':requestScope.searchTerm}" />
                <div class="search-section">
                    <form action="MainController">
                        <input type="hidden" name="action" value="search"/>
                        <label for="searchInput">Search Books:</label>
                        <input type="text" id="searchInput" name="searchTerm" value="${searchTerm}" class="search-input" placeholder="Enter book title, author or ID..."/>
                        <input type="submit" value="Search" class="search-btn"/>
                    </form>
                </div>
                <c:if test="${isAdmin}">
                    <a href="bookForm.jsp" class="add-btn">
                        Add
                    </a>
                </c:if>
                <c:if test="${not empty requestScope.books}">
                    <table class="book-table">
                        <thead>
                            <tr>
                                <th>BookID</th>
                                <th>Image</th>
                                <th>Title</th>
                                <th>Author</th>
                                <th>PublishYear</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                    <c:if test="${isAdmin}">
                                    <th>Action</th>
                                    </c:if>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="b" items="${requestScope.books}">
                                <tr>
                                    <td>${b.bookID}</td>
                                    <td><img src="${b.image}" width="150px" /></td>
                                    <td>${b.title}</td>
                                    <td>${b.author}</td>
                                    <td>${b.publishYear}</td>
                                    <td>${b.price}</td>
                                    <td>${b.quantity}</td>
                                    <c:if test="${isAdmin}">
                                    <td><a href="MainController?action=edit&id=${b.bookID}&searchTerm=${searchTerm}">
                                            <img src="assets/images/edit-icon.png"  style="height: 25px"/>                              
                                        </a><a href="MainController?action=delete&id=${b.bookID}&searchTerm=${searchTerm}">
                                            <img src="assets/images/delete-icon.png"  style="height: 25px"/>                              
                                        </a></td>
                                    </c:if>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>
            </c:if>
            <c:if test="${!isLoggedIn}">
                You do not have permission to access this content.
            </c:if>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
