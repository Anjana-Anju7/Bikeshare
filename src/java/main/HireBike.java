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
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.tomcat.jni.SSLContext;

/**
 *
 * @author
 */
public class HireBike extends HttpServlet {

    static PreparedStatement pst = null;
    static PreparedStatement pst2 = null;
    static PreparedStatement pst3 = null;
    static ResultSet rs = null;
    static Connection con = null;
    static int status;
    static int status1;
    static int status2;
    static String sql = "";
    static String sql2 = "";
    static String sql3 = "";

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
        //set variables 
        //kiosk variables
        int userId = Integer.parseInt(request.getParameter("userid"));
        int secretCode = (int) (Math.random() *100001);
        LocalDateTime myDateObj = LocalDateTime.now();
        DateTimeFormatter myFormatObj = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss"); 
        String generated_date = myDateObj.format(myFormatObj);
        
        //transactions 
        int start_stationId = Integer.parseInt(request.getParameter("start"));
        float amount = 0;
        String plan = request.getParameter("plan");
        LocalDateTime myDateObj2 = LocalDateTime.now();
        DateTimeFormatter myFormatObj2 = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss"); 
        String trans_date = myDateObj.format(myFormatObj2);
        
        if(plan.equals("yearly")){
            amount = 90;
        }
        else if(plan.equals("daily")){
            amount = 2;
        }
        //rentals
        int bikeId = Integer.parseInt(request.getParameter("id"));
        int end_stationId = Integer.parseInt(request.getParameter("end"));
        
        try{
          //insert into rentals
          sql = "insert into rentals(userId,bikeId,start,end,subscription_plan)values(?,?,?,?,?)";
          pst = con.prepareStatement(sql);
          pst.setInt(1, userId);
          pst.setInt(2, bikeId);
          pst.setInt(3, start_stationId);
          pst.setInt(4, end_stationId);
          pst.setString(5, plan);
          status = pst.executeUpdate();
          
          //insert into transactions
          sql2 = "insert into transactions(userId,stationId,amount,transaction_date)values(?,?,?,?)";
          pst2 = con.prepareStatement(sql2);
          pst2.setInt(1, userId);
          pst2.setInt(2, start_stationId);
          pst2.setFloat(3, amount);
          pst2.setString(4, trans_date);
          status1 = pst2.executeUpdate();
          
          //insert into kiosk
          sql3 = "insert into kiosk(userId,secret_code,generated_date)values(?,?,?)";
          pst3 = con.prepareStatement(sql3);
          pst3.setInt(1, userId);
          pst3.setInt(2, secretCode);
          pst3.setString(3, generated_date);
          status2 = pst3.executeUpdate();
          
          //check if queries are successful
          if(status > -1 && status1 > -1 && status2 > -1){
                session.setAttribute("success", "Bike Hire Successfully, your secret code is:"+secretCode+" dont share it");
                response.setStatus(response.SC_FOUND); // can also be SC_Moved_Temporarily
                response.setHeader("Location", "account-details.jsp");
          }
          
        }catch(Exception e){
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
