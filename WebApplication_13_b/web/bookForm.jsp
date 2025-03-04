<%-- 
    Document   : bookForm
    Created on : Feb 27, 2025, 11:12:25 AM
    Author     : acer
--%>

<%@page import="utils.AuthUtils"%>
<%@page import="dto.UserDTO"%>
<%@page import="dto.BookDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="header.jsp"/>

        <div class="page-content">
            <% if (AuthUtils.isLoggedIn(session)) {
                    UserDTO user = AuthUtils.getUser(session);
                    if (AuthUtils.isAdmin(session)) {
            %>
            <%
                BookDTO book = new BookDTO();
                try {
                    book = (BookDTO) request.getAttribute("book");
                } catch (Exception e) {
                    book = new BookDTO();
                }
                if (book == null) {
                    book = new BookDTO();
                }
                // get error information
                String txtBookID_error = request.getAttribute("txtBookID_error") + "";
                txtBookID_error = txtBookID_error.equals("null") ? "" : txtBookID_error;
                String txtTitle_error = request.getAttribute("txtTitle_error") + "";
                txtTitle_error = txtTitle_error.equals("null") ? "" : txtTitle_error;
                String txtQuantity_error = request.getAttribute("txtQuantity_error") + "";
                txtQuantity_error = txtQuantity_error.equals("null") ? "" : txtQuantity_error;
            %>
            <div class="form-container">
                <h1>Book Information</h1>
                <form action="MainController" method="post">
                    <input type="hidden" name="action" value="add"/>

                    <div class="form-group">
                        <label for="txtBookID">Book ID:</label>
                        <input type="text" id="txtBookID" name="txtBookID" value="<%=book.getBookID()%>"/>
                        <% if (!txtBookID_error.isEmpty()) {%>
                        <div class="error-message"><%=txtBookID_error%></div>
                        <% }%>
                    </div>

                    <div class="form-group">
                        <label for="txtTitle">Title:</label>
                        <input type="text" id="txtTitle" name="txtTitle" value="<%=book.getTitle()%>"/>
                        <% if (!txtTitle_error.isEmpty()) {%>
                        <div class="error-message"><%=txtTitle_error%></div>
                        <% }%>
                    </div>

                    <div class="form-group">
                        <label for="txtAuthor">Author:</label>
                        <input type="text" id="txtAuthor" name="txtAuthor" value="<%=book.getAuthor()%>"/>
                    </div>

                    <div class="form-group">
                        <label for="txtPublishYear">Publish Year:</label>
                        <input type="number" id="txtPublishYear" name="txtPublishYear" value="<%=book.getPublishYear()%>"/>
                    </div>

                    <div class="form-group">
                        <label for="txtPrice">Price:</label>
                        <input type="number" id="txtPrice" name="txtPrice" value="<%=book.getPrice()%>"/>
                    </div>

                    <div class="form-group">
                        <label for="txtQuantity">Quantity:</label>
                        <input type="number" id="txtQuantity" name="txtQuantity" value="<%=book.getQuantity()%>"/>
                        <% if (!txtQuantity_error.isEmpty()) {%>
                        <div class="error-message"><%=txtQuantity_error%></div>
                        <% }%>
                    </div>

                    <div class="button-group">
                        <input type="submit" value="Save" />
                        <input type="reset" value="Reset"/>
                    </div>
                </form>
                
                <a href="MainController?action=search" class="back-link">Back to Book List</a>
            </div>
            <%} else {%>
            <div class="form-container error-container">
                <h1>403 Error</h1>
                <p>You do not have permission to access this content!</p>
                <a href="MainController?action=search" class="back-link">Back to Book List</a>
            </div>
            <%}
                } else {%>
            <div class="form-container error-container">
                <h1>Access Denied</h1>
                <p>Please log in to access this page.</p>
                <a href="login.jsp" class="back-link">Go to Login</a>
            </div>
            <%}%>
        </div>

        <jsp:include page="footer.jsp"/>
    </body>
</html>
