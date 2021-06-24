<%-- 
    Document   : userpayment
    Created on : Dec 25, 2018, 12:52:34 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<%@ page import="Bean.User" %>
<c:if test="${sessionScope.memberprofile == null}">
    <% response.sendRedirect(request.getContextPath() + "/adminSessionTerminate.jsp"); %>
</c:if>
<html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>USER TRANSACTION</title>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
        <link rel="stylesheet" href="assets/css/main.css" />
        <!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
        <!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
        <link rel="stylesheet" type="text/css" href="assets/css/main.css">
    </head>

    <body>

        <div id="main" class="wrapper style1_1">
            <div class="container">
                <!-- Header -->
                <jsp:include page="headerCourt.jsp" />

                <div class="creditCardForm">
                    <header class="heading">
                        <h1>PAYMENT</h1>
                    </header>
                    <div>
                        <section id="content" align="center">
                            <form action="UserCashServlet" method="post">
                                <table class="ta">
                                    <tr>
                                    <div class="form-group ">
                                        <th> <label for="fullname">Full name</label></th>
                                        <td colspan = '2'><input size= "30"type="text" id="fullname" name="fullname" placeholder="Full Name"></td>
                                    </div>
                                    </tr>
                                    <div class="form-group">
                                        <th><label for="cvv">CVV</label></th>
                                        <td><input type="text" id="cvv" class="form-control" name="cvv" placeholder="CVV"></td>
                                        <td></td>    
                                    </div>
                                    </tr>
                                    <tr>
                                    <div  class="form-group">
                                        <th><label for="cardNumber">Card Number</label></th>
                                        <td colspan='2'><input size='30' type="text" id="cardNo" class="form-control" name="cardNo" placeholder="Card Number"></td>                                </div>
                                    </tr>
                                    <tr>
                                    <div class="form-group" >

                                        <th> <label>Expiration Date</label></th>
                                        <td> <select id="month" name="month" required>
                                                <option value="01">January</option>
                                                <option value="02">February </option>
                                                <option value="03">March</option>
                                                <option value="04">April</option>
                                                <option value="05">May</option>
                                                <option value="06">June</option>
                                                <option value="07">July</option>
                                                <option value="08">August</option>
                                                <option value="09">September</option>
                                                <option value="10">October</option>
                                                <option value="11">November</option>
                                                <option value="12">December</option>
                                            </select>
                                        </td>
                                        <td>
                                            <select id="year" name="year" required>
                                                <option value="2016"> 2016</option>
                                                <option value="2017"> 2017</option>
                                                <option value="2018"> 2018</option>
                                                <option value="2019"> 2019</option>
                                                <option value="2020"> 2020</option>
                                                <option value="2021"> 2021</option>
                                                <option value="2022"> 2022</option>
                                                <option value="2023"> 2023</option>
                                                <option value="2024"> 2024</option>
                                                <option value="2025"> 2025</option>
                                                <option value="2026"> 2026</option>
                                                <option value="2027"> 2027</option>
                                                <option value="2028"> 2028</option>
                                                <option value="2029"> 2029</option>
                                            </select>
                                        </td></tr>
                                    </div>
                                    <tr>
                                        <td></td>
                                        <td>    
                                            <div class="form-group">
                                                <img src="images/visa-logo.png" id="visa" width="60" height="50">
                                                <img src="images/MasterCard_Logo.png" id="mastercard" width="60" height="50">

                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td></td>  
                                        <td>
                                            <div  class="form-group" id="pay-now" >
                                                <input type="hidden" name="bookingID" value="${param.bookingID}">
                                                <button type="submit" id="confirm-purchase"class="button special">PAY BOOKING</button>
                                            </div>
                                        </td>
                                        <td></td>
                                    </tr>
                                </table>
                            </form>
                    </div>
                </div>
                </section>
            </div>
        </div>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/jquery.scrolly.min.js"></script>
        <script src="assets/js/jquery.dropotron.min.js"></script>
        <script src="assets/js/jquery.scrollex.min.js"></script>
        <script src="assets/js/skel.min.js"></script>
        <script src="assets/js/util.js"></script>
        <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
        <script src="assets/js/main.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.payform.min.js" charset="utf-8"></script>
        <script src="assets/js/script.js"></script>
    </body>
</html>

