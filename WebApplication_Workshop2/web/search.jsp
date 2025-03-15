<%-- 
    Document   : search
    Created on : Mar 15, 2025, 8:27:50 AM
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
        <div style="min-height: 500px; padding: 10px">
            <c:set var="isLoggedIn" value="<%=Instructor.isLoggedIn(session)%>"/>
            <c:set var="isAdmin" value="<%=Instructor.isAdmin(session)%>"/>

            <c:if test="${isLoggedIn}">
                <c:set var="searchTerm" value="${requestScope.searchTerm==null?"":requestScope.searchTerm}"/>
                <div class="search-section">
                    <form action="MainController">
                        <input type="hidden" name="action" value="search"/>
                        <label for="searchTerm">Search Category:</label>
                        <input type="text" id="searchInput" name="searchTerm" value="${searchTerm}" class="search-input" placeholder="Enter Exam Title or Subject... "/>
                        <input type="submit" value="Search" class="search-btn"/>
                    </form>
                </div>
                <c:if test="${isAdmin}"
                      <a href="" class="add-btn">
                        Add
                    </a>
                </c:if>
                <c:if test="${not empty requestScope.}">

                </c:if>
            </c:if>

        </div>
    </body>
</html>
