package controller;

import dao.ExamCategoriesDAO;
import dao.ExamDAO;
import dao.UserDAO;
import dto.ExamCategoriesDTO;
import dto.ExamDTO;
import dto.UserDTO;
import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeParseException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import utils.AuthUtils;

@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    public static final String LOGIN_PAGE = "login.jsp";
    private static final ExamCategoriesDAO spdao = new ExamCategoriesDAO();

    public String processLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        String strUsername = request.getParameter("txtUserID");
        String strPassword = request.getParameter("txtPassword");

        if (AuthUtils.isValidLogin(strUsername, strPassword)) {
            UserDAO udao = new UserDAO();
            UserDTO user = udao.readByUsername(strUsername);
            request.getSession().setAttribute("user", user);
            url = processViewExamCategories(request, response); 
        } else {
            request.setAttribute("message", "Incorrect Username or Password!");
        }
        return url;
    }
    
    public String processLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = "login.jsp";
        HttpSession session = request.getSession();
        if (AuthUtils.isInstructor(session)) {
            session.invalidate();
        }
        return url;
    }

    public String processViewExamCategories(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<ExamCategoriesDTO> list = spdao.getAllCategories();
        request.setAttribute("list", list);
        request.setAttribute("mode", "categories");
        return "view.jsp";
    }

    public String processViewExamsByCategory(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String categoryIdStr = request.getParameter("categoryId");

        if (categoryIdStr != null && !categoryIdStr.isEmpty()) {
            try {
                int categoryId = Integer.parseInt(categoryIdStr);
                ExamDAO examDAO = new ExamDAO();
                List<ExamDTO> exams = examDAO.getExamsByCategory(categoryId);
                request.setAttribute("exams", exams);
                request.setAttribute("mode", "exams");
            } catch (NumberFormatException e) {
                request.setAttribute("message", "Invalid category ID.");
            }
        } else {
            request.setAttribute("message", "Category ID is required.");
        }

        return "view.jsp";
    }

    public String processCreateExam(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String url = "createExam.jsp";

        HttpSession session = request.getSession();
        // Bước 4: Kiểm tra quyền: chỉ Instructor được tạo kỳ thi
        if (!AuthUtils.isInstructor(session)) {
            request.setAttribute("message", "Not Authorized");
            return "login.jsp";
        }

        // Bước 1: Cung cấp danh sách Categories cho form
        ExamCategoriesDAO catDAO = new ExamCategoriesDAO();
        List<ExamCategoriesDTO> categories = catDAO.getAllCategories();
        System.out.println("Categories in controller: " + categories.size());
        for (ExamCategoriesDTO category : categories) {
            System.out.println("ID: " + category.getCategory_id() + ", Name: " + category.getCategory_name());
        }
        request.setAttribute("categories", categories);

        // Lấy dữ liệu từ form
        String examTitle = request.getParameter("examTitle");
        String subject = request.getParameter("subject");
        String categoryIdStr = request.getParameter("categoryId");
        String totalMarksStr = request.getParameter("totalMarks");
        String durationStr = request.getParameter("duration");

        // Nếu examTitle == null, nghĩa là người dùng chưa nhấn submit, chỉ hiển thị form
        if (examTitle == null) {
            return url;
        }

        // Bước 2: Validation riêng cho từng trường
        String examTitleError = null;
        String subjectError = null;
        String categoryError = null;
        String totalMarksError = null;
        String durationError = null;

        // Kiểm tra trống
        if (examTitle.trim().isEmpty()) {
            examTitleError = "Exam Title can't be empty.";
        }
        if (subject == null || subject.trim().isEmpty()) {
            subjectError = "Subject can't be empty.";
        }
        if (categoryIdStr == null || categoryIdStr.trim().isEmpty()) {
            categoryError = "Category must be selected.";
        }
        if (totalMarksStr == null || totalMarksStr.trim().isEmpty()) {
            totalMarksError = "Total Marks is required.";
        }
        if (durationStr == null || durationStr.trim().isEmpty()) {
            durationError = "Duration is required.";
        }

        // Chuyển đổi số, chỉ thực hiện nếu chưa có lỗi ở trường đó
        int categoryId = 0, totalMarks = 0, duration = 0;
        if (categoryError == null) {
            try {
                categoryId = Integer.parseInt(categoryIdStr);
            } catch (NumberFormatException e) {
                categoryError = "Invalid category format.";
            }
        }
        
        if (totalMarksError == null) {
            try {
                totalMarks = Integer.parseInt(totalMarksStr);
                if (totalMarks <= 0) {
                    totalMarksError = "Total Marks must be greater than 0.";
                }
            } catch (NumberFormatException e) {
                totalMarksError = "Invalid total marks format.";
            }
        }

        if (durationError == null) {
            try {
                duration = Integer.parseInt(durationStr);
                if (duration <= 0) {
                    durationError = "Duration must be greater than 0.";
                }
            } catch (NumberFormatException e) {
                durationError = "Invalid duration format.";
            }
        }

        // Bước 3: Nếu có lỗi, set các attribute lỗi và giữ lại dữ liệu đã nhập
        if (examTitleError != null || subjectError != null || categoryError != null
                || totalMarksError != null || durationError != null) {
            request.setAttribute("examTitleError", examTitleError);
            request.setAttribute("subjectError", subjectError);
            request.setAttribute("categoryError", categoryError);
            request.setAttribute("totalMarksError", totalMarksError);
            request.setAttribute("durationError", durationError);

            // Giữ lại dữ liệu người dùng nhập
            request.setAttribute("examTitle", examTitle);
            request.setAttribute("subject", subject);
            request.setAttribute("categoryId", categoryIdStr);
            request.setAttribute("totalMarks", totalMarksStr);
            request.setAttribute("duration", durationStr);
            return url;
        }

        // Nếu không có lỗi, tạo đối tượng ExamDTO (exam_id = 0 để DB tự tạo nếu có IDENTITY)
        ExamDTO exam = new ExamDTO(0, categoryId, totalMarks, duration, examTitle, subject);
        ExamDAO examDAO = new ExamDAO();
        boolean created = examDAO.createExam(exam);
        if (created) {
            request.setAttribute("message", "Exam created successfully!");
            url = "MainController?action=viewExamCategories";
        } else {
            request.setAttribute("message", "Exam creation failed.");
            request.setAttribute("examTitle", examTitle);
            request.setAttribute("subject", subject);
            request.setAttribute("categoryId", categoryIdStr);
            request.setAttribute("totalMarks", totalMarksStr);
            request.setAttribute("duration", durationStr);
        }
        return url;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        String url = LOGIN_PAGE;
        try {
            if (action != null) {
                switch (action) {
                    case "login":
                        url = processLogin(request, response);
                        break;
                    case "logout":
                        url = processLogout(request, response);
                        request.getSession().invalidate();
                        url = LOGIN_PAGE;
                        break;
                    case "viewExamCategories":
                        url = processViewExamCategories(request, response);
                        break;
                    case "viewExamsByCategory":
                        url = processViewExamsByCategory(request, response);
                        break;
                    case "createExam":
                        url = processCreateExam(request, response);
                        break;
                }
            }
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

// <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
