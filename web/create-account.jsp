<%-- 
    Document   : contact
    Created on : Nov 16, 2022, 1:40:30 PM
    Author     : softnut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Create account</title>
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
                        <h1 class="request_text">Create Your Account</h1>
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
                    <form action="CreateAccount" method="post">
                        <div class="form-group">
                            <label>ID Number:</label><br>
                            <input type="number" class="email-bt" placeholder="ID Number" name="id" required="true">
                        </div>
                        <div class="form-group">
                            <label>First Name:</label><br>
                            <input type="text" class="email-bt" placeholder="First Name" name="fname" required="true">
                        </div>
                        <div class="form-group">
                            <label>Middle Name:</label><br>
                            <input type="text" class="email-bt" placeholder="Middle Name" name="mname" required="true">
                        </div>
                        <div class="form-group">
                            <label>Last Name:</label><br>
                            <input type="text" class="email-bt" placeholder="Last Name" name="lname" required="true">
                        </div>
                        <div class="form-group">
                            <label>Date of Birth:</label><br>
                            <input type="date" class="email-bt" placeholder="Select Date of birth" name="dob" required="true">
                        </div>
                        <div class="form-group">
                            <label>User Name:</label><br>
                            <input type="text" class="email-bt" placeholder="User Name" name="uname" required="true">
                        </div>
                        <div class="form-group">
                            <label>Password:</label><br>
                            <input type="password" class="email-bt" placeholder="Your Password" name="pass" required="true">
                        </div>
                        <div class="form-group">
                            <button class="btn btn-primary">Register</button><br>
                            <label>Have an account?</label><a href="Login.jsp">Login Here</a>
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