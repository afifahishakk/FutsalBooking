<!DOCTYPE HTML>
<!--
        Landed by HTML5 UP
        html5up.net | @ajlkn
        Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="Bean.User" %>
<%@ page import="Bean.BookingCourt" %>
<%@ page import="java.util.ArrayList" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${sessionScope.adminprofile == null}">
    <% response.sendRedirect(request.getContextPath() + "/adminSessionTerminate.jsp"); %>
</c:if>
<html>
    <head>
        <title>Booking List</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/main.css" />
        
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->


    </head>
    <body>
        <div id="page-wrapper">

            <!-- Header -->
            <jsp:include page="headerAdmin.jsp" />
            <!-- Main -->
            <div id="main" class="wrapper style1">
                <div class="container">
                    <header class="major">
                        <h2>Booking List</h2>
                        <p>Below are the list of bookings.</p>
                    </header>

                    <!-- Content -->
                    <section id="content">

                        <div class="table-wrapper">
                            <table border="1">
                                <thead>
                                    <tr>
                                        <th>Index</th>
                                        <th>Username</th>                    
                                        <th>Booking ID</th>
                                        <th>Court Name</th>
                                        <th>Court Type</th>
                                        <th>Booking Date</th>
                                        <th>Booking Status</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="pending" scope="page" value="${0}"/>
                                    <c:set var="approved" scope="page" value="${0}"/>
                                    <c:forEach items="${sessionScope.mainbooking}" var="booking" varStatus="loop">                                
                                        <tr>
                                            <td><c:out value="${loop.index + 1}" /></td>    
                                            <td><c:out value="${booking.username}" /></td>
                                            <td><c:out value="${booking.bookingID}" /></td>
                                            <td><c:out value="${booking.court.courtName}" /></td>
                                            <td><c:out value="${booking.court.courtType}" /></td>
                                             <td><c:out value="${booking.bookDate}" /></td>
                                            <!--
                                            <td><c:out value="${booking.bookingStat}" /></td> -->

                                            <c:if test="${booking.bookingStat == 'pending'}">
                                                <c:url value="bookingapproval.jsp" var="displayURL">
                                                    <c:param name="bookingID" value="${booking.bookingID}" />
                                                    <c:param name="courtName" value="${booking.court.courtName}" />
                                                    <c:param name="username" value="${booking.username}" /> 
                                                    <c:param name="courtType" value="${booking.court.courtType}" />
                                                </c:url>
                                                <td><a href="<c:out value='${displayURL}' />"><b><c:out value="${booking.bookingStat}" /></b></a></td>
                                                </c:if>

                                            <c:if test="${booking.bookingStat == 'approve'}">
                                                <td><c:out value="${booking.bookingStat}" /></td>
                                            </c:if>

                                            <c:if test="${booking.bookingStat == 'rejected'}">
                                                <td><c:out value="${booking.bookingStat}" /></td>
                                            </c:if>    
                                           <c:url value="DeleteBookingServlet" var="displayURLDelete">
                                                <c:param name="bookID"   value="${booking.bookingID}" />
                                            </c:url>
                                            <td><a href="<c:out value='${displayURLDelete}' />"><span class="glyphicon glyphicon-trash" ></span></td> 
                                        </tr>    
                                    </c:forEach>
                                </tbody>
                            </table>	
                        </div>

                    </section>

                </div>
            </div>

            <!-- Footer -->
            <footer id="footer">
                <ul class="icons">
                    <li><a href="#" class="icon alt fa-twitter"><span class="label">Twitter</span></a></li>
                    <li><a href="#" class="icon alt fa-facebook"><span class="label">Facebook</span></a></li>
                    <li><a href="#" class="icon alt fa-linkedin"><span class="label">LinkedIn</span></a></li>
                    <li><a href="#" class="icon alt fa-instagram"><span class="label">Instagram</span></a></li>
                    <li><a href="#" class="icon alt fa-github"><span class="label">GitHub</span></a></li>
                    <li><a href="#" class="icon alt fa-envelope"><span class="label">Email</span></a></li>
                </ul>
                <ul class="copyright">
                    <li>&copy; Untitled. All rights reserved.</li><li>Design: JEMAH'S</li>
                </ul>
            </footer>

        </div>

        <!-- Scripts -->
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/jquery.dropotron.min.js"></script>
        <script src="assets/js/jquery.scrollex.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="assets/js/main.js"></script>

    </body>
</html>