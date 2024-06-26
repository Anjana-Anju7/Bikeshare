

<%@page import="main.DBConnection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<%
    //check if session is set, i.e user is logged in
    if (session.getAttribute("userid") == null) {
        response.setStatus(response.SC_FOUND);
        response.setHeader("Location", "login-panel.jsp");
        return;
    }
%>
<html lang="en">
    <head>
        <title>Return Bike</title>
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
                        <h1 class="request_text">Return Bike</h1>
                        
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
               
                    <form action="ReturnBike" method="post">

                        <div class="form-group">
                            <label>Select Destination Station:</label><br>

                            <select class="email-bt" name="end" required="true">
                                <option value="">select end point</option>
                                <%
                                    String u = (String)session.getAttribute("userid");
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
                            <label>Enter Bike Id:</label>
                            <br>
                            <input class="email-bt" name="bikeid" type="text" required="true" />
                        </div>
                        <div class="form-group">
                            <input name="userid" type="hidden" readonly="true" value="<%=u%>"/> 
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