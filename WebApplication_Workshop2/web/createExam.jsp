<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    if (request.getAttribute("categories") == null) {
        response.sendRedirect("MainController?action=createExam");
        return;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Create New Exam</title>
        <style>
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: 'Arial', sans-serif;
            }

            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
                background: linear-gradient(135deg, #667eea, #764ba2);
                flex-direction: column;
            }

            .container {
                width: 400px;
                padding: 20px;
                background: rgba(255, 255, 255, 0.2);
                border-radius: 15px;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
                backdrop-filter: blur(10px);
                text-align: center;
            }

            h2 {
                color: white;
                margin-bottom: 20px;
            }

            .input-field, select {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                outline: none;
            }

            .submit-btn {
                width: 100%;
                padding: 10px;
                background: rgba(255, 255, 255, 0.3);
                border: none;
                color: white;
                font-size: 18px;
                border-radius: 5px;
                cursor: pointer;
                transition: 0.3s;
            }

            .submit-btn:hover {
                background: rgba(255, 255, 255, 0.5);
            }

            .error-msg {
                color: red;
                margin-top: 10px;
            }

            .button-container {
                margin-top: 20px;
                display: flex;
                justify-content: space-between;
                width: 400px;
            }

            .btn {
                padding: 10px 15px;
                border: none;
                border-radius: 5px;
                cursor: pointer;
                text-decoration: none;
                font-size: 16px;
                color: white;
                transition: 0.3s;
            }

            .btn-back {
                background-color: #17a2b8;
            }

            .btn-back:hover {
                background-color: #138496;
            }

            .btn-logout {
                background-color: #dc3545;
            }

            .btn-logout:hover {
                background-color: #c82333;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <h2>Create New Exam</h2>
            <c:if test="${not empty message}">
                <p class="error-msg">${message}</p>
            </c:if>
            <form action="MainController" method="post" novalidate>
                <input type="hidden" name="action" value="createExam" />
                
                <input class="input-field" type="text" name="examTitle" placeholder="Exam Title" value="${examTitle}" required />
                <c:if test="${not empty examTitleError}">
                    <span class="error-msg">${examTitleError}</span>
                </c:if>
                
                <input class="input-field" type="text" name="subject" placeholder="Subject" value="${subject}" required />
                <c:if test="${not empty subjectError}">
                    <span class="error-msg">${subjectError}</span>
                </c:if>

                <select name="categoryId" class="input-field" required>
                    <option value="">-- Select Category --</option>
                    <c:forEach var="category" items="${categories}">
                        <option value="${category.category_id}"
                            <c:if test="${not empty categoryId and category.category_id == (categoryId + 0)}">selected</c:if>>
                            ${category.category_name}
                        </option>
                    </c:forEach>
                </select>
                <c:if test="${not empty categoryError}">
                    <span class="error-msg">${categoryError}</span>
                </c:if>

                <input class="input-field" type="number" name="totalMarks" min="0" placeholder="Total Marks" value="${totalMarks}" required />
                <c:if test="${not empty totalMarksError}">
                    <span class="error-msg">${totalMarksError}</span>
                </c:if>

                <input class="input-field" type="number" name="duration" min="0" placeholder="Duration (minutes)" value="${duration}" required />
                <c:if test="${not empty durationError}">
                    <span class="error-msg">${durationError}</span>
                </c:if>

                <input class="submit-btn" type="submit" value="Create Exam" />
            </form>
        </div>

        <div class="button-container">
            <a href="MainController?action=viewExamCategories" class="btn btn-back">Back to Categories</a>
            <form action="MainController" method="post" style="display: inline;">
                <input type="hidden" name="action" value="logout"/>
                <input type="submit" value="Logout" class="btn btn-logout"/>
            </form>
        </div>
    </body>
</html>
