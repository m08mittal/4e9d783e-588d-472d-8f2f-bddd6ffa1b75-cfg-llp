<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256" import="com.llp.amsws.model.User"
	import="java.util.List" import="com.llp.amsws.model.Transaction"
	import="com.llp.amsws.servlets.ServletConstants"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
   "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<link rel="shortcut icon" href="../../assets/ico/favicon.ico">

<title>Your Home Page</title>

<!-- Bootstrap core CSS -->
<link href="../css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet"
	href="../bootstrap-table-master/src/bootstrap-table.css"></link>
<link rel="stylesheet"
	href="../bootstrap-editable/css/bootstrap-editable.css"></link>

<!-- Custom styles for this template -->
<link href="../css/navbar-static-top.css" rel="stylesheet">

<!--Java Scripts -->
<script src="../js/jquery-1.10.2.js"></script>
<script src="../js/bootstrap.min.js"></script>
<script src="../bootstrap-table-master/src/bootstrap-table.js"></script>
<script src="../bootstrap-editable/js/bootstrap-editable.js"></script>

<script src="../js/llp/user-ya/account-operations.js"></script>
<script src="../js/llp/user-ya/asset-operations.js"></script>
<script src="../js/llp/common/common-util.js"></script>
<script>
	clearScreen();
</script>
</head>
<body>

	<!-- Static navbar -->
	<div class="navbar navbar-inverse navbar-static-top" role="navigation">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
			</div>
			<div class="navbar-collapse collapse">
				<ul class="nav navbar-nav">
					<li><a href="#" id="user-inbox">Inbox</a></li>
					<li class="dropdown"><a id="myaccount" href="#"
						class="dropdown-toggle" data-toggle="dropdown">My Account<b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a id="viewTransactions" href="#">View Transactions</a></li>
							<li><a id="viewMyPlan" href="#">View My Plan</a></li>
							<li><a id="editProfile" href="#">Edit My Profile</a></li>
						</ul></li>

					<li class="dropdown"><a id="projects" href="#"
						class="dropdown-toggle" data-toggle="dropdown">Projects<b
							class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a id="viewProfitLoss" href="#">View Profit/Loss</a></li>
							<li><a id="viewProjectLocations" href="#">View Project
									Locations</a></li>
						</ul></li>
					<li><a href="#" id="companySharePrices">Company Share
							Prices</a></li>
					<li><a href="#companyPolicy">Company Policy</a></li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<%
					    User currentUser = (User) (session.getAttribute(ServletConstants.CURRENT_SESSION_USER));
					%>
					<li class="active"><a href="">Hi <%=currentUser.getUsername()%></a></li>
					<li><a href="LoginServlet?action=signout">Sign Out</a></li>
				</ul>
			</div>

			<!--/.nav-collapse -->
		</div>
		<!--/.container-fluid -->
	</div>

	<!-- Main jumbotron for a primary marketing message or call to action -->
	<div class="jumbotron">
		<div class="container">
			<div class="row">
				
				<textarea id="comm-free-text-div" class="form-control" readonly="readonly" rows="15"></textarea>
			
				<div class="col-sm-3 col-md-2 sidebar">
					<div class="table-responsive">
						<table class="table table-striped" id="genericTableId">
							<thead>
							</thead>
							<tbody></tbody>
						</table>
					</div>
				</div>
				<table id="genericTableId"
					data-classes="table table-hover table-bordered "
					data-toolbar="filter-bar" data-search="true" data-height="299"
					data-pagination="true" data-cache="false">
				</table>
			</div>

			<table class="table table-striped" id="genericFormId">
				<thead>
				</thead>
				<tbody></tbody>
			</table>
			<form id="user-profile-form" name="user-profile-form"
				class="form-horizontal" action="#" method="POST"
				role="form">
				<div class="form-group">
					<label class="col-md-3 control-label">Your Name</label>
					<div class="col-md-4">
						<input class="form-control" id="username" name="username"
							type="text" placeholder="Your Nick Name" value="">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">EmailId</label>
					<div class="col-md-4">
						<input class="form-control" id="emailId" name="emailId"
							type="text" placeholder="email-Id" value="">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Profession</label>
					<div class="col-md-4">
						<input class="form-control" id="profession" name="profession"
							type="text" placeholder="Your Profession" value="">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Change Your Password</label>
					<div class="col-md-4">
						<input class="form-control" id="password" name="password"
							type="password" placeholder="New Password">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Your Address</label>
					<div class="col-sm-4">
						<input class="form-control" id="address.line1"
							name="address.line1" type="text" placeholder="Line1">
					</div>
					<div class="clearfix"></div>
					<div class="col-md-offset-3 col-sm-4">
						<input class="form-control" id="address.line2"
							name="address.line2" type="text" placeholder="Line2">
					</div>
					<div class="clearfix"></div>
					<div class="col-md-offset-3 col-sm-4">
						<input class="form-control" id="address.pincode"
							name="address.pincode" type="text" placeholder="PineCode">
					</div>

					<div class="clearfix"></div>
					<div class="col-md-offset-3 col-sm-4">
						<input class="form-control" id="address.city" name="address.city"
							type="text" placeholder="City">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Contact No</label>
					<div class="col-md-4">
						<input class="form-control" id="mobileNo" name="mobileNo"
							type="text" placeholder="Contact No">
					</div>
					<div class="clearfix"></div>
					<label class="col-md-3 control-label">Group</label>
					<div class="col-md-4">
						<input class="form-control" id="groupname" readonly="readonly" name="groupname"
							type="text" placeholder="Contact No">
					</div>
					<div class="clearfix"></div>
					<br />
					<button id="submit-profile" class="col-md-offset-6" type="submit" col-md-2 btnbtn-default">Update</button>
				</div>
			</form>
		</div>
	</div>
	<div class="container">
		<hr>
		<footer>
		<p>Cypher Future Group &copy; 2014</p>
		</footer>
	</div>


	<!-- Bootstrap core JavaScript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
</body>
</html>
