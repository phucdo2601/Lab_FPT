/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package phucdn.controller.shoppingCart;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import phucdn.dto.object.CartObj;
import phucdn.dto.object.ItemDTO;

/**
 *
 * @author ASUS
 */
@WebServlet(name = "AddCartController", urlPatterns = {"/AddCartController"})
public class AddCartController extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        CartObj shoppingCart = (CartObj) session.getAttribute("Cart");
        String productID = request.getParameter("txtProductID");
        String productName = request.getParameter("txtProductName");
        String image = request.getParameter("txtImage");
        double price = Double.parseDouble(request.getParameter("txtPrice"));
        String userChoose = request.getParameter("txtUsernameLogin");
        
        ItemDTO dto = new ItemDTO(productID, productName, image, price);
        try {
            if (shoppingCart == null) {
                if (userChoose != null) {
                    shoppingCart = new CartObj(userChoose);
                } else {
                    shoppingCart = new CartObj();
                }
            }

            dto.setQuantity(1);
            shoppingCart.addToCart(dto);
            session.setAttribute("Cart", shoppingCart);
            
        } catch (Exception e) {
            log("Error at AddCartController: " + e.getMessage());
            e.printStackTrace();
        } finally{
            response.sendRedirect("MainController");
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
