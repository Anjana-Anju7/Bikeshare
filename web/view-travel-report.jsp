

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@page import="main.DBConnection"%>
<!DOCTYPE html>
<%
    //check if session is set, i.e user is logged in
//    HttpServletRequest request;
//    HttpServletResponse response;
//    HttpSession session = request.getSession();
    if (session.getAttribute("userid") == null) {
        response.setStatus(response.SC_FOUND);
        response.setHeader("Location", "login-panel.jsp");
        return;
    }
    
%>
<html lang="en">
    <head>
        <title>travel report</title>
        <jsp:include page="include/css.jsp"/>
        <jsp:include page="include/meta.jsp"/>
        <!--Start of Tawk.to Script-->
        <script type="text/javascript">
            var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
            (function () {
                var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
                s1.async = true;
                s1.src = 'https://embed.tawk.to/637ae21edaff0e1306d87bbd/1gic06jcb';
                s1.charset = 'UTF-8';
                s1.setAttribute('crossorigin', '*');
                s0.parentNode.insertBefore(s1, s0);
            })();
        </script>
        <!--End of Tawk.to Script-->
        <style>
            label{
                color: white;
            }
            a{
                color:blue;
            }
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
            }
            body{
                overflow: auto;
            }
        </style>
    </head>
    <body>
        <!-- header section start -->
        <div class="header_section header_bg">
            <jsp:include page="include/nav.jsp"></jsp:include>
            </div>
            <!-- header section end -->
            <!-- contact section start -->

            <div class="container">
                <h1>Travel Transactions Report:</h1>
                 
            <table border="1">
                <tr>
                    <th>From Station Id</th>
                    <th>Amount Paid</th>
                    <th>Transaction Date</th>
                    
                </tr>    
                <%
                    String user = request.getParameter("uid");
                    String sql1 = "select stationId as from_station_Id,amount as amountPaid,transaction_date from transactions where userId=?";
                    // File[] files = dir.listFiles();
                    //Random rand = new Random();
                    //File file = files[rand.nextInt(files.length)];
                    Connection con = DBConnection.ConnectDB();
                    PreparedStatement pst1 = con.prepareStatement(sql1);
                    pst1.setString(1, user);
                    ResultSet rs1 = pst1.executeQuery();
                    while (rs1.next()) {
                        int id = rs1.getInt("from_station_Id");
                        String amount = rs1.getString("amountPaid");
                        String date = rs1.getString("transaction_date");
                        

                %>
                <tr>
                    <td><%=id%></td>  
                    <td><%=amount%></td> 
                    <td><%=date%></td> 
                </tr>
                <% } %>
            </table>
            <br>
            
            <br><br>
            <button class="btn btn-primary" onclick="window.print()">Print</button>

        </div>

        <br><br><br>
        <!-- contact section end -->
        <!-- footer section start -->
       
            <!-- footer section end -->

            <!-- copyright section start -->
        
            <!-- copyright section end -->  

            <!-- Javascript files-->
        <jsp:include page="include/js.jsp"></jsp:include>
    </body>
</html>