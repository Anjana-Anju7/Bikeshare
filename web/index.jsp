

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@page import="main.DBConnection"%>
<!DOCTYPE html>
<html lang="en">
   <head>
     <title>Welcome : Home Page </title>
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
   </head>
   <body>
      <!-- header section start -->
      <div class="header_section header_bg">
            <jsp:include page="include/nav.jsp"></jsp:include>
            <jsp:include page="include/banner.jsp"></jsp:include>
      </div>
   
      <!-- header section end -->
      <!-- cycle section start -->
          <div class="cycle_section layout_padding">
                <div class="container">
                    <h1 class="cycle_taital">Our cycle</h1>
                    <p class="cycle_text">Hire and get a ride</p>
                <%

                    String sql = "select *from bike";
                   // File[] files = dir.listFiles();
                    //Random rand = new Random();
                    //File file = files[rand.nextInt(files.length)];
                    Connection con = DBConnection.ConnectDB();
                    PreparedStatement pst = con.prepareStatement(sql);
                    ResultSet rs = pst.executeQuery();
                    int i=0;
                    
                    while (rs.next()) {
                        i = i +1;
                        int id = rs.getInt("id");
                        String brand = rs.getString("brand");
                        String model = rs.getString("model");
                        String description = rs.getString("description");
                        String status = rs.getString("status");
                        float price = rs.getFloat("price");

                %>
                <div class="cycle_section_2 layout_padding">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="box_main">
                                <h6 class="number_text"><%=i%></h6>
                                <div class="image_2"><img src="bikeimages/img-<%=i%>.png"></div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <h1 class="cycles_text"><%//=status%></h1>
                            <p class="lorem_text"><%=description%></p>
                            <div class="btn_main">
                                <div class="buy_bt"><a href="hire.jsp?id=<%=id%>">Hire Now</a></div>
                               <!-- <h4 class="price_text">Price <span style=" color: #f7c17b">$</span> <span style=" color: #325662"><%//=price%></span></h4>-->
                            </div>
                        </div>
                    </div>
                </div>
                <% }%>
        
            </div>
        </div>
      <!-- cycle section end -->
      <!-- about section start -->
      
     
      
      <!-- footer section start -->
      <jsp:include page="include/footer.jsp"/>
      <!-- footer section end -->
      
      <!-- copyright section start -->
      <jsp:include page="include/copyright.jsp"/>
      <!-- copyright section end --> 
      
      <!<!-- JS start -->
      <jsp:include page="include/js.jsp"/>
      <!<!-- JS end -->
      
   </body>
</html>