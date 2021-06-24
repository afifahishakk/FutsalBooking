<%-- 
    Document   : header
    Created on : Dec 18, 2018, 5:57:06 PM
    Author     : Balqis
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<header id="header">
    <h1 id="logo"><a href="Home.jsp">JEMAH'S </a>Hi! ${sessionScope.memberprofile.getUsername()}</h1>
    <nav id="nav">
        <ul>
            <li>
                <a href="#">PROFILE</a>
                <ul>
                    <li><a href="viewprofile.jsp">VIEW PROFILE</a></li>
                    <li><a href="editprofile.jsp">EDIT PROFILE</a></li>
                </ul>
            </li>
            <li><a href="viewAvailabiltyServlet">BOOK COURT</a></li>
             <li><a href="ViewAvailabilityItemServlet">BOOK ITEM</a></li>
            <li><a href="userViewCourtServlet">BOOKING COURT LIST</a></li>
            <li><a href="userViewItemServlet">BOOKING ITEM LIST</a></li>
            <li><a href="HistoryBookingServlet">BOOKING HISTORY</a></li>
            <li><a href="logout.jsp" class="button special">LOG OUT</a></li>
        </ul>
    </nav>
</header>
