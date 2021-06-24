<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="Bean.Court" %>
<%@ page import="Bean.User" %>

<c:if test="${sessionScope.memberprofile == null}">
    <% response.sendRedirect(request.getContextPath() + "/sessionterminate.jsp"); %>
</c:if>
<html>
    <head>
        <title>Book Court</title>
        <meta charset="utf-8" />
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
            <div id="main" class="wrapper style1">
                <div class="container">
                    <header class="major">
                        <h2>Book Court</h2>
                        <p>Below are the list of court that are available.</p>
                    </header>

                    <!-- Content -->
                    <section id="content">

                        <div class="table-wrapper">
                            <table border ="1">                  

                                <thead>
                                    <tr>
                                        <th>Index</th>
                                        <th>Court Name</th>
                                        <th>Court Type</th>
                                        <th>Price (RM)</th>
                                        <th>Status</th>
                                        <th>Select Booking</th>
                                        <th> </th>

                                    </tr>
                                </thead>


                                <tbody>

                                    <c:forEach items="${sessionScope.bklist}" var="currcourt" varStatus="loop">
                                       <div class="col-lg-9">
                                        <tr>
                                            <td><c:out value="${loop.index + 1}" /> </td>
                                            <td><c:out value="${currcourt.courtName}" /> </td>
                                            <td><c:out value="${currcourt.courtType}" /> </td>
                                            <td><c:out value="${currcourt.price}" /> </td>
                                            <td><c:out value="${currcourt.courtStat}"/> </td>
                                                                                     
                                           
                                            <c:url value = "BookingCourt.jsp?" var = "myURL">
                                            <c:param name = "courtName" value = "${currcourt.courtName}"/>
                                            <c:param name = "courtType" value = "${currcourt.courtType}"/>
                                            <c:param name = "courtID" value = "${currcourt.courtID}"/>
                                           </c:url> 
                                                
                                             
                                           <td> <a href ='${myURL}' class="button special">Select Court</a> </td>
                                        </tr></div>
                                    </c:forEach>
                                </tbody> 


                        </div>


                        </table>
                    </section>
                    <!--			<br><header class="major">
                                            <p>Please enter the required field</p>
                                    </header>
                                    
                                    <div class="row uniform 50%">
                                                                    <div class="6u -3u">
                                                                            <input type="text" name="courtno" id="courtno" value="" placeholder="Court No. (eg: Court #1)">
                                                                    </div>
                                    </div>
                                                            
                                    <div class="row uniform 50%">
                                                                    <div class="6u -3u">
                                                                            <input type="text" name="time" id="time" value="" placeholder="Time (eg: 2-4PM)">
                                                                    </div>
                                    </div>
                                                            
                                    <div class="row uniform 50%" align="center">
                                                                    <div class="6u -3u">
                                                                            <input type="date" name="date" id="date" value="" >
                                                                    </div>
                                    </div>
                                    
                                    <div class="row uniform 50%" align="center">
                                                            <div class="12u">
                                                                    <ul class="actions">
                                                                            <li><input type="submit" value="Book Now" class="special"></li>
                                                                    </ul>
                                                            </div>
                                                    

                            </div>
                    </div> -->

                    <!-- Footer -->
                    <br><footer id="footer">
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