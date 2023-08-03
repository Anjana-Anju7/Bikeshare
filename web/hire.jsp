

<%@page import="main.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<%
    //check if session is set, i.e user is logged in
    if (session.getAttribute("userid")==null){
      response.setStatus(response.SC_FOUND);
      response.setHeader("Location", "login-panel.jsp");
      return;
    }
%>
<html lang="en">
    <head>
        <title>Hire Bike</title>
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
        </style>
    </head>
    <body>
        <!-- header section start -->
        <div class="header_section header_bg">
            <jsp:include page="include/nav.jsp"></jsp:include>
            </div>
            <!-- header section end -->
            <!-- contact section start -->
            <div class="contact_section layout_padding">
                <div class="container">
                    <div class="contact_main">
                        <h1 class="request_text">Hire Bicycle</h1>
                        <h4><a href="return-bike.jsp">Return Bike</a></h4>
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
                    <span style="color:white;font-size:x-large;">
                        <%
                            if (session.getAttribute("success") != null && session.getAttribute("success") != "false") {
                                String s = (String) session.getAttribute("success");
                                out.println(s);
                                //on page refresh remove message
                                session.removeAttribute("success");
                            }
                        %>
                    </span><br>
                    <%
                        int bid = Integer.parseInt(request.getParameter("id"));
                        //get this bicyles details
                        String sql = "select *from bike where id=?";
                        Connection con = DBConnection.ConnectDB();
                        PreparedStatement pst = con.prepareStatement(sql);
                        String u = (String)session.getAttribute("userid");
                        pst.setInt(1, bid);
                        ResultSet rs = pst.executeQuery();
                        if (rs.next()) {
                            String brand = rs.getString("brand");
                            String model = rs.getString("model");
                            String description = rs.getString("description");
                            String status = rs.getString("status");
                            float price = rs.getFloat("price");
                    %>
                    <div style="color:white;">
                        <em>Brand:<%=brand%></em><br>
                        <em>Model:<%=model%></em><br>
                        <em>Status:<%=status%></em><br>
                        <strong>User ID:<%=u%></strong>
<!--                        <em>Price: $ <%//=price%></em><br>-->
                    </div>
                    <% } %>
                    <form action="HireBike" method="post">

                        <div class="form-group">
                            <label>Select Starting Station:</label><br>

                            <select class="email-bt" name="start" required="true">
                                <option value="">select start point</option>
                                <%
                                    String sql1 = "select *from stations";
                                    Connection con1 = DBConnection.ConnectDB();
                                    PreparedStatement pst1 = con.prepareStatement(sql1);
                                    ResultSet rs1 = pst1.executeQuery();
                                    while (rs1.next()) {

                                        int sid = rs1.getInt("id");
                                        String name = rs1.getString("stationName");

                                %>
                                <option value="<%=sid%>"><%=name%></option>
                                <%}%>
                            </select>
                        </div>
                        <br><br><br>
                        <div class="form-group">
                            <label>Select Ending/Destination Station:</label><br>
                            

                            <select class="email-bt" name="end" required="true">
                                <option value="">select end point</option>
                                <%
                                    String sql2 = "select *from stations";
                                    Connection con2 = DBConnection.ConnectDB();
                                    PreparedStatement pst2 = con2.prepareStatement(sql2);
                                    ResultSet rs2 = pst2.executeQuery();
                                    while (rs2.next()) {
                                        int sid2 = rs2.getInt("id");
                                        String name2 = rs2.getString("stationName");

                                %>
                                <option value="<%=sid2%>"><%=name2%></option>
                                <%}%>
                            </select>
                        </div>
                         <div class="form-group">
                            <label>Subscription Plan:</label>
                            <br>
                            <span style="color:white;"><em><strong>NB: The system will auto charge your credit card.year plan:90 Euros, 24 hrs: 2 Euros </strong></em></span>
                            <select name="plan" required="true" class="email-bt" >
                                <option value="">select your plan</option> 
                                <option value="yearly">yearly 90 pounds</option> 
                                <option value="daily">Daily 2 Euros</option>
                            </select>
                        </div>   
                        <div class="form-group">
                            <input name="userid" type="hidden" readonly="true" value="<%=u%>"/> 
                            <br>
                            <input name="id" type="hidden" readonly="true" value="<%=bid%>"/>
                        </div>
                        <br><br>
                        
                        <div class="form-group">
                            <input type="submit" value="Submit" class="btn btn-primary">
                            <br>
                            <label><a href="bikes.jsp" style="color:white">Go Back</a></label>
                        </div>
                    </form>

                </div>
            </div>
        </div>
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