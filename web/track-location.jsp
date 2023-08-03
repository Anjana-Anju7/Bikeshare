

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
        <title>track location</title>
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
                <h1>Track Position</h1>
                <p id="demo"></p>
                <button class="btn btn-primary" onclick="getLocation()">Start</button>
                <div id="mapholder"></div>
                <br>
                <button class="btn btn-primary" onclick="stopWatch()">Stop</button>
                <script src="https://maps.google.com/maps/api/js?key=AIzaSyB-tG2ALUPGoA6PnHUHwbgV_cy8Lpd_6M0"></script>
                <script>
                    let x = document.getElementById("demo");
                    function getLocation()
                    {
                        if (navigator.geolocation)
                        {
                            
                            //navigator.geolocation.getCurrentPosition(showPosition, showError);
                            geoloc = navigator.geolocation;
                            watchId = geoloc.watchPosition(showPosition);
                             
                        } else {
                            x.innerHTML = "Geolocation is not supported by this browser.";
                        }
                    }

                    function showPosition(position)
                    {
                        let lat = position.coords.latitude;
                        let lon = position.coords.longitude;
                         console.log(lat);
                         console.log(lon);
                        let latlon = new google.maps.LatLng(lat, lon)
                        let mapholder = document.getElementById('mapholder')
                        mapholder.style.height = '500px';
                        mapholder.style.width = '100%';

                        let myOptions = {
                            center: latlon, zoom: 14,
                            mapTypeId: google.maps.MapTypeId.ROADMAP,
                            mapTypeControl: false,
                            navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL}
                        };
                        let map = new google.maps.Map(document.getElementById("mapholder"), myOptions);
                        let marker = new google.maps.Marker({position: latlon, map: map, title: "You are here!"});
                    }

                    function showError(error)
                    {
                        switch (error.code)
                        {
                            case error.PERMISSION_DENIED:
                                x.innerHTML = "User denied the request for Geolocation."
                                break;
                            case error.POSITION_UNAVAILABLE:
                                x.innerHTML = "Location information is unavailable."
                                break;
                            case error.TIMEOUT:
                                x.innerHTML = "The request to get user location timed out."
                                break;
                            case error.UNKNOWN_ERROR:
                                x.innerHTML = "An unknown error occurred."
                                break;
                        }
                    }
                    //clear watch
                    function stopWatch() {
                       geoloc.clearWatch(watchId);
                    }
                </script>
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