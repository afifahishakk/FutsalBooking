<%-- 
    Document   : manageItem
    Created on : May 10, 2019, 10:46:00 AM
    Author     : USER
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="Bean.Item" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="Bean.User" %>

<c:if test="${sessionScope.adminprofile == null}">
    <% response.sendRedirect(request.getContextPath() + "/adminSessionTerminate.jsp");%>
</c:if>
<html>

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
            <header id="header">
                <h1 id="logo"><a href="admin.jsp">JEMAH'S </a>Hi! ${sessionScope.adminprofile.getUsername()}</h1>
                <nav id="nav">
                    <ul>
                        <li><a href="additem.jsp">ADD COURT</a></li>
                        <li><a href="MainBookingServlet">MANAGE BOOKING</a></li>
                        <li><a href="viewCourtServlet">MANAGE COURT</a></li>
                        <li><a href="adminLogout.jsp" class="button special">LOG OUT</a></li>
                    </ul>
                </nav>
            </header>

            <!-- Main -->
            <div id="main" class="wrapper style1">
                <div class="container">
                    <header class="major">
                        <h2>Manage Court</h2>
                        <p>Below are the list of items.</p>
                    </header>

                    <!-- Content -->
                    <section id="content">

                        <div class="table-wrapper">
                            <table>
                                <thead>
                                    <tr>
                                        <th>Index</th>
                                        <th>Court Name</th>
                                        <th>Court Type</th>
                                        <th>Price</th>
                                        <th>Status</th>
                                        <th>Option</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${sessionScope.itemlist}" var="curritem" varStatus="loop">
                                        <tr>
                                            <td><c:out value="${loop.index + 1}" /></td>


                                            <td><c:out value="${curritem.itemName}" /></td>


                                            <td><c:out value="${curritem.itemType}" /></a></td>

                                            <td><c:out value="${curritem.price}" /></a></td>



                                            <c:if test="${curritem.itemStat == 'active'}">
                                                <c:url value="deactivateItemServlet" var="displayURLDeactivate">
                                                    <c:param name="itemID"   value="${curritem.itemID}" />
                                                </c:url>
                                                <td><b><a href="<c:out value='${displayURLDeactivate}' />"><c:out value="${curritem.itemStat}" /></a></b></td>
                                                </c:if>

                                            <c:if test="${curritem.itemStat == 'deactivate'}">
                                                <c:url value="activateItemServlet" var="displayURLActivate">
                                                    <c:param name="itemID"   value="${curritem.itemID}" />
                                                </c:url>
                                                <td><a href="<c:out value='${displayURLActivate}' />"><c:out value="${curritem.itemStat}" /></a></td>
                                                </c:if>

                                            <c:url value="deleteItemServlet" var="displayURLDelete">
                                                <c:param name="itemID"   value="${curritem.itemID}" />
                                            </c:url>

                                            <c:url value="editItemServlet" var="displayURLEdit">
                                                <c:param name="itemID"   value="${curritem.itemID}" />
                                            </c:url>

                                            <td><a href="<c:out value='${displayURLDelete}' />"><span class="glyphicon glyphicon-trash" ></span></a> / <a href="<c:out value='${displayURLEdit}' />"><span class="glyphicon glyphicon-edit" ></span></a></td>                            
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
                    <li>&copy; Untitled. All rights reserved.</li><li>Design: TEAM JEMAHS.</li>
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