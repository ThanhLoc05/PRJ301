/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utils;

import dao.UserDAO;
import dto.UserDTO;
import javax.servlet.http.HttpSession;

/**
 *
 * @author acer
 */
public class InstructorUtils {
    private static final String INSTRUCTION_ROLE = "Instruction";
    private static final String STUDENT_ROLE = "Student";
    
    public static UserDTO getUser(String strUserName){
        UserDAO udao = new UserDAO();
        UserDTO user = udao.readById(strUserName);
        return user;
    }
    
    public static boolean isValidLogin(String strUserName, String strPassword){
        UserDTO user = getUser(strUserName);
        System.out.println(user);
        return false;
    }
    
    public static boolean isLoggedIn(HttpSession session){
        return session.getAttribute("user") != null;
    }
    
    public static UserDTO getUser(HttpSession session){
        if(!isLoggedIn(session)){
            return null;
        }
        return (UserDTO) session.getAttribute("user");
    }
    
    public static boolean isInstructor(HttpSession session){
        if(!isLoggedIn(session)){
            return false;
        }
        UserDTO user = getUser(session);
        return user.getRole().equals(INSTRUCTION_ROLE);
    }
}
