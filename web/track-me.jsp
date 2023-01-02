<%-- 
    Document   : contact
    Created on : Nov 16, 2022, 1:40:30 PM
    Author     : softnut
--%>

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
        <title>Code verification</title>
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
        <script>
            function showPosition(position) {
                let latlon = position.coords.latitude + "," + position.coords.longitude;

                let img_url = "https://maps.googleapis.com/maps/api/staticmap?center=
                        "+latlon+" & zoom = 14 & size = 400x300 & sensor = false & key = AIzaSyA0s1a7phLN0iaD6 - UE7m4qP - z21pH0eSc
                ";

                        document.getElementById("mapholder").src = img_url;
            }
            function getLocation() {
                if (navigator.geolocation) {
                    navigator.geolocation.watchPosition(showPosition);
                }
            }
        </script>
    </head>
    <body onload="getLocation()">
        <!-- header section start -->
        <div class="header_section header_bg">
            <jsp:include page="include/nav.jsp"></jsp:include>
            </div>
            <!-- header section end -->
            <!-- contact section start -->
            <div class="contact_section layout_padding">
                <div class="container">
                    <div class="map-responsive">
                        <iframe id="mapholder"  width="600" height="400" frameborder="0" style="border:0; width: 100%;" allowfullscreen=""></iframe>
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