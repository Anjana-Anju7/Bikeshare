
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
public class ReturnBike extends HttpServlet {
    static PreparedStatement pst = null;
    static PreparedStatement pst2 = null;
    static ResultSet rs = null;
    static Connection con = null;
    static int status;
    static String sql = "";
   

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
        int secretCode = (int) (Math.random() * 100001);
        int bikeId = Integer.parseInt(request.getParameter("bikeid"));
        int end_stationId = Integer.parseInt(request.getParameter("end"));
        
        //check whether details exist in rentals 
        try{
            sql= "select *from rentals where bikeId=? and userId=? and end=?";
            pst = con.prepareStatement(sql);
            pst.setInt(1, bikeId);
            pst.setInt(2, userId);
            pst.setInt(3, end_stationId);
            rs = pst.executeQuery();
            if(!rs.next()){
                session.setAttribute("error", "Invalid Bike or Station");
                response.setStatus(response.SC_FOUND); // can also be SC_Moved_Temporarily
                response.setHeader("Location", "return-bike.jsp");  
                return;
            }
        }catch(SQLException e){
           out.print(e); 
        }
        //if yes, save in return kiosk 
        try{
            String sql2 = "insert into returnkiosk (userId,bike_id,secretCode,destination) values (?,?,?,?)";
            pst2 = con.prepareStatement(sql2);
            pst2.setInt(1, userId);
            pst2.setInt(2, bikeId);
            pst2.setInt(3, secretCode);
            pst2.setInt(4, end_stationId);
            status = pst2.executeUpdate();
            if(status > -1){
                session.setAttribute("success", "Woow, Almost there, your  secret code is "+secretCode+" verify below");
                response.setStatus(response.SC_FOUND); // can also be SC_Moved_Temporarily
                response.setHeader("Location", "secret-code-return-verify.jsp");
            }
        }catch(SQLException e){
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
