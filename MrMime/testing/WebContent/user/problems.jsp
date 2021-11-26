<%@page import="org.apache.catalina.User"%>
<%@page import="database.db"%>
<%@page import="java.util.ListIterator"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML>
<html>
<head>
<title>MCQs | ALGranth</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="problems.css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu|Varela+Round"
	rel="stylesheet">
<link rel="stylesheet"
	href="bootstrap-social-gh-pages/bootstrap-social.css">
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">
<link href="https://fonts.googleapis.com/css?family=Anton"
	rel="stylesheet">
<link rel="shortcut icon" href="/favicon.ico">
<link rel="icon" sizes="16x16 32x32 64x64" href="/favicon/favicon.ico">
<link rel="icon" type="image/png" sizes="196x196"
	href="/favicon/favicon-192.png">
<link rel="icon" type="image/png" sizes="160x160"
	href="/favicon/favicon-160.png">
<link rel="icon" type="image/png" sizes="96x96"
	href="/favicon/favicon-96.png">
<link rel="icon" type="image/png" sizes="64x64"
	href="/favicon/favicon-64.png">
<link rel="icon" type="image/png" sizes="32x32"
	href="/favicon/favicon-32.png">
<link rel="icon" type="image/png" sizes="16x16"
	href="/favicon/favicon-16.png">
<link rel="apple-touch-icon" href="/favicon/favicon-57.png">
<link rel="apple-touch-icon" sizes="114x114"
	href="/favicon/favicon-114.png">
<link rel="apple-touch-icon" sizes="72x72"
	href="/favicon/favicon-72.png">
<link rel="apple-touch-icon" sizes="144x144"
	href="/favicon/favicon-144.png">
<link rel="apple-touch-icon" sizes="60x60"
	href="/favicon/favicon-60.png">
<link rel="apple-touch-icon" sizes="120x120"
	href="/favicon/favicon-120.png">
<link rel="apple-touch-icon" sizes="76x76"
	href="/favicon/favicon-76.png">
<link rel="apple-touch-icon" sizes="152x152"
	href="/favicon/favicon-152.png">
<link rel="apple-touch-icon" sizes="180x180"
	href="/favicon/favicon-180.png">
<meta name="msapplication-TileColor" content="#FFFFFF">
<meta name="msapplication-TileImage" content="/favicon/favicon-144.png">
<meta name="msapplication-config" content="/browserconfig.xml">
<meta name="viewport" content="initial-scale=1, maximum-scale=1" />
<!-- Chrome, Firefox OS and Opera -->
<meta name="theme-color" content="#24292e">
<!-- Windows Phone -->
<meta name="msapplication-navbutton-color" content="#24292e">
<!-- iOS Safari -->
<meta name="apple-mobile-web-app-status-bar-style" content="#24292e">

<%
	if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
		response.sendRedirect("index.jsp?cred=You+are+not+logged+in");
	}
%>
<%!ResultSet rs = null;
	int i;
	String qr;%>
