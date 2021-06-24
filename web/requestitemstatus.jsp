<%-- 
    Document   : requestitemstatus
    Created on : May 10, 2019, 11:47:40 PM
    Author     : USER
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="Bean.User" %>

<c:if test="${sessionScope.memberprofile == null}">
    <% response.sendRedirect(request.getContextPath() + "/sessionterminate.jsp");%>
</c:if>
<html>
    <head>
        <title>Book Court</title>
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
                        <h2>Request Book Item Status</h2>
                        <p>Below are the the request of your Item.</p>
                    </header>

                    <!-- Content -->
                    <section id="content">

                        BOOK SUCCESSFUL!


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

