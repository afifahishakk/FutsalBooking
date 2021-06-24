<%-- 
    Document   : AdminHeader
    Created on : Dec 13, 2018, 6:19:50 PM
    Author     : Adah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="header">
    <h1 id="logo"><a href="admin.jsp">FUTSAL BOOKING MANAGEMENT</a>&nbsp;&nbsp;&nbsp;Hi! ${sessionScope.adminprofile.getUsername()}</h1>
    <nav id="nav">
        <ul>
            <li>
                <a href="#">PROFILE</a>
                <ul>
                    <li><a href="viewprofileadmin.jsp">VIEW PROFILE</a></li>
                    <li><a href="editprofileadmin.jsp">EDIT PROFILE</a></li>
                </ul>
            </li>
            <li><a href="MainBookingServlet">MANAGE BOOKING</a></li>
            <li><a href="viewCourtServlet">MANAGE COURT</a></li>
            <li><a href="viewItemServlet">MANAGE ITEM</a></li>
            <li><a href="adminLogout.jsp" class="button special">LOG OUT</a></li>
        </ul>
    </nav>
</header>
