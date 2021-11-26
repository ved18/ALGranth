
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
<title>ALGranth|Forum</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="forumMain.css">
<link href="https://fonts.googleapis.com/css?family=Ubuntu|Varela+Round"
	rel="stylesheet">
<link rel="stylesheet"
	href="bootstrap-social-gh-pages/bootstrap-social.css">
<link rel="stylesheet" href="font-awesome/css/font-awesome.min.css">

<%!ResultSet rs, rs2, rs3 = null;
	int id;
	int i, q;
	String qr, uname;%>
</head>
<body>
	<nav class="navbar navbar-default navbar-fixed-top">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#myNavbar">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="getStarted.jsp"><img
					src="homepageLogo1.png"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavbar">
				<ul class="nav navbar-nav">
					<!--<li class="active"><a href="#">Home</a></li>-->
					<li><a href="howtostart.jsp">How To Start</a></li>
					<li><a href="getStarted.jsp">Get Started</a></li>
					<li><a href="algorithm.jsp">Algorithms</a></li>
					<li><a href="data_structures.jsp">Data Structures</a></li>
					<li><a href="problems.jsp">MCQs</a></li>
					<li class="active"><a href="forum.jsp">Forum</a></li>
					<li><a href="admin_index.jsp">Admin Portal</a></li>
				</ul>

				<%
					if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {
				%>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#" data-toggle="modal" data-target="#myModal"><span
							class="glyphicon glyphicon-log-in"></span> Sign in</a></li>
					<li><a href="index.jsp">Register</a></li>
				</ul>
				<%
					} else {
				%>
				<ul class="nav navbar-nav navbar-right">
					<jsp:useBean id="db" class="database.db" scope="request">
						<jsp:setProperty name="db" property="*" />
						<%
							try {

										db.connect();
										System.out.println("-----CONNECTED TO DATABASE-----");
										String var = (String) session.getAttribute("userid");
										rs = db.execSQL("select username from user_details where email_id='" + var + "'");
										rs2 = db.execSQL("select * from forum_question where q_id=" + request.getParameter("cred"));
										while (rs2.next()) {
											id = rs2.getInt("q_id");
										}
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
				<%
					}
				%>
			</div>
		</div>
	</nav>
	<div class="box" style="margin-top:10%; padding-top:3%">
		<form action="../controller/forum/add_forum_answer.jsp?cred=<%=id%>"
			method="post" class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-4" for="name"></label>
				<div class="col-xs-3">
					<div class="input-group">
						<input type="text" class="form-control" id="name"
							placeholder="Description" name="description">
					</div>
				</div>
			</div>
			<br>
			<div class="form-group">
				<div class="col-sm-offset-4 col-sm-10">
					<div class="subButton">
						<div class="col-xs-3">
							<button type="submit" class="btn btn-primary btn-block"
								name="btn_reg">Post</button>
						</div>
					</div>
				</div>
			</div>
		</form>
	</div>
	<jsp:useBean id="db2" class="database.db" scope="request">
		<jsp:setProperty name="db2" property="*" />
		<%
			try {

					db2.connect();
					System.out.println("-----CONNECTED TO DATABASE-----");
					rs = db2.execSQL("select * from forum_question where q_id=" + request.getParameter("cred"));

					while (rs.next()) {
						int q = rs.getInt("q_id");
						rs2 = db2.execSQL("select distinct answer, a.usr_id from forum_answer a , forum_question q where '" + q
								+ "'= a.q_id");
						rs3 = db2.execSQL("select * from user_details where email_id='" + rs.getString("usr_id") + "'");

						while (rs3.next()) {
							uname = rs3.getString("username");
						}
		%>
		<div class="jumbotron">
			<div class="question">
				<%=rs.getString("question")%>
				<%=rs.getString("date_time")%>
				<%=uname%>
				<br>
				<%=rs.getString("description")%>
			</div>
		</div>

		<%
			while (rs2.next()) {
		%>
		<div class="jumbotron">
			<div class="question">
				<%=rs2.getString("answer")%>
				<div class="username">
				<%=rs2.getString("usr_id") %></div>
			</div>
		</div>
		<%
			}
					}
					db2.close();
				} catch (Exception ex) {
					out.println("Unable to connect to database " + ex);
				}
		%>
	</jsp:useBean>
	<div class="modal " id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<center>
						<h4 class="modal-title">Sign in</h4>
					</center>
				</div>
				<div class="modal-body">
					<form action="../controller/login_register/login.jsp"
						class="form-horizontal">
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-6">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-envelope"></i></span> <input type="email"
										class="form-control" id="email" placeholder="Email ID "
										name="email_id">
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-6">
								<div class="input-group">
									<span class="input-group-addon"><i
										class="glyphicon glyphicon-lock"></i></span> <input type="password"
										class="form-control" id="pwd" placeholder="Password"
										name="pwd">
								</div>
							</div>
						</div>
						<!--  	<div class="form-group">
							<div class="col-sm-offset-1 col-sm-10">
								<div class="checkbox">
									<center>
										<label><input type="checkbox">Remember me</label>
									</center>
								</div>
							</div>
						</div>
					-->
						<div class="form-group">
							<div class="col-sm-offset-3 col-sm-6">
								<center>
									<button type="submit" class="btn btn-primary btn-block"
										name="btn_login">Sign in</button>
								</center>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>