<%-- 
    Document   : contact
    Created on : Nov 16, 2022, 1:40:30 PM
    Author     : softnut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@page import="main.DBConnection"%>
<!DOCTYPE html>
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
                <span style="float: right;">
                    <form action="Logout">
                        <button class="btn btn-primary">Logout</button>   
                    </form>
                </span>
                <br><br>
                <a href="<%=request.getContextPath()%>/add-bikes.jsp">Add Bike</a> | <a href="<%=request.getContextPath()%>/add-station.jsp">Add Station</a>
            <hr>
            <hr>               
            <h3>Registered Users </h3>
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
                <tr>
                    <td><%=userid%></td>  
                    <td><%=fname%></td> 
                    <td><%=mname%></td> 
                    <td><%=lname%></td> 
                    <td><%=dob%></td> 
                    <td><%=usertype%></td> 
                    <td><%=status%></td>
                </tr>
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
        </div>

        <br><br><br>
        <!-- contact section end -->
        <!-- footer section start -->
        <jsp:include page="include/footer.jsp"></jsp:include>
            <!-- footer section end -->

            <!-- copyright section start -->
        <jsp:include page="include/copyright.jsp"></jsp:include>
            <!-- copyright section end -->  

            <!-- Javascript files-->
        <jsp:include page="include/js.jsp"></jsp:include>
    </body>
</html>