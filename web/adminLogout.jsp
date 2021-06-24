<%-- 
    Document   : adminLogout
    Created on : Dec 21, 2018, 1:37:26 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    session.invalidate();
    response.sendRedirect("adminlogin.jsp"); 
%>