</head>
<body>
	<!--NavBar-->
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="getStarted.jsp"><img
					src="homepageLogo1.png"></a> <a class="navbar-brand-mobile"
					href="getStarted.jsp"><img src="homepageLogo1.png"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<!--<li class="active"><a href="#">Home</a></li>-->
					<li><a href="howtostart.jsp">How To Start</a></li>
					<li><a href="getStarted.jsp">Get Started</a></li>
					<li><a href="algorithm.jsp">Algorithms</a></li>
					<li><a href="data_structures.jsp">Data Structures</a></li>
					<li class="active"><a href="problems.jsp">MCQs</a></li>
					<li><a href="forum.jsp">Forum</a></li>
					<li><a href="admin_index.jsp">Admin Portal</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right ">
					<jsp:useBean id="db" class="database.db" scope="request">
						<jsp:setProperty name="db" property="*" />
						<%
							try {

									db.connect();
									System.out.println("-----CONNECTED TO DATABASE-----");
									String var = (String) session.getAttribute("userid");
									rs = db.execSQL("select username from user_details where email_id='" + var + "'");

									while (rs.next()) {
						%>
						<li><a href="profile.jsp"> <%=rs.getString("username")%>
						</a></li>

						<%
							}
									db.close();
								} catch (Exception ex) {
									out.println("Unable to connect to database " + ex);
								}
						%>
					</jsp:useBean>



					<li><a href="../controller/login_register/logout.jsp"><span
							class="glyphicon glyphicon-log-in"></span> Log Out</a></li>
				</ul>
		
			</div>
		</div>
	</nav>
	<!-- First Year -->
	        <!-- First Year -->
        <div class="subjects">
            <div class="header">
                <h2>First year</h2>
            </div>
            <hr class="sub-hr"> 
            <div class="grid">
                <div class="grid-column col-sm-3">
                    <a href="#" data-toggle="modal" data-target="#algo_modal_em1">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">EM-I</h3>
                        </div>
                    </a>
                    <a href="#" data-toggle="modal" data-target="#algo_modal_bee">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">BEE</h3>
                        </div>
                    </a>
                    <a href="#" data-toggle="modal" data-target="#algo_modal_bxe">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">BXE</h3>
                        </div>
                    </a>
                    <a href="#" data-toggle="modal" data-target="#algo_modal_fpl2">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">FPL-II</h3>
                        </div>
                    </a>
                </div>
                <div class="grid-column col-sm-3">
                   
                    <a href="#" data-toggle="modal" data-target="#algo_modal_em2">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">EM-II</h3>
                        </div>
                    </a>
                    <a href="#" data-toggle="modal" data-target="#algo_modal_phy">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">Physics</h3>
                        </div>
                    </a>
                    <a href="#" data-toggle="modal" data-target="#algo_modal_chem">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">Chemistry</h3>
                        </div>
                    </a>
                    <a href="#" data-toggle="modal" data-target="#algo_modal_mech">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">Mechanics</h3>
                        </div>
                    </a>
                </div>
                <div class="grid-column col-sm-3">
                    <!--<center><hr class="element-hr"></center>-->
                    <a href="#" data-toggle="modal" data-target="#algo_modal_bme">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">BME</h3>
                        </div>
                    </a>
                    <a href="#" data-toggle="modal" data-target="#algo_modal_bcee">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; padding-left: 10px; margin-top: 25px;">BCEE</h3>
                        </div>
                    </a>
                    <a href="#" data-toggle="modal" data-target="#algo_modal_fpl1">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">FPL-I</h3>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        <!-- 2nd year -->
        <div class="subjects">
            <div class="header">
                <h2>Second year</h2>
            </div>
            <hr class="sub-hr"> 
            <div class="grid">
                <div class="grid-column col-sm-3">
                    <a href="#" data-toggle="modal" data-target="#algo_modal_dm">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">Discrete Maths</h3>
                        </div>
                    </a>
                    <a href="#" data-toggle="modal" data-target="#algo_modal_deld">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">DELD</h3>
                        </div>
                    </a>
                    <a href="#" data-toggle="modal" data-target="#algo_modal_coa">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">COA</h3>
                        </div>
                    </a>
                     <a href="#" data-toggle="modal" data-target="#algo_modal_cg">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">CG</h3>
                        </div>
                    </a>
                    
                </div>
                <div class="grid-column col-sm-3">
                    
                    <a href="#" data-toggle="modal" data-target="#algo_modal_oop">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">OOP</h3>
                        </div>
                    </a>
                    <a href="#" data-toggle="modal" data-target="#algo_modal_fds">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">FDS</h3>
                        </div>
                    </a>
                    <a href="#" data-toggle="modal" data-target="#algo_modal_em3">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">EM-III</h3>
                        </div>
                    </a>
                   
                </div>
                <div class="grid-column col-sm-3">
                    <!--<center><hr class="element-hr"></center>-->
                    <a href="#" data-toggle="modal" data-target="#algo_modal_fccn">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">FCCN</h3>
                        </div>
                    </a>
                    <a href="#" data-toggle="modal" data-target="#algo_modal_dsf">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; padding-left: 10px; margin-top: 25px;">DSF</h3>
                        </div>
                    </a>
                    <a href="#" data-toggle="modal" data-target="#algo_modal_pai">
                        <div class="grid-element">
                            <img src="../favicon/favicon-57.png" style="border-radius: 25px; float:left; margin-left: 5%; margin-top:14px;"><h3 style="vertical-align: middle; float:left; margin-top: 25px; padding-left: 10px;">PAI</h3>
                        </div>
                    </a>
                </div>
            </div>
        </div>
        
        <!--Footer-->
        <div class="jumbotron footer row">
        	<div class = "col-sm-4"></div>
        	<div class="row footercopyright"><center><span class="col-sm-4">&copy; 2017 Algranth, All Rights Reserved.</span></center></div>
        	<div class = "col-sm-4"></div>
        	<span class="col-sm-6 footer-span">
        	<a href="index.jsp" class = "footer-text">Home</a>
        	<span> | </span>
        	<a href=# class = "footer-text">Contact Us</a>
        	<span> | </span>
 			<a href="aboutUs.jsp" class = "footer-text">About Us</a>  
        	<span> | </span>
        	<a href=# class = "footer-text">Terms Of Service</a>
        	</span>         
        </div>
                <!-- Modal -->
                        
       <div class="sub-modal">
            <div class="modal fade" id="algo_modal_em1" role="dialog">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<center>
							<h4 class="modal-title">EM-I</h4>
						</center>
					</div>
					<form action="quiz.jsp" method="get">
					<div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="em1">
						
					</div>
					<div class="modal-footer">
						<button type="reset" class="btn btn-default" data-dismiss="modal">Close</button>
						<button type="submit" class="btn btn-default" style="float: left">Take
							the Quiz!</button>
					</div></form>
				</div>
			</div>
		</div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_em2" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <center><h4 class="modal-title">EM-II</h4></center>
                        </div><form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="em2">
						
					</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-default" style="float: left">Take the Quiz!</button>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_phy" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <center><h4 class="modal-title">Physics</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="phy">
						
					</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-default" style="float: left">Take the quiz</button>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_em3" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <center><h4 class="modal-title">EM-III</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="phy">
						
					</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-default" style="float: left">Take the quiz</button>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_bme" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <center><h4 class="modal-title">BME</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="bme">
						
					</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-default" style="float: left">Take the quiz</button></a>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_mech" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <center><h4 class="modal-title">Mechanics</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="mech">
						
					</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-default" style="float: left">Take the quiz</button></a>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_chem" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <center><h4 class="modal-title">Chemistry</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="phy">
						
					</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-default" style="float: left">Take the quiz</button></a>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_cg" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <center><h4 class="modal-title">CG</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="cg">
						
					</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-default" style="float: left">Take the quiz</button></a>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_coa" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <center><h4 class="modal-title">COA</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="coa">
						
					</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-default" style="float: left">Take the quiz</button>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_pai" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                        <div class="modal-header">
                            <center><h4 class="modal-title">PAI</h4></center>
                        </div>
                       <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="pai">
						
					</div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="submit" class="btn btn-default" style="float: left">Take a 5q quiz</button>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_deld" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content"><div class="modal-header">
                            <center><h4 class="modal-title">DELD</h4></center>
                        </div>
                       <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="deld">
						
					</div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-default" style="float: left">Take a 5q quiz</button>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_dsf" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content"><div class="modal-header">
                            <center><h4 class="modal-title">DSF</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="dsf">
						
					</div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-default" style="float: left">Take a 5q quiz</button><
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_fds" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                    <div class="modal-header">
                            <center><h4 class="modal-title">FDS</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="fds">
						
					</div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-default" style="float: left">Take a 5q quiz</button>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_oop" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                    <div class="modal-header">
                            <center><h4 class="modal-title">OOP</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="oop">
						
					</div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-default" style="float: left">Take a 5q quiz</button>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
     <div class="sub-modal">
            <div class="modal fade" id="algo_modal_bee" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                    <div class="modal-header">
                            <center><h4 class="modal-title">BEE</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="bee">
						
					</div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-default" style="float: left">Take a 5q quiz</button>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_bcee" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                    <div class="modal-header">
                            <center><h4 class="modal-title">BCEE</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="bcee">
						
					</div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-default" style="float: left">Take a 5q quiz</button>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_bxe" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                    <div class="modal-header">
                            <center><h4 class="modal-title">BXE</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="bxe">
						
					</div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-default" style="float: left">Take a 5q quiz</button>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_fpl1" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                    <div class="modal-header">
                            <center><h4 class="modal-title">FPL-I</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="fpl1">
						
					</div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-default" style="float: left">Take a 5q quiz</button>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_fpl2" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                    <div class="modal-header">
                            <center><h4 class="modal-title">FPL-II</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="fpl2">
						
					</div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-default" style="float: left">Take a 5q quiz</button>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_dm" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                    <div class="modal-header">
                            <center><h4 class="modal-title">Discrete maths</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="dm">
						
					</div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-default" style="float: left">Take a 5q quiz</button>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
        <div class="sub-modal">
            <div class="modal fade" id="algo_modal_fccn" role="dialog">
                <div class="modal-dialog">
                    <div class="modal-content">
                    <div class="modal-header">
                            <center><h4 class="modal-title">FCCN</h4></center>
                        </div>
                        <form action="quiz.jsp" method="get">
                       <div class="modal-body">
						
							<div class="option">
								<input type="radio" name="noq" value='10'> 10 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='20'> 20 Questions
							</div>
							<div class="option">
								<input type="radio" name="noq" value='50'> 50 Questions
							</div>
							<input type="hidden" name="sub" value="fccn">
						
					</div>
                        <div class="modal-body">
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                            <button type="button" class="btn btn-default" style="float: left">Take a 5q quiz</button>
                        </div></form>
                    </div>     
                </div>
            </div>
        </div>
</body>
</html>