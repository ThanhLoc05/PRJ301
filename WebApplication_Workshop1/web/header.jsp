<%-- 
    Document   : header
    Created on : Mar 5, 2025, 11:35:55 PM
    Author     : acer
--%>

<%@page import="utils.FounderUtils"%>
<%@page import="dto.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
    * {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: Arial, sans-serif;
}

body {
    background-color: #ecf0f1;
}

.header {
    background-color: #1abc9c; /* Xanh ngọc bích */
    padding: 1rem 0;
    width: 100%;
    position: fixed;
    top: 0;
    z-index: 1000;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.container {
    max-width: 1200px;
    margin: 0 auto;
    padding: 0 1.5rem;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

/* Logo */
.logo {
    color: #fff;
    font-size: 1.8rem;
    font-weight: bold;
    text-decoration: none;
}

/* Navigation Menu */
.nav {
    display: flex;
    align-items: center;
    justify-content: space-between;
    width: 100%;
}

.menu {
    display: flex;
    list-style: none;
    gap: 2rem;
    flex-grow: 1;
    justify-content: center;
}

.menu-item a {
    color: #fff;
    text-decoration: none;
    font-size: 1rem;
    font-weight: 500;
    transition: color 0.3s ease;
}

.menu-item a:hover {
    color: #2c3e50;
}

/* Search Bar */
.search-bar {
    display: flex;
    align-items: center;
    background: #fff;
    border-radius: 20px;
    padding: 0.5rem 1rem;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.search-input {
    border: none;
    outline: none;
    padding: 0.3rem;
    width: 220px;
    font-size: 0.95rem;
}

.search-button {
    background: none;
    border: none;
    cursor: pointer;
    color: #1abc9c;
    font-size: 1.1rem;
}

/* User Section */
.right-section {
    display: flex;
    align-items: center;
    gap: 1.5rem;
}

.user-section {
    display: flex;
    align-items: center;
    gap: 1rem;
}

.welcome-text {
    color: #fff;
    font-size: 0.95rem;
}

.user-name {
    color: #f39c12;
    font-weight: bold;
}

/* Logout Button */
.logout-btn {
    background-color: #e74c3c;
    color: white;
    border: none;
    border-radius: 5px;
    padding: 0.5rem 1rem;
    font-size: 0.85rem;
    font-weight: 500;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s;
}

.logout-btn:hover {
    background-color: #c0392b;
    transform: scale(1.05);
}

/* Responsive Design */
@media (max-width: 768px) {
    .container {
        flex-direction: column;
        align-items: center;
    }

    .nav {
        flex-direction: column;
        gap: 1rem;
    }

    .menu {
        flex-direction: column;
        gap: 1rem;
    }

    .search-input {
        width: 160px;
    }
}
</style>

<header class="header">
    <%

    %>
    <div class="container">
        <nav class="nav">
            <a href="#" class="logo">Dự án Công Nghệ Thông Tin</a>
            <ul class="menu">
                <li class="menu-item"><a href="#">Trang chủ</a></li>
                <li class="menu-item"><a href="#">Dự án</a></li>
                <li class="menu-item"><a href="#">Liên hệ</a></li>
            </ul>
            <div class="right-section">
                <div class="search-bar">
                    <input type="text" class="search-input" placeholder="Tìm kiếm...">
                    <button class="search-button">🔍</button>
                </div>
                <%  if (FounderUtils.isLoggedIn(session)) {
                        UserDTO userHeader = FounderUtils.getUser(session);

                %>
                <div class="user-section">
                    <span class="welcome-text">Xin chào, <span class="user-name"><%=userHeader.getName()%></span>!</span>
                    <form action="MainController" method="post" style="margin: 0;">
                        <input type="hidden" name="action" value="logout"/>
                        <input type="submit" value="Đăng xuất" class="logout-btn"/>
                    </form>
                </div>
                <%}%>
            </div>
        </nav>
    </div>
</header>
