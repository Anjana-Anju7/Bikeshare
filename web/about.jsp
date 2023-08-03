

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
   <head>
    <title>About Us</title>
    <jsp:include page="include/meta.jsp"></jsp:include>
    <jsp:include page="include/css.jsp"></jsp:include>
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
   <jsp:include page="include/nav.jsp"></jsp:include>
      <!-- header section end -->
      
      <!-- about section start -->
      <div class="about_section layout_padding">
         <div class="container">
            <h1 class="about_taital">About Our cycle Store</h1>
            <p class="about_text"> We Offer bike sharing services at affordable prices
            </p>
            <div class="about_main">
               <img src="images/img-5.png" class="image_5">
            </div>
            <div class="read_bt_1"><a href="#">Read More</a></div>
         </div>
      </div>
      <!-- about section end -->
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