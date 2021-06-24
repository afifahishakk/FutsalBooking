<%-- 
    Document   : sessionterminate
    Created on : Dec 21, 2018, 12:34:16 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
		<link rel="stylesheet" href="assets/css/main.css" />
<header id="header">
    <title>Session Terminated</title>
   <html>
			
		<body>
		<div id="page-wrapper">

			<!-- Header -->
				<header id="header">
					<h1 id="logo"><a href="index.html">TEAM JEMAHS.</a></h1>
					<nav id="nav">
						<ul>
							<li><a href="Signin.jsp" class="button special">Sign In</a></li>
							<li><a href="Signup.jsp" class="button special">Sign Up</a></li>
						</ul>
					</nav>
				</header>

			<!-- Main -->
				<div id="main" class="wrapper style1">
                                    <header align ="center" class="major" >
                                        
					<div class="container">
                                            
						
                                                <h2><b>SESSION TERMINATED<br>PLEASE LOGIN TO VIEW THE HOME PAGE</b></h2>         
							<h2>LOG IN FORM</h2>
							<p>Please enter the required field.</p>
						
                                     </header>
						<!-- Content -->
							<section id="content" align="center">
								
								<form method="post" action="LoginUserServlet">
									<div  align="center"  class="row uniform 50%">
										<div class="6u -3u">
											<input type="text" name="username" id="name" value="" placeholder="Username">
										</div>
									</div>
									
									<div class="row uniform 50%">
										<div class="6u -3u">
											<input type="password" name="password" id="name" value="" placeholder="Password">
										</div>
									</div>
									
									<div class="row uniform 50%">
									<div class="12u">
										<ul class="actions">
											<li><input type="submit" value="Log In" class="special"></li>
										</ul>
									</div>
									</div>
									
								</form>
						
								
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
						<li>&copy; Untitled. All rights reserved.</li><li>Design: JEMAH'S</a></li>
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
