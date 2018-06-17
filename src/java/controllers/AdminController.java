/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Movies;
import entities.Oders;
import entities.Reviews;
import entities.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import javax.ejb.EJB;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import session.CategoriesFacade;
import session.MoviesFacade;
import session.OdersFacade;
import session.OrderStatusesFacade;
import session.ReviewsFacade;

/**
 *
 * @author Serhii Bielik
 */
@WebServlet(name = "AdminController", 
        urlPatterns = {"/reviews", "/delete-review", "/delete-order", 
            "/approve-review", "/orders", "/order", "/status-order"})
public class AdminController extends HttpServlet {

    private Users user;
    
    @EJB
    CategoriesFacade categoriesFacade;
    
    @EJB
    ReviewsFacade reviewsFacade;
    
    @EJB
    OdersFacade ordersFacade;
    
    @EJB
    OrderStatusesFacade orderStatusesFacade;

    @Override
    public void init(ServletConfig servletConfig) throws ServletException {

        super.init(servletConfig);
        
        getServletContext().setAttribute("categories", categoriesFacade.findAll());
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
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

        if (!user.getIsAdmin()) {
            request.setAttribute("errorMsg", "You do not have rights for this.");
            response.sendRedirect("/home");
            return;
        }
        
        /*if (userPath.contains("review")) {
            request.setAttribute("reviews", reviewsFacade.findAll());
        } else if (userPath.contains("order")) {
            request.setAttribute("orders", ordersFacade.findAll());
        }*/
        
        int reviewId;
        Reviews r;
        
        switch (userPath) {
            case "/reviews":             
                request.setAttribute("reviews", reviewsFacade.findAll());
                userPath = "/reviews";
                break;
                
            case "/approve-review":                
                reviewId = Integer.parseInt(request.getQueryString());                
                r = reviewsFacade.find(reviewId);                
                if (r != null) {
                    r.setIsApproved(true);
                    reviewsFacade.edit(r);
                    request.setAttribute("okMsg", "Review #" + reviewId + " has been approved.");
                }      
                request.setAttribute("reviews", reviewsFacade.findAll());
                userPath = "/reviews";
                break;
                
            case "/delete-review":
                reviewId = Integer.parseInt(request.getQueryString());                
                r = reviewsFacade.find(reviewId);
                if (r != null) {
                    reviewsFacade.remove(r);
                    request.setAttribute("okMsg", "Review #" + reviewId + " has been removed.");
                }      
                request.setAttribute("reviews", reviewsFacade.findAll());
                userPath = "/reviews";
                break;
            case "/orders":
                request.setAttribute("orders", ordersFacade.findAll());
                userPath = "/orders";
                break;
            case "/order":
                request.setAttribute("order", ordersFacade.find(Integer.parseInt(request.getQueryString())));
                userPath = "/order";
                break;
            case "/delete-order":
                reviewId = Integer.parseInt(request.getQueryString());                
                Oders o = ordersFacade.find(reviewId);
                if (o != null) {
                    ordersFacade.remove(o);
                    request.setAttribute("okMsg", "Order #" + reviewId + " has been removed.");
                }      
                request.setAttribute("orders", ordersFacade.findAll());
                userPath = "/orders";
                break;
        }
        String url = "/WEB-INF/view/admin" + userPath + ".jsp";
        
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

        if (!user.getIsAdmin()) {
            request.setAttribute("errorMsg", "You do not have rights for this.");
            response.sendRedirect("/home");
            return;
        }

        switch (userPath) {
            case "/status-order":

                int orderId = Integer.parseInt(request.getParameter("orderId"));
                int statusId = Integer.parseInt(request.getParameter("statusId"));                
              
                Oders o = ordersFacade.find(orderId);                
                o.setStatusId(orderStatusesFacade.find(statusId));                
                ordersFacade.edit(o);
                
                response.sendRedirect("order?"+orderId);
        }
        String url = "/WEB-INF/view/movie" + userPath + ".jsp";
        
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
