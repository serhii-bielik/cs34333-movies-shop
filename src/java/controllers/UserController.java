/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Users;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import session.UsersFacade;

/**
 *
 * @author WD
 */
@WebServlet(name = "UserController", 
        loadOnStartup = 1,
        urlPatterns = { "/login",
                        "/logout",
                        "/signup"})
public class UserController extends HttpServlet {
    
    private Users user;
    
    @EJB
    UsersFacade usersFacade;    
    
    @Override
    public void init(ServletConfig servletConfig) throws ServletException {

        super.init(servletConfig);

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
        
        String userPath = request.getServletPath();
        HttpSession session = request.getSession();
        user = (Users) session.getAttribute("user");
        
        switch (userPath) {
            case "/login":                
                if (user != null) {
                    response.sendRedirect("/");
                    return;               
                } else {
                    userPath = "/login";
                }            
                break;
                
            case "/logout":
                if (user == null) {
                    response.sendRedirect("/");
                    return;               
                }
                session.removeAttribute("isAdmin");
                session.removeAttribute("username");
                session.removeAttribute("user");
                userPath = "/login";
                break;
                
            case "/signup":
                if (user != null) {
                    response.sendRedirect("/");
                    return;               
                } else {
                    userPath = "/signup";
                } 
                break;
        }
        
        String url = "/WEB-INF/view/user" + userPath + ".jsp";
        
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
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
        String userPath = request.getServletPath();
        
        HttpSession session = request.getSession();
        user = (Users) session.getAttribute("user");
        if (user != null) {
            response.sendRedirect("/");
            return;                
        }
        
        String email, pwd, username;
        
        switch (userPath) 
        {
            case "/login":      
                email = request.getParameter("email");
                pwd = request.getParameter("password");
                
                user = usersFacade.login(email, pwd);
                
                if (user != null){
                    if (user.getIsAdmin())
                         session.setAttribute("isAdmin", true);
                    session.setAttribute("username", user.getUsername());
                    session.setAttribute("user", user);
                    response.sendRedirect("/");
                    return;
                } else {
                    request.setAttribute("errorMsg","Wrong email or password");
                    userPath = "/login";
                }             
                break;
                
            case "/signup":                
                email = request.getParameter("email");
                username = request.getParameter("username");
                pwd = request.getParameter("password");
                
                if(!usersFacade.isExists(email, username)) {
                    Users u = usersFacade.prepareUser(email, username, pwd);
                    if (u != null) {
                        usersFacade.create(u);
                        request.setAttribute("okMsg","Account has been created, now you can login.");
                    }                    
                } else {
                    request.setAttribute("errorMsg","Email or username is not unique");
                }
                
                userPath = "/login";
                break;
        }
        
        String url = "/WEB-INF/view/user" + userPath + ".jsp";
        
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
