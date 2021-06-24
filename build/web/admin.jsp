<%-- 
    Document   : admin
    Created on : Dec 18, 2018, 3:00:05 AM
    Author     : Adah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="Bean.User" %>

<c:if test="${sessionScope.adminprofile == null}">
    <% response.sendRedirect(request.getContextPath() + "/adminSessionTerminate.jsp"); %>
</c:if>

<jsp:useBean id="adminprofile" class="Bean.User" scope="session" />

<html >
	<head>
		<title>HOME - ADMIN</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
		<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
		<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->
	</head>
	<body class="landing">
		<div id="page-wrapper">

			<!-- Header -->
				<jsp:include page="headerAdmin.jsp" />

			<!-- Banner -->
				<section id="banner">
					<div class="content">
						<header>
							<h2>- WELCOME - <br>
							ARE YOU READY? <br>
							- LET'S GET STARTED -</h2><br>
							Here we provide some features for you as listed below.
						</header>
						
					</div>
					<a href="#two" class="goto-next scrolly">Next</a>
				</section>

			<!-- Two -->
				<section id="two" class="spotlight style2 right">
					<span class="image fit main"><img src="images/profile.png" alt="" /></span>
					<div class="content">
						<header>
							<h2>PROFILE</h2>
							<p>With this features, each admin can view and edit their profile easily.</p>
						</header>
						
						<ul class="actions">
							<li><a href="viewprofileadmin.jsp" class="button">Click Here</a></li>
						</ul>
					</div>
					<a href="#three" class="goto-next scrolly">Next</a>
				</section>

			<!-- Three -->
				<section id="three" class="spotlight style3 left">
					<span class="image fit main bottom"><img src="images/801185742_565.jpg" alt="" /></span>
					<div class="content">
						<header>
							<h2>MANAGE COURT</h2>
							<p>With this features, admin can add, manage, and view booking of the courts. </p>
						</header>
						<ul class="actions">
							<li><a href="#" class="button">Click Here</a></li>
						</ul>
					</div>
					
				</section>

			
				</section>

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