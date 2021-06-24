<!DOCTYPE HTML>
<!--
        Landed by HTML5 UP
        html5up.net | @ajlkn
        Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:if test="${sessionScope.memberprofile == null}">
    <% response.sendRedirect(request.getContextPath() + "/sessionterminate.jsp"); %>
</c:if>
<html>

<head>
    <title>Manage Court</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
    <link rel="stylesheet" href="assets/css/main.css" />

    <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
    <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->


</head>

<body>
    <div id="page-wrapper">

        <!-- Header -->
        <jsp:include page="headerCourt.jsp" />

        <!-- Main -->
        <div id="main" class="wrapper style1_1">
            <div class="container">
                <header class="major">
                    <h2>Booking</h2>
                    <p>List of bookings.</p>
                </header>

                <!-- Content -->
                <section id="content">

                    <div class="table-wrapper">
                        <table border="1">

                            <thead>
                                <tr>
                                    <th>Index</th>
                                    <th>Court Name</th>
                                    <th>Court Type</th>
                                    <th>Price (RM)</th>
                                    <th>Booking Date</th>
                                    <th>Status</th>
                                    <th>Payment Status
                                    <th>

                                    <th></th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${sessionScope.rqcourtlist}" var="court" varStatus="loop">
                                    <tr>
                                        <td>
                                            <c:out value="${loop.index + 1}" />
                                        </td>
                                        <td>
                                            <c:out value="${court.court.courtName}" />
                                        </td>
                                        <td>
                                            <c:out value="${court.court.courtType}" />
                                        </td>
                                        <td>
                                            <c:out value="${court.price}" />
                                        </td>
                                        <td>
                                            <c:out value="${court.bookDate}" />
                                        </td>
                                        <td>
                                            <c:out value="${court.bookingStat}" />
                                        </td>
                                        <!--<td><c:out value="${court.payStatus}"/> </td>-->
                                        <c:if test="${court.bookingStat == 'approve'}">
                                            <c:if test="${court.payStatus == 'pending'}">

                                                <c:url value="userpayment.jsp" var="displayURL">
                                                    <c:param name="bookingID" value="${court.bookingID}" />
                                                </c:url>
                                                <td><a href="<c:out value='${displayURL}' />">PAY BILL</a></td>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${court.bookingStat == 'pending'}">
                                            <c:if test="${court.payStatus == 'pending'}">

                                                <td>PENDING</td>
                                            </c:if>
                                        </c:if>
                                        <c:if test="${court.bookingStat == 'approve'}">
                                            <c:if test="${court.payStatus == 'approve'}">

                                                <td>PAID</td>
                                            </c:if>
                                        </c:if>
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
                <li>&copy; Untitled. All rights reserved.</li>
                <li>Design: JEMAH'S</li>
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