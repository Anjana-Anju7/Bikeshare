
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
 * @author
 */
public class VerifyReturnCode extends HttpServlet {

    static PreparedStatement pst = null;
    static PreparedStatement pst2 = null;
    static PreparedStatement pst3 = null;
    static PreparedStatement pst4 = null;
    static PreparedStatement pst5 = null;
    static ResultSet rs = null;
    static ResultSet rs1 = null;
    static ResultSet rs2 = null;
    static Connection con = null;

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
        String secretCode = request.getParameter("code");
        String userid = request.getParameter("userid");
        //check if code exists
        try {
            String sql = "select *from returnkiosk where userId=? and secretCode=?";
            pst = con.prepareStatement(sql);
            pst.setString(1, userid);
            pst.setString(2, secretCode);
            rs = pst.executeQuery();
            if (!rs.next()){
                session.setAttribute("error", "Invalid Code, Bike Not returned, try again");
                response.setStatus(response.SC_FOUND); // can also be SC_Moved_Temporarily
                response.setHeader("Location", "secret-code-return-verify.jsp");
                return;
            }
            else{
                String sql4 = "select id from stations where id=?";
                pst4 = con.prepareStatement(sql4);
                pst4.setString(1, rs.getString("destination"));
                rs2= pst4.executeQuery();
                //if record exists
                if(rs2.next()){
                   int start_id = rs2.getInt("id");
                   //reduce number of bikes in stations for the particular station
                   String sql5 = "update stations set number_of_bikes = number_of_bikes+1 where id=?";
                   pst5 = con.prepareStatement(sql5);
                   pst5.setInt(1, start_id);
                   pst5.executeUpdate();
                }
                session.setAttribute("success", "Code Verified!! Bike returned Successfully");
                response.setStatus(response.SC_FOUND); // can also be SC_Moved_Temporarily
                response.setHeader("Location", "secret-code-return-verify.jsp"); 
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
