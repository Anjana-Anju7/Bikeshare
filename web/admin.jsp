
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
    //check whether admin is the one logged in
    if (session.getAttribute("userid") != null && session.getAttribute("userid") != "false") {
        if (!session.getAttribute("userLevel").equals("admin")) {
            response.setStatus(response.SC_FOUND);
            response.setHeader("Location", "login-panel.jsp");
        }
//        else{
//            response.setStatus(response.SC_FOUND);
//            response.setHeader("Location", "admin.jsp");
//        }
    }
%>
<html lang="en">
    <head>
        <title>admin area</title>
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
                <h1>Admin Panel:</h1> 
                <!--                <span style="float: right;">
                                    <form action="Logout">
                                        <button class="btn btn-primary">Logout</button>   
                                    </form>
                                </span>-->
                <br><br>
                <a href="<%=request.getContextPath()%>/add-bikes.jsp">Add Bike</a> | <a href="<%=request.getContextPath()%>/add-station.jsp">Add Station</a>
            <hr>
            <hr>               
            <h3>Registered Users </h3>
            <span style="color:red;font-size:x-large;">
                <%
                    if (session.getAttribute("error") != null && session.getAttribute("error") != "false") {
                        String s = (String) session.getAttribute("error");
                        out.println(s);
                        //on page refresh remove message
                        session.removeAttribute("error");
                    }
                %>
            </span><br>
            <span style="color:blue;font-size:x-large;">
                <%
                    if (session.getAttribute("success") != null && session.getAttribute("success") != "false") {
                        String s = (String) session.getAttribute("success");
                        out.println(s);
                        //on page refresh remove message
                        session.removeAttribute("success");
                    }
                %>
            </span><br>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Middle Name</th>
                    <th>Last Name</th>
                    <th>Date of Birth</th>
                    <th>User Type</th>
                    <th>User Status</th>
                </tr>    
                <%
                    String sql = "select a.userId,a.first_name,a.middle_name,a.last_name,a.dob,"
                            + "b.user_type,b.status from profile a, users b where a.userId = b.id;";
                    // File[] files = dir.listFiles();
                    //Random rand = new Random();
                    //File file = files[rand.nextInt(files.length)];
                    Connection con = DBConnection.ConnectDB();
                    PreparedStatement pst = con.prepareStatement(sql);
                    ResultSet rs = pst.executeQuery();
                    while (rs.next()) {
                        int userid = rs.getInt("userId");
                        String fname = rs.getString("first_name");
                        String mname = rs.getString("middle_name");
                        String lname = rs.getString("last_name");
                        String dob = rs.getString("dob");
                        String usertype = rs.getString("user_type");
                        String status = rs.getString("status");

                %>
                <form method="post" action="BlackListUser">
                    <tr>
                        <td><%=userid%></td>  
                        <td><%=fname%></td> 
                        <td><%=mname%></td> 
                        <td><%=lname%></td> 
                        <td><%=dob%></td> 
                        <td><%=usertype%></td> 
                        <td><%=status%></td>
                        <td>
                            <a href="user-status.jsp?id=<%=userid%>">Update User Status</a> 
                        </td>
                        
                    </tr>
                </form>
                <% } %>
            </table>
            <br><br>
            <h3>User Requests:</h3>
            <table border="1">
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th>Message</th>
                    <th>Date Sent</th>
                </tr>    
                <%
                    String sql1 = "select *from user_requests order by id desc";
                    // File[] files = dir.listFiles();
                    //Random rand = new Random();
                    //File file = files[rand.nextInt(files.length)];
                    Connection con1 = DBConnection.ConnectDB();
                    PreparedStatement pst1 = con.prepareStatement(sql1);
                    ResultSet rs1 = pst1.executeQuery();
                    while (rs1.next()) {
                        int id = rs1.getInt("id");
                        String name = rs1.getString("name");
                        String mail = rs1.getString("email");
                        String phn = rs1.getString("phone_number");
                        String msg = rs1.getString("message");
                        String date = rs1.getString("date");

                %>
                <tr>
                    <td><%=id%></td>  
                    <td><%=name%></td> 
                    <td><%=mail%></td> 
                    <td><%=phn%></td> 
                    <td><%=msg%></td> 
                    <td><%=date%></td> 
                </tr>
                <% } %>
            </table>
            <br><br>
            <h3>Stations Analysis:</h3>
            <table border="1">
                <tr>
                    <th>Station Id</th>
                    <th>Station Name</th>
                    <th>Number of times Booked</th>
                    <th>Total Revenue</th>   
                </tr>   

                <%
                    String sql3 = "select a.id as station_id, a.stationName, count(b.stationId) "
                            + " as Number_of_times_booked, sum(b.amount) as Total_revenue "
                            + " from stations a,transactions b where a.id=b.stationId group by b.stationId;";
                    // File[] files = dir.listFiles();
                    //Random rand = new Random();
                    //File file = files[rand.nextInt(files.length)];
                    Connection con3 = DBConnection.ConnectDB();
                    PreparedStatement pst3 = con.prepareStatement(sql3);
                    ResultSet rs3 = pst3.executeQuery();
                    while (rs3.next()) {
                        int id = rs3.getInt("station_id");
                        String name = rs3.getString("stationName");
                        String num = rs3.getString("Number_of_times_booked");
                        String revenue = rs3.getString("Total_revenue");

                %>
                <tr>
                    <td><%=id%></td>  
                    <td><%=name%></td> 
                    <td><%=num%></td> 
                    <td><%=revenue%></td>
                </tr>
                <% }%>
            </table>
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