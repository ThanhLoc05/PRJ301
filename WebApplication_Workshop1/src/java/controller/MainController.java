/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.StartupProjectsDAO;
import dao.UserDAO;
import dto.StartupProjectsDTO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utils.FounderUtils;
import javax.servlet.http.HttpSession;

/**
 *
 * @author acer
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    private StartupProjectsDAO sp = new StartupProjectsDAO();

    private static final String LOGIN_PAGE = "login.jsp";
    

    private String processLogin(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;

        String strUserName = request.getParameter("txtUserName");
        String strPassword = request.getParameter("txtPassword");
        if (FounderUtils.isValidLogin(strUserName, strPassword)) {
            url = "search.jsp";
            UserDTO user = FounderUtils.getUser(strUserName);
            request.getSession().setAttribute("user", user);

            processSearch(request, response);
        } else {
            request.setAttribute("message", "Incorrect UserName or Password");
            url = "login.jsp";
        }
        return url;
    }

    private String processLogout(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;

        HttpSession session = request.getSession();
        if (FounderUtils.isLoggedIn(session)) {
            request.getSession().invalidate();
            url = "login.jsp";
        }
        return url;
    }

    private String processSearch(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (FounderUtils.isLoggedIn(session)) {
            String searchTerm = request.getParameter("searchTerm");
            if (searchTerm == null) {
                searchTerm = "";
            }
            List<StartupProjectsDTO> projects = sp.searchByName(searchTerm);
            request.setAttribute("projects", projects);
            request.setAttribute("searchTerm", searchTerm);
        }
        return url;
    }

    public String processAdd(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String url = LOGIN_PAGE;
        HttpSession session = request.getSession();
        if (FounderUtils.isAdmin(session)) {
            try {
                boolean checkError = false;
                String project_id = request.getParameter("txtProject_id");
                String project_name = request.getParameter("txtProject_name");
                String Description = request.getParameter("txtDescription");
                String Status = request.getParameter("txtStatus");
                String estimate_lauch = request.getParameter("txtEstimate_lauch");
                Date estimate_launch = null;
                SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                dateFormat.setLenient(false);

                if(project_id == null || project_id.trim().isEmpty()){
                    checkError = true;
                    request.setAttribute("txtProject_id", "Project ID cannot be empty!");
                }
                
                if(project_name == null || project_name.trim().isEmpty()){
                    checkError = true;
                    request.setAttribute("txtProject_name", "Project Name cannot be empty!");
                }
                
                if(Description == null || Description.trim().isEmpty()){
                    checkError = true;
                    request.setAttribute("txtDescription", "Description cannot be empty!");
                }
                
                if(Status == null || Status.trim().isEmpty()){
                    checkError = true;
                    request.setAttribute("txtStatus", "Status cannot be empty!");
                }
                
                if(estimate_launch == null ){
                    checkError = true;
                    request.setAttribute("txtEstimate_launch", "Estimate Launch cannot be empty!");
                }

                StartupProjectsDTO project = new StartupProjectsDTO(project_id, project_name, Description, Status, estimate_launch);

                if (!checkError) {
                    sp.create(project);

                    url = processSearch(request, response);
                } else {
                    url = "projectForm.jsp";
                    request.setAttribute("project", project);
                }
            } catch (Exception e) {
            }
        }
        return url;
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try {
            String action = request.getParameter("action");
            System.out.println("action: " + action);
            if (action == null) {
                url = LOGIN_PAGE;
            } else {
                if (action.equals("login")) {
                    url = processLogin(request, response);
                } else if (action.equals("logout")) {
                    url = processLogout(request, response);
                } else if (action.equals("search")) {
                    url = processSearch(request, response);
                } else if (action.equals("add")) {
                    url = processAdd(request, response);
                }
            }

        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
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
