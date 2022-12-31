<%-- 
    Document   : contact
    Created on : Nov 16, 2022, 1:40:30 PM
    Author     : softnut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>
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
            <%--<jsp:include page="include/nav.jsp"></jsp:include>--%>
        </div>
        <!-- header section end -->
        <!-- contact section start -->
        <div class="contact_section layout_padding">
            <div class="container">
                <div class="contact_main">
                    <h1 class="request_text">Choose your Login Option</h1>
                    <%-- get sessions Here --%>
                        <div class="form-group">
                            <a href="Login.jsp"><button class="btn btn-primary">Regular User Login</button></a>
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <a href="login-admin.jsp"><button class="btn btn-primary">Admin Login</button></a>
                        </div>
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