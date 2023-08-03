

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
      //check whether admin is the one logged in
    if(session.getAttribute("userid") != null && session.getAttribute("userid") != "false"){
        if(!session.getAttribute("userLevel").equals("admin")){
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
        <title>Add Bikes</title>
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
                        <h1 class="request_text">Add New Bike</h1>
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
                    <form action="AddBike" method="post">
                        <div class="form-group">
                            <label>Bike Brand:</label><br>
                            <input type="text" class="email-bt" placeholder="Bike Brand" name="brand" required="true">
                        </div>
                        <div class="form-group">
                            <label>Bike Model:</label><br>
                            <input type="text" class="email-bt" placeholder="Bike Model" name="model" required="true">
                        </div>
                        <div class="form-group">
                            <label>Description:</label><br>
                            <input type="text" class="email-bt" placeholder="Bike description" name="des" required="true">
                        </div>
                        <div class="form-group">
                            <label>Price:</label><br>
                            <input type="text" class="email-bt" placeholder="Bike Price" name="price" required="true">
                        </div>
                        
                        <div class="form-group">
                            <button class="btn btn-primary">Submit</button><br>
                            <label><a href="admin.jsp" style="color:white">Go Back</a></label>
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