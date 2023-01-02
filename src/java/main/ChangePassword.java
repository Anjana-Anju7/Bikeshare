/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Steven
 */
public class ChangePassword extends HttpServlet {

    static PreparedStatement pst = null;
    static PreparedStatement pst2 = null;
    static ResultSet rs = null;
    static Connection con = null;
    static int status;

    @Override
    public void init() throws ServletException {
        try {
            con = DBConnection.ConnectDB();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CreateAccount.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CreateAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        String username = request.getParameter("uname");
        String pass = request.getParameter("newpass");
        //check if username exists 
        try {
            String sql = "select *from users where username=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, username);
            rs = pst.executeQuery();
            if (!rs.next()) {
                session.setAttribute("error", "User Not Found, try again");
                response.setStatus(response.SC_FOUND); // can also be SC_Moved_Temporarily
                response.setHeader("Location", "change-password.jsp");
                return;
            }

        } catch (SQLException e) {
            out.print(e);
        }
        //if exists , update 
        try {
            String sql2 = "update users set password=? where username=?";
            pst2 = con.prepareStatement(sql2);
            pst2.setString(1, pass);
            pst2.setString(2, username);
            status = pst2.executeUpdate();
            if (status > -1) {
                session.setAttribute("success", "Password Changed Successfully,Use it for login");
                response.setStatus(response.SC_FOUND); // can also be SC_Moved_Temporarily
                response.setHeader("Location", "change-password.jsp");
            }
        } catch (SQLException e) {
            out.print(e);
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
