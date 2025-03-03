/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import dao.UserDAO;
import dto.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author acer
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet{
    
    private static final String LOGIN_PAGE = "login.jsp";
    
    public UserDTO getUser(String strUserName){
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readById(strUserName);
        return user;
    }
    
    public boolean isValidLogin(String strUserName, String strPassword){
        UserDTO user = getUser(strUserName);
        System.out.println(user);
        System.out.println(strPassword);
        return user != null && user.getPassword().equals(strPassword);
    }
    
    public void search(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
        String searchTerm = request.getParameter("searchTerm");
        if(searchTerm == null){
            searchTerm = "";
        }
        request.setAttribute("searchTerm", searchTerm);
    }
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url = LOGIN_PAGE;
        try{
            String action = request.getParameter("action");
            System.out.println("action: " + action);
            if(action == null){
                url = LOGIN_PAGE;
            } else {
                if(action.equals("login")){
                    String strUserName = request.getParameter("txtUserName");
                    String strPassword = request.getParameter("txtPassword");
                    if(isValidLogin(strUserName, strPassword)){
                        url = "search.jsp";
                        UserDTO user = getUser(strUserName);
                        request.getSession().setAttribute("user", user);
                        //search
                        search(request, response);
                    } else {
                        request.setAttribute("message", "Incorrect UserName or Password");
                        url = "login.jsp";
                    }
                } else if(action.equals("logout")){
                    request.getSession().invalidate();
                    url = "login.jsp";
                } else if(action.equals("search")){
                    search(request, response);
                    url = "search.jsp";
                } else if(action.equals("add")){
                    try {
                        boolean checkError = false;
                        
                        
                    } catch (Exception e){
                        
                    }
                }
            }
        
    
        }catch (Exception e) {
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
