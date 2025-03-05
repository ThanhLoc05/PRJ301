<%-- 
    Document   : footer
    Created on : Mar 5, 2025, 11:37:06 PM
    Author     : acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<style>
   /* Đảm bảo trang luôn có chiều cao 100% */
html, body {
    height: 100%;
    margin: 0;
    padding: 0;
    display: flex;
    flex-direction: column;
}

/* Footer nhỏ hơn nhưng vẫn cân đối */
.footer {
    background-color: #1abc9c; /* Xanh ngọc bích */
    color: #fff;
    padding: 1.5rem 0; /* Giảm chiều cao footer */
    margin-top: auto;
}

/* Cấu trúc dàn đều và tối ưu */
.footer-container {
    max-width: 1100px;
    margin: 0 auto;
    padding: 0 1.5rem;
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 1.5rem; /* Giảm khoảng cách giữa các phần */
}

/* Tiêu đề nhỏ gọn */
.footer-section h3 {
    font-size: 1rem; /* Giảm nhẹ kích thước */
    margin-bottom: 0.6rem; /* Giảm khoảng cách */
    color: #2c3e50;
    text-align: center;
}

/* Nội dung footer */
.footer-section p {
    font-size: 0.85rem;
    line-height: 1.3;
    text-align: center;
}

/* Cân đối danh sách liên kết */
.footer-links {
    list-style: none;
    padding: 0;
    text-align: center;
}

.footer-links li {
    margin-bottom: 0.3rem;
}

.footer-links a {
    color: #ecf0f1;
    text-decoration: none;
    font-size: 0.85rem;
    transition: color 0.3s ease;
}

.footer-links a:hover {
    color: #2c3e50;
}

/* Mạng xã hội */
.social-links {
    display: flex;
    justify-content: center;
    gap: 0.8rem; /* Giảm khoảng cách giữa icon */
    margin-top: 0.5rem;
}

.social-links a {
    color: #fff;
    text-decoration: none;
    font-size: 1.2rem; /* Nhỏ hơn một chút */
    transition: color 0.3s ease, transform 0.2s;
}

.social-links a:hover {
    color: #2c3e50;
    transform: scale(1.1);
}

/* Bản quyền nhỏ hơn */
.copyright {
    text-align: center;
    padding-top: 1rem;
    margin-top: 1rem;
    border-top: 1px solid rgba(255, 255, 255, 0.2);
    font-size: 0.8rem;
    color: #ecf0f1;
}

/* 📌 Responsive - Dàn đều hơn trên mọi màn hình */
@media (max-width: 992px) {
    .footer-container {
        grid-template-columns: repeat(2, 1fr); /* 2 cột trên tablet */
    }
}

@media (max-width: 600px) {
    .footer-container {
        grid-template-columns: 1fr; /* 1 cột trên điện thoại */
        text-align: center;
    }

    .social-links {
        justify-content: center;
    }
}

</style>

<footer class="footer">
    <div class="footer-container">
        <div class="footer-section">
            <h3>Về dự án của chúng tôi</h3>
            <p>Chúng tôi tin rằng những dự án công nghệ thông tin của chúng tôi sẽ được mọi người biết đến trong tương lai.</p>
        </div>
        
        <div class="footer-section">
            <h3>Liên kết</h3>
            <ul class="footer-links">
                <li><a href="#">Trang chủ</a></li>
                <li><a href="#">Dự án</a></li>
                <li><a href="#">Chính sách</a></li>
            </ul>
        </div>
        
        <div class="footer-section">
            <h3>Liên hệ</h3>
            <p>Địa chỉ: 123 Đường ABC, Quận XYZ</p>
            <p>Email: contact@shoponline.com</p>
            <p>Điện thoại: (84) 123-456-789</p>
        </div>
        
        <div class="footer-section">
            <h3>Theo dõi hành trình của chúng tôi</h3>
            <p>Cập nhật tin tức mới nhất về những dự án đang hoạt động, dự kiến sẽ ra mắt sắp tới  </p>
            <div class="social-links">
                <a href="#">📱</a>
                <a href="#">💬</a>
                <a href="#">📷</a>
            </div>
        </div>
    </div>
    
    <div class="copyright">
        <p>&copy;Dự án Công Nghệ Thông Tin sẽ luôn cập nhật tin tức mới nhất về những dự án .</p>
    </div>
</footer>
