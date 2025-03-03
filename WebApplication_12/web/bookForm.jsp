<%-- 
    Document   : bookForm
    Created on : Feb 27, 2025, 11:12:25 AM
    Author     : acer
--%>

<%@page import="dto.BookDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            BookDTO book = new BookDTO();
            try {
                    book = (BookDTO) request.getAttribute("book");
                } catch (Exception e) {
                    book = new BookDTO();
                }
            if(book==null){
                book = new BookDTO();
            }
            //get error information
            String txtBookID_error = request.getAttribute("txtBookID_error") + "";
            txtBookID_error = txtBookID_error.equals("null") ? "" :txtBookID_error;
            String txtTitle_error = request.getAttribute("txtTitle_error") + "";
            txtTitle_error = txtTitle_error.equals("null") ? "" :txtTitle_error;
            String txtQuantity_error = request.getAttribute("txtQuantity_error") + "";
            txtQuantity_error = txtQuantity_error.equals("null") ? "" :txtQuantity_error;
        %>
        <form action="MainController" method="post">
            <input type="hidden" name="action" value="add"/>
            BookID: <input type="text" id="txtBookID" name="txtBookID" value="<%=book.getBookID()%>"/>
            Title: <input type="text" id="txtTitle" name="txtTitle" value="<%=book.getTitle()%>"/>
            Author: <input type="text" id="txtAuthor" name="txtAuthor" value="<%=book.getAuthor()%>"/>
            Publish Year: <input type="number" id="txtPublishYear" name="txtPublishYear" value="<%=book.getPublishYear()%>"/>
            Price: <input type="number" id="txtPrice" name="txtPrice" value="<%=book.getPrice()%>"/>
            Quantity: <input type="number" id="txtQuantity" name="txtQuantity" value="<%=book.getQuantity()%>"/>
            <input type="submit" value="Save"/>
            <input type="reset" value="Reset"/>
        </form>
    </body>
</html>
