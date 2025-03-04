<%-- 
    Document   : search
    Created on : Mar 4, 2025, 10:39:07 PM
    Author     : acer
--%>

<%@page import="dto.StartupProjectsDTO"%>
<%@page import="java.util.List"%>
<%@page import="utils.FounderUtils"%>
<%@page import="dto.UserDTO"%>
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
            <%                if (session.getAttribute("user") != null) {
                    UserDTO user = (UserDTO) session.getAttribute("user");
            %>

            <%
                String searchTerm = request.getAttribute("searchTerm") + "";
                searchTerm = searchTerm.equals("null") ? "" : searchTerm;
            %>
            <div class="search-section">
                <form action="MainController">
                    <input type="hidden" name="action" value="search"/>
                    <label for="searchInput">Search Projects:</label>
                    <input type="text" id="searchInput" name="searchTerm" value="<%=searchTerm%>" class="search-input" placeholder="Enter project_id, project_name or ..."/>
                    <input type="submit" value="Search" class="search-btn"/>
                </form>
            </div>
            <% if (FounderUtils.isAdmin(session)) {
            %>
            <a href="projectForm.jsp" class="add-btn">
                Add new Startup Projects
            </a>
            <%}%>

            <%
                if (request.getAttribute("projects") != null) {
                    List<StartupProjectsDTO> projects = (List<StartupProjectsDTO>) request.getAttribute("projects");

            %>
            <table class="book-table">
                <thead>
                    <tr>
                        <th>project_id</th>
                        <th>project_name</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>estimate_lauch</th>
                        <% if (FounderUtils.isAdmin(session)) {
                            %>
                        <th>Action</th>
                            <%}%>
                    </tr>
                </thead>
                <tbody>
                    <%            for (StartupProjectsDTO p : projects) {
                    %>
                    <tr>
                        <td><%=p.getProject_id()%></td>
                        <td><%=p.getProject_name()%></td>
                        <td><%=p.getDescription()%></td>
                        <td><%=p.getStatus()%></td>
                        <td><%=p.getEstimated_launch()%></td>
                        <% 
                            if (FounderUtils.isAdmin(session)) {
                        %>
                        <td><a href="MainController?action=delete&id=<%=p.getProject_id()%>&searchTerm=<%=searchTerm%>">
                                <img src="assets/images/delete-icon.png" style="height: 25px"/>

                            </a></td>

                        <%}%>
                    </tr>
                    <%
                        }
                    %>
                </tbody>
            </table>
            <%    }
            } else { %>
            You do not have permission to access this content.
            <%}%>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
