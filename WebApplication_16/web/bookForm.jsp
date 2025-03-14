<%-- 
    Document   : bookForm
    Created on : Feb 27, 2025, 11:12:25 AM
    Author     : acer
--%>

<%@page import="utils.AuthUtils"%>
<%@page import="dto.UserDTO"%>
<%@page import="dto.BookDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
     <jsp:include page="header.jsp"/>

        <div class="page-content">
            <% if (AuthUtils.isAdmin(session)) { %>

            <div class="form-container">
                <h1>Book Information</h1>

                <!-- Hiển thị thông báo thành công nếu có -->
                <c:if test="${not empty requestScope.success}">
                    <div class="success-message">${requestScope.success}</div>
                </c:if>

                <!-- Hiển thị thông báo lỗi nếu có -->
                <c:if test="${not empty requestScope.error}">
                    <div class="error-container">
                        <p>${requestScope.error}</p>
                    </div>
                </c:if>

                <%
                    BookDTO book = new BookDTO();
                    if (request.getAttribute("book") == null) {
                        request.setAttribute("book", new BookDTO());
                        book = new BookDTO();
                    } else {
                        book = (BookDTO) request.getAttribute("book");
                    }

                    String action = request.getAttribute("action") + "";
                    if (!action.equals("update")) {
                        action = "add";
                    }
                %>

                <form action="MainController" method="post">
                    <input type="hidden" name="action" value="${action}"/>

                    <div class="form-group">
                        <label for="txtBookID">Book ID:</label>
                        <input type="text" id="txtBookID" name="txtBookID" value="${book.bookID}" ${not empty book.bookID ? 'readonly' : ''}/>
                        <c:if test="${not empty requestScope.txtBookID_error}">
                            <div class="error-message">${requestScope.txtBookID_error}</div>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <label for="txtTitle">Title:</label>
                        <input type="text" id="txtTitle" name="txtTitle" value="${book.title}"/>
                        <c:if test="${not empty requestScope.txtTitle_error}">
                            <div class="error-message">${requestScope.txtTitle_error}</div>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <label for="txtAuthor">Author:</label>
                        <input type="text" id="txtAuthor" name="txtAuthor" value="${book.author}"/>
                        <c:if test="${not empty requestScope.txtAuthor_error}">
                            <div class="error-message">${requestScope.txtAuthor_error}</div>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <label for="txtPublishYear">Publish Year:</label>
                        <input type="number" id="txtPublishYear" name="txtPublishYear" value="${book.publishYear}"/>
                        <c:if test="${not empty requestScope.txtPublishYear_error}">
                            <div class="error-message">${requestScope.txtPublishYear_error}</div>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <label for="txtPrice">Price:</label>
                        <input type="number" id="txtPrice" name="txtPrice" value="${book.price}" step="0.01"/>
                        <c:if test="${not empty requestScope.txtPrice_error}">
                            <div class="error-message">${requestScope.txtPrice_error}</div>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <label for="txtQuantity">Quantity:</label>
                        <input type="number" id="txtQuantity" name="txtQuantity" value="${book.quantity}"/>
                        <c:if test="${not empty requestScope.txtQuantity_error}">
                            <div class="error-message">${requestScope.txtQuantity_error}</div>
                        </c:if>
                    </div>

                    <div class="form-group">
                        <label for="txtImage">Book Cover Image:</label>
                        <input type="hidden" id="txtImage" name="txtImage" value="${book.image}"/>
                        <div class="upload-container">
                            <div class="file-upload-wrapper">
                                <button type="button" class="file-upload-button">Choose an Image</button>
                                <input type="file" id="imageUpload" class="file-upload-input" accept="image/*"/>
                            </div>
                            <div class="file-info" id="fileInfo">No file selected</div>
                            <div class="progress-bar-container" id="progressContainer">
                                <div class="progress-bar" id="progressBar"></div>
                            </div>
                        </div>
                        <c:if test="${not empty requestScope.txtImage_error}">
                            <div class="error-message">${requestScope.txtImage_error}</div>
                        </c:if>
                        <div class="image-preview" id="imagePreview">
                            <c:if test="${not empty book.image}">
                                <img src="${book.image}" alt="${book.title}"/>
                            </c:if>
                        </div>
                    </div>

                    <div class="button-group">
                        <input type="submit" value="Save" />
                        <input type="reset" value="Reset"/>
                    </div>
                </form>

                <a href="MainController?action=search" class="back-link">Back to Book List</a>
            </div>
            <% } else { %>
            <div class="form-container error-container">
                <h1>403 Error</h1>
                <p>You do not have permission to access this content!</p>
                <a href="MainController?action=search" class="back-link">Back to Book List</a>
            </div>
            <% }%>
        </div>

        <jsp:include page="footer.jsp"/>

        <script>
            // JavaScript để cải thiện trải nghiệm người dùng
            document.addEventListener('DOMContentLoaded', function () {
                // Preview image when URL is entered
                document.getElementById('txtImage').addEventListener('input', function () {
                    const imageUrl = this.value.trim();
                    let previewContainer = document.querySelector('.image-preview');

                    if (!previewContainer) {
                        previewContainer = document.createElement('div');
                        previewContainer.className = 'image-preview';
                        this.parentNode.appendChild(previewContainer);
                    }

                    if (imageUrl) {
                        // Check if it's a URL or base64 data
                        if (imageUrl.startsWith('data:image') || imageUrl.startsWith('http')) {
                            previewContainer.innerHTML = `<img src="${imageUrl}" alt="Preview" onerror="this.src='assets/images/placeholder.png'; this.alt='Image not available';">`;
                        } else {
                            previewContainer.innerHTML = '<p>Enter a valid image URL or base64 data</p>';
                        }
                    } else {
                        previewContainer.innerHTML = '';
                    }
                });
            });
        </script>
        
         <!-- Thêm jQuery từ CDN -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
        
        <script>
            $(document).ready(function() {
                // Hiển thị tên file khi chọn file
                $('#imageUpload').change(function() {
                    const file = this.files[0];
                    if (file) {
                        // Kiểm tra xem file có phải là hình ảnh không
                        if (!file.type.match('image.*')) {
                            alert('Please select an image file (JPEG, PNG, GIF, etc.)');
                            this.value = '';
                            $('#fileInfo').text('No file selected');
                            return;
                        }
                        
                        // Hiển thị tên file và kích thước
                        const fileSize = (file.size / 1024).toFixed(2) + ' KB';
                        $('#fileInfo').text(file.name + ' (' + fileSize + ')');
                        
                        // Hiển thị thanh tiến trình và bắt đầu chuyển đổi sang Base64
                        $('#progressContainer').show();
                        
                        // Thiết lập FileReader để đọc file và chuyển đổi sang Base64
                        const reader = new FileReader();
                        
                        reader.onprogress = function(event) {
                            if (event.lengthComputable) {
                                const percentLoaded = Math.round((event.loaded / event.total) * 100);
                                $('#progressBar').css('width', percentLoaded + '%');
                            }
                        };
                        
                        reader.onload = function(e) {
                            // Hoàn thành tiến trình
                            $('#progressBar').css('width', '100%');
                            
                            // Lưu trữ dữ liệu Base64 vào input ẩn
                            const base64String = e.target.result;
                            $('#txtImage').val(base64String);
                            
                            // Hiển thị hình ảnh xem trước
                            $('#imagePreview').html('<img src="' + base64String + '" alt="Preview">');
                            
                            // Ẩn thanh tiến trình sau 1 giây
                            setTimeout(function() {
                                $('#progressContainer').hide();
                                $('#progressBar').css('width', '0%');
                            }, 1000);
                        };
                        
                        reader.onerror = function() {
                            alert('Error reading the file. Please try again.');
                            $('#progressContainer').hide();
                            $('#progressBar').css('width', '0%');
                            $('#fileInfo').text('No file selected');
                        };
                        
                        // Bắt đầu đọc file và chuyển đổi sang Base64
                        reader.readAsDataURL(file);
                    } else {
                        $('#fileInfo').text('No file selected');
                    }
                });
                
                // Xử lý nút Reset
                $('#resetBtn').click(function() {
                    $('#imagePreview').empty();
                    $('#fileInfo').text('No file selected');
                    $('#txtImage').val('');
                    $('#progressContainer').hide();
                    $('#progressBar').css('width', '0%');
                });
                
                  // Để chọn lại file đã tải lên trước đó (nếu có)
                const existingImageSrc = $('#imagePreview img').attr('src');
                if (existingImageSrc) {
                    $('#txtImage').val(existingImageSrc);
                }
            });
        </script>
        
    </body>
</html>
