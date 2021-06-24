<!DOCTYPE HTML>
<!--
	Twenty by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="Bean.User" %>

<c:if test="${sessionScope.memberprofile == null}">
    <% response.sendRedirect(request.getContextPath() + "/sessionterminate.jsp"); %>
</c:if>
<html>
<head>
    <title>Futsal Court</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="left-sidebar">
    <div id="page-wrapper">
    <!-- Header -->
    <header id="header">	
        <h1 id="logo"><a href="index.html">FUTSAL COURT</span></a></h1>
        <nav id="nav">
            <ul>	
            <li class="submenu">
                <a href="#">OPTION</a>
                <ul>
                 <li><a href="left-sidebar.html">Search Court</a></li>
                 <li><a href="contact.html">Contact</a></li>
                </ul>
            </li>
            
            <li><a href="Signin.html" class="button special">Sign In</a></li>
            <li><a href="Signup.html" class="button special">Sign Up</a></li>
            </ul>
        </nav>
    </header>

    <!-- Main -->
    <article id="main">
    <div align="center">
        <span><img src='images/logo-futsal.png'></span>
        <p>Choose type of futsal court that you preferred.</p>
    </div>
        
    <!-- One -->
    <section class="wrapper style4 container">
        <div class="row 150%">
        <div class="4u 12u(narrower)">

        <!-- Sidebar -->
        <div class="sidebar">
        <section>
        <header>
            <h3><b>FIFA Court</b></h3>
        </header>
            <p>Dimension of the court according to Official FIFA size.</p>
        <footer>
        <ul class="buttons" action="RequestBookingServlet">
             <li><a href="#" class="button small">BOOK COURT</a></li>
        </ul>
        </footer>
        </section>
        </div>
        </div>
            
        <div class="8u 12u(narrower) important(narrower)">
        <!-- Content -->
        <div class="content">
        <section>
            <a href="#" class="image featured"><img src="images/courtfifa.jpg" width="80" height="200"/></a>
        </section>
        </div>
        </div>
        </div>
    </section>
    </article>

    <!-- Footer -->

    <footer id="footer">
        <ul class="icons">
            <li><a href="#" class="icon circle fa-twitter"><span class="label">Twitter</span></a></li>
            <li><a href="#" class="icon circle fa-facebook"><span class="label">Facebook</span></a></li>
            <li><a href="#" class="icon circle fa-google-plus"><span class="label">Google+</span></a></li>
            <li><a href="#" class="icon circle fa-github"><span class="label">Github</span></a></li>
            <li><a href="#" class="icon circle fa-dribbble"><span class="label">Dribbble</span></a></li>
        </ul>
        <ul class="copyright">
            <li>&copy; Untitled</li><li>Design: <a href="http://html5up.net">HTML5 UP</a></li>
        </ul>
    </footer>

    </div>

    <!-- Scripts -->
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/js/jquery.dropotron.min.js"></script>
    <script src="assets/js/jquery.scrolly.min.js"></script>
    <script src="assets/js/jquery.scrollgress.min.js"></script>
    <script src="assets/js/skel.min.js"></script>
    <script src="assets/js/util.js"></script>
    <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
    <script src="assets/js/main.js"></script>
    
</body>
</html>