
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
import model.BikeModel;

/**
 *
 * @author 
 */
public class AddBike extends HttpServlet {

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
        BikeModel m = new BikeModel();
        m.setBrand(request.getParameter("brand"));
        m.setModel(request.getParameter("model"));
        m.setDescription(request.getParameter("des"));
        m.setPrice(Float.parseFloat(request.getParameter("price")));
        HttpSession session = request.getSession();
        try{
            /* TODO output your page here. You may use following sample code. */
           sql = "insert into bike(brand,model,description,price) values(?,?,?,?)";
           pst=con.prepareStatement(sql);
           pst.setString(1, m.getBrand());
           pst.setString(2, m.getModel());
           pst.setString(3, m.getDescription());
           pst.setFloat(4, m.getPrice());
           
           status = pst.executeUpdate();
           
           if(status > -1){
               session.setAttribute("success", "New Bike Added Successfully");
                response.setStatus(response.SC_FOUND); // can also be SC_Moved_Temporarily
                response.setHeader("Location", "add-bikes.jsp");
           }else{
                session.setAttribute("error", "Error In adding a new bike!!try again");
                response.setStatus(response.SC_FOUND); // can also be SC_Moved_Temporarily
                response.setHeader("Location", "add-bikes.jsp"); 
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
