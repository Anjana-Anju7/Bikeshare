<%-- 
    Document   : nav
    Created on : Nov 16, 2022, 1:24:37 PM
    Author     : softnut
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a href="<%=request.getContextPath()%>" class="logo"><img src="images/logo.png"></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="<%=request.getContextPath()%>/index.jsp">Home</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/about.jsp">About</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/bikes.jsp">Bikes</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<%=request.getContextPath()%>/contact.jsp">Contact</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <div class="login_menu">
                <ul>
<!--                    <li><a href="/Login.jsp">Account</a></li>-->
                </ul>
            </div>
            <div></div>
        </form>
    </div>
    <div id="main" class="btn-dark">
        <span style="font-size:36px;cursor:pointer; color: #fff" onclick="openNav()"><img src="<%=request.getContextPath()%>/images/toggle-icon.png" style="height: 30px;"></span>
    </div>
</nav>
