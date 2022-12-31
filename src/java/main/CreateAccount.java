/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package main;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;
import model.UserModel;

/**
 *
 * @author
 */
public class CreateAccount extends HttpServlet {

    static PreparedStatement pst = null;
    static PreparedStatement pst2 = null;
    static ResultSet rs = null;
    static Connection con = null;
    static boolean status = false;
    static String sql = "";
    static String sql2 = "";

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            //set the form parameters using usermodel
            //UserController c = new UserController();
            UserModel m = new UserModel();
            int userSaved;
            int profileSaved;

            m.setId(Integer.parseInt(request.getParameter("id")));
            m.setFirstName(request.getParameter("fname"));
            m.setMiddleName(request.getParameter("mname"));
            m.setLastName(request.getParameter("lname"));
            m.setDob(request.getParameter("dob"));
            m.setUsername(request.getParameter("uname"));
            m.setPassword(request.getParameter("pass"));

            HttpSession session = request.getSession();

            sql = "insert into users (id,username, password) values (?,?,?)";
            pst = con.prepareStatement(sql);
            pst.setInt(1, m.getId());
            pst.setString(2, m.getUsername());
            pst.setString(3, m.getPassword());
            userSaved = pst.executeUpdate();

            sql2 = "insert into profile (userId,first_name, middle_name,last_name,dob) values (?,?,?,?,?)";
            pst2 = con.prepareStatement(sql2);
            pst2.setInt(1, m.getId());
            pst2.setString(2, m.getFirstName());
            pst2.setString(3, m.getMiddleName());
            pst2.setString(4, m.getLastName());
            pst2.setString(5, m.getDob());
            profileSaved = pst2.executeUpdate();

            //check if both successful
            if (userSaved > -1 && profileSaved > -1) {
                //set session success
                session.setAttribute("success", "Registration Successful,Login now");
                response.setStatus(response.SC_FOUND); // can also be SC_Moved_Temporarily
                response.setHeader("Location", "Login.jsp");
            } else {
                //set session error
                session.setAttribute("error", "Error In Registering");
                response.setStatus(response.SC_FOUND); // can also be SC_Moved_Temporarily
                response.setHeader("Location", "create-account.jsp");
                
            }

        } catch (Exception e) {
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CreateAccount.class.getName()).log(Level.SEVERE, null, ex);
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(CreateAccount.class.getName()).log(Level.SEVERE, null, ex);
        }
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
