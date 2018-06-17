/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controllers;

import cart.ShoppingCart;
import cart.ShoppingCartItem;
import entities.Movies;
import entities.Oders;
import entities.OrderItems;
import entities.Reviews;
import entities.Users;
import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
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
import session.OrderItemsFacade;
import session.OrderStatusesFacade;
import session.ReviewsFacade;

/**
 *
 * @author Serhii Bielik
 */
@WebServlet(name = "CartController", loadOnStartup = 1,
            urlPatterns = {"/add-to-cart",
                           "/view-cart",
                           "/update-cart",
                           "/checkout"})
public class CartController extends HttpServlet {
    
    private String surcharge;

    private Users user;
    
    @EJB
    CategoriesFacade categoriesFacade;

    @EJB
    MoviesFacade moviesFacade;
    
    @EJB
    OdersFacade ordersFacade;
    
    @EJB
    OrderStatusesFacade orderStatusesFacade;
    
    @EJB
    OrderItemsFacade orderItemsFacade;
    
    @EJB
    ReviewsFacade reviewsFacade;

    @Override
    public void init(ServletConfig servletConfig) throws ServletException {

        super.init(servletConfig);
        
        surcharge = "0";
        
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
            case "/view-cart":
                String clear = request.getParameter("clear");

                if ((clear != null) && clear.equals("true")) {

                    ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
                    cart.clear();
                }

                userPath = "/cart";
                /*int movieId = Integer.parseInt(request.getQueryString());
                Movies movie = moviesFacade.find(movieId);
                
                request.setAttribute("category", movie.getCategoryId());
                request.setAttribute("movie", movie);
                request.setAttribute("user", user);
                
                userPath = "/movie";*/
                break;
            case "/checkout":
                if (user == null) {
                    response.sendRedirect("/login");
                    return;
                }
                ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
                cart.calculateTotal(surcharge);
                
                Oders o = new Oders();
                o.setPrice(new BigDecimal(cart.getTotal()));  
                o.setStatusId(orderStatusesFacade.find(1));
                o.setOrderDate(new Date());
                ordersFacade.create(o);
                               
                for (ShoppingCartItem item : cart.getItems()) {
                    OrderItems oi = new OrderItems();
                    oi.setMovieId(item.getProduct());
                    oi.setQuantity(item.getQuantity());
                    oi.setOrderId(o);
                    orderItemsFacade.create(oi);
                }               
                request.setAttribute("orderId", o.getId());                
                userPath = "/confirmation";
                break;
        }
        String url = "/WEB-INF/view/cart" + userPath + ".jsp";
        
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
        ShoppingCart cart = (ShoppingCart) session.getAttribute("cart");
        String productId;
        
        switch (userPath) {
            case "/add-to-cart":
                if (cart == null) {
                    cart = new ShoppingCart();
                    session.setAttribute("cart", cart);
                }
                productId = request.getParameter("movieId");

                if (!productId.isEmpty()) {

                    Movies product = moviesFacade.find(Integer.parseInt(productId));
                    cart.addItem(product);
                }
                
                response.sendRedirect("/movie?" + Integer.parseInt(productId));
                return;
            case "/update-cart":
                productId = request.getParameter("productId");
                String quantity = request.getParameter("quantity");

                Movies product = moviesFacade.find(Integer.parseInt(productId));
                cart.update(product, quantity);

                userPath = "/cart";
                break;
        }
        String url = "/WEB-INF/view/cart" + userPath + ".jsp";
        
        try {
            request.getRequestDispatcher(url).forward(request, response);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }

}
