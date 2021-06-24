<%-- 
    Document   : bookingItem
    Created on : May 10, 2019, 10:45:38 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="Bean.Item" %>
<%@ page import="Bean.User" %>
<c:if test="${sessionScope.memberprofile == null}">
    <% response.sendRedirect(request.getContextPath() + "/sessionterminate.jsp"); %>
</c:if>
<html>
    <head>
        <title>Book Court</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->


        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

        <link href="assets/css/navbar-fixed-top.css" rel="stylesheet">
        <link rel="stylesheet" href="assets/css/main.css" />
    </head>
    <body>
    <jsp:include page="headerCourt.jsp" />    
    <div id="page-wrapper">

        <!-- Header -->


        <!-- Main -->
        <div id="main" class="wrapper style1">
            <div class="container">
                <div class="well" id="wellhome">
                    <header class="major">
                        <h2>Book Item</h2>
                        <p>Below are the list of item that are available.</p>
                    </header>
                    <fieldset>
                        <div class="container">
                            <form method ="post" action = "RequestBookingItemServlet">
                                <h1><b>Booking Information</b></h1>
                                <div class="form-group">
                                    <label for="bookDate" class="col-lg-3 control-label">Item ID</label>
                                    <div class="input-group date"  >
                                        <input type="text" class="form-control" id="itemID" readonly  name="itemID" value="${param.itemID}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="bookDate" class="col-lg-3 control-label">Court Type</label>
                                    <div class="input-group date" >
                                        <input type="text" class="form-control" id="itemtype" readonly  name="itemType" value="${param.itemName}">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label for="bookDate" class="col-lg-3 control-label">Court Name</label>
                                    <div class="input-group date" >
                                        <input type="text" class="form-control" id="itemname" readonly name="itemName" value="${param.itemType}">
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label for="bookDate" class="col-lg-3 control-label">Booking Date</label>
                                    <div class="input-group date" id='datetimepicker1'>
                                        <input type="text" class="form-control" id="bookDate" name="bookdate"> 
                                    <span class="input-group-addon">
                                      <span class="glyphicon glyphicon-calendar"></span>
                                     </span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-lg-9 col-lg-offset-3 pull-right">
                                        <button type="reset" class="btn btn-default">Cancel</button>
                                        <button type="submit" class="btn btn-primary">Submit</button>
                                    </div>
                                </div>

                            </form>
                        </div>
                        <fieldset>
                            </div> <!-- /row -->
                            </div> <!-- /well -->
                            </div>
                            </div> <!-- /container -->
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



                            <!-- Scripts -->


                            <script src="assets/js/app.js"></script><script src="assets/js/jquery.min.js"></script>
                            <script src="assets/js/moment.min.js"></script>
                            <script src="assets/js/bootstrap.min.js"></script>
                            <script src="assets/js/bootstrap-datetimepicker.min.js"></script>    
                            <script src="assets/js/app.js"></script>


                            <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->


                            </body>
                            </html>