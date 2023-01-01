<%-- 
    Document   : logout
    Created on : Jan 1, 2023, 9:32:17 PM
    Author     : 
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<!DOCTYPE html>
<%
    try{
          HttpSession s = request.getSession();
          s.invalidate();// destroy all session variables 
          response.setStatus(response.SC_FOUND);
          response.setHeader("Location", "login-panel.jsp");
        }catch(Exception e){
            out.print(e);
        }
    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Logout</title>
    </head>
    <body>
        
    </body>
</html>
