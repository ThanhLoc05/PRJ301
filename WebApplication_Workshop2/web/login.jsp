<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Login Page</title>
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
            }

            .login-container {
                width: 350px;
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

            .input-field {
                width: 100%;
                padding: 10px;
                margin: 10px 0;
                border: none;
                border-radius: 5px;
                font-size: 16px;
                outline: none;
            }

            .login-btn {
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

            .login-btn:hover {
                background: rgba(255, 255, 255, 0.5);
            }

            .error-msg {
                color: red;
                margin-top: 10px;
            }
        </style>
    </head>
    <body>

        <div class="login-container">
            <h2>Login</h2>
            <form action="MainController" method="post">
                <input type="hidden" name="action" value="login"/>
                <input class="input-field" type="text" name="txtUserID" placeholder="Username" required/>
                <input class="input-field" type="password" name="txtPassword" placeholder="Password" required/>
                <input class="login-btn" type="submit" value="Login"/>
            </form>

            <%  
                String message = request.getAttribute("message") + "";
                message = message.equals("null") ? "" : message;
            %>
            <div class="error-msg"><%= message %></div>
        </div>

    </body>
</html>
