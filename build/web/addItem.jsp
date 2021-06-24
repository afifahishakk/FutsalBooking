<%-- 
    Document   : addItem
    Created on : May 10, 2019, 10:44:10 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="Bean.User" %>

<c:if test="${sessionScope.adminprofile == null}">
    <% response.sendRedirect(request.getContextPath() + "/adminSessionTerminate.jsp");%>
</c:if>
<html>
    <head>
        <title>Add Item</title>
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
            <jsp:include page="headerAdmin.jsp" />

            <!-- Main -->
            <div id="main" class="wrapper style1">
                <div class="container">
                    <header class="major">
                        <h2>ADD COURT</h2>
                        <p>Please enter the required field.</p>
                    </header>

                    <!-- Content -->
                    <section id="content" align="center">

                        <div align="center">
                            <form method="get" action="registerItemServlet">

                                <div class="row uniform 50%">
                                    <div class="6u -3u">
                                        <select name="itemName" id="itemName">
                                            <option >Ball</option>
                                            <option >Racquet</option>
                                            <option >Bat</option>
                                            <option >Boot</option>
                                            <option >Shuttle</option>
                                            <option >Net</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row uniform 50%">
                                    <div class="6u -3u">
                                        <select name="itemType" id="itemType">
                                            <option value="Item Type">Item Type</option> 
                                            <option value="Badminton">Indoor Item</option>
                                            <option value="Tennis">Outdoor Item</option>
                                             <option value="Futsal">Outdoor Item</option>
                                              <option value="Volleyball">Outdoor Item</option>
                                               <option value="Ping Pong">Outdoor Item</option>
                                        </select>
                                    </div>
                                </div>

                                <div class="row uniform 50%">
                                    <div class="6u -3u">
                                        <input type="text" name="price" id="price" value="" placeholder="Price" required>
                                    </div>
                                </div>

                                <div class="row uniform 50%">
                                    <div class="12u">
                                        <ul class="actions">
                                            <li><input type="submit" value="Add Item" class="special"></li>
                                        </ul>
                                    </div>
                                </div>

                            </form> 




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
                    <li>&copy; Untitled. All rights reserved.</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
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