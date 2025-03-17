<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Page</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            justify-content: center;
            align-items: center;
            background: linear-gradient(135deg, #667eea, #764ba2);
            text-align: center;
        }

        .container {
            width: 80%;
            background: white;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid black;
            padding: 10px;
        }

        th {
            background-color: #f2f2f2;
        }

        .btn {
            padding: 8px 12px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background: #333;
            color: white;
            text-align: center;
            padding: 10px;
        }

        .logout {
            text-align: right;
        }
    </style>
</head>
<body>
    <div class="container">
        <c:if test="${mode eq 'categories'}">
            <h1>Welcome ${sessionScope.user.name} !</h1>
        </c:if>

        <form action="MainController" method="post" class="logout">
            <input type="hidden" name="action" value="logout"/>
            <input type="submit" value="Logout" class="btn"/>
        </form>

        <c:choose>
            <c:when test="${mode eq 'categories'}">
                <h2>Exam Categories</h2>
                <table>
                    <tr>
                        <th>Category Name</th>
                        <th>Description</th>
                        <th>Action</th>
                    </tr>
                    <c:forEach var="category" items="${list}">
                        <tr>
                            <td>${category.category_name}</td>
                            <td>${category.description}</td>
                            <td>
                                <a href="MainController?action=viewExamsByCategory&categoryId=${category.category_id}" class="btn">View Exams</a>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
                <br>
                
                <%-- Chỉ hiển thị nút "Create New Exam" nếu user có role là "instructor" --%>
                <c:if test="${not empty sessionScope.user and sessionScope.user.role eq 'Instructor'}">
                    <button type="button" class="btn" onclick="window.location.href = 'createExam.jsp'">Create New Exam</button>
                </c:if>

            </c:when>

            <c:when test="${mode eq 'exams'}">
                <h2>Exams by Category</h2>
                <table>
                    <tr>
                        <th>Exam Title</th>
                        <th>Subject</th>
                        <th>Total Marks</th>
                        <th>Duration (minutes)</th>
                    </tr>
                    <c:forEach var="exam" items="${exams}">
                        <tr>
                            <td>${exam.exam_title}</td>
                            <td>${exam.subject}</td>
                            <td>${exam.total_marks}</td>
                            <td>${exam.duration}</td>
                        </tr>
                    </c:forEach>
                </table>
                <br>
                <a href="MainController?action=viewExamCategories" class="btn">Back to Categories</a>
            </c:when>
        </c:choose>
    </div>

    <div class="footer">
        © 2025 Exam Online | No pain no gain
    </div>
</body>
</html>
