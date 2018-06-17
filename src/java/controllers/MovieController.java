/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import entities.Categories;
import entities.Movies;
import entities.Reviews;
import entities.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
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
import session.ReviewsFacade;

/**
 *
 * @author Serhii Bielik
 */
@WebServlet(name = "MovieController", urlPatterns = {"/movie", "/add-review"})
public class MovieController extends HttpServlet {

    private Users user;
    
    @EJB
    CategoriesFacade categoriesFacade;

    @EJB
    MoviesFacade moviesFacade;
    
    @EJB
    ReviewsFacade reviewsFacade;

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

        switch (userPath) {
            case "/movie":
                int movieId = Integer.parseInt(request.getQueryString());
                Movies movie = moviesFacade.find(movieId);
                
                request.setAttribute("category", movie.getCategoryId());
                request.setAttribute("movie", movie);
                request.setAttribute("user", user);
                
                userPath = "/movie";
                break;
        }
        String url = "/WEB-INF/view/movie" + userPath + ".jsp";
        
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

        switch (userPath) {
            case "/add-review":
                
                String title = request.getParameter("title");
                String review = request.getParameter("review");
                BigDecimal rating = new BigDecimal(request.getParameter("rating"));
                int movieId = Integer.parseInt(request.getParameter("movieId"));
                
                boolean isApproved = user.getIsAdmin();
                if (!isApproved) {
                    request.setAttribute("okMsg", "Your review will be published affter admin approval.");
                }
                
                Movies movie = moviesFacade.find(movieId);
                
                Reviews r = new Reviews();
                r.setTitle(title);
                r.setBody(review);
                r.setRating(rating);
                r.setUserId(user);
                r.setMovieId(movie);
                r.setIsApproved(isApproved);
                
                reviewsFacade.create(r);
                
                request.setAttribute("category", movie.getCategoryId());
                request.setAttribute("movie", movie);
                request.setAttribute("user", user);
                
                userPath = "/movie";
                break;
        }
        String url = "/WEB-INF/view/movie" + userPath + ".jsp";
        
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
