<%-- 
    Document   : js
    Created on : Nov 16, 2022, 1:00:32 PM
    Author     : softnut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!-- Javascript files-->
<script src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script src="<%=request.getContextPath()%>/js/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.bundle.min.js"></script>
<script src="<%=request.getContextPath()%>/js/jquery-3.0.0.min.js"></script>
<script src="<%=request.getContextPath()%>/js/plugin.js"></script>
<!-- sidebar -->
<script src="<%=request.getContextPath()%>/js/jquery.mCustomScrollbar.concat.min.js"></script>
<script src="<%=request.getContextPath()%>/js/custom.js"></script>
<!-- javascript --> 
<script src="<%=request.getContextPath()%>/js/owl.carousel.js"></script>
<script src="<%=request.getContextPath()%>/https:cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.js"></script>
<script>
    function openNav() {
        document.getElementById("mySidenav").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";
    }

    function closeNav() {
        document.getElementById("mySidenav").style.width = "250px";
        document.getElementById("main").style.marginLeft = "250px";

    }

    $("#main").click(function () {
        $("#navbarSupportedContent").toggleClass("nav-normal")
    })
</script>