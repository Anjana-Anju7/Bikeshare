
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
//    if (session.getAttribute("userid") == null) {
//        response.setStatus(response.SC_FOUND);
//        response.setHeader("Location", "login-panel.jsp");
//        return;
//    }

%>
<html lang="en">
    <head>
        <title>Bike map</title>
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
                <h1>Bike Location Map</h1>
                <p id="demo"></p>
                <!--                <button class="btn btn-primary" onclick="getLocation()">Start</button>-->
                <div id="mapholder"></div>
                <br>
                <script src="https://maps.google.com/maps/api/js?key=AIzaSyB-tG2ALUPGoA6PnHUHwbgV_cy8Lpd_6M0"></script>
            <%                String sql1 = "select *from stations";
                // File[] files = dir.listFiles();
                //Random rand = new Random();
                //File file = files[rand.nextInt(files.length)];
                Connection con1 = DBConnection.ConnectDB();
                PreparedStatement pst1 = con1.prepareStatement(sql1);
                ResultSet rs1 = pst1.executeQuery();
                while (rs1.next()) {
                    int id = rs1.getInt("id");
                    String name = rs1.getString("stationName");
                    int numBikes = rs1.getInt("number_of_bikes");
                    String lat = rs1.getString("station_latitude");
                    String lon = rs1.getString("station_longitude");
                    //String date = rs1.getString("date"); 
            %>
            <script>
            let latlon = new google.maps.LatLng(<%=lat%>, <%=lon%>)
            let mapholder = document.getElementById('mapholder')
            mapholder.style.height = '500px';
            mapholder.style.width = '100%';

            let myOptions = {
                center: latlon, zoom: 14,
                mapTypeId: google.maps.MapTypeId.SATELLITE,
                mapTypeControl: false,
                navigationControlOptions: {style: google.maps.NavigationControlStyle.SMALL}
            };
            let map = new google.maps.Map(document.getElementById("mapholder"), myOptions);
            let marker = new google.maps.Marker({position: latlon, map: map, title: "<%=name%>(<%=numBikes%>)"});
           
            
            </script>
            <% }%>
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