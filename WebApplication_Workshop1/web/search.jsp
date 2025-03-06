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
        <style>
            .project-table {
                width: 100%;
                border-collapse: collapse;
                margin: 25px 0;
                font-size: 14px;
                font-family: Arial, sans-serif;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
                table-layout: fixed;
            }

            .project-table thead th {
                background-color: #009879;
                color: #ffffff;
                text-align: center;
                font-weight: bold;
                padding: 12px 15px;
                width: auto;
            }

            .project-table tbody tr {
                border-bottom: 1px solid #dddddd;
            }

            .project-table tbody tr:nth-of-type(even) {
                background-color: #f3f3f3;
            }

            .project-table tbody tr:last-of-type {
                border-bottom: 2px solid #009879;
            }

            .project-table tbody td {
                padding: 12px 15px;
                text-align: center; /* Căn giữa nội dung bảng */
                vertical-align: middle;
                word-wrap: break-word;
                overflow: hidden;
            }

            .project-table thead th,
            .project-table tbody td {
                width: 20%; /* Mỗi cột chiếm 20% để dàn đều */
            }

            /* Hover effect */
            .project-table tbody tr:hover {
                background-color: #f5f5f5;
                transition: 0.3s ease;
            }

            /* Search section styles */
            .search-section {
                background-color: #fff;
                border-radius: 8px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
                display: flex;
                align-items: center;
            }

            .search-section form {
                display: flex;
                align-items: center;
                flex-grow: 1;
            }

            .search-section label {
                margin-right: 10px;
                font-weight: bold;
                color: #333;
            }

            .search-input {
                flex-grow: 1;
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
                font-size: 14px;
                margin-right: 10px;
                transition: border-color 0.3s;
            }

            .search-input:focus {
                border-color: #009879;
                outline: none;
                box-shadow: 0 0 0 2px rgba(0, 152, 121, 0.2);
            }

            .search-btn {
                background-color: #009879;
                color: white;
                border: none;
                border-radius: 4px;
                padding: 10px 15px;
                cursor: pointer;
                font-weight: bold;
                transition: background-color 0.3s;
            }

            .search-btn:hover {
                background-color: #00806a;
            }

            /* Add button styles */
            .add-btn {
                display: inline-block;
                background-color: #007bff;
                color: white;
                text-decoration: none;
                border-radius: 4px;
                padding: 10px 15px;
                margin-bottom: 20px;
                font-weight: bold;
                transition: background-color 0.3s;
            }

            .add-btn:hover {
                background-color: #0069d9;
                text-decoration: none;
            }

            /* Add a nice icon to the add button */
            .add-btn::before {
                content: "+";
                margin-right: 5px;
                font-weight: bold;
            }

            /* Responsive design */
            @media screen and (max-width: 768px) {
                .project-table {
                    font-size: 12px;
                }

                .project-table thead th,
                .project-table tbody td {
                    padding: 8px 10px;
                }
            }
        </style>  
    </head>
    <body>
        <%@include file="header.jsp" %>
        <div style="min-height: 500px; padding: 10px">
            <%
                if (session.getAttribute("user") != null) {
                    UserDTO user = (UserDTO) session.getAttribute("user");
            %>

            <%
                //String searchTerm = request.getAttribute("searchTerm") + "";
                //searchTerm = searchTerm.equals("null") ? "" : searchTerm;
                String searchTerm = (request.getAttribute("searchTerm") != null) ? request.getAttribute("searchTerm").toString() : "";
            %>

            <% if (FounderUtils.isAdmin(session)) {%>
            <a href="projectForm.jsp" class="add-btn">
                Add New Startup Project    
            </a>
            <div class="search-section">
                <form action="MainController">
                    <input type="hidden" name="action" value="search"/>
                    <label for="searchInput">Search Projects:</label>
                    <input type="text" id="searchInput" name="searchTerm" value="<%=searchTerm%>" class="search-input" placeholder="Enter project_id or project_name or Description..."/>
                    <input type="submit" value="Search" class="search-btn"/>
                </form>
            </div>


            <% } %>

            <%
                if (request.getAttribute("projects") != null) {
                    List<StartupProjectsDTO> projects = (List<StartupProjectsDTO>) request.getAttribute("projects");
            %>
            <table class="project-table">
                <thead>
                    <tr>
                        <th>Project_id</th>
                        <th>Project_name</th>
                        <th>Description</th>
                        <th>Status</th>
                        <th>Estimate Launch</th>
                    </tr>
                </thead>
                <tbody>
                    <% for (StartupProjectsDTO sp : projects) {%>
                    <tr>
                        <td><%=sp.getProject_id()%></td>
                        <td><%=sp.getProject_name()%></td>
                        <td><%=sp.getDescription()%></td>
                        <td><%=sp.getStatus()%></td>
                        <td><%=sp.getEstimated_launch()%></td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
            <% } %>

            <% } else { %>
            You do not have permission to access this content.
            <% }%>
        </div>
        <jsp:include page="footer.jsp"/>
    </body>
</html>